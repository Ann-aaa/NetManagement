<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>添加商品属性 | 猫宁网 - 但行好事，莫问前程</title>
<meta name="author" content="猫宁Morning. - 但行好事，莫问前程。" />
<meta name="keywords" content="猫宁商城,猫宁Morning,猫宁公益商城,公益,电子商城,猫宁社区,公益商城,在线购物,社会责任">
<meta name="description" content="猫宁Morning公益商城是中国公益性在线电子商城，以商城B2C模式运营的公益在线商城，是一家致力于将传统公益商城互联网化的创新公益商城。">
<link rel="shortcut icon" href="${ctximg}/default/ico/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${ctxsta}/common/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctxsta}/os/user/css/gloab.css" />
<link rel="stylesheet" href="${ctxsta}/os/user/css/index.css" />
<script> var t1 = new Date().getTime(); baselocation='${ctx}';</script>
</head>
<body class="bgf4">
<script zIndex="-1" src="${ctxsta}/os/user/js/canvas-nest.min.js"></script>
<div class="login-box">
  <div class="container-nav"> <a class="navbar-brand" href="javascript:history.go(-1)">返回</a>
    <ul class="navbar-nav-right">
    <c:forEach items="${loginTop}" var="loginTop">
       <li><a href="${loginTop.href}" target="${loginTop.target}">${loginTop.name }</a></li>   
    </c:forEach>
      <li class="link-line">|</li>
    </ul>
  </div>
  <div class="main">
    <div class="reg-box-pan display-inline">
      <div class="step">
        <ul>
        </ul>
      </div>
      <div class="reg-box" id="verifyCheck" style="margin-top:20px;">
        <div class="part1">
          <form id="verifyUser" name="proinsert1" action="${ctx}/detail/insert/${sessionScope.product.productNumber}" method="post">
            
           
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>商品名称：</span>
              <div class="f-fl item-ifo">
                <input type="text" value="${sessionScope.product.name}" readonly="readonly" name="proname1" maxlength="20" class="txt03 f-r3 required btn_part1"   id="proname1" />
                </label>
              </div>
            </div>
            
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>商品介绍：</span>
              <div class="f-fl item-ifo">
                <input type="text" name="prointro" value="${sessionScope.product.introduce}" maxlength="2000" class="txt03 f-r3 required btn_part1"   id="prointro" />
                </label>
              </div>
            </div>
          <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>商品图片：</span>
              <div class="f-fl item-ifo">
               <input type="text" name="proimg"  maxlength="50" class="txt03 f-r3 required btn_part1"   id="proimg1" />
               </label>              
              </div>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>商品颜色：</span>
              <div class="f-fl item-ifo">
                <input type="text" name="procolor" maxlength="50" class="txt03 f-r3 required btn_part1"   id="procolor" />
                </label>
              </div>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>商品内存：</span>
              <div class="f-fl item-ifo">
                <input type="text" name="prosize" maxlength="50" class="txt03 f-r3 required btn_part1"   id="prosize" />
                </label>
              </div>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>商品库存：</span>
              <div class="f-fl item-ifo">
                <input type="text" name="prostock" maxlength="20" class="txt03 f-r3 required btn_part1"   id="prostock" />
                </label>
              </div>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>商品价格：</span>
              <div class="f-fl item-ifo">
                <input type="text" name="proprice"  maxlength="20" class="txt03 f-r3 required btn_part1"   id="proprice1" />
                </label>
              </div>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>商品积分：</span>
              <div class="f-fl item-ifo">
                <input type="text" name="proscore" maxlength="20" class="txt03 f-r3 required btn_part1"   id="proscore" />
                </label>
              </div>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl">&nbsp;</span>
              <div class="f-fl item-ifo"> 
              <input class="btn btn-blue f-r3" id="btn_login" type="submit" value="确定">
               </div>
            </div>
          </form>
        </div>
        <div class="part4 text-center" style="display:none">
          <h3></h3>
          <p class="c-666 f-mt30 f-mb50">页面将在 <strong id="times" class="f-size18">10</strong> 秒钟后，跳转到 <a href="${ctx}/pass/login" class="c-blue">登陆界面</a></p>
        </div>
        <div class="item col-xs-12" style="height:auto">
            <div class="lines" ></div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="m-sPopBg" style="z-index:998;"></div>
<div class="m-sPopCon regcon">
  <div class="m-sPopTitle"><strong>服务协议条款</strong><b id="sPopClose" class="m-sPopClose" onClick="closeClause()">×</b></div>
  <div class="apply_up_content">
    <pre class="f-r0">
		<strong>同意以下服务条款，提交注册信息</strong>
        </pre>
  </div>
  <center>
    <a class="btn btn-blue btn-lg f-size12 b-b0 b-l0 b-t0 b-r0 f-pl50 f-pr50 f-r3" href="javascript:closeClause();">已阅读并同意此条款</a>
  </center>
</div>
<footer class="footer clear">
</footer>
<script src="${ctxsta}/common/jquery/jquery-2.1.4.min.js"></script> 
<script src="${ctxsta}/common/bootstrap/js/bootstrap.min.js"></script> 
<script src="${ctxsta}/os/user/js/register.js"></script> 
<script src="${ctxsta}/os/js/base.js"></script>
</body>
</html>