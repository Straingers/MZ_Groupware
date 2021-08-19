<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@900&display=swap');

body {
  padding: 0;
  margin: 0; 
  height: 100vh;
  background: #18191f;
  font-family: 'Poppins', sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
}

ul {
  position: relative;
  display: flex;
}

li {
  list-style: none;
}

label {
  position: relative;
}

input[type="checkbox"] {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 80px;
  width: 80px;
  z-index: 100;
}

div {
  position: relative;
  height: 80px;
  width: 80px;
  background: #18191f;
  color: #555;
  display: flex;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 46px;
  cursor: pointer;
  margin: 0 4px;
  border-radius: 20px;
  box-shadow: -1px -1px 4px rgba(255, 255, 255, 0.05),
    4px 4px 6px rgba(0, 0, 0, 0.2),
    inset -1px -1px 4px rgba(255, 255, 255, 0.05),
    inset 1px 1px 1px rgba(0, 0, 0, 0.1);
}

/* div:before {
  content: "";
  position: absolute;
  top: 2px;
  left: 2px;
  width: 75px;
  height: 38px;
  border-top-left-radius: 20px;
  border-top-right-radius: 20px;
  background: rgba(255, 255, 255, 0.05);
} */

input[type="checkbox"]:checked ~ div {
  box-shadow: inset 0 0 2px rgba(255, 255, 255, 0.05),
    inset 4px 4px 6px rgba(0, 0, 0, 0.2);
  color: yellow;
  text-shadow: 0 0 15px yellow, 0 0 25px yellow;
  animation: glow 1.5s linear infinite;
}

@keyframes glow {
  0% {
    filter: hue-rotate(0deg);
  }
  100% {
    filter: hue-rotate(360deg);
  }
}
</style>
<meta charset="UTF-8">
<title></title>
<script src="https://tistory4.daumcdn.net/tistory/3134841/skin/images/confetti_v2.js"></script>

<style>
	#canvas{z-index:10;pointer-events: none;position: fixed;top: 0;transform: scale(1.1);}
	.fireworks-container {
	position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: #000000;
	}
	
</style>
<script src="<%=request.getContextPath() %>/resources/dist/fireworks.js"></script>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	const container = document.querySelector('.fireworks-container')
	const fireworks = new Fireworks(container, {
		  target: container,
		  startDelay: 1,
		    minDelay: 20,
		    maxDelay: 30,
		    speed: 4,
		    acceleration: 1.05,
		    friction: 0.98,
		    gravity: 1,
		    particles: 75,
		    trace: 3,
		    explosion: 5,
		    boundaries: {
		        top: 50,
		        bottom: container.clientHeight,
		        left: 50,
		        right: container.clientWidth
		    },
		    sound: {
		        enable: false,
		        list: [
		            'explosion0.mp3',
		            'explosion1.mp3',
		            'explosion2.mp3'
		        ],
		        min: 4,
		        max: 8
		    }
	});  
	$('#fire').click(function(){
		fireworks.start();
	});
});
</script>
<canvas id="canvas" style="width:1500px;height:1000px;"></canvas>
<div class="fireworks-container" style="background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;"></div>
<ul>
  <li>
    <input type="checkbox" id="fire"/>
    <div>최</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>종</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>프</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>로</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>젝</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>트</div>
  </li>
</ul>
<ul>
  <li>
    <input type="checkbox"  id="startButton"/>
    <div>수</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>고</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>많</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>으</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>셨</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>습</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>니</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>다</div>
  </li>
</ul>
<br><br><br><br><br><br><br>
<h3 style="color: white; font-family: sans-serif;position:relative;'">한명 한명 빛을 발하여 이와 같은 결과를 낼 수 있었습니다.</h3>
<br><br><br>
<h3 style="color: white; font-family: sans-serif;position:relative;">끝까지 저희의 프로젝트를 봐주셔서 감사합니다.</h3>
</body>
<script>

	
	
	
//티스토리 공감버튼 이벤트
  function reAction(){
  	$("#startButton").trigger("click");
  	setTimeout(function(){
  		$("#stopButton").trigger("click");
  	}, 6000);
  }  
  reAction(); 
</script>
</html>