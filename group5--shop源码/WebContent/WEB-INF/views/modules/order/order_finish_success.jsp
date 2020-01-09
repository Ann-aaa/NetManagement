<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>选择在线支付方式 - 猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/os/css/order-confirm.css">
</head>
<body>
<!-- 轮播top菜单导航引入 -->
<jsp:include page="/WEB-INF/views/modules/common/site_header2.jsp" />
<!-- 轮播top菜单导航引入 -->

<div class="page-main page-mini-main">
  <div class="container-fluid confirm-box">
    <form target="_blank" action="#" id="J_payForm" method="post">
      <div class="section section-order">
        <div class="order-info clearfix">
          <div class="fl">
            <h2 class="title">收货成功！~~~谢谢您的光顾</h2>
            <p class="order-time" id="J_deliverDesc">感谢您的光顾</p>
          </div>
          <div class="fr">
        </div>
        </div>
        <i class="iconfont icon-right">&#x221a;</i>
        <a class="navbar-brand" href="javascript:history.go(-1)">返回我的订单</a>
       <!--     <div class="order-detail">
          <ul>
            <li class="clearfix">
              <div class="label">订单号：</div>
              <div class="content"> <span class="order-num"> ${order.orderNumber } </span> </div>
            </li>
            <li class="clearfix">
              <div class="label">收货信息：</div>
              <div class="content"> ${orderShipment.userName} ${orderShipment.userPhone}&nbsp;&nbsp;
                &nbsp;&nbsp;${orderShipment.userAdress} </div>
            </li>
            <li class="clearfix">
              <div class="label">商品名称：</div>
              <div class="content">
                <c:forEach items="${orderProducts}" var="orderProduct"> ${orderProduct.name}&nbsp;${orderProduct.productSpecName} <br>
                </c:forEach>
              </div>
            </li>
            <li class="clearfix">
              <div class="label">配送时间：</div>
              <div class="content">
                <c:if test="${order.shipmentTime eq 1}">不限送货时间</c:if>
                <c:if test="${order.shipmentTime eq 2}">工作日送货</c:if>
                <c:if test="${order.shipmentTime eq 3}">双休日、假日送货</c:if>
              </div>
            </li>
            <li class="clearfix">
              <div class="label">发票信息：</div>
                <div class="content">
                <c:if test="${order.invoiceType eq 1}">不开发票</c:if>
                <c:if test="${order.invoiceType eq 2}">电子发票&nbsp; ${order.invoiceTitle }</c:if>
                <c:if test="${order.invoiceType eq 3}">普通发票&nbsp; ${order.invoiceTitle }</c:if>
              </div>
             
            </li>
          </ul>
        </div>-->
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