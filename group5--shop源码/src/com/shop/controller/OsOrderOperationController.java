package com.shop.controller;

import com.shop.po.OsOrder;
import com.shop.po.OsOrderStatus;
import com.shop.po.OsUser;
import com.shop.service.OsOrderService;
import com.shop.vo.OrderVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;

@Controller
@RequestMapping(value = "/uc/order")
public class OsOrderOperationController {

	@Autowired
	private OsOrderService orderService;

	// 订单列表
	@RequestMapping(value = "/list")
	public String orderUI(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "limit", required = false, defaultValue = "8") Integer limit) {
		OsUser user = (OsUser) session.getAttribute("user");
		List<OrderVO> orderVOs = orderService.getPageOrderByUserId(user.getUserId(), page, limit);
		com.shop.common.PageInfo info = new com.shop.common.PageInfo(page.intValue(), limit.intValue(), "", "");

		info.setTotal((int) orderService.getL().getTotal());
		request.setAttribute("pageInfo", info);
		request.setAttribute("orderVOs", orderVOs);
		return "/usercenter/user_order";
	}

	// 订单详情
	@RequestMapping(value = "//{orderNumber}")
	public String orderUI(@PathVariable Long orderNumber, HttpSession session, HttpServletRequest request) {
		OrderVO orderVO = orderService.getOrderByOrderNumber(orderNumber);

		request.setAttribute("orderVO", orderVO);
		return "/usercenter/user_order_view";
	}

	// 状态更改
	@RequestMapping(value = "/status/{orderNumber}")
	public String orderStatusUpdate(@PathVariable Long orderNumber, HttpSession session, HttpServletRequest request) {
		OrderVO orderVO = orderService.getOrderByOrderNumber(orderNumber);
		OsUser user = (OsUser) session.getAttribute("user");
		OsOrder osOrder = orderService.getByOrderNumber(orderNumber, user.getUserId());
		System.out.println(orderVO.getOrderId());
		OsOrderStatus oStatus = orderService.selectOrderStatusByOrderId(orderVO.getOrderId());
		OsOrderStatus oStatus1 = oStatus;
		oStatus1.setRemarks("已收货");
		byte status = Byte.parseByte("6");
		osOrder.setOrderStatus(status);
		oStatus1.setOrderStatus(status);
		orderService.updateByPrimaryKey(oStatus1);
		orderService.updateOsOrderByPrimaryKey(osOrder);
		orderVO.setOrderStatus(status);
		request.setAttribute("orderVO", orderVO);
//        return "redirect:/index";
		return "/order/order_finish_success";
	}

}
