package com.shop.controller;

import com.shop.common.OsResult;
import com.shop.po.OsUser;
import com.shop.po.Seller;
import com.shop.service.OsCategoryService;
import com.shop.service.OsSellerService;
import com.shop.service.OsUserService;
import com.shop.util.CreateImageCode;
import com.shop.util.GetRandom;
import com.shop.vo.CartVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;

@Controller
@RequestMapping("/pass1")
public class OsSellerLoginController {

    @Autowired
    OsCategoryService osCategoryService;
    @Autowired
    OsSellerService osSellerService;

    //登录访问
    @RequestMapping("/login")
    public String loginUI(HttpServletRequest request) {
        return "/seller/seller_login";
    }

    //注册
    @RequestMapping("/register")
    public String registerUI(HttpServletRequest request) {
        return "/seller/seller_register";
    }

    @RequestMapping( "/bb/register")
    public String login(@ModelAttribute("seller") Seller seller, 
    		@RequestParam("registerCode") String registerCode,@RequestParam("money") String money, HttpSession session,HttpServletRequest request) {
    	String code = (String) session.getAttribute("code");
        //Long num = GetRandom.getNumber();
        //seller .setSellerNumber(num);
        BigDecimal price = new BigDecimal (money);
        seller.setPrice(price);
        if (code.equals(registerCode)) {
                osSellerService.insertSeller(seller);
                return "/seller/seller_login";    
        } else {
        	return "/seller/seller_register";
        }   	
    	
    }

    
    @RequestMapping( "/bb/login")
    public String login(@RequestParam("loginName1") String loginName,
                        @RequestParam("loginPassword1") String loginPassword, HttpSession session,HttpServletRequest request) {
        Seller seller = osSellerService.selectSeller(loginName, loginPassword);
        if (loginPassword.equals(seller.getLoginPassword())) {
            session.setAttribute("seller", seller);
            //session.setAttribute("seller", seller);
            CartVO cartVO = new CartVO();
            session.setAttribute("cart", cartVO);
           return "redirect:/index";
           // return "/seller/seller_register";
        } else {
            return "/seller/seller_register";
        }
    }

    //登出
    @RequestMapping("/logout")
    public String loginUI(HttpServletRequest request, HttpSession session) {
        session.invalidate();
        return "redirect:/index";
    }

    @RequestMapping(value = "/captcha-image.jpg")
    @ResponseBody
    public void getImageCode(HttpServletRequest req, HttpServletResponse response, HttpSession session) throws IOException {
        // 设置响应的类型格式为图片格式
        response.setContentType("image/jpeg");
        //禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        CreateImageCode vCode = new CreateImageCode(100, 30, 4, 8);
        System.out.println("code" + vCode.getCode());
        session.setAttribute("code", vCode.getCode());
        vCode.write(response.getOutputStream());
    }

}
