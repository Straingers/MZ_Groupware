<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.css" rel="stylesheet" type="text/css">


<%@ include file="/WEB-INF/views/admin/comp/group/jstree_css.jsp" %>	
<style>
.scroll_body {
    max-height: 580px;
    overflow-y: auto;
}

.swal2-popup .btn {
    margin: 0px 5px 0;
}

.card.card-custom {
  -webkit-box-shadow: 0px 0px 30px 0px rgba(82, 63, 105, 0.05);
  box-shadow: 0px 0px 30px 0px rgba(82, 63, 105, 0.05);
  border: 0;
}

.selectWidth {
	max-width:40%;
}
</style>
</head>

<body>
<!-- js -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/dist/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.js"></script>
<script src="<%=request.getContextPath() %>/resources/orgChart/js/xlsx.core.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
<!-- css -->

<!-- --------------------- -->
<!-- --------------------- -->
<!-- --------------------- -->
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" 
style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl fas fa-building " style="padding: 0px 10px;"></i>
			주소록</h3>
		</div>
	</div>
</div>
<!-- --------------------- -->
<!-- --------------------- -->
<!-- --------------------- -->

<div class="content d-flex flex-column flex-column-fluid" id="kt_content"><!-- p-0 -->
	
	<div class="d-flex flex-column-fluid">
	
		<!--begin::Container-->
		<div class="container col-12">
				
			<div class="row">
				<div class="col-lg-3">
					<div class="card card-custom example example-compact gutter-b">
						<div class="card-header">
							<div class="card-title">
							
								<div class="btn-group" role="group" aria-label="Basic example">
								    <button type="button" class="btn btn-light-primary" onclick="javascript:OpenWindow('<%=request.getContextPath()%>/admin/comp/member/org/list','인사변경현황',1500,700);">
								    	<i class="fas fa-user-edit fa-xs"></i>조직도</button>
								</div>
								<div class="btn-group" role="group" aria-label="Basic example">
								    <button type="button" class="btn btn-light-primary" id="excelFileExport">
								    	<i class="fas fa-user-edit fa-xs"></i>엑셀출력</button>
								</div>
							</div><!-- end::card-title -->
							<div class="card-toolbar">
							</div><!-- end::card-toolbar -->
						</div><!-- end::card-header -->
						<div class="card-body scroll_body">
							<button type="button" class="btn btn-light-primary btn-sm mr-3" onclick="fn_extends()" >모두펼치기</button>
							<button type="button" class="btn btn-light-primary btn-sm mr-3" onclick="fn_collapse()" >모두접기</button>
							
							<div id="kt_tree_4" class="tree-demo">
							</div>
							
							
						
						</div><!-- end::card-body -->
						<div class="card-footer">
						</div><!-- end::card-footer -->
					</div><!-- end::card -->
				</div><!-- end::col-lg-6 -->
				<div class="col-lg-9">
					<div class="card card-custom example example-compact gutter-b">
						<div class="card-header">
							<div class="card-title">
								<span class="label label-inline count"></span>
							</div><!-- end::card-title -->
							<div class="card-toolbar">
								<div class="row align-items-center">
									<div class="my-2 my-md-0">
										<div class="input-group row">
											<select class="form-control col-md-3 selectWidth" name="searchType" id="searchType">
												<option value="">-선택-</option>
												<option value="3">사 번</option>
												<option value="4">이 름</option>
												<option value="5">입사일</option>
												<option value="6">내선번호</option>
												<option value="7">직위</option>		
												<option value="8">부서</option>																		
											</select>	
															
											<input class="form-control" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요." value="${pageMaker.cri.keyword }"/>
										</div>	
									</div>
								</div>
							</div><!-- end::card-toolbar -->
						</div><!-- end::card-header -->
						<div class="card-body scroll_body">
							<ul id="myTab" class="nav nav-tabs nav-bold nav-tabs-line">
								<li>
									<a class="nav-link" href="#basic" data-toggle="tab" data-load="true" id="basic">
										<span class="nav-icon"><i class="fas fa-user-graduate"></i></span>
										<span class="nav-text">일반</span>
									</a>
								</li>
								<li>
									<a class="nav-link" href="#favorite" data-toggle="tab" data-load="true" id="favorite">
										<span class="nav-icon"><i class="fas fa-user-cog"></i></span>
                    <span class="nav-text">즐겨찾기</span>
									</a>
									<input type="hidden" id="modifyDeptName" name="deptName"/>
								</li>
							</ul>
							
							<div class="tab-content">
								<div class="tab-pane fade" id="basic">
									<div id="basicDiv" class="table-responsive">
										<table id="addressTable" class="table table-hover" style="overflow:auto;">
											<thead>
												<tr style="left: 0px;">
												
													<th scope="col" id="th_checkBox">
														<span style="width: 50px;">
														</span>
													</th>
												
													<th class="text-center" style="width: 50px;"><span><i class="fas fa-star text-warning"></i></span></th>
													<th scope="col" style="width: 100px;">
														<span>사번</span>
													</th>
													<th scope="col" style="width: 100px;">
														<span>이름</span>
													</th>
													<th scope="col">
														<span style="width: 137px;">입사일</span>
													</th>
													<th scope="col">
														<span style="width: 137px;">내선번호</span>
													</th>
													<th scope="col">
														<span style="width: 137px;">직위</span>
													</th>
													<th scope="col">
														<span style="width: 137px;">부서</span>
													</th>
												</tr>
											</thead>
											<tbody id="tableBody">
												
											</tbody>
										</table>
										<!-- -------------------------------------------------------------------------------------- -->
										<!-- -------------------------------------------------------------------------------------- -->
										<!-- -------------------------------------------------------------------------------------- -->
										
										
									</div> <!-- end::data table div -->
								</div><!-- tab-pane fade -->
								<div class="tab-pane fade" id="favorite">
									<div id="favoriteDiv" class="table-responsive">
										<table id="favoriteTable" class="table table-hover" style="overflow:auto;">
											<thead>
												<tr style="left: 0px;">
												
													<th scope="col" id="th_checkBox"  style="width: 50px;">
													</th>
												
													<th class="text-center" style="width: 50px;"><span><i class="fas fa-star text-warning"></i></span></th>
													<th scope="col" style="width: 100px;">
														<span>사번</span>
													</th>
													<th scope="col">
														<span>이름</span>
													</th>
													<th scope="col">
														<span style="width: 100px;">입사일</span>
													</th>
													<th scope="col">
														<span style="width: 150px;">내선번호</span>
													</th>
													<th scope="col">
														<span style="width: 100px;">직위</span>
													</th>
													<th scope="col">
														<span style="width: 100px;">부서</span>
													</th>
												</tr>
											</thead>
											<tbody id="favoriteTableBody">
												
											</tbody>
										</table>
										<!-- -------------------------------------------------------------------------------------- -->
										<!-- -------------------------------------------------------------------------------------- -->
										<!-- -------------------------------------------------------------------------------------- -->
										
										
									</div> <!-- end::data table div -->
								</div><!-- tab-pane fade -->
						</div>
						</div><!-- end::card-body -->
						<div class="card-footer p-0">
						</div><!-- end::card-footer -->
					</div><!-- end::card -->
				</div><!-- end::col-lg-6 -->
			</div><!-- end::row -->
		</div><!--end::Container-->
	</div><!-- d-flex flex-column-fluid -->
</div>

<script>
$("#keyword").keyup(function() {
    var k = $(this).val();
    var optionVal = $('#searchType').val();
    $("#addressTable > tbody > tr").hide();
    var temp = $("#addressTable > tbody > tr > td:nth-child(5n+"+optionVal+"):contains('" + k + "')"); // 5n+3 (3 td)
		
    $(temp).parent().show();
    $('.count').text("목록 수 : " + temp.length);                
})

function fn_openDetail(empNo){ // jstree 세팅으로 인하여 '와 "를 모두 사용하고 있어 부득이하게 OpenWindow 코드를 분리함.
	var UrlStr 		= "<%=request.getContextPath()%>/address/comp/detail.do?empNo="+empNo;
	var WinTitle 	= "상세보기";
	var WinWidth 	= 1040;
	var WinHeight = 600;
	
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width="+WinWidth+"," // 스크롤바
			+ "height=" + WinHeight + ", top=" + wintop + ", left="
			+ winleft + ", resizable=yes, status=yes"); // 실제로 요청
	win.focus();
}

/*탭기능 구현*/
$(document).on('click', '#myTab li > a', function() {
	$('#myTab li').removeClass('active show');	
	$('div.tab-content .tab-pane').removeClass('active show');

	var _id = $(this).attr('id');
	
	$(this).tab('show').parent().addClass('active');
	$('div.tab-content .tab-pane#'+_id).addClass('active show');
});

$(document).ready(function() {
	$('#myTab li:first-child').addClass('active show');
	$('div.tab-content div').eq(0).addClass('active show');
	$("#excelFileExport").click(function(){
  	exportExcel();
  });
});

/*즐겨찾기 탭 버튼 클릭 시 동작*/
$(document).on('click','#favorite', function(){
	$("#favoriteDiv").show();
	$("#basicDiv").hide();
	$.ajax({
		  url : "<%=request.getContextPath() %>/admin/comp/group/getEmployeeFavorite.do"
			, type : "get"
			, contentType: "application/json; charset=utf-8;"
			, success : function(data) {
				var tableBodyHtml = "";
				if(data){
					for(var emp in data){
						emp = Number(emp);
						
							tableBodyHtml += "<tr>"
							+ "<td scope='row' id='empNo'><span style='width: 20px;'>" + (emp+1) + "</span></td>"
							+ "<td class='text-center star'><span style='width: 100px;'><i class='fas fa-star text-warning'></i></span></td>"
							+ "<td>"
							+	"<span id='empNo' style='width: 137px;'>" + data[emp].empNo + "</span>"
							+ "</td>"
							+ "<td>"
							+	"<span id='empName' style='width: 137px; cursor:pointer;' onclick='fn_openDetail("+data[emp].empNo+")'>" + data[emp].empName + "</span>"
							+ "</td>"
							+ "<td>"
							+	"<span id='empCreateDate' style='width: 137px;'>" + data[emp].strEmpCreateDate + "</span>"
							+ "</td>"
							+ "<td>"
							+	"<span id='empTel' style='width: 137px;'>" + data[emp].empTel + "</span>"
							+ "</td>"
							+ "<td>"
							+	"<span id='psName' style='width: 137px;'>" + data[emp].psName + "</span>"
							+ "</td>"
							+ "<td>"
							+	"<span id='deptName' style='width: 137px;'>" + data[emp].deptName + "</span>"
							+ "</td>"
						  + "</tr>"
					}
				} else {
					tableBodyHtml += "<td colspan='7' style='text-align: center;'>"
						+	"<span > 직원 정보가 없습니다. </span>"
						+ "</td>"
				}
				
				
				$("#favoriteTableBody").html(tableBodyHtml);
				$('.count').text("목록 수 : " + $('#favoriteTableBody').children().length);
			}
	  });
});

// 일반탭 클릭 시 작업 
$(document).on('click','#basic', function(){
	$("#basicDiv").show();
	$("#favoriteDiv").hide();
	$('.count').text("목록 수 : " + $('#tableBody').children().length);
});

// start Excel Export
function s2ab(s) { 
    var buf = new ArrayBuffer(s.length);
    var view = new Uint8Array(buf);
    for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
    return buf;    
}
function exportExcel(){ 
    var wb = XLSX.utils.book_new();
    var newWorksheet = excelHandler.getWorksheet();
    XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());
    var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});
    saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
}
var excelHandler = {
        getExcelFileName : function(){
            return 'Palosanto_주소록.xlsx';
        },
        getSheetName : function(){
            return 'Palosanto_주소록';
        },
        getExcelData : function(){
            return document.getElementById('addressTable');  
        },
        getWorksheet : function(){
            return XLSX.utils.table_to_sheet(this.getExcelData());
        }
}
// end Excel Export
</script>

<%@ include file="/WEB-INF/views/address/comp/jstree_js.jsp" %>	
</body>