package com.shop.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.shop.po.OsProductDetail;
import com.shop.util.GetRandom;
import com.shop.vo.KindVO;

import net.sf.json.JSONObject;

import org.apache.hadoop.hive.ql.parse.HiveParser_IdentifiersParser.intervalLiteral_return;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.po.OsCategory;
import com.shop.po.OsProduct;
import com.shop.po.OsProductCategory;
import com.shop.po.OsProductImage;
import com.shop.po.OsProductParameter;
import com.shop.po.OsProductSpecification;
import com.shop.po.OsUser;
import com.shop.po.Seller;
import com.shop.service.OsCategoryService;
import com.shop.service.OsProductService;
import com.shop.vo.HotCategoryVO;

@Controller
public class OsProductController {

	@Autowired
    OsProductService osProductService;
	@Autowired
    OsCategoryService osCategoryService;
	
	
	
	
	// 首页热门分类
	@RequestMapping("/recommend/hot")
	public String recommendTop(HttpServletRequest request) {
		ArrayList<HotCategoryVO> categorys = osProductService.getHotCategory();
		request.setAttribute("categorys", categorys);
		return "/recommend/recommend_hot";
	}

	// 商品详情
	@RequestMapping("/detail/{productNumber}")
	public String productDetail(HttpServletRequest request, @PathVariable Long productNumber) {
		//信息
		OsProduct osProduct = osProductService.getProductDetil(productNumber);
		//商品详细介绍
		OsProductDetail detail = osProductService.getProductDetail(osProduct.getProductId());
		//图片
		List<OsProductImage> productImages = osProductService.getProductImages(osProduct.getProductId());
		//参数
		List<OsProductParameter> productParameter = osProductService.getProductParameter(osProduct.getProductId());
		//规格
		List<KindVO> kindVOs = osProductService.getProductKind(osProduct.getProductId());
		Map<String, Object> map =  osProductService.getProductSpecification(osProduct.getProductId());
		request.setAttribute("product",osProduct);
		request.setAttribute("detail",detail);
		request.setAttribute("productImages",productImages);
		request.setAttribute("productParameter",productParameter);
		request.setAttribute("kindVOs",kindVOs);
		request.setAttribute("productSpecifications", JSONObject.fromObject(map));
		return "/product/product_detail";
	}
	
	
	
	
	
	
	
}
