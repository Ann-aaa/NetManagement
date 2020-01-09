<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>修改密码成功 - 猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/os/css/order-confirm.css">
</head>
<body>

<div class="page-main page-mini-main">
  <div class="container-fluid confirm-box">
    <form target="_blank" action="#" id="J_payForm" method="post">
      <div class="section section-order">
        <div class="order-info clearfix">
          <div class="fl">
            <h2 class="title">您的密码已经修改成功</h2>
          </div>
          <div class="fr">
          <a class="navbar-brand" href="javascript:history.go(-1)">返回</a>
        </div>
        </div>
        <i class="iconfont icon-right">&#x221a;</i>
      </div>
    </form>
  </div>
</div>
<myfooter> 
  <!-- layer javascript --> 
  <script src="${ctxsta}/common/layer/layer.js"></script> 
  <script src="${ctxsta}/os/js/order.js"></script> 
</myfooter>
</body>
</html>