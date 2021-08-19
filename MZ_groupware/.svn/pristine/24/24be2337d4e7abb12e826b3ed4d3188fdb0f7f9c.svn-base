<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
"use strict";
function enterkey() {
    if (window.event.keyCode == 13) {
		$("#session-timeout-dialog-keepalive").click();
    }
}
function KTSessionTimeoutDemo() {
	var cnt = 0;
    var initDemo = function () {
    	$.sessionTimeout({
            title: "부재중...",
            message: "장시간 활동이 확인되지 않았습니다. 비밀번호를 확인합니다.<br>"
            		+ "<input class='form-control' type='password' onkeyup='enterkey();' id='pwd' placeholder='비밀번호를 입력하세요' value='' /><br>",
            logoutButton : '로그아웃' ,
            logoutButtonClass : 'btn-default' ,
            keepAliveButton : '비밀번호확인' ,
            keepAliveButtonClass : 'btn-primary' ,
            keepAliveUrl: location.href,
            redirUrl: "<%=request.getContextPath() %>/common/logout.do",
            logoutUrl: "<%=request.getContextPath() %>/common/logout.do",
            warnAfter: 1000,
            redirAfter: 60000, //redirect after 10 secons,
            ignoreUserActivity: true,
            countdownMessage: "Redirecting in {timer} seconds.",
            countdownBar: true
        });
    	
    	$('#session-timeout-dialog').on('hide.bs.modal', function() {
			if($("#pwd").val() == '') {
				Swal.fire("비밀번호가 입력되지 않았습니다.", "", "warning");
				$("#pwd").val("");
		   		startSessionTimer();
				$("#pwd").focus();
		   		return;
			}
			if($("#pwd").val() == '${loginUser.empPwd }') {
				Swal.fire("로그인이 유지됩니다.", "", "success");
				location.reload();
				return;
			} else {
				cnt++;
			}
			if(cnt == 5) {
				Swal.fire("비밀번호를  5회 이상 잘못 입력하셨습니다.\n로그아웃 됩니다.", "", "error");
				setTimeout(function(){
					window.location = "<%=request.getContextPath() %>/common/logout.do";
					$("#pwd").val("");
				}, 1500);
				return;

			}
		    Swal.fire(cnt + "회 비밀번호를 잘못 입력하셨습니다.", "(" + cnt + "/5)", "error");
			$("#pwd").val("");
	   		startSessionTimer();
			$("#pwd").focus();
        });
    }
    return initDemo();
}

var timer = 0;

$("body").click(function(e) {
	timer = 0;
});

$(document).ready(function() {
	setInterval("cnt_plus()", 1000);
});

function cnt_plus() {
	timer += 1000;
	if(timer == 3600000){
		timer = 0;
		KTSessionTimeoutDemo();
	}
}
</script>