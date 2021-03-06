package com.shop.controller;

import com.shop.common.OsResult;
import com.shop.po.OsAddress;
import com.shop.po.OsCategory;
import com.shop.po.OsProduct;
import com.shop.po.OsUser;
import com.shop.service.OsAddressService;
import com.shop.service.OsUserService;
import com.shop.vo.AddressVO;
import com.shop.vo.UserVO;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;

@Controller
@RequestMapping(value = "/uc/user")
public class OsUserInfoController {
	@Autowired
	private OsAddressService osAddressService;
	@Autowired
	private OsUserService osUserService;

	//我的个人中心
	@RequestMapping(value = "/portal")
	public String portal() {
		return "/usercenter/user_portal";
	}

	// 更新用户信息
	/*
	 * @RequestMapping("/password") public String registerUI(HttpServletRequest
	 * request) { return "/usercenter/password_update"; }
	 * 
	 * @RequestMapping(value = "/updatepass") public String
	 * address(@RequestParam("newpass") String newpass, HttpSession session) {
	 * OsUser user = (OsUser) session.getAttribute("user");
	 * user.setLoginPassword(newpass); osUserService.updateByPrimaryKey(user);
	 * return "redirect:/index"; }
	 */

	//收货地址
	@RequestMapping(value = "/address")
	public String address(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "limit", required = false, defaultValue = "3") Integer limit,
			HttpServletRequest request, HttpSession session) {
		OsUser user = (OsUser) session.getAttribute("user");
		List<OsAddress> addresses = osAddressService.pageAddressInfo(page, limit, user.getUserId());

		com.shop.common.PageInfo info = new com.shop.common.PageInfo(page.intValue(), limit.intValue(), "", "");
		info.setTotal((int) osAddressService.getL().getTotal());
		request.setAttribute("addresses", addresses);
		request.setAttribute("pageInfo", info);
		return "/usercenter/user_address";     
	}

	//查看个人信息
	@RequestMapping(value = "/userinfo")
	public String UserInfo(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "limit", required = false, defaultValue = "3") Integer limit,
			HttpServletRequest request, HttpSession session) {
		OsUser user = (OsUser) session.getAttribute("user");
		List<OsUser> us = osAddressService.pageUserInfo(page, limit, user.getUserId());

		com.shop.common.PageInfo info = new com.shop.common.PageInfo(page.intValue(), limit.intValue(), "", "");
		info.setTotal((int) osAddressService.getJ().getTotal());
		request.setAttribute("us", us);
		request.setAttribute("pageInfo", info);
		return "/usercenter/user_info";
	}

	//创建收货地址
	@RequestMapping(value = "/address/insert", method = RequestMethod.POST)
	@ResponseBody
	public Object addressCreate(OsAddress address, HttpSession session) {
		OsUser osUser = (OsUser) session.getAttribute("user");
		address.setUserId(osUser.getUserId());
		Integer count = osAddressService.insertAddress(address);
		if (count == 1) {
			return new OsResult(1, "新增收货地址成功");
		} else {
			return new OsResult(0, "新增收货地址失败");
		}

	}

	//更新收货地址
	@RequestMapping(value = "/address/update", method = RequestMethod.POST)
	@ResponseBody
	public Object addressUpdate(AddressVO addressvo, HttpSession session) {
		OsUser osUser = (OsUser) session.getAttribute("user");
		OsAddress osAddress = new OsAddress();
		BeanUtils.copyProperties(addressvo, osAddress);//将osAddress值赋给addressvo  反射   javaBean属性
		osAddress.setUserId(osUser.getUserId());
		int count = osAddressService.updatetAddress(osAddress);
		if (count == 1) {
			return new OsResult(1, "更新收货地址成功");
		} else {
			return new OsResult(0, "更新收货地址失败");
		}
	}

	//更新用户信息
	@RequestMapping(value = "/user/update", method = RequestMethod.POST)
	@ResponseBody
	public Object userUpdate(UserVO uservo, HttpSession session) {
		OsUser osUser = (OsUser) session.getAttribute("user");
		OsUser osAddress = new OsUser();
		BeanUtils.copyProperties(uservo, osAddress);
		osUser.setUserId(osUser.getUserId());
		int count = osAddressService.updatetUser(osUser);
		if (count == 1) {
			return new OsResult(1, "更新成功");
		} else {
			return new OsResult(0, "更新失败");
		}
	}

	//删除收货地址
	@RequestMapping(value = "/address/{addressId}", method = RequestMethod.DELETE)
	@ResponseBody
	public Object addressDelete(@PathVariable("addressId") Long addressId, HttpSession session) {
		Integer count = osAddressService.deleteByAddressId(addressId);
		if (count == 1) {
			return new OsResult(1, "删除收货地址成功");
		} else {
			return new OsResult(0, "删除收货地址失败");
		}
	}
}
