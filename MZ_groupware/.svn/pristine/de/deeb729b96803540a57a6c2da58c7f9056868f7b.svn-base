<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script id="template" type="text/template">
    <tr id="{empNo}" data-emp-name="{empName}" data-ps-name="{psName}" data-dept-name="{deptName}">
        <td class='text-center align-middle' style="width:100px;">{empName}</td>
        <td class='text-center align-middle' style="width:100px;">{psName}</td>
        <td class='text-center align-middle' style="width:100px;">{deptName}</td>
        <td class='text-center align-middle px-0'>
            <a href="javascript:fn_addRec('{empNo}')" id='addRec' class='btn btn-sm font-weight-bold btn-pill btn-outline-success mr-2'>수신</a>
            <a href="javascript:fn_addCc('{empNo}')" id='addCc' class='btn btn-sm font-weight-bold btn-pill btn-outline-success'>참조</a>
        </td>
    </tr>
</script>

<script>
  // JQuery 충돌 무시 코드
  var newJquery = $.noConflict(true);

  // 부서목록 기준 트리 생성
  getDeptList();

  function getDeptList() {
    $.ajax({
      url: "<%=request.getContextPath() %>/admin/comp/group/getdept.do"
      , type: "post"
      , contentType: "application/json; charset=utf-8;"
      , success: function (data) {
        setTree(data);
      }
    });
  }

  function setTree(treeData) {
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
      "plugins": ["state", "types"]
    });
    newJquery('#kt_tree_4').bind("select_node.jstree", function (e, data) {
      var deptName = data.node.text;
      var nodeId = data.node.id;
      getMember(deptName, nodeId);
    });
  }

  function getMember(deptName, nodeId) {
    if (deptName !== 'Palosanto') {
      $.ajax({
        url: "<%=request.getContextPath() %>/admin/comp/group/getdeptCodeByName.do?deptName=" + deptName
        , type: "GET"
        , contentType: "application/json; charset=utf-8;"
        , success: function (result) {
          var tableBodyHtml = "";
          if (result) {
            $.each(result, function (index, data) {
              tableBodyHtml +=
                $('#template').html()
                  .replaceAll('{empName}', data.empName)
                  .replaceAll('{psName}', data.psName)
                  .replaceAll('{deptName}', data.deptName)
                  .replaceAll('{empNo}', data.empNo);
            })
          } else {
            tableBodyHtml =
              "<td colspan='4' style='text-align: center;'>" +
              "   <span> 직원 정보가 없습니다. </span>" +
              "</td>"
          }
          $("#tableBody").html(tableBodyHtml);
        }
      });
    } else {
      $.ajax({
        url: "<%=request.getContextPath() %>/admin/comp/group/getEmployee.do"
        , type: "get"
        , contentType: "application/json; charset=utf-8;"
        , success: function (result) {
          var tableBodyHtml = "";
//           if (result) {
//             $.each(result, function (index, data) {
//               tableBodyHtml += "<tr>"
//                 + "<td>"
//                 + "<span id='empName'>" + data.empName + "</span>"
//                 + "</td>"
//                 + "<td>"
//                 + "<span id='psName'>" + data.psName + "</span>"
//                 + "</td>"
//                 + "<td>"
//                 + "<span id='deptName'>" + data.deptName + "</span>"
//                 + "</td>"
//                 + "</tr>"
//             })
//           } else {
//             tableBodyHtml += "<td colspan='3' style='text-align: center;'>"
//               + "<span > 직원 정보가 없습니다. </span>"
//               + "</td>"
//           }
		  tableBodyHtml += "<td class='mt-5' colspan='4' style='text-align: center;padding-top: 50px;'>"
              + "<span><b>부 또는 팀을 선택해주세요.</b></span>"
              + "</td>"


          $("#tableBody").html(tableBodyHtml);
        }
      });
    }
  }

  //회원 목록 조회/////////////////////////////////////////////////////////////
</script>

<script>
  function fn_extends() {
    newJquery("#kt_tree_4").jstree("open_all");
  }

  function fn_collapse() {
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
  });
</script>
