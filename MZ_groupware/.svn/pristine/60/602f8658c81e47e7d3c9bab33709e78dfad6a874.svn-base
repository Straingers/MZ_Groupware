/**
 * 
 */

// pagination list up 함수 
//  page : 페이지 번호, url : list url
// copyright 김형민 2021.06.01
function list_go(page, url){
		
	if(!url) url = "list.do";
	
	var jobForm = $('#jobForm');
	
	jobForm.find('[name="page"]').val(page);
	jobForm.find('[name="perPageNum"]').val($('select[name="perPageNum"]').val());
	jobForm.find('[name="searchType"]').val($('select[name="searchType"]').val());
	jobForm.find('[name="keyword"]').val($('input[name="keyword"]').val());
	
	jobForm.attr({
		action : url
		, method : 'get'
	}).submit();
}


// 팝업창 띄우기
// 새로운 Window창을 Open할 경우 사용되는 함수(arg : 주소, 창타이틀, 넓이, 길이)
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	   winleft = (screen.width - WinWidth) / 2;
	   wintop = (screen.height - WinHeight) / 2;
	   var win = window.open(UrlStr, WinTitle, "scrollbars=yes, width=" + WinWidth
	         + ", " + "height=" + WinHeight + ", top=" + wintop + ", left="
	         + winleft + ", resizeable=yes, status=yes");
	   win.focus();
	}

// 팝업창 닫기
function CloseWindow(parentURL){
	if(parentURL) {
		window.opener.parent.location.href = parentURL;
	} else {
		window.opener.parent.location.reload(true);
	}
	window.close();
}

// 사진 불러오기
function MemberPictureThumb(targetObj, fileName){
	targetObj.style.backgroundImage = "url('getPicture.do?picture=" + fileName + "')";
	targetObj.style.backgroundPosition = "center";
	targetObj.style.backgroundRepeat = "no-repeat";
	targetObj.style.backgroundSize = "cover";
}

// 알림창 읽고나서 지우기
function removeNotify(notificationNo) {
	$.ajax({
		url : 'common/removeNotify.do'
		, data : {'notificationNo' : notificationNo}
		, type : "post"
		, success : function(){
			$("#" + notificationNo).remove();
			$(".notification").click();
			$('#notifyNum', parent.document).text(parseInt($('#notifyNum', parent.document).text()) - 1);
			if($('#notifyNum', parent.document).text() == 0) {
				$('#notifyNum', parent.document).css("display", "none");
				var str = '<p class="font-size-h5 font-size-lg-h3 font-weight-boldest text-center" id="noNoti">알림이 없습니다.</p>';
				$(".notifyList", parent.document).prepend(str);
			}
		}
	});
}
// 알림창에서 X버튼
function removeXNotify(notificationNo) {
	$.ajax({
		url : 'common/removeNotify.do'
		, data : {'notificationNo' : notificationNo}
		, type : "post"
		, success : function(){
			$("#" + notificationNo).remove();
			$('#notifyNum', parent.document).text(parseInt($('#notifyNum', parent.document).text()) - 1);
			if($('#notifyNum', parent.document).text() == 0) {
				$('#notifyNum', parent.document).css("display", "none");
				var str = '<p class="font-size-h5 font-size-lg-h3 font-weight-boldest text-center" id="noNoti">알림이 없습니다.</p>';
				$(".notifyList", parent.document).prepend(str);
			}
		}
	});
}






