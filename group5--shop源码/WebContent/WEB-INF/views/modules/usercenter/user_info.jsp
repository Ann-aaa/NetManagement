<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>个人信息- 猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/os/css/address.css">
<link rel="stylesheet" href="${ctxsta}/os/area/css/select2.css" />
</head>
<body>
<div class="span16">
  <div class="uc-box uc-main-box">
    <div class="uc-content-box">
      <div class="box-hd">
        <h1 class="title">个人信息</h1>
        
      </div>
      <div class="box-bd">
        <div class="user-address-list J_addressList clearfix">
          <c:forEach items="${us}" var="us">
             <div class="address-item J_addressItem" data-address_id="${address.addressId}" data-consignee="${us.userName}"  data-zipcode="${us.telephone}" data-tel="${us.loginPassword}">
              <dl>
                用户名：<dt> <span class="uname">${us.userName}</span> <br>联系电话：<em class="uname">${us.telephone}</em> </dt>
                密码：<dd class="utel">${us.loginPassword}</dd>
              </dl>
          <!--      <div class="actions"> <a class="modify J_addressModify" data-id="${us.userId}" href="javascript:void(0);">修改</a></div>  -->
            <div><a href="${ctx}/pass/password">修改密码</a></div>
            </div>
          </c:forEach>
        </div>
        <div class="xm-pagenavi">
          <c:if test="${pageInfo.total gt pageInfo.limit and not empty us}">
            <div id="pager" data-pager-href="${ctx}/uc/user/userinfo?page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-current="${pageInfo.current}"></div>
          </c:if>
          <div class="address-edit-box">
          <div class="box-main">
            <div class="form-section">
              <input class="input-text J_addressInput" type="text" id="user_name" name="userName" placeholder="用户名">
              <p class="tip-msg tipMsg"></p>
            </div>
            <div class="form-section">
                <input class="input-text J_addressInput" type="text" maxlength="11" id="user_phone" name="user_phone" placeholder="11位手机号">
              <p class="tip-msg tipMsg"></p>
            </div>
            <div class="form-section">
              <input class="input-text J_addressInput" type="text" maxlength="6" id="user_zipcode" name="user_zipcode" placeholder="密码">
              <p class="tip-msg tipMsg"></p>
            </div>
          </div>
          <div class="form-confirm clearfix">
            <input class="input-text J_addressInput" type="hidden" id="address_id" name="address_id">
            <a href="javascript:void(0);" class="btn btn-primary" id="J_save" >保存</a> <a href="javascript:void(0);" class="btn btn-gray" id="J_cancel">取消</a> </div>
        </div>
        
        </div>
        <div class="xm-edit-addr-backdrop" id="J_editAddrBackdrop"> </div>
      </div>
    </div>
  </div>
</div>
<myfooter> 
  <!-- layer javascript --> 
  <script src="${ctxsta}/common/layer/layer.js"></script> 
  <!-- 分页js --> 
  <script src="${ctxsta}/common/pager/jquery.pager.js"></script> 
  <!-- 地址选择 --> 
  <script src="${ctxsta}/os/area/js/area.js"></script> 
  <script src="${ctxsta}/os/area/js/location.js"></script> 
  <script src="${ctxsta}/os/area/js/select2.js"></script> 
  <script src="${ctxsta}/os/area/js/select2_locale_zh-CN.js"></script> 
  <script src="${ctxsta}/os/js/address.js"></script> 
  <script type="text/javascript">
		var pagecount = $('#pager').attr('data-pager-totalPage'); // 总页面数
		var current = $('#pager').attr('data-pager-current'); // 当前页数
		var href = $('#pager').attr('data-pager-href'); // 链接地址
		$(document).ready(function() {
			$("#pager").pager({
				pagenumber : current,
				pagecount : pagecount,
				buttonClickCallback : PageClick
			});
		});
		PageClick = function(number) {
			$("#pager").pager({
				pagenumber : number,
				pagecount : pagecount,
				buttonClickCallback : PageClick
			});
			window.location.href = href + number;
  	}
  </script> 
</myfooter>
</body>
</html>