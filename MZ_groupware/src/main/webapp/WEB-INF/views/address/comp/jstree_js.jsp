<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
var newJquery = $.noConflict(true); // JQuery 충돌 무시 코드

// 부서목록 기준 트리 생성///////////////////////////////////////////////////////
getDeptList();
function getDeptList(){
	  var result = new Array();
	  $.ajax({
		  url : "<%=request.getContextPath() %>/admin/comp/group/getdept.do"
		, type : "post"
		, contentType: "application/json; charset=utf-8;"
		, success : function(data) {
			var treeData = data;
			setTree(treeData);
		}
	  });
}
var export_member_data;
function setTree(treeData){
	newJquery("#kt_tree_4").jstree({
	    "core": {
	        "themes": {
	            "responsive": false
	        },
	        "check_callback": true,
	        "data": treeData
	    },
	    "types": {
	        "default": {
	            "icon": "fa fa-folder text-primary"
	        },
	        "file": {
	            "icon": "fa fa-file  text-primary"
	        }
	    },
	    "state": {
	        "key": "demo2"
	    },
	    "plugins": ["state", "types"]
	});
	newJquery('#kt_tree_4').bind("select_node.jstree",function(e,data) {
		  var level = data.node.parents.length;
		  var deptName  = data.node.text;
		  var nodeId    = data.node.id;
		  var deptNameArr = getMember(deptName,nodeId);
      $("#modifyDeptName").attr("value",deptName);
      
      // start 탭 초기화 (즐겨찾기 상태일 때 좌측 jsTree 클릭하는 경우 제어)
      $('#myTab li:last-child').removeClass('active show');	
  		$('#myTab li:last-child a').removeClass('active show');
      
      $('#myTab li:first-child').addClass('active show');
  		$('div.tab-content div').eq(0).addClass('active show');
	    // end 탭 초기화
  		
  		
	    // 부서 이름 기준 부서 정보 조회
// 	    var modifyDeptName = $("#modifyDeptName").val();
	    $.ajax({
	    	url : "<%=request.getContextPath()%>/admin/comp/group/getDeptByDeptName.do"+"?deptName="+deptName
	    	, type : "get"
	    	, contentType : "application/json; charset=utf-8;"
	    	, success : function(data){
	    		$("#modifyDeptCode").attr("value",data.deptCode);
	    		$("#modifyDeptCodeSelect").val(data.deptSuper).prop("selected",true);
	    		$("#modifyDeptSuper").attr("value",data.deptSuper);
	    		$("#modifyEmpNo").val(data.deptSuperNo).prop("selected",true);
	    		$("#modifyDeptSuperNo").attr("value",data.deptSuperNo);
	    		$("#beforeDeptSuperNo").attr("value",data.deptSuperNo);
	    	}
	    	, error : function(xhr){
	    		alert("시스템 문제가 발생하였습니다. 관리자에게 문의해주세요.");
	    	} 
	    });
	});
}
//부서목록 기준 트리 생성///////////////////////////////////////////////////////

//회원 목록 조회/////////////////////////////////////////////////////////////

// 즐겨찾기 호출할 함수 생성 ///////////////////////////////
var favoriteList;

$(document).ready(function(){
	getFavorite(); // 문서 로드 시 즐겨찾기 데이터 가져오기 위함.
});

function getFavorite(){
	$.ajax({
		url : "<%=request.getContextPath()%>/address/comp/favorite.do"
		,type:"get"
		,contentType:"application/json;charset=utf-8;"
		,success:function(data){
			favoriteList = data;
		}
		,error:function(xhr){
			console.log("즐겨찾기 목록 가져오는 도중 문제 발생.");
		}
	});
}

function getMember(deptName,nodeId){
		if(deptName!='Palosanto'){
			  $.ajax({
				  url : "<%=request.getContextPath() %>/admin/comp/group/getdeptCodeByName.do?deptName="+deptName
					, type : "get"
					, contentType: "application/json; charset=utf-8;"
					, success : function(data) {
						getFavorite();
						getExportMember(data); // export 용 데이터 추가
						
						var tableBodyHtml = "";
						if(data != ""){
							for(var emp in data){
								emp = Number(emp);
								
								var favorhtml = "";
								if(data[emp].empNo == '${loginUser.empNo}'){ // 로그인 유저인 경우 star 표시 하지 않음.
									favorhtml = "<td></td>";
								} else { // 로그인 유저가 아닌경우 star 표시를 함. 기본값 : 빈 star / favorite star인 경우 색 표시
									favorhtml = "<td class='text-center star' style='width: 100px;'><i class='far fa-star text-warning'></i></td>";
									for(var favorite in favoriteList){
										favorite = Number(favorite);
										
										if(data[emp].empNo == favoriteList[favorite].favoriteEmpNo){
				  							favorhtml = "<td class='text-center star' style='width: 100px;'><i class='fas fa-star text-warning'></i></td>";
			  							}
									}
							 		
								}
								
								
							
									tableBodyHtml += "<tr>"
										+ "<td scope='row' id='empNo' style='width: 20px;'><span>" + (emp+1) + "</span></td>"
										+ favorhtml
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
						
						
						$("#tableBody").html(tableBodyHtml);
						$('.count').text("목록 수 : " + $('#tableBody').children().length);
					}
			  });
		}else{
			$.ajax({
				  url : "<%=request.getContextPath() %>/admin/comp/group/getEmployee.do"
					, type : "get"
					, contentType: "application/json; charset=utf-8;"
					, success : function(data) {
						getFavorite();
						getExportMember(data);
						
						var tableBodyHtml = "";
						if(data != ""){
							for(var emp in data){
								emp = Number(emp);
								
								var favorhtml = "";
								if(data[emp].empNo == '${loginUser.empNo}'){ // 로그인 유저인 경우 star 표시 하지 않음.
									favorhtml = "<td></td>";
								} else { // 로그인 유저가 아닌경우 star 표시를 함. 기본값 : 빈 star / favorite star인 경우 색 표시
									favorhtml = "<td class='text-center star' style='width: 100px;'><i class='far fa-star text-warning'></i></td>";
									for(var favorite in favoriteList){
										favorite = Number(favorite);
										
										if(data[emp].empNo == favoriteList[favorite].favoriteEmpNo){
				  							favorhtml = "<td class='text-center star' style='width: 100px;'><i class='fas fa-star text-warning'></i></td>";
			  							}
									}
								}
								
									tableBodyHtml += "<tr>"
									+ "<td scope='row' id='empNo' style='width: 20px;'><span>" + (emp+1) + "</td>"
									+ favorhtml
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
						
						$("#tableBody").html(tableBodyHtml);
						$('.count').text("목록 수 : " + $('#tableBody').children().length);
					}
			  });
		}
}
//회원 목록 조회/////////////////////////////////////////////////////////////
</script>

<script>
	function fn_extends(){
		newJquery("#kt_tree_4").jstree("open_all");
	}
	function fn_collapse(){
		newJquery("#kt_tree_4").jstree("close_all");
	}
</script>

<script>
//별 이벤트/////////////////////////////////////////////////////////
$(document).on('click', '.star', function(){
	var favoriteEmpNo = $(this).next().text(); // 사번 추출
	
	if($(this).children().first().hasClass('fas')){ // 별이 색칠된 상태
		$(this).children().first().removeClass('fas').addClass('far');
		$.ajax({
   			url : "<%=request.getContextPath() %>/address/comp/remove.do?favoriteEmpNo="+favoriteEmpNo
   			,type : "get"
   			,contentType : "application/json; charset=utf-8;"
   			,success : function(data){
   				console.log("처리완료");
   			}
   			,error : function(xhr){
   				console.log("문제");
   			}
   		});
		
	}else if($(this).children().first().hasClass('far')){ // 별이 색칠되지 않은 상태
		$(this).children().first().removeClass('far').addClass('fas');
		$.ajax({
   			url : "<%=request.getContextPath() %>/address/comp/regist.do?favoriteEmpNo="+favoriteEmpNo
   			,type : "get"
   			,contentType : "application/json; charset=utf-8;"
   			,success : function(data){
   				console.log("처리완료");
   			}
   			,error : function(xhr){
   				console.log("문제");
   			}
   		});
	}
});
function getExportMember(data){
	
	export_member_data = data;
// 	console.log(export_member_data);
	
// 	console.log(export_member_data[0]);
	$.each(export_member_data, function(index, item){ 
		console.log(export_member_data[index]);
	});

}

</script>