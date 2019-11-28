package com.shop.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.shop.po.OsProductDetail;
import com.shop.vo.KindVO;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.po.OsProduct;
import com.shop.po.OsProductImage;
import com.shop.po.OsProductParameter;
import com.shop.service.OsProductService;
import com.shop.vo.HotCategoryVO;

@Controller
public class OsProductController {

	@Autowired
    OsProductService osProductService;

	// 首页热门分类
	@RequestMapping("/recommend/hot")
	public String recommendTop(HttpServletRequest request) {
		ArrayList<HotCategoryVO> categorys = osProductService.getHotCategory();
		request.setAttribute("categorys", categorys);
		return "/recommend/recommend_hot";
	}

}
