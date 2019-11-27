package com.shop.controller;

import com.shop.po.OsUser;
import com.shop.service.OsCategoryService;
import com.shop.util.CreateImageCode;
import com.shop.util.GetRandom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/pass")
public class OsUserLoginController {

    @Autowired
    OsCategoryService osCategoryService;

    //登录访问
    @RequestMapping("/login")
    public String loginUI(HttpServletRequest request) {
        return "/user/user_login";
    }

    //注册
    @RequestMapping("/register")
    public String registerUI(HttpServletRequest request) {
        return "/user/user_register";
    }


    
//    @RequestMapping( "/aa/login")
//    public String login(@RequestParam("loginName") String loginName,
//                        @RequestParam("loginPassword") String loginPassword, HttpSession session,HttpServletRequest request) {
//        OsUser user = osUserService.selectUser(loginName, loginPassword);
//        if (loginPassword.equals(user.getLoginPassword())) {
//            session.setAttribute("user", user);
//            CartVO cartVO = new CartVO();
//            session.setAttribute("cart", cartVO);
//           return "redirect:/index";
//           
//        } else {
//            return "/user/user_register";
//        }
//    }

    //登出
    @RequestMapping("/logout")
    public String loginUI(HttpServletRequest request, HttpSession session) {
        session.invalidate();
        return "redirect:/index";
    }

    @RequestMapping(value = "/captcha-image.jpg")
    @ResponseBody
    public void getImageCode(HttpServletRequest req, HttpServletResponse response, HttpSession session) throws IOException {
        response.setContentType("image/jpeg");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        CreateImageCode vCode = new CreateImageCode(100, 30, 4, 8);
        System.out.println("code" + vCode.getCode());
        session.setAttribute("code", vCode.getCode());
        vCode.write(response.getOutputStream());
    }

}
