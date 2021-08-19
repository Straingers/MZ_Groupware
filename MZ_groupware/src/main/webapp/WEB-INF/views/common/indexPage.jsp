<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>MZ GroupWare</title>
<head>

</head>
<body style="padding-left: 230px;">
<div class="d-flex flex-column flex-root">
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/main_aside.jsp" %>

<div class="d-flex flex-column flex-column-fluid">
	<div class="wrapper">
		<iframe name="ifr" src="<%=request.getContextPath() %>/common/main.do" frameborder="0" style="width:100%; height: 86.5vh;"></iframe>
	</div>
</div>
<ul class="sticky-toolbar nav flex-column pl-2 pr-2 pt-3 pb-3 mt-4">
	<!--begin::Item-->
	<li class="nav-item mb-2" id="kt_demo_panel_toggle" data-toggle="tooltip" title="" data-placement="right" data-original-title="업무공유 작성">
		<button class="btn btn-sm btn-icon btn-bg-light btn-icon-info btn-hover-info" onclick="OpenWindow('<%=request.getContextPath()%>/task/share/registForm.do','작성',1000,700);">
			<i class="fas fa-share-alt"></i>
		</button>
	</li>
	<!--end::Item-->
	<!--begin::Item-->
	<li class="nav-item mb-2" id="kt_demo_panel_toggle" data-toggle="tooltip" title="" data-placement="right" data-original-title="일일업무 작성">
		<button class="btn btn-sm btn-icon btn-bg-light btn-icon-success btn-hover-success" onclick="OpenWindow('<%=request.getContextPath()%>/task/daily/registForm.do','작성',1000,700);">
			<i class="fas fa-tasks"></i>
		</button>
	</li>
	<!--end::Item-->
	<!--begin::Item-->
	<li class="nav-item mb-2" data-toggle="tooltip" title="" data-placement="left" data-original-title="전자결재 작성">
		<button class="btn btn-sm btn-icon btn-bg-light btn-icon-primary btn-hover-primary" onclick="OpenWindow('<%=request.getContextPath()%>/approval/registForm','결재문서 등록',1000,700);">
			<i class="flaticon-interface-3"></i>
		</button>
	</li>
	<!--end::Item-->
	<!--begin::Item-->
	<li class="nav-item mb-2" data-toggle="tooltip" title="" data-placement="left" data-original-title="쪽지함">
		<button class="btn btn-sm btn-icon btn-bg-light btn-icon-warning btn-hover-warning" onclick="javascript:OpenWindow('<%=request.getContextPath()%>/message/receive/list.do','쪽지함',1250,700);" >
			<i class="far fa-comments"></i>
		</button>
	</li>
	<!--end::Item-->
	<!--begin::Item-->
<!-- 	<li class="nav-item" id="kt_sticky_toolbar_chat_toggler" data-toggle="tooltip" title="" data-placement="left" data-original-title="쪽지함"> -->
<!-- 		<a class="btn btn-sm btn-icon btn-bg-light btn-icon-danger btn-hover-danger" href="#" data-toggle="modal" data-target="#kt_chat_modal"> -->
<!-- 			<i class="flaticon2-chat-1"></i> -->
<!-- 		</a> -->
<!-- 	</li> -->
	<!--end::Item-->
</ul>

<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>

<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/js/index.js"></script>

<script type="text/x-handlebars-template"  id="subMenu-list-template">
{{#each .}}
{{#if subMenuList}}
	<li class="menu-item subMenu menu-item-submenu" aria-haspopup="true" data-menu-toggle="hover" onclick="goPage('{{menuUrl}}','{{menuCode}}');">
		<a href="javascript:;" class="menu-link menu-toggle">
			<i class="{{menuIcon}}"></i>&nbsp;&nbsp;&nbsp;
			<span class="menu-text">{{menuName}}</span>
			<i class="menu-arrow"></i>
		</a>
		<div class="menu-submenu subsubMenu">
			<!--<i class="menu-arrow"></i> -->			
			<ul class="menu-subnav">
				<li class="menu-item menu-item-parent" aria-haspopup="true">
					<span class="menu-link">
					<span class="menu-text">{{menuName}}</span>
					</span>
				</li>
				{{#each subMenuList}}
				<li class="menu-item" aria-haspopup="true">
					<a href="javascript:goPage('{{menuUrl}}','{{menuCode}}');" class="menu-link">
						<i class="menu-bullet menu-bullet-line">
							<span></span>
						</i>
						<span class="menu-text">{{menuName}}</span>
					</a>
				</li>
				{{/each}}
			</ul>
		</div>
	</li>
{{else}}
	<li class="menu-item subMenu menu-item-submenu" aria-haspopup="true" data-menu-toggle="hover" onclick="goPage('{{menuUrl}}','{{menuCode}}');">
		<a href="#" class="menu-link menu-toggle">
			<i class="{{menuIcon}}"></i>&nbsp;&nbsp;&nbsp;
			<span class="menu-text">{{menuName}}</span>
		</a>
		<div class="menu-submenu">
		</div>
	</li>
{{/if}}
{{/each}}
</script>

<script>
<!-- common -->
init();
function init() {
	goPage('${menu.menuUrl}', '${menu.menuCode}');
	subMenu('${menu.menuCode}'.substring(0, 3) + '0000');
}
</script>
</div>
</body>
