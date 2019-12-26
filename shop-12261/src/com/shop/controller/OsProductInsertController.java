package com.shop.controller;

import java.math.BigDecimal;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.po.OsCategory;
import com.shop.po.OsProduct;
import com.shop.po.OsProductCategory;
import com.shop.po.OsProductSpecification;
import com.shop.po.Seller;
import com.shop.service.OsCategoryService;
import com.shop.service.OsProductService;

@Controller
@RequestMapping("/pro")
public class OsProductInsertController {
	
	@Autowired
    OsProductService osProductService;
	@Autowired
    OsCategoryService osCategoryService;
	
	@RequestMapping( "/product/insert")
    public String insertProduct(@RequestParam("proname") String proname, 
    		@RequestParam("proprice") String proprice, 
    		@RequestParam("prointro") String prointro, 
    		@RequestParam("proimage") String proimage, 
    		@RequestParam("protitle") String protitle, 
    		@RequestParam("prodescription") String prodescription, 
    		@RequestParam("procatrgory") String procatrgory, 
    		@RequestParam("prostock") String prostock, 
    		@RequestParam("proscore") String proscore, 
    		 HttpSession session,HttpServletRequest request) {
		
		OsProduct product = new OsProduct();
		//Long num = GetRandom.getNumber();
		Long num = getRandom(13);
		product.setProductNumber(num);
		product.setName(proname);
		BigDecimal showPrice = new BigDecimal (proprice);
		product.setShowPrice(showPrice);
		product.setIntroduce(prointro);
		product.setPicImg("images/goods/201901/"+proimage+".jpg");
		product.setPageTitle(protitle);
		product.setPageDescription(prodescription);
		Seller seller =(Seller) session.getAttribute("seller");
		product.setSellerId(seller.getSellerId());
		int result =osProductService.insertProduct(product);
		if(0!=result){
		
		OsCategory category = osCategoryService.getByCategoryName(procatrgory);
		OsProductCategory procateCategory = new OsProductCategory();
		procateCategory.setCategoryId(category.getCategoryId());
		//procateCategory.setProductId(osProductService.selectProductIdByNameAndSellerId(proname,seller.getSellerId()));
		
		procateCategory.setProductId(osProductService.getProductDetil(num).getProductId());
		osProductService.insertProductCategory(procateCategory);
		if(procatrgory.equals("手机")||procatrgory.equals("小米手机")){
			session.setAttribute("phoneSize","0");
			return "redirect:/index";
		}else{
			
		OsProductSpecification productSpecification =new  OsProductSpecification();
		//productSpecification.setProductId(osProductService.selectProductIdByNameAndSellerId(proname,seller.getSellerId()));
		productSpecification.setProductId(osProductService.getProductDetil(num).getProductId());
		productSpecification.setScore(Integer.valueOf(proscore));
		productSpecification.setPrice(showPrice);
		productSpecification.setStock(Integer.valueOf(prostock));
		productSpecification.setProductSpecNumber(num);
		osProductService.insertOsProductSpecification(productSpecification);
                return "redirect:/index"; 
		}
		}else{
			return "redirect:/user/user_login";
		}
	}
	
	@RequestMapping("/insertpro")
    public String insertPro(HttpServletRequest request) {
        return "/product/product_insert";
    }
	
	public static  Long getRandom(int length){
		String val="";
		Random random = new Random();
		for(int i=0;i<length;i++){
			val+=String.valueOf(random.nextInt(10));
		}
		return Long.valueOf(val);
	}

}
