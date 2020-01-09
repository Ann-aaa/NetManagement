<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>用户订单管理| 猫宁网 - 但行好事，莫问前程</title>
<meta name="author" content="猫宁Morning. - 但行好事，莫问前程。" />
<meta name="keywords" content="猫宁商城,猫宁Morning,猫宁公益商城,公益,电子商城,猫宁社区,公益商城,在线购物,社会责任">
<meta name="description" content="猫宁Morning公益商城是中国公益性在线电子商城，以商城B2C模式运营的公益在线商城，是一家致力于将传统公益商城互联网化的创新公益商城。">
<link rel="shortcut icon" href="${ctximg}/default/ico/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${ctxsta}/common/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctxsta}/os/user/css/gloab.css" />
<link rel="stylesheet" href="${ctxsta}/os/user/css/index.css" />
<link rel="stylesheet" href="${ctxsta}/os/user/css/style.css"/>
<script> var t1 = new Date().getTime(); baselocation='${ctx}';</script>
</head>
<body class="bgf4">
<script zIndex="-1" src="${ctxsta}/os/user/js/canvas-nest.min.js"></script>
<div class="login-box">
  <div class="container-nav"> <a class="navbar-brand" href="javascript:history.go(-1)">返回</a>
    <ul class="navbar-nav-right">
      <c:forEach items="${loginTop}" var="loginTop">
        <li><a href="${loginTop.href}" target="${loginTop.target }">${loginTop.name }</a></li>
      </c:forEach>
       
    </ul>
  </div>
  <div class="main">
    <div class="reg-box-pan display-inline">
      <div class="reg-box login" id="verifyCheck" style="margin-top:20px;">
        <div class="part1">
        
        <div class="feat_prod_box_details">
					<div class="contact_form">
						<div class="form_subtitle">用户订单管理</div>

						<form>
							<table>
								<tr>
									
									<th>用户名</th>
									<th>手机号</th>
									<th>地址</th>
									<th>订单编号</th>
									<th>总价</th>
									<th>商品名称</th>
									<th>商品数量</th>
									<th>状态</th>

									<th>处理订单</th>


								</tr>

								<c:forEach items="${sessionScope.orderInfoList}" var="oInfo">
									<tr>
										<td align="center">${oInfo.userName}</td>
										<td align="center">${oInfo.telephone}</td>
										<td align="center">${oInfo.userAdress}</td>
										<td align="center">${oInfo.orderNumber}</td>
										<td align="center">${oInfo.payAmount}</td>
										<td align="center">${oInfo.name}</td>
										<td align="center">${oInfo.buyNumber}</td>
										<td align="center">${oInfo.remarks}</td>
										<td align="center"><a
											href="${ctx}/pass/order/update/${oInfo.orderNumber}">处理订单</a></td>
									</tr>
								</c:forEach>
							</table>
						</form>
					</div>
				</div>
        
          <div class="item col-xs-12 message" style="height:auto">
            <label class="valid" ></label>
          </div>
          <div class="item col-xs-12" style="height:auto">
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<footer class="footer clear">
</footer>
<script src="${ctxsta}/common/jquery/jquery-2.1.4.min.js"></script> 
<script src="${ctxsta}/common/bootstrap/js/bootstrap.min.js"></script> 
<script src="${ctxsta}/common/security/security.js"></script> 
<script src="${ctxsta}/os/user/js/register.js"></script> 
<script src="${ctxsta}/os/js/base.js"></script>
</body>
</html>
