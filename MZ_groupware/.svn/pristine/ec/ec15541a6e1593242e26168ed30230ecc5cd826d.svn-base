<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<style>
	.notification {
	  text-decoration: none;
	  padding: 15px 26px;
	  position: relative;
	  display: inline-block;
	}
	
	.notification .badge {
	  position: absolute;
	  top: -10px;
	  right: -20px;
	  border-radius: 50%;
	  background: red;
	  color: white;
	}
	.modal-backdrop {
		z-index: +1;
	}
	.rotate:hover {
  		transform: rotateY( 360deg )
	}
	.rotate {
        width: 100px;
        height: 100px;
        margin: 50px auto;
        padding: 20px;
        transition: all 1s linear;
      }
     .rotate {
     	width: 100%;
     	height: 100%;
     	border: 10px solid #ffffff;
     	border-radius: 50%;
     }
</style>

<div id="kt_header" class="header header-fixed">
	<!--begin::Container-->
	<div class="container-fluid d-flex align-items-stretch justify-content-between" style="background-color: #0871b9;">
		<!--begin::Header Menu Wrapper-->
		<div class="header-menu-wrapper header-menu-wrapper-left" id="kt_header_menu_wrapper">
			<!--begin::Header Menu-->
			<div id="kt_header_menu"
				class="header-menu header-menu-mobile header-menu-layout-default">
				<!-- 				begin::Header Nav -->
				<ul class="menu-nav">
					<c:forEach items="${menuList }" var="menu">
						<c:if test="${fn:substring(menu.menuCode, 0, 1) eq 'M' }">
							<li class="menu-item menu-item-submenu menu-item-rel active" data-menu-toggle="click" aria-haspopup="true">
								<a href="javascript:subMenu('${menu.menuCode }'); javascript:goPage('${menu.menuUrl}','${menu.menuCode }');" class="menu-link">
									<span class="menu-text">${menu.menuName }</span>
									<i class="menu-arrow"></i>
								</a>
							</li>
						</c:if>
					</c:forEach>
					<c:if test="${loginUser.authority eq 'ROLE_ADMIN' }">
						<c:forEach items="${menuList }" var="menu">
							<c:if test="${fn:substring(menu.menuCode, 0, 1) eq 'A' }">
								<li class="menu-item menu-item-submenu menu-item-rel active" data-menu-toggle="click" aria-haspopup="true">
									<a href="javascript:subMenu('${menu.menuCode }'); javascript:goPage('${menu.menuUrl}','${menu.menuCode }');" class="menu-link">
										<span class="menu-text">${menu.menuName }</span>
										<i class="menu-arrow"></i>
									</a>
								</li>
							</c:if>
						</c:forEach>
					</c:if>
				</ul>
				<!--end::Header Nav -->
			</div>
			<!--end::Header Menu-->
		</div>
		<!--end::Header Menu Wrapper-->
		<!--begin::Topbar-->
		<div class="topbar">
			<c:forEach items="${menuList }" var="menu">
				<c:if test="${fn:substring(menu.menuCode, 0, 1) eq 'Q' }">
				    <div class="topbar-item quick" data-offset="10px,0px" aria-expanded="false">
					    <div class="btn btn-icon btn-hover-icon-primary btn-clean btn-lg mr-1 rotate" 
										 data-container="body" data-toggle="popover" data-placement="bottom" data-content="${menu.menuName }" data-original-title="" title="">
							<a href="javascript:subMenu('${menu.menuCode }'); javascript:goPage('${menu.menuUrl}','${menu.menuCode }');">
								<span class="svg-icon svg-icon-xl svg-icon-primary icon" >
										${menu.menuIcon }
								</span>
				    		</a>
						</div>
					</div>
				</c:if>
		    </c:forEach>
		    
			
			<div class="dropdown dropdown-inline mr-4">
			    <div class="topbar-item" data-toggle="dropdown" data-offset="10px,0px" aria-expanded="false">
				    <div class="btn btn-icon btn-hover-icon-primary btn-clean btn-lg mr-1 rotate" 
				    		data-container="body" data-toggle="popover" data-placement="bottom" data-content="알림" data-original-title="" title="">
						<span class="svg-icon svg-icon-xl svg-icon-primary notification">
							<i class="fas fa-bell icon-lg text-white"></i>
							<c:if test="${notificationCnt ge 1}">
								<span class="counter counter-lg badge" id="notifyNum">${notificationCnt }</span>
								<span class="pulse-ring"></span>
							</c:if>
							<c:if test="${notificationCnt lt 1}">
								<span class="counter counter-lg badge" id="notifyNum" style="display: none;">0</span>
							</c:if>
						</span>
					</div>
				</div>
				<div class="dropdown-menu p-0 m-0 dropdown-menu-right dropdown-menu-anim-up dropdown-menu-lg">
					<form>
						<div class="d-flex flex-column bgi-size-cover bgi-no-repeat rounded-top" style="background-image: url(<%=request.getContextPath()%>/resources/bootstrap/media/misc/bg-1.jpg)">
							<h4 class="d-flex flex-center rounded-top py-6">
								<span class="text-white">알림</span>
							</h4>
						</div>
						<!--begin::Content-->
						<div class="tab-content">
							<div class="tab-pane show p-8 active" id="topbar_notifications_notifications" role="tabpanel">
								<!--begin::Nav-->
								<div class="scroll pr-7 mr-n7 ps notifyList" data-scroll="true" data-height="300" data-mobile-height="200" style="height: 300px; overflow: hidden;">
									<c:choose>
										<c:when test="${notificationList.size() == 0 }">
											<p class="font-size-h5 font-size-lg-h3 font-weight-boldest text-center" id="noNoti">알림이 없습니다.</p>
										</c:when>
										<c:otherwise>
											<c:forEach items="${notificationList }" var="notification">
												<c:choose>
													<c:when test="${notification.notificationType eq '쪽지' }">
														<div class="align-items-center" id="${notification.notificationNo }">
															<div class="offcanvas-header d-flex align-items-center justify-content-between pb-5">
																<div class="d-flex flex-column font-weight-bold">
																	<a href="javascript:OpenWindow('${notification.notificationUrl }', '${notification.notificationType } 상세보기', 500, 450);  javascript:removeNotify('${notification.notificationNo }');" 
																	   class="font-weight-bold text-dark-75 text-truncate text-hover-primary" style="width: 250px;">
																		[${notification.notificationType }] ${notification.notificationContent }
																	</a>
																</div>
																<div align="left">
																	<a href="javascript:removeXNotify('${notification.notificationNo }');" class="btn btn-xs btn-icon btn-light btn-hover-primary" id="kt_quick_cart_close">
																		<i class="ki ki-close icon-xs text-muted"></i>
																	</a>
																</div>
															</div>
														</div>
													</c:when>
													<c:otherwise>
														<div class="align-items-center" id="${notification.notificationNo }">
															<div class="offcanvas-header d-flex align-items-center justify-content-between pb-5">
																<div class="d-flex flex-column font-weight-bold">
																	<a href="javascript:OpenWindow('${notification.notificationUrl }', '${notification.notificationType } 상세보기', 1000, 700);  javascript:removeNotify('${notification.notificationNo }');" 
																	   class="font-weight-bold text-dark-75 text-truncate text-hover-primary" style="width: 250px;">
																		[${notification.notificationType }] ${notification.notificationContent }
																	</a>
																</div>
																<div align="left">
																	<a href="javascript:removeXNotify('${notification.notificationNo }');" class="btn btn-xs btn-icon btn-light btn-hover-primary" id="kt_quick_cart_close">
																		<i class="ki ki-close icon-xs text-muted"></i>
																	</a>
																</div>
															</div>
														</div>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								<div class="ps__rail-x" style="left: 0px; bottom: 0px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 0px; right: 0px; height: 300px;"><div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 109px;"></div></div></div>
								<!--end::Nav-->
							</div>
						
						</div>
						<!--end::Content-->
					</form>
				</div>
			</div>
			
		   <!-- QR 모달
		    	 resources\bootstrap\css\style.bundle.css
		    	 6838행 .modal-backdrop 에서 position: fixed; 주석 처리함!
	    	-->
		    <div class="topbar-item" data-offset="10px,0px" aria-expanded="false">
			    <div class="btn btn-icon btn-hover-icon-primary btn-clean btn-lg mr-1 rotate" data-container="body" data-toggle="popover" data-placement="bottom" data-content="QR코드" data-original-title="" title="">
					<span class="svg-icon svg-icon-xl svg-icon-primary" data-toggle="modal" data-target="#qrCode">
						<i class="fas fa-qrcode icon-xl text-white"></i>
<!-- 						<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="24" height="24"></rect><rect fill="#000000" opacity="0.3" x="4" y="4" width="8" height="16"></rect><path d="M6,18 L9,18 C9.66666667,18.1143819 10,18.4477153 10,19 C10,19.5522847 9.66666667,19.8856181 9,20 L4,20 L4,15 C4,14.3333333 4.33333333,14 5,14 C5.66666667,14 6,14.3333333 6,15 L6,18 Z M18,18 L18,15 C18.1143819,14.3333333 18.4477153,14 19,14 C19.5522847,14 19.8856181,14.3333333 20,15 L20,20 L15,20 C14.3333333,20 14,19.6666667 14,19 C14,18.3333333 14.3333333,18 15,18 L18,18 Z M18,6 L15,6 C14.3333333,5.88561808 14,5.55228475 14,5 C14,4.44771525 14.3333333,4.11438192 15,4 L20,4 L20,9 C20,9.66666667 19.6666667,10 19,10 C18.3333333,10 18,9.66666667 18,9 L18,6 Z M6,6 L6,9 C5.88561808,9.66666667 5.55228475,10 5,10 C4.44771525,10 4.11438192,9.66666667 4,9 L4,4 L9,4 C9.66666667,4 10,4.33333333 10,5 C10,5.66666667 9.66666667,6 9,6 L6,6 Z" fill="#000000" fill-rule="nonzero"></path></g></svg> -->
					</span>
				</div>
			</div>
			
			<div class="topbar-item" data-offset="10px,0px" aria-expanded="false">
				<div class="btn btn-hover-transparent-white d-inline-flex align-items-center btn-lg ml-5 p-2" onclick="logout_go();">
					<div class="d-flex flex-column text-right pr-3">
						<c:choose>
							<c:when test="${loginUser.authority eq 'ROLE_ADMIN' }">
						        <span class="text-white  font-weight-bolder font-size-base mr-2">관리자</span>
							</c:when>
							<c:otherwise>
						        <span class="text-white font-weight-bold font-size-base mr-2">${loginUser.deptName}</span>
						        <span class="text-white  font-weight-bolder font-size-base mr-2">${loginUser.empName}&nbsp;${loginUser.psName}</span>
							</c:otherwise>
						</c:choose>
			        </div>
			        <span class="symbol symbol-40">
			        	<i class="fas fa-sign-out-alt p-0 text-danger"></i>
			        </span>
				</div>
			</div>
						
			<div class="modal fade" id="qrCode" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
    			<div class="modal-dialog modal-dialog-centered modal-sm" role="document">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" align="center">${loginUser.empName}님의 QR코드</h5>
			                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <i aria-hidden="true" class="ki ki-close"></i>
			                </button>
			            </div>
			            <div class="modal-body">
			                <img id="img" class="img-fluid" width="300px" src="<c:url value="/createCode.do?qrCode=${loginUser.qrCode}" />"/>
			            </div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			            </div>
			        </div>
    			</div>
			</div>
		</div>
		<!--end::Topbar-->
	</div>
	<!--end::Container-->
</div>
<script>
function logout_go() {
	if(confirm('로그아웃하시겠습니까?')) {
		location.href="<%=request.getContextPath()%>/common/logout.do";
	}
}
</script>