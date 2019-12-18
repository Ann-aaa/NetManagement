package com.shop.controller;

import com.shop.common.OsResult;
import com.shop.po.OsAddress;
import com.shop.po.OsCategory;
import com.shop.po.OsProduct;
import com.shop.po.OsUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/uc/user")
public class OsUserInfoController {

    /**
     * GET 我的个人中心
     */
    @RequestMapping(value = "/portal")
    public String portal() {
        return "/usercenter/user_portal";
    }


}
