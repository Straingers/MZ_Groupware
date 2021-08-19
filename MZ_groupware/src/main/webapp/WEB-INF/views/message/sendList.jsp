<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${dataMap.cri}"/>

<style>
.ellipsis {
   width:220px;
   padding:0 5px;
   overflow:hidden;
   text-overflow:ellipsis;
   white-space:nowrap;
}
</style>
<!-- --------------------- -->

<link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.css" rel="stylesheet" type="text/css">
<%@ include file="/WEB-INF/views/admin/comp/group/jstree_css.jsp" %>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/dist/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.js"></script>
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" 
style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2">
				<i class="far fa-envelope" style="padding: 0px 10px;"></i>
				쪽지함
			</h3>
		</div>
	</div>
</div>
<!-- --------------------- -->
<div class="content p-0 d-flex flex-column flex-column-fluid" id="kt_content">
	<div class="d-flex flex-column-fluid">
   <!--begin::Container-->
		<div class="container col-7">
			<div class="card card-custom">
				<div class="card-header card-header-tabs-line p-2">
					<div class="card-toolbar">
						<ul class="nav nav-tabs nav-bold nav-tabs-line">
							<li class="nav-item" onclick="parent.goPage('message/receive/list.do','Q020000');">
								<a class="nav-link" data-toggle="tab" href="#" id="recbox">
									<span class="nav-icon"><i class="fas fa-sign-in-alt"></i></span>
									<span class="nav-text">수신함</span>
								</a>
							</li>
							<li class="nav-item" onclick="parent.goPage('message/send/list.do','Q020000');">
								<a class="nav-link active" data-toggle="tab" href="#" id="sendbox">
									<span class="nav-icon"><i class="fas fa-sign-out-alt"></i></span>
									<span class="nav-text">발신함</span>
								</a>
							</li>
						</ul>
					</div>
					<div class="card-title">
						<div class="input-group row">
							<select class="form-control col-sm-4" name="openType" id="openType" onchange="msgList_go(1);">
						  		<option value="all" ${pageMaker.cri.openType == 'all' ? 'selected':'' }>상태전체</option>
						  		<option value="open" ${pageMaker.cri.openType == 'open' ? 'selected':'' }>읽음</option>
						  		<option value="close" ${pageMaker.cri.openType == 'close' ? 'selected':'' }>안읽음</option>
						  	</select>
<!-- 						  	<select class="form-control col-sm-3" name="perPageNum" id="perPageNum" onchange="list_go(1);"> -->
<!-- 						  		<option value="10" selected="">10개씩</option> -->
<!-- 						  		<option value="20">20개씩</option> -->
<!-- 						  		<option value="30">30개씩</option> -->
<!-- 						  		<option value="50">50개씩</option> -->
<!-- 						  	</select> -->
							<input class="form-control col-sm-4" type="hidden" name="perPageNum" value="10">
							<input class="form-control col-sm-4" type="text" name="keyword" placeholder="발신자 검색" value="">
							<span class="input-group-append">
								<button class="btn btn-light-primary px-6 font-weight-bold" type="button" id="searchBtn" data-card-widget="search" onclick="msgList_go(1);">
									<i class="fa fa-fw fa-search"></i>
								</button>
							</span>
						</div>	
					</div>
				</div>
				<div class="card-body">
					<div class="form-inline">
						<div class="table-responsive" id="sendTable">
							<table class="table" style="font-size: 12.5px;">
								<thead>
									<tr>
										<th scope="col" class="text-center" style="width: 70px;">NO</th>
										<th scope="col" class="text-center">쪽지 내용</th>
										<th scope="col" class="text-center" style="width: 70px;">수신자</th>
										<th scope="col" class="text-center" style="width: 110px;">발신 일자</th>
										<th scope="col" class="text-center" style="width: 80px;">열람 상태</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${!empty dataMap.msgList}">
											<c:forEach items="${dataMap.msgList }" var="msg">
												<tr>
													<th scope="row" class="text-center"><a
														href="javascript:detail_go(${msg.mssNo});"
														class="text-dark text-center"> ${msg.mssNo } </a></th>
													<td>
														<div class="ellipsis">
															<a href="javascript:detail_go(${msg.mssNo});" class="text-dark"> ${msg.mssContent} </a>
														</div>
													</td>
													<td class="text-center" style="width: 70px;">${msg.receiver}</td>
													<td class="text-center" style="width: 110px;">${msg.mssSenddate }</td>
													<td class="text-center" style="width: 80px;"><c:choose>
															<c:when test="${msg.mssOpenStatus eq 'N'}">
																<span
																	class="label label-inline label-light-primary font-weight-bold">
																	안읽음 </span>
															</c:when>
															<c:when test="${msg.mssOpenStatus eq 'Y'}">
																<span
																	class="label label-inline label-light-danger font-weight-bold">
																	읽음 </span>
															</c:when>
														</c:choose></td>
												</tr>
											</c:forEach>

										</c:when>
										<c:otherwise>
											<tr class="text-center">
												<td colspan="5">수신된 쪽지가 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<%@ include file="/WEB-INF/views/message/msgPagination.jsp"%>
				</div>
			</div>
		</div>
		<!-- container -->
		<div class="container col-5">
			<div class="card card-custom" data-card="true" id="kt_card_1">
				<div class="card-header">
					<div class="card-title">
						<h3 class="card-label">수신상세화면</h3>
					</div>
					<div class="card-toolbar">
						<button type="button" class="btn btn-light-primary float-right"
							data-toggle="modal" data-target="#registMsg">쪽지보내기</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-light-primary float-right"
							onclick="remove_go();">삭제</button>
					</div>
				</div>
				<div class="card-body" id="detailBody">
					<table class='table table-borderless detail'>
						<tr class='text-center'>
							<th>쪽지를 선택해주세요</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="modal fade" id="registMsg" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		    <div class="modal-dialog" role="document">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="exampleModalLabel">쪽지 전송</h5>
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <i aria-hidden="true" class="ki ki-close"></i>
		                </button>
		            </div>
		            <div class="modal-body">
		               <div class="form-group row">
							<a href="#" class="btn btn-secondary font-weight-bolder btn-sm col-3" data-toggle="modal" data-target="#exampleModal">
								<i class="flaticon2-telegram-logo"></i> 수신자 선택
							</a>
							<label class="col-2 col-form-label text-center">수신</label>
                            <div class="col-7 align-center" id="empRec"></div>
                            <input type="hidden" id="empRecList" name="recEmp" />
			            </div>
			            <div class="form-group mb-1">
			               <label for="exampleTextarea">쪽지 내용</label>
			               <textarea class="form-control" id="msscontent" rows="3"></textarea>
			            </div>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-sm btn-light font-weight-bold" onclick="fn_auto();" id="autoBtn">AUTO</button>
		                <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">취소</button>
		                <button type="button" class="btn btn-primary font-weight-bold" onclick="regist_go();">전송</button>
		            </div>
		        </div>
		    </div>
		</div>
		<div class="modal fade" id="exampleModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
        <div class="modal-dialog" role="document" style="max-width: 100%; width: auto; display: table;">
            <div class="modal-content" style="height: 700px; width: 800px;">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">수신자 선택</h5>
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i aria-hidden="true" class="ki ki-close"></i>
                    </button>--%>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div id="kt_tree_4" class="tree-demo col-4" style="border: 1px solid #EBEDF3;">
                        </div>
                        <div class="col-8" style="border: 1px solid #EBEDF3;">
                            <table class="table table-hover" id="del_target" style="overflow:auto;" style="height:500px;overflow:scroll;">
                                <thead>
                                <tr style="left: 0px;">
                                    <th scope="col" hidden>사번</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">직위</th>
                                    <th scope="col">부서</th>
                                    <th scope="col" width="25%"></th>
                                </tr>
                                </thead>
                                <tbody id="tableBody">

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <div class="col-12">
                            <table class="table table-hover" id="recTable" style="overflow:auto;">
                                <tr>
                                    <th scope="col">수신자 이름</th>
                                    <th scope="col">수신자 부서</th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="ref_go();">확인</button>
                    <%--<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>--%>
                </div>
            </div>
        </div>
    </div>
		<!--end::Container-->
		<input type="hidden" name="mssReceiver" value=""/>
		<input type="hidden" name="mssContent" value=""/>
	</div>
</div>
<%@ include file="/WEB-INF/views/message/jstree_js.jsp" %>
<!-- <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script> -->
<script>
function fn_auto() {
	$('#msscontent').val('개발팀 박상영입니다. 지시하신 회의실 예약과 사내일정 등록 완료하였습니다. 참고 부탁드립니다. 감사합니다.');
	$('#autoBtn').hide();
}



var empList = [];

function fn_delEmp(empNo) {
  $('#emp_' + empNo).remove();
  var index = empList.findIndex(function (element) {
    return element.emp === empNo;
  })
  empList.splice(index, 1);
}

function fn_addRec(empNo) {
  var exist = $(empList).filter(function () {
    return this.emp === empNo;
  }).length > 0;

  if (exist) {
    alert('이미 추가된 직원입니다.');
    return false;
  }

  var emp = $('#' + empNo);
  var empName = emp.data('emp-name');
  var deptName = emp.data('dept-name');
  var psName = emp.data('ps-name');

  var empObj = {
    emp: empNo,
    empName: empName,
    type: 'rec'
  };

  empList.push(empObj);

  $('#recTable').append(
    '<tr onclick="fn_delEmp(\'' + empNo + '\')" id="emp_' + empNo + '" name="REC">' +
    '	<td>' + empName + ' ' + psName + '</td>' +
    '	<td>' + deptName + '</td>' +
    '</tr>'
  );
}
function ref_go() {
	  $('#empRec').empty();
// 	  $('#empCc').empty();

	  $('#empRecList').val(null);
// 	  $('#empCcList').val(null);

	  var recList = [];
// 	  var ccList = [];

	  for (var empObj of empList) {
// 	    if (empObj.type === 'rec') {
	      $('#empRec').append('<span class="badge badge-pill badge-primary mr-2">' + empObj.empName + '</span>');
	      recList.push(empObj.emp);
// 	    } else {
// 	      $('#empCc').append('<span class="badge badge-pill badge-primary mr-2">' + empObj.empName + '</span>');
// 	      ccList.push(empObj.emp);
// 	    }
	  }

	  $('#empRecList').val(recList);
// 	  $('#empCcList').val(ccList);

	  $('#exampleModal').modal('hide');
	}
function remove_go(mssNo) {
	var remurl = "";
	if($("#recbox").attr("class").includes('active')){
		remurl = "<%=request.getContextPath()%>/message/recRemove.do";
	}else if($("#sendbox").attr("class").includes('active')){
		remurl = "<%=request.getContextPath()%>/message/sendRemove.do";
	}
	var data = {mssNo : $("#tmpMssNo").val()};
	$.ajax({
		type : "POST",
		url : remurl,
		data : JSON.stringify(data),
		dataType : "json",
		contentType : "application/json",
		success : function() {
			Swal.fire({
      		  	icon: "success",
      		  	title: "쪽지를 삭제하였습니다.",
      		  	showConfirmButton: false,
      		  	timer: 1500
      		}).then((result) => {
    		   location.reload();
    	  	});
		},
		error : function() {
			alert("시스템 장애로 쪽지 삭제에 실패했습니다. 관리자에게 문의바랍니다.");
			history.go(-1);
		}
	});
}
function regist_go() {
	var rec = $('input[name="recEmp"]').val();
	if(rec == "") {
		alert("수신자 선택은 필수입니다.");
		return;
	}
	
	var recList = [];
	recList = $('#empRecList').val().split(",");
	$.ajax({
		url : "<%=request.getContextPath()%>/message/regist.do"
      , type : "post"
      , data : JSON.stringify({
         "mssReceiver" : recList,
         "mssContent" : $('#msscontent').val(),
      })
      , datatype : "json"
	  , contentType : "application/json"
      , success : function(data) {
	    	Swal.fire({
	  		  	icon: "success",
	  		  	title: "쪽지를 전송하였습니다.",
	  		  	showConfirmButton: false,
	  		  	timer: 1500
	  		}).then((result) => {
	  			var receiver = "";
	  			for(var i = 0; i < recList.length; i++) {
	  				receiver += recList[i] + "/";
	  			}
	           socket.send("쪽지," + receiver.substring(0, receiver.length - 1) + "," + $('#msscontent').val() + ",쪽지가 도착했습니다.,<%=request.getContextPath()%>/message/main/detail.do?mssNo=" + data.mssNo);	
			   $('#registMsg').modal("hide");
			   location.reload();
	  		});
      }
      , error : function(error) {
         alert("쪽지 보내기에 실패했습니다. 관리자에게 문의하세요.");
      }
   });
}

function detail_go(mssNo) {
	var source = $("#recDetailContent").html();
   
	var data = {
			mssNo : mssNo
			, pageType : "send"
		};
	$.ajax({
		type : "post",
		url : "<%=request.getContextPath()%>/message/detail.do",
		data : JSON.stringify(data),
		dataType : "json",
		contentType : "application/json",
		success : function(data) {
			var template = Handlebars.compile(source);

			var html = template(data.msg);
			$(".detail").remove();

			$('#detailBody').html(html);
			$("#sendTable").load("<%=request.getContextPath()%>/message/list.do" + "#sendTable");
<%-- 			location.href = "<%=request.getContextPath()%>/message/list.do"; --%>
		},
		error : function(error) {
			console.log(error)
			alert("상세보기 로드에 실패했습니다. 관리자에게 문의바랍니다.");
			history.go(-1);
		}
	});
}
</script>



<script id="recDetailContent" type="text/x-handlebars-template">
   <table class="table table-borderless detail">
      <tr class="text-center">
         <th scope="col">보낸 사람</th>
         <td scope="col">{{sender}}</td>
      </tr>
      <tr class="text-center">
         <th scope="col">발신 일자</th>
         <td scope="col">{{mssSenddate}}</td>
      </tr>
      <tr class="text-center">
         <td colspan="4"><input type="hidden" id="tmpMssNo" value="{{mssNo}}"/>&nbsp;</td>
      </tr>
      <tr class="text-center">
         <th colspan="4">{{mssContent}}</th>
      </tr>
   </table>
</script>