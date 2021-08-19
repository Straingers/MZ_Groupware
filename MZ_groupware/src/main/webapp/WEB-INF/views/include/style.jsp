<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<meta charset="utf-8" />

<meta name="description" content="Metronic admin dashboard live demo. Check out all the features of the admin panel. A large number of settings, additional services and widgets." />

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/dist/jquery.min.js"></script>
<link rel="canonical" href="https://keenthemes.com/metronic" />
<!--begin::Fonts-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
<!--end::Fonts-->
<!--begin::Global Theme Styles(used by all pages)-->
<link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/prismjs/prismjs.bundle.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/style.bundle.css" rel="stylesheet" type="text/css">
<!--end::Global Theme Styles-->
<!--begin::Layout Themes(used by all pages)-->
<link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet" type="text/css" />
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/themes/layout/header/base/light.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/themes/layout/header/menu/light.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/themes/layout/brand/light.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/themes/layout/aside/light.css" rel="stylesheet" type="text/css">

<!--end::Layout Themes-->
<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/bootstrap/media/logos/main.ico" />

<!-- customized Style -->
<link href="<%=request.getContextPath() %>/resources/css/allpageuse.css" rel="stylesheet" type="text/css">

<style>
/* @font-face { /* 나눔고딕 Regular */ */
/*   font-family: 'Nanum Gothic'; */
/*   font-style: normal; */
/*   font-weight: 400; */
/*   src: url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.eot); */
/*   src: url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.eot?#iefix) format('embedded-opentype'), */
/*        url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.woff2) format('woff2'), */
/*        url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.woff) format('woff'), */
/*        url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.ttf) format('truetype'); */
/* } */
/* @font-face { /* 나눔고딕 Bold */ */
/*   font-family: 'Nanum Gothic'; */
/*   font-style: normal; */
/*   font-weight: 700; */
/*   src: url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Bold.eot); */
/*   src: url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Bold.eot?#iefix) format('embedded-opentype'), */
/*        url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Bold.woff2) format('woff2'), */
/*        url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Bold.woff) format('woff'), */
/*        url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Bold.ttf) format('truetype'); */
/* } */
/* @font-face { /* 나눔고딕 ExtraBold */ */
/*   font-family: 'Nanum Gothic'; */
/*   font-style: normal; */
/*   font-weight: 800; */
/*   src: url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-ExtraBold.eot); */
/*   src: url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-ExtraBold.eot?#iefix) format('embedded-opentype'), */
/*        url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-ExtraBold.woff2) format('woff2'), */
/*        url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-ExtraBold.woff) format('woff'), */
/*        url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-ExtraBold.ttf) format('truetype'); */
/* } */

/* html, body { */
/*   font-family: 'Nanum Gothic', sans-serif; */
/* } */

@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

html, body{
 font-family: 'Nanum Gothic', sans-serif;
}
</style>
