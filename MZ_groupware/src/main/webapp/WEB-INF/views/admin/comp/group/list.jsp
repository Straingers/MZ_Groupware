<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.css" rel="stylesheet" type="text/css">


<%@ include file="/WEB-INF/views/admin/comp/group/jstree_css.jsp" %>	
<style>
.swal2-popup .btn {
    margin: 0px 5px 0;
}

.card.card-custom {
  -webkit-box-shadow: 0px 0px 30px 0px rgba(82, 63, 105, 0.05);
  box-shadow: 0px 0px 30px 0px rgba(82, 63, 105, 0.05);
  border: 0;
}


#card_body::-webkit-scrollbar {
   width: 5px; /*스크롤바의 너비*/
}

#card_body::-webkit-scrollbar-thumb {
   background-color: #3699FF;
}

#card_body::-webkit-scrollbar-track {
   background-color: white;
}
</style>
</head>

<body>
<!-- js -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/dist/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.js"></script>

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
			전사관리 > 조직관리</h3>
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
				<div class="col-lg-4">
					<div class="card card-custom example example-compact gutter-b">
						<div class="card-header">
							<div class="card-title">
							</div><!-- end::card-title -->
							<div class="card-toolbar">
								<button type="button" class="btn btn-text-primary btn-hover-light-primary btn-sm mr-3" data-toggle="modal" data-target="#registModal">
									<i class="fas fa-user-plus text-primary fa-xs"></i>
									<span class="font-weight-bold">부서등록</span>
								</button>
								<button type="button" class="btn btn-text-primary btn-hover-light-primary btn-sm mr-3" data-toggle="modal" data-target="#modifyModal"><i class="fas fa-user-edit text-primary fa-xs"></i>부서수정</button>
								<button type="button" class="btn btn-text-primary btn-hover-light-primary btn-sm mr-3" onclick="fn_deptDelete()"><i class="fas fa-user-minus text-primary fa-xs"></i>부서삭제</button>
							</div><!-- end::card-toolbar -->
						</div><!-- end::card-header -->
						<div class="card-body scroll_body" id="scroll_style">
							<button type="button" class="btn btn-light-primary btn-sm mr-3" onclick="fn_extends()" >모두펼치기</button>
							<button type="button" class="btn btn-light-primary btn-sm mr-3" onclick="fn_collapse()" >모두접기</button>
							
							<div id="kt_tree_4" class="tree-demo">
							</div>
							
							
						
						</div><!-- end::card-body -->
						<div class="card-footer">
						</div><!-- end::card-footer -->
					</div><!-- end::card -->
				</div><!-- end::col-lg-6 -->
				<div class="col-lg-8">
					<div class="card card-custom example example-compact gutter-b">
						<div class="card-header">
							<div class="card-title">
							</div><!-- end::card-title -->
							<div class="card-toolbar">
								<button type="button" class="btn btn-light-primary btn-sm mr-3" data-toggle="modal" data-target="#positionModal">직위 관리</button>
							</div><!-- end::card-toolbar -->
						</div><!-- end::card-header -->
						<div class="card-body" id="card_body" style="padding-top: 10px; overflow:auto; overflow-y: auto; overflow-x: hidden; height: 580px; list-style:none; padding-left: 15px;">
							
							<div class="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-loaded" id="kt_datatable" style="">
								
								<!-- -------------------------------------------------------------------------------------- -->
								<!-- -------------------------------------------------------------------------------------- -->
								<!-- -------------------------------------------------------------------------------------- -->
								<table class="table table-hover" style="overflow:auto;">
									<thead>
										<tr style="left: 0px;">
										
											<th scope="col" id="th_checkBox">
												<span style="width: 20px;">
													<label class="checkbox checkbox-single checkbox-all">
													<input type="checkbox">&nbsp;<span></span>
													</label>
												</span>
											</th>
										
										
											<th scope="col">
												<span style="width: 137px;">사번</span>
											</th>
											<th scope="col">
												<span style="width: 137px;">이름</span>
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
						
						</div><!-- end::card-body -->
						<div class="card-footer p-0">
						</div><!-- end::card-footer -->
					</div><!-- end::card -->
				</div><!-- end::col-lg-6 -->
			</div><!-- end::row -->
		</div><!--end::Container-->
	</div><!-- d-flex flex-column-fluid -->
</div>


<input type="hidden" id="treeDeptName" name="treeDeptName" />
<!-- ------------------------------- -->
<!-- ------------------------------- -->
<!-- ------------------------------- -->

<!-- ------------------------------- -->
<!-- ------------------------------- -->
<!-- ------------------------------- -->

<%@ include file="/WEB-INF/views/admin/comp/group/jstree_js.jsp" %>	
<%@ include file="/WEB-INF/views/admin/comp/group/modal.jsp" %>	
<script>



function fn_deptDelete(){
	Swal.fire({
        title: "정말 삭제하시겠습니까?",
        text: "조직 내 직원은 상위부서로 이동됩니다.",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "삭제",
        cancelButtonText: "취소",
        customClass: {
         confirmButton: "btn-primary"
        },
        reverseButtons: true
    }).then(function(result) {
        if (result.value) {
        	 	var modifyDeptCode = $("#modifyDeptCode").val();
        	 	var modifyDeptSuper = $("#modifyDeptSuper").val();
        	 	$.ajax({
        			  url : "<%=request.getContextPath() %>/admin/comp/group/dept/remove.do?deptCode="+modifyDeptCode+"&deptSuper="+modifyDeptSuper+"&authority=ROLE_USER"
        			, type : "get"
        			, contentType: "application/json; charset=utf-8;"
        			, success : function(data) {
        				Swal.fire({
   	                title: "부서 삭제가 완료되었습니다.",
   	                icon: "success",
   	                confirmButtonText: "확인",
   	                customClass: {
   	                 confirmButton: "btn btn-primary"
   	                }
   	            }).then((result) => {
		   	   		  	location.href = "<%=request.getContextPath()%>/admin/comp/group/list";
					  		})
        			}
        			, error : function(xhr){
        				Swal.fire({
   	                title: "문제가 발생했습니다.",
   	                text: "관리자에게 문의하여 주세요!!",
   	                icon: "error",
   	                confirmButtonText: "확인",
   	                customClass: {
   	                 confirmButton: "btn btn-primary"
   	                }
   	            })
        			}
       		  });
        }
    });

}

</script>
</body>