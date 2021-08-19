/**
 * 
 */
function subMenu(menuCode) {
	if(menuCode!="M010000") {
		$.getJSON("subMenu.do?menuCode=" + menuCode, function(data){	
			printData(data, $('.subMenuList'), $('#subMenu-list-template'), '.subMenu');
		});
	}else {
		$('.subMenuList').html("");	
	}
}

function printData(dataArr, target, templateObject, removeClass) {
	var template = Handlebars.compile(templateObject.html());
	
	var html = template(dataArr);
	
	$(removeClass).remove();
	target.append(html);
}

function goPage(url, menuCode) {
	//HTML5 지원 브라우저에서 사용가능
	if(typeof(history.pushState) == 'function'){
		var renewURL = location.href;
		
		renewURL = renewURL.substring(0, renewURL.indexOf(".do") + 3);
		
		if(menuCode != 'M010000'){
			renewURL += "?menuCode=" + menuCode;
		}
		// 페이지를 리로드하지 않고 페이지 주소면 변경할때 사용
		history.pushState(menuCode, null, renewURL);
	} else {
		location.hash = "#" + menuCode;
	}
	$('iframe[name="ifr"]').attr("src", url);
}

