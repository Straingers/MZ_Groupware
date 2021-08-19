<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
    <link rel=" shortcut icon" href="image/favicon.ico">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/Calendar/vendor/css/fullcalendar.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/Calendar/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='<%=request.getContextPath() %>/resources/Calendar/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='<%=request.getContextPath() %>/resources/Calendar/vendor/css/bootstrap-datetimepicker.min.css' />
    <link rel="stylesheet" href='<%=request.getContextPath() %>/resources/Calendar/vendor/css/checkbox.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/Calendar/css/main.css">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
.card-label {
  font-weight: 500;
  font-size: 1.400rem;
  color: #181C32;
}

.swal2-styled.swal2-confirm {
  border: 0;
  border-radius: 0.25em;
  background: initial;
  background-color: #2778c4;
  color: #fff;
  font-size: 1.0625em;
}

/* .btn.btn-primary:hover:not(.btn-text):not(:disabled):not(.disabled), .btn.btn-primary:focus:not(.btn-text), .btn.btn-primary.focus:not(.btn-text) { */
/*     color: rgb(255, 255, 255); */
/*     background-color: rgb(24, 125, 228); */
/*     border-color: rgb(24, 125, 228); */
/* } */

/* .swal2-styled.swal2-confirm { */
/* 	background-color: rgb(24, 125, 228); */
/* } */

</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/calendar/head.jsp" flush="true"></jsp:include>
	<div class="panel panel-default"
		style="float: left; margin-top: 80px; width: 20%; margin-left: 30px;">
		<div class="panel-heading">
			<h4 class="card-label" style="text-align: center;">사내일정</h4>
		</div>
		<div>
			<div class="panel-body">
				<ul style="padding-inline-start: 0px;">
					<li style="list-style: none; padding: 5px 0px 5px 5px; margin-bottom: 5px;">
						<div style="position: relative; display: inline; cursor: pointer; vertical-align: middle;">
							<label class="checkbox checkbox-dark"> <input type="checkbox" class='filter' id="checkbox-all" name="checkbox-all" checked="checked" value="1"><span></span><h4 class="card-label">&nbsp;&nbsp;&nbsp;전체일정</h4></label>
						</div>
					</li>

					<li style="list-style: none; padding: 5px 0px 5px 5px; margin-bottom: 5px;">
						<div style="position: relative; display: inline; cursor: pointer; vertical-align: middle;">
							<label class="checkbox checkbox-warning"> <input type="checkbox" class='filter' name="Check" checked="checked" value="100"><span></span><h4 class="card-label">&nbsp;&nbsp;&nbsp;경영지원부</h4> </label>
						</div>
					</li>

					<li style="list-style: none; padding: 5px 0px 5px 5px; margin-bottom: 5px;">
						<div style="position: relative; display: inline; cursor: pointer; vertical-align: middle;">
							<label class="checkbox checkbox-primary"> <input type="checkbox" class='filter' name="Check" checked="checked" value="200"><span></span><h4 class="card-label">&nbsp;&nbsp;&nbsp;사업부</h4> </label>
						</div>
					</li>

					<li style="list-style: none; padding: 5px 0px 5px 5px; margin-bottom: 5px;">
						<div style="position: relative; display: inline; cursor: pointer; vertical-align: middle;">
							<label class="checkbox checkbox-success"> <input type="checkbox" class='filter' name="Check" checked="checked" value="300"><span></span><h4 class="card-label">&nbsp;&nbsp;&nbsp;RnD부</h4> </label>
						</div>
					</li>
				</ul>
			</div>
		</div>
	
	
		<div class="panel-heading" style=" border-top: 2px solid #efefef;" >
			<h4 class="card-label" style="text-align: center;">내 일정</h4>
		</div>
		<div>
			<div class="panel-body">
				<ul style="padding-inline-start: 0px;">

					<li style="list-style: none; padding: 5px 0px 5px 5px; margin-bottom: 5px;">
						<div style="position: relative; display: inline; cursor: pointer; vertical-align: middle;">
<!-- 							<label class="checkbox-inline"><input class='filter' name='check2' type="checkbox" value="2" checked>&nbsp;마이캘린더</label> -->
							<label class="checkbox checkbox-danger"> <input type="checkbox" class='filter' name="MyCheck" checked="checked" value="2"><span></span><h4 class="card-label">&nbsp;&nbsp;&nbsp;내 일정</h4></label>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- /.filter panel -->
	
    <div class="container" style="float: right; width: 76%; height: 100%; padding-right: 30px;">
    
    <!-- user 정보 나중에 type을 hidden으로 바꾸기-->
	<input type="hidden" name="edit-empNo" id="edit-empNo"  value="${loginUser.empNo }" />
	<input type="hidden" name="edit-deptCode" id="edit-deptCode" value="${loginUser.deptCode }" />  
	
	

  	
        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">내 일정</a></li>
                <li><a tabindex="-1" href="#">부서일정</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">
					
<!--                         <div class="row"> -->
<!--                             <div class="col-xs-12"> -->
<!--                                 <label class="col-xs-4" for="edit-empNo">사번</label> -->
<!--                                 <input class="inputModal" type="text" name="edit-empNo" id="edit-empNo" -->
<!--                                     required="required" /> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="row"> -->
<!--                             <div class="col-xs-12"> -->
<!--                                 <label class="col-xs-4" for="edit-deptCode">부서코드</label> -->
<!--                                 <input class="inputModal" type="text" name="edit-deptCode" id="edit-deptCode" -->
<!--                                     required="required" /> -->
<!--                             </div> -->
<!--                         </div> -->
                        
                        
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">제목</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required"  />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">일정시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">일정 끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-place">장소</label>
                                <input class="inputModal" type="text" name="edit-place" id="edit-place"
                                    required="required" />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                             	 <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                  	<option value="내 일정">내 일정</option> 
                                    <option value="부서일정">부서일정</option>
                                </select> 
                            </div>
                        </div>
                        
<!--                         <div class="row"> -->
<!--                             <div class="col-xs-12"> -->
<!--                                 <label class="col-xs-4" for="edit-color">색상</label> -->
<!--                                 <select class="inputModal" name="color" id="edit-color"> -->
<!--                                     <option value="#D25565" style="color:#D25565;">빨간색</option> -->
<!--                                     <option value="#9775fa" style="color:#9775fa;">보라색</option> -->
<!--                                     <option value="#ffa94d" style="color:#ffa94d;">주황색</option> -->
<!--                                     <option value="#74c0fc" style="color:#74c0fc;">파란색</option> -->
<!--                                     <option value="#f06595" style="color:#f06595;">핑크색</option> -->
<!--                                     <option value="#63e6be" style="color:#63e6be;">연두색</option> -->
<!--                                     <option value="#a9e34b" style="color:#a9e34b;">초록색</option> -->
<!--                                     <option value="#4d638c" style="color:#4d638c;">남색</option> -->
<!--                                     <option value="#495057" style="color:#495057;">검정색</option> -->
<!--                                 </select> -->
<!--                             </div> -->
<!--                         </div> -->
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-primary" id="inputDate" style="float: left;">AUTO</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                     <div class="modal-footer modalBtnContainer-close">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
		

    </div>
    <!-- /.container -->
	

    <script src="<%=request.getContextPath() %>/resources/Calendar/vendor/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/Calendar/vendor/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/Calendar/vendor/js/moment.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/Calendar/vendor/js/fullcalendar.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/Calendar/vendor/js/ko.js"></script>
    <script src="<%=request.getContextPath() %>/resources/Calendar/vendor/js/select2.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/Calendar/vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/Calendar/js/main.js"></script>
    <script src="<%=request.getContextPath() %>/resources/Calendar/js/addEvent.js"></script>
    <script src="<%=request.getContextPath() %>/resources/Calendar/js/editEvent.js"></script>
    <script src="<%=request.getContextPath() %>/resources/Calendar/js/etcSetting.js"></script>

    
</body>

</html>