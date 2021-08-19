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
			console.log(data);
			setTree(treeData);
		}
	  });
}

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
// 			$("#modifyDeptCodeSelect").attr('disabled', 'false');
		  var level = data.node.parents.length;
		  var deptName  = data.node.text;
		  var nodeId    = data.node.id;
		  var deptNameArr = getMember(deptName,nodeId);
		  console.log(data.node);
	      console.log(deptName+","+nodeId+","+level);
	      $("#modifyDeptName").attr("value",deptName);
	    
	    // 부서 이름 기준 부서 정보 조회
// 	    var modifyDeptName = $("#modifyDeptName").val();
	    $.ajax({
	    	url : "<%=request.getContextPath()%>/admin/comp/group/getDeptByDeptName.do"+"?deptName="+deptName
	    	, type : "get"
	    	, contentType : "application/json; charset=utf-8;"
	    	, success : function(data){
	    		$("#modifyDeptCode").attr("value",data.deptCode);
	    		$("#modifyDeptSuper").attr("value",data.deptSuper);
	    		$("#modifyDeptName").attr("value",data.deptName);
	    		$("#modifyDeptSuperNo").attr("value",data.deptSuperNo);
	    		$("#beforeDeptSuperNo").attr("value",data.deptSuperNo);
	    		
	    		
	    		console.log("@@@");
	    		console.log(data.deptSuper);
	    		console.log($("#modifyDeptSuper").val());
	    		console.log($("#modifyDeptCodeSelect").val(data.deptSuper));
	    		$("#modifyDeptCodeSelect").val(data.deptSuper).prop("selected",true);
	    		$("#modifyEmpNo").val(data.deptSuperNo).prop("selected",true);
	    		
	    		if(data.deptSuper=='000'){ // Palosanto 인 경우 비활성화
	    			$("#modifyDeptCodeSelect").hide();
	    			$("#palosanto").show();
	    		} else {
	    			$("#modifyDeptCodeSelect").show();
	    			$("#palosanto").hide();
	    		}
	    	}
	    	, error : function(xhr){
	    		alert("시스템 문제가 발생하였습니다. 관리자에게 문의해주세요.");
	    	} 
	    });
	});
}
//부서목록 기준 트리 생성///////////////////////////////////////////////////////

//회원 목록 조회/////////////////////////////////////////////////////////////

// html 변환하여 테이블 삽입 function
function setHtml(data){
	
}
function getMember(deptName,nodeId){
		if(deptName!='Palosanto'){
			  $.ajax({
				  url : "<%=request.getContextPath() %>/admin/comp/group/getdeptCodeByName.do?deptName="+deptName
					, type : "get"
					, contentType: "application/json; charset=utf-8;"
					, success : function(data) {
						console.log(data);
						var tableBodyHtml = "";
						if(data != ""){
							for(var emp in data){
								emp = Number(emp);
								tableBodyHtml += "<tr>"
								+ "<th scope='row' id='empNo'>" + (emp+1) + "</th>"
								+ "<td>"
								+	"<span id='empNo'>" + data[emp].empNo + "</span>"
								+ "</td>"
								+ "<td>"
								+	"<span id='empName'>" + data[emp].empName + "</span>"
								+ "</td>"
								+ "<td>"
								+	"<span id='empCreateDate'>" + data[emp].strEmpCreateDate + "</span>"
								+ "</td>"
								+ "<td>"
								+	"<span id='empTel'>" + data[emp].empTel + "</span>"
								+ "</td>"
								+ "<td>"
								+	"<span id='psName'>" + data[emp].psName + "</span>"
								+ "</td>"
								+ "<td>"
								+	"<span id='deptName'>" + data[emp].deptName + "</span>"
								+ "</td>"
							  + "</tr>"
							}
						} else {
							tableBodyHtml += "<td colspan='7' style='text-align: center;'>"
								+	"<span > 직원 정보가 없습니다. </span>"
								+ "</td>"
						}
						
						
						$("#tableBody").html(tableBodyHtml);
					}
			  });
		}else{
			$.ajax({
				  url : "<%=request.getContextPath() %>/admin/comp/group/getEmployee.do"
					, type : "get"
					, contentType: "application/json; charset=utf-8;"
					, success : function(data) {
						var tableBodyHtml = "";
						if(data != ""){
							for(var emp in data){
								console.log("data[emp].strEmpCreateDate : " + data[emp].strEmpCreateDate);
								emp = Number(emp);
								tableBodyHtml += "<tr>"
								+ "<th scope='row' id='empNo'>" + (emp+1) + "</th>"
								+ "<td>"
								+	"<span id='empNo'>" + data[emp].empNo + "</span>"
								+ "</td>"
								+ "<td>"
								+	"<span id='empName'>" + data[emp].empName + "</span>"
								+ "</td>"
								+ "<td>"
								+	"<span id='empCreateDate'>" + data[emp].strEmpCreateDate + "</span>"
								+ "</td>"
								+ "<td>"
								+	"<span id='empTel'>" + data[emp].empTel + "</span>"
								+ "</td>"
								+ "<td>"
								+	"<span id='psName'>" + data[emp].psName + "</span>"
								+ "</td>"
								+ "<td>"
								+	"<span id='deptName'>" + data[emp].deptName + "</span>"
								+ "</td>"
							  + "</tr>"
							}
						} else {
							tableBodyHtml += "<td colspan='7' style='text-align: center;'>"
								+	"<span > 직원 정보가 없습니다. </span>"
								+ "</td>"
						}
						
						
						$("#tableBody").html(tableBodyHtml);
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
