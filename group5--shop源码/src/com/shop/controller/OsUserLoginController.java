package com.shop.controller;

import com.shop.common.OsResult;
import com.shop.po.OrderInfo;
import com.shop.po.OsOrder;
import com.shop.po.OsOrderProduct;
import com.shop.po.OsOrderShipment;
import com.shop.po.OsOrderStatus;
import com.shop.po.OsUser;
import com.shop.po.Seller;
import com.shop.service.OsCategoryService;
import com.shop.service.OsOrderService;
import com.shop.service.OsUserService;
import com.shop.util.CreateImageCode;
import com.shop.util.GetRandom;
import com.shop.vo.CartVO;
import com.shop.vo.OrderVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
  
@Controller
@RequestMapping("/pass")
public class OsUserLoginController {

	@Autowired
	OsCategoryService osCategoryService;
	@Autowired
	OsUserService osUserService;
	@Autowired
	OsOrderService osOrderService;

	// 登录访问
	@RequestMapping("/login")
	public String loginUI(HttpServletRequest request) {
		return "/user/user_login";
	}

	// 注册
	@RequestMapping("/register")
	public String registerUI(HttpServletRequest request) {
		return "/user/user_register";
	}

	// 修改密码
	@RequestMapping("/password")
	public String registerUI1(HttpServletRequest request) {
		return "/usercenter/password_update";
	}

	// 修改密码
	@RequestMapping(value = "/updatepass")
	public String address(@RequestParam("newpass") String newpass, HttpSession session) {
		OsUser user = (OsUser) session.getAttribute("user");
		user.setLoginPassword(newpass);
		osUserService.updateByPrimaryKey(user);
//        return "redirect:/index";
		return "/usercenter/update_success";
	}

	//订单管理
	@RequestMapping("/ordermanage")
	public String UserOrderManage(HttpServletRequest request, HttpSession session) {

		Seller seller = (Seller) session.getAttribute("seller");
		List<OsOrderProduct> oplist = osOrderService.selectBySellerId(seller.getSellerId());
		List<OrderInfo> oInfoList = new ArrayList<OrderInfo>();
		for (OsOrderProduct op : oplist) {
			OrderInfo orderInfo = new OrderInfo();
			orderInfo.setName(op.getName());
			System.out.println(op.getName());
			orderInfo.setBuyNumber(op.getBuyNumber());
			Long orderId = op.getOrderId();
			OsOrder order = osOrderService.selectOsOrderByOrderId(orderId);
			System.out.println(order.getOrderNumber());
			orderInfo.setOrderNumber(order.getOrderNumber());
			// orderInfo.setOrderStatus(order.getOrderStatus());
			orderInfo.setPayAmount(order.getPayAmount());
			OsOrderShipment orderShipment = osOrderService.getOrderShipmentByOrderId(orderId);
			System.out.println(orderShipment.getUserName());
			orderInfo.setUserName(orderShipment.getUserName());
			orderInfo.setTelephone(orderShipment.getUserPhone());
			orderInfo.setUserAdress(orderShipment.getUserAdress());

			OsOrderStatus orderStatus = osOrderService.selectOrderStatusByOrderId(orderId);
			System.out.println(orderStatus.getRemarks());
			orderInfo.setRemarks(orderStatus.getRemarks());

			oInfoList.add(orderInfo);
		}
		session.setAttribute("orderInfoList", oInfoList);
		return "/user/user_order_manage";
	}

	//修改订单状态
	@RequestMapping("/order/update/{orderNumber}")
	public String updateRemarks(HttpServletRequest request, @PathVariable Long orderNumber) {
		OsOrder order = osOrderService.selectOsOrderByOrderNumber(orderNumber);
		OsOrderStatus orderStatus = osOrderService.selectOrderStatusByOrderId(order.getOrderId());
		OsOrderStatus statusNew = orderStatus;
		String remark = orderStatus.getRemarks();
		switch (remark) {
		case "订单提交":
			byte status1 = Byte.parseByte("2");
			statusNew.setOrderStatus(status1);
			statusNew.setRemarks("付款成功");
			osOrderService.updateByPrimaryKey(statusNew);
			order.setOrderStatus(status1);
			osOrderService.updateOsOrderByPrimaryKey(order);
			System.out.println("订单提交to付款");
			break;
		case "付款成功":
			byte status2 = Byte.parseByte("3");
			statusNew.setOrderStatus(status2);
			statusNew.setRemarks("商家打包发货");
			osOrderService.updateByPrimaryKey(statusNew);
			order.setOrderStatus(status2);
			osOrderService.updateOsOrderByPrimaryKey(order);
			System.out.println("付款成功to商家打包发货");
			break;
		case "商家打包发货":
			byte status3 = Byte.parseByte("4");
			statusNew.setOrderStatus(status3);
			statusNew.setRemarks("等待快递揽收");
			osOrderService.updateByPrimaryKey(statusNew);
			order.setOrderStatus(status3);
			osOrderService.updateOsOrderByPrimaryKey(order);
			System.out.println("商家打包发货o等待快递揽收");
			break;
		case "等待快递揽收":
			byte status4 = Byte.parseByte("5");
			;
			statusNew.setOrderStatus(status4);
			statusNew.setRemarks("快递运输途中");
			osOrderService.updateByPrimaryKey(statusNew);
			order.setOrderStatus(status4);
			osOrderService.updateOsOrderByPrimaryKey(order);
			System.out.println("等待快递揽收to快递运输途中");
			break;
		case "快递运输途中":
			byte status5 = Byte.parseByte("6");
			statusNew.setOrderStatus(status5);
			statusNew.setRemarks("已收货");
			osOrderService.updateByPrimaryKey(statusNew);
			order.setOrderStatus(status5);
			osOrderService.updateOsOrderByPrimaryKey(order);
			System.out.println("快递运输途中to已收货");
			break;
//		case "已收货":
//			byte status6 = Byte.parseByte("1");
//			statusNew.setOrderStatus(status6);
//			statusNew.setRemarks("订单提交");
//			osOrderService.updateByPrimaryKey(statusNew);
//			order.setOrderStatus(status6);
//			osOrderService.updateOsOrderByPrimaryKey(order);
//			System.out.println("已收货to订单提交");
//			break;
		default:
			break;
		}
//    	return "redirect:/index";
		return "/order/order_update_success";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public Object register(@ModelAttribute("user") OsUser user, @RequestParam("registerCode") String registerCode,
			HttpSession session) {
		String code = (String) session.getAttribute("code");
		Long num = GetRandom.getNumber();
		user.setUserNumber(num);
		//

		//
		if (code.equals(registerCode)) {
			try {
				osUserService.insertUser(user);
				return new OsResult(1, user.getUserName());
			} catch (Exception e) {
				return new OsResult(0, "注册失败");
			}
		} else {
			return new OsResult(0, "验证码错误");
		}
	}

	// 登录
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Object login(@RequestParam("loginName") String loginName,
			@RequestParam("loginPassword") String loginPassword, HttpSession session) {
		OsUser user = osUserService.selectUser(loginName, loginPassword);
		if (loginPassword.equals(user.getLoginPassword())) {
			session.setAttribute("user", user);
			CartVO cartVO = new CartVO();
			session.setAttribute("cart", cartVO);
			return new OsResult(1, "");

		} else {
			return new OsResult(0, "登录失败，用户名或密码错误");
		}
	}


	// 登出
	@RequestMapping("/logout")
	public String loginUI(HttpServletRequest request, HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}

	
	@RequestMapping(value = "/captcha-image.jpg")
	@ResponseBody
	public void getImageCode(HttpServletRequest req, HttpServletResponse response, HttpSession session)
			throws IOException {
		// 设置响应的类型格式为图片格式
		response.setContentType("image/jpeg");
		// 禁止图像缓存。
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		CreateImageCode vCode = new CreateImageCode(100, 30, 4, 8);
		System.out.println("code" + vCode.getCode());
		session.setAttribute("code", vCode.getCode());
		vCode.write(response.getOutputStream());
	}

}
