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
	    "plugins": ["contextmenu", "state", "types"],
	    'contextmenu' : {
				"items" : {
					<c:if test="${loginUser.empNo eq 'admin'}">
						"create" : {
		        "separator_before" : false,
						"separator_after" : true,
						"label" : "부서 등록",
						"icon": "fas fa-user-plus text-primary",
						"action" : function(obj){alert('부서 등록')}
					},
					"modify" : {
		        "separator_before" : false,
						"separator_after" : true,
						"label" : "부서 수정",
						"icon": "fas fa-user-edit text-primary",
						"action" : function(obj){alert('부서 수정')}
					},
					"delete" : {
						"separator_before" : false,
						"separator_after" : true,
						"label" : "부서 삭제",
						"icon": "fas fa-user-minus text-primary",
						"action" :function(obj){alert('부서 삭제')}
					}
					</c:if>
				}
			}
	    
	});
	newJquery('#kt_tree_4').bind("select_node.jstree",function(e,data) {
		  var level = data.node.parents.length;
		    var deptName  = data.node.text;
		    var nodeId    = data.node.id;
		  console.log(data.node);
	    console.log(deptName+","+nodeId+","+level);
	    var deptNameArr = getMember(deptName,nodeId);
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
						var tableBodyHtml = "";
						if(data != ""){
							for(var emp in data){
								emp = Number(emp);
								tableBodyHtml += "<tr  onclick='jsTree_go();'>"
								+ "<th scope='row' id='th_checkBox'>"  
								+ 	"<span style='width: 20px;'>"
								+		"<label class='checkbox checkbox-single checkbox-all'>"
								+			"<input name='chk' type='checkbox' value='" + data[emp].empNo + "," + data[emp].empName + "," + data[emp].psName + "," + data[emp].deptName + "'>&nbsp;<span></span>"
								+		"</label>"
								+	"</span>"
								+ "</th>"
								+ "<td>"
								+	"<span id='empNoTree'>" + data[emp].empNo + "</span>"
								+ "</td>"
								+ "<td>"
								+	"<span id='empName'>" + data[emp].empName + "</span>"
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
	
    $('#target').click(function () {
        let tbodyTr = $('tbody tr');
        const tdArr = [];	// 배열 선언
        const td = tbodyTr.children();

        td.each(function (i) {
            if (td.eq(i).children().children().prop("checked")) {
                tdArr.push(td.eq(i - 1).text());
            }
        });
        console.log(tdArr);
    });

</script>