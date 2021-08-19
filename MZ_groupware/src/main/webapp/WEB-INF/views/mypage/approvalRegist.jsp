<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
   <title>결재선 등록</title>
   <link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.css" rel="stylesheet" type="text/css">
    <%@ include file="/WEB-INF/views/admin/comp/group/jstree_css.jsp" %>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/dist/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.js"></script>
<style>
#apList::-webkit-scrollbar {
	width: 5px; /*스크롤바의 너비*/
}

#apList::-webkit-scrollbar-thumb {
	background-color: rgb(226, 226, 226);
}

#apList::-webkit-scrollbar-track {
	background-color: white;
}
</style>
</head>
<body>

<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
   <div class="d-flex flex-column-fluid">
      <div class="container col-11">

         <div class="card-header" style="justify-content: left">
            <h4 class="modal-title" id="myModalLabel">결재선 등록</h4>
         </div>
         <div class="card-body">
      
         <div class="row">
               <div id="kt_tree_4" class="tree-demo col-4" style="border: 1px solid #EBEDF3;">
               </div>
               <div id="apList" class="col-8" style="border: 1px solid #EBEDF3; overflow: auto; height: 320px;">
                  <table class="table table-hover" id="del_target">
                     <thead>
                        <tr style="left: 0px;">
                        
                           <th scope="col" id="th_checkBox">
                              <span style="width: 20px;">
                                 <label class="checkbox checkbox-single checkbox-all">
                                    <input type="checkbox" id="all_select">&nbsp;<span></span>
                                 </label>
                              </span>
                           </th>
                           <th scope="col">
                              <span style="width: 137px;">사번</span>
                           </th>
                           <th scope="col">
                              <span style="width: 137px;">이름</span>
                           </th>
                           <th scope="col">
                              <span style="width: 137px;">직위</span>
                           </th>
                           <th scope="col">
                              <span style="width: 137px;">부서</span>
                           </th>
                        </tr>
                     </thead>
                     <tbody id="tableBody" style="min-height: 270px;">
                        
                     </tbody>
               </table>
            </div>
         </div>

         <div class="d-flex justify-content-center mt-3">
            <button class="btn btn-primary btn-shadow-hover btn-sm font-weight-bold col-2" onclick="appList_go('first');">1차 결재권자</button>
            <button class="btn btn-primary btn-shadow-hover btn-sm font-weight-bold col-2 ml-3" onclick="appList_go('second');">2차 결재권자</button>
            <button class="btn btn-primary btn-shadow-hover btn-sm font-weight-bold col-2 ml-3" onclick="appList_go('third');">최종 결재권자</button>
         </div>
<!--             <input type="hidden" name="refEmp" class="form-control" value="1" style="border: none; height: 9.75px; text-align: center;"> -->
            <div class="modal-body" style="height: 150px;">
               <table class="table table-hover" id="tableBody">
               <thead>
                  <tr>
                     <th scope="col" class="col-2">
                        <span>사번</span>
                     </th>
                     <th scope="col" class="col-2">
                        <span>이름</span>
                     </th>
                     <th scope="col" class="col-2">
                        <span>직위</span>
                     </th>
                     <th scope="col" class="col-2">
                        <span>부서</span>
                     </th>
                     <th scope="col" class="col-4">
                        <span>결재유형</span>
                     </th>
                  </tr>
               </thead>
               <tbody id="listDiv">
               </tbody>
               </table>
            </div>
         </div>
      </div>
   </div>
</div>
<div class="card-footer">
   <div class="form-group">
      <form id="registForm">
         <input type="hidden" name="empNo" id="empNo" value="${loginUser.empNo}"/>
         <input type="hidden" name="lineFirst" id="lineFirst"/>
         <input type="hidden" name="lineSecond" id="lineSecond"/>
         <input type="hidden" name="lineFinal" id="lineFinal"/>
         <label>결재선 이름</label>
         <div class="input-group">
            <input type="text" name="lineName" class="form-control  mr-2" placeholder="결재선 이름을 입력하세요."/>
             <button type="button" class="btn btn-primary mr-2" onclick="reg_go();">확인</button>
             <button type="button" class="btn btn-default" onclick="javascript:CloseWindow();">취소</button>
         </div>
      </form>
   </div>
</div>

<%@ include file="/WEB-INF/views/approval/js/jstree_js.jsp" %>   

<script>

function remove_go(ele) {
   $(ele).remove();
   
   if ($("#listDiv [name='firType']").length < 1) {
      $("#listDiv").append(firStr);
      $("input[name='chk']").prop("checked",false);
   }else if ($("#listDiv [name='secType']").length < 1) {
      $("#listDiv").append(secStr);
      $("input[name='chk']").prop("checked",false);
   }else if ($("#listDiv [name='thiType']").length < 1) {
      $("#listDiv").append(thiStr);
      $("input[name='chk']").prop("checked",false);
   }
}

function jsTree_go() {
   var test = $("#empNoTree").html();
}

$('#all_select').click(function () {
      if ($("input:checkbox[id='all_select']").prop("checked")) {
          $("input[type=checkbox]").prop("checked", true);
      } else {
          $("input[type=checkbox]").prop("checked", false);
      }
  });

  $('#del_target').click(function () { 
      var tbodyTr = $('#tableBody tr');
      const tdArr = [];   // 배열 선언
      const td = tbodyTr.children();
      
      td.each(function (i) {
          if (td.eq(i).children().children().prop("checked")) {
              tdArr.push(td.eq(i - 1).text());
          }
      });
      console.log(tdArr);
  });

function appList_go(type) {
   
   var first = '1차결재권자';
   var second = '2차결재권자';
   var third = '3차결재권자';
   
   var firStr = '';
   var secStr = '';
   var thiStr = '';
   
   $("input[name='chk']:checked").each(function() {
      var test = $(this).val();
      var empl = $('[name="inEmpNo"]').length;
      var emplName = $('[name="inEmpName"]').length;
      var empArr = new Array(empl);
      var empArrName = new Array(emplName);
      
      for(var i = 0; i < empl; i++) {
         empArr[i] = $('[name="inEmpNo"]').eq(i).text();
      }
      for(var i = 0; i < emplName; i++) {
         empArrName[i] = $('[name="inEmpName"]').eq(i).text();
      }
           
      if(empArr.indexOf(test.split(",")[0]) != -1) {
         alert(test.split(",")[1] +" 님은 이미 추가된 임직원입니다.");
         return;
      }
      
      
      if (type == 'first' || type == 'second' || type == 'third') {
         if ($("input[name='chk']:checked").length > 1) {
            alert("결재권자는 각 1명만 등록 가능합니다.");
            return;
         }
      }
   
   if(type == 'first') {
      firStr += '<tr style="left: 0px;" id="listTr" onclick="remove_go(this);">'
         +    '<td scope="col">'
         +       '<span type="text" name="firstEmpNo" >' + test.split(",")[0] + '</span>'
         +       '<input type="hidden" name="inEmpNo" value="' + test.split(",")[0] + '">'
         +   '</td>'
         +    '<td scope="col">'
         +       '<span type="text" name="firstEmpName">'+ test.split(",")[1] +'</span>'
         +       '<input type="hidden" name="inEmpName" value="' + test.split(",")[1] + '">'
         +   '</td>'
         +    '<td scope="col">'
         +       '<span type="text">' + test.split(",")[2] + '</span>'
         +   '</td>'
         +    '<td scope="col">'
         +       '<span type="text">' + test.split(",")[3] + '</span>'
         +   '</td>'
         +    '<td scope="col">'
         +   '<span type="text" name="firType">'+ first +'</span>'
         +    '</td>'
         +    '</tr>'
   } else if(type == 'second') {
      secStr += '<tr style="left: 0px;" id="listTr" onclick="remove_go(this);">'
         +    '<td scope="col">'
         +       '<span type="text" name="secondEmpNo">' + test.split(",")[0] + '</span>'
         +       '<input type="hidden" name="inEmpNo" value="' + test.split(",")[0] + '">'
         +   '</td>'
         +    '<td scope="col">'
         +       '<span type="text" name="secondEmpName">' + test.split(",")[1] + '</span>'
         +       '<input type="hidden" name="inEmpName" value="' + test.split(",")[1] + '">'
         +   '</td>'
         +    '<td scope="col">'
         +       '<span type="text">' + test.split(",")[2] + '</span>'
         +   '</td>'
         +    '<td scope="col">'
         +       '<span type="text">' + test.split(",")[3] + '</span>'
         +   '</td>'
         +    '<td scope="col">'
         +   '<span type="text" name="secType">'+ second +'</span>'
         +    '</td>'
         +    '</tr>'
   }else if(type == 'third') {
      thiStr += '<tr style="left: 0px;" id="listTr" onclick="remove_go(this);">'
         +    '<td scope="col">'
         +       '<span type="text" name="thirdEmpNo">' + test.split(",")[0] + '</span>'
         +       '<input type="hidden" name="inEmpNo" value="' + test.split(",")[0] + '">'
         +   '</td>'
         +    '<td scope="col">'
         +       '<span type="text" name="thirdEmpName">' + test.split(",")[1] + '</span>'
         +       '<input type="hidden" name="inEmpName" value="' + test.split(",")[1] + '">'
         +   '</td>'
         +    '<td scope="col">'
         +       '<span type="text">' + test.split(",")[2] + '</span>'
         +   '</td>'
         +    '<td scope="col">'
         +       '<span type="text">' + test.split(",")[3] + '</span>'
         +   '</td>'
         +    '<td scope="col">'
         +   '<span type="text" name="thiType">'+ third +'</span>'
         +    '</td>'
         +    '</tr>'
   }
});   

if ($("#listDiv [name='firType']").length < 1) {
   $("#listDiv").append(firStr);
   $("input[name='chk']").prop("checked",false);
}else if ($("#listDiv [name='secType']").length < 1) {
   $("#listDiv").append(secStr);
   $("input[name='chk']").prop("checked",false);
}else if ($("#listDiv [name='thiType']").length < 1) {
   $("#listDiv").append(thiStr);
   $("input[name='chk']").prop("checked",false);
   }
}

function reg_go() {
    $('#lineFirst').empty();
    $('#lineSecond').empty();
    $('#lineFinal').empty();
    
   var first = $('[name="firstEmpNo"]');
   if (first.length == 0) {
      alert("1차 결재자 선택은 필수입니다.");
      return;
   }
   var second = $('[name="secondEmpNo"]');
   if (second.length == 0) {
      alert("2차 결재자 선택은 필수입니다.");
      return;
   }
   var third = $('[name="thirdEmpNo"]');
   if (third.length == 0) {
      alert("3차 결재자 선택은 필수입니다.");
      return;
   }
    
    $('#lineFirst').val(first.text());
    $('#lineSecond').val(second.text());
    $('#lineFinal').val(third.text());
   
    if(confirm('결재선을 등록하시겠습니까?')) {
       $('#registForm').attr("action", "<%=request.getContextPath()%>/mypage/line/approvalRegist.do");
       $('#registForm').attr("method", "post");
       $('#registForm').submit();
   }
}
</script>

</body>