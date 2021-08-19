<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker}" />
<c:set var="cri" value="${dataMap.pageMaker.cri}" />
<c:set var="transferHistoryList" value="${dataMap.transferHistoryList}" />

<head>
<link rel="icon" href="img/logo.png">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/orgChart/css/jquery.orgchart.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/orgChart/css/style.css">
<style type="text/css">
  .orgchart .second-menu-icon {
    transition: opacity .5s;
    opacity: 0;
    right: -5px;
    top: -5px;
    z-index: 2;
    position: absolute;
  }
  .orgchart .second-menu-icon::before { background-color: rgba(68, 157, 68, 0.5); }
  .orgchart .second-menu-icon:hover::before { background-color: #449d44; }
  .orgchart .node:hover .second-menu-icon { opacity: 1; }
  .orgchart .node .second-menu {
    display: none;
    position: absolute;
    top: 0;
    right: -70px;
    border-radius: 35px;
    box-shadow: 0 0 10px 1px #999;
    background-color: #fff;
    z-index: 1;
  }
  .orgchart .node .second-menu .avatar {
    width: 60px;
    height: 60px;
    border-radius: 30px;
    float: left;
    margin: 5px;
  }
  
  .scroll_body {
    max-height: 100px;
    overflow-y: auto;
	}
  
</style>
<!-- 가상선택자 스타일 적용(노드) -->
<style type="text/css">
.orgchart .hierarchy::before {
  content: "";
  position: absolute;
  top: -11px;
  left: 0;
  width: 100%;
  border-top: 2px solid gray;
  box-sizing: border-box;
}

/* excluding root node */
.orgchart > ul > li > ul li > .node::before {
  content: "";
  position: absolute;
  top: -11px;
  left: calc(50% - 1px);
  width: 2px;
  height: 9px;
  background-color: gray;
}

/* excluding leaf node */
.orgchart .node:not(:only-child)::after {
  content: "";
  position: absolute;
  bottom: -11px;
  left: calc(50% - 1px);
  width: 2px;
  height: 9px;
  background-color: gray;
}

.table{
margin-bottom:0px;
}
.table td{
padding:0px;
}

</style>
</head>
<body>
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" 
style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-11">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2">
				<i class="icon-xl fas fa-users" style="padding: 0px 10px;"></i>
				인사관리 > 조직도
			</h3>
		</div><!-- d-flex justify-content-between align-items-md-center flex-column flex-md-row -->
	</div><!-- col-md-11 -->
</div><!-- row justify-content-center py-8 px-8 py-md-4 px-md-0 -->

<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
	<div class="d-flex flex-column-fluid">
		<div class="container col-11">
			<button type="button" class="btn btn-light-primary" style="margin: 10px;" id="btn-chart1">새로고침</button>
			<div id="chart-container"></div>

  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/orgChart/js/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/es6-promise/4.1.1/es6-promise.auto.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/orgChart/js/html2canvas.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/orgChart/js/jspdf.umd.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/orgChart/js/jquery.orgchart.js"></script>
  <script type="text/javascript">
  	var newJquery = $.noConflict(true); // JQuery 충돌 무시 코드
  	newJquery(function() {
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/comp/group/getEmployee"
			,type:"get"
			,contentType:"application/json; charset=utf-8;"
			,success : function(data){
				console.log(data);
			}
			,error : function(xhr){
				console.log("문제");
			}
		});
		
		//////////////////////////////// class 에서 html 을 만들어주어야 함.
		
		
var oc;	
var dateJson;
$.ajax({
		url:"<%=request.getContextPath()%>/admin/comp/member/org/getJson"
		,type:"get"
		,contentType:"application/json; charset=utf-8;"
		,success : function(data){
			dataJson = data;
			oc = newJquery('#chart-container').orgchart({
			      'data' : data,
			      'visibleLevel': 2,
			      'nodeContent': 'title',
			      'nodeID': 'id',
			      'nodeContent': 'title',
			      'pan': true,
			      'zoom': true,
			      'exportButton': true,
			      'exportFileextension': 'pdf',
			      'exportFilename': 'Palosanto',
			      'createNode': function($node, data) {
			        var secondMenuIcon = $('<i>', {
			          'class': 'oci oci-info-circle second-menu-icon',
			          click: function() {
			            $(this).siblings('.second-menu').toggle();
			          }
			        });
			        console.log(data.className);
			        var secondMenu = '<div class="second-menu"><div class="avatar" style="background-position:center;background-repeat:no-repeat;background-size:cover;background-image:url(\'<%=request.getContextPath() %>/admin/comp/member/getPicture?empPhoto='+data.className+'\')"></div></div>';
			        $node.append(secondMenuIcon).append(secondMenu);
			      }
			});
			
			
			
			$(".oc-export-btn").addClass("btn btn-light-primary"); // export 버튼 디자인
			
			$(".orgchart #1 .title").css({'background-color':'#001B6B'});
			$(".orgchart #1 .content").css({'border-color':'#001B6B'});

			$(".orgchart div[data-parent='1'] .title").css({'background-color':'#002EB8'});
			$(".orgchart div[data-parent='1'] .content").css({'border-color':'#002EB8'});
			
			$("div.node2").each(function(){
				  var divParent = $(this).parent().parent();
				  var beforeDivTitle = $(divParent).find(".title");
				  var beforeDivContent = $(divParent).find(".content");
				  $(beforeDivTitle).css("background", "#0F266B");
				  $(beforeDivContent).css("border-color", "#0F266B");
			});
			
			$("div.node3").each(function(){
				  var divParent = $(this).parent().parent();
				  var beforeDivTitle = $(divParent).find(".title");
				  var beforeDivContent = $(divParent).find(".content");
				  $(beforeDivTitle).css("background", "#003BEB");
				  $(beforeDivContent).css("border-color", "#003BEB");
			});
			
			// 새로고침 버튼 클릭 시 
			$('#btn-chart1').on('click', function (argument) {
		        oc.init({ 'data': data });
		        
		        $('.org-member').css({
							"border-bottom" : "1px solid lightpink"
						});
						
						$(".orgchart #1 .title").css({'background-color':'#001B6B'});
						$(".orgchart #1 .content").css({'border-color':'#001B6B'});
		
						$(".orgchart div[data-parent='1'] .title").css({'background-color':'#002EB8'});
						$(".orgchart div[data-parent='1'] .content").css({'border-color':'#002EB8'});
						
						$("div.node2").each(function(){
							  var divParent = $(this).parent().parent();
							  var beforeDivTitle = $(divParent).find(".title");
							  var beforeDivContent = $(divParent).find(".content");
							  $(beforeDivTitle).css("background", "#0F266B");
							  $(beforeDivContent).css("border-color", "#0F266B");
						});
						
						$("div.node3").each(function(){
							  var divParent = $(this).parent().parent();
							  var beforeDivTitle = $(divParent).find(".title");
							  var beforeDivContent = $(divParent).find(".content");
							  $(beforeDivTitle).css("background", "#003BEB");
							  $(beforeDivContent).css("border-color", "#003BEB");
						});
      });
			
			
		}
		,error : function(xhr){
			console.log("문제");
		}
});
		
		$(".oc-export-btn").addClass("btn btn-light-primary");
		
		
});

  	
  	
  </script>
		</div><!-- container col-11 -->
	</div><!-- d-flex flex-column-fluid -->
</div><!-- content d-flex flex-column flex-column-fluid -->


</body>
