package com.shop.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import ch.ethz.ssh2.Session;

import com.shop.po.OsProductDetail;
import com.shop.util.GetRandom;
import com.shop.vo.KindVO;

import net.sf.json.JSONObject;
import net.sf.jsqlparser.expression.LongValue;

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
import com.shop.po.OsSpecificationAttribute;
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
	
	
	/*
	
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
    */
	
	public static  Long getRandom(int length){
		String val="";
		Random random = new Random();
		for(int i=0;i<length;i++){
			val+=String.valueOf(random.nextInt(10));
		}
		return Long.valueOf(val);
	}
	
	
	@RequestMapping("/detail/seller/{productNumber}")
	public String productDetailSeller(HttpServletRequest request,
			HttpSession session,
			@PathVariable Long productNumber) {
		OsProduct osProduct = osProductService.getProductDetil(productNumber);
		//信息
		//OsProduct osProduct =new OsProduct ();
		//if(String.valueOf(productNumber).length()==13){
		 //  osProduct = osProductService.getProductDetil(productNumber);
		//}else{
			//int pronumber1  =productNumber.intValue();
			//int pronumber2=pronumber1/10;
			//Long proNumber=new Long((long)pronumber1/10);
			//osProduct = osProductService.getProductDetil(proNumber);
		//}
		String icon=(String) session.getAttribute("phoneSize");
		if("0".equals(icon)){
		OsProductCategory osProductCategory=osProductService.selectByProductId(osProduct.getProductId());
		if(osProductCategory.getCategoryId().intValue()==33||osProductCategory.getCategoryId().intValue()==34){
			session.setAttribute("productId", osProduct.getProductId());
			session.setAttribute("product",osProduct);
			return "/product/seller_phone";
		}
		}
		
		
		
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
		return "/product/sellerproduct_detail";
	}
	
	
	@RequestMapping("/phone/complete")
    public String phoneCompleteI(HttpServletRequest request) {
        return "/product/seller_phone";
    }
	
	
	@RequestMapping("/detail/insert/{productNumber}")
	public String productDetailInsert(HttpServletRequest request,HttpSession session,
			@RequestParam("prointro") String prointro,
			@RequestParam("proimg") String proimg,
			@RequestParam("procolor") String procolor, 
    		@RequestParam("prosize") String prosize,
    		@RequestParam("prostock") String prostock, 
    		@RequestParam("proprice") String proprice,
    		@RequestParam("proscore") String proscore,
    		
    		@PathVariable Long productNumber) {
		Long productIdLong= (Long) session.getAttribute("productId");
		//信息
		//OsProduct osProduct = osProductService.getProductDetil(productNumber);
		Long productNumber1=new Long(0);
		if(String.valueOf(productNumber).length()==13){
			List<OsProductSpecification> oslist=osProductService.selectOsProductSpecificationByProductId(productIdLong);
			//Long bigLong = new Long(0);
			//for(OsProductSpecification os:oslist){
			//	if(os.getProductSpecNumber().longValue()>=bigLong.longValue()){
			//		bigLong=os.getProductSpecNumber();
			//	}
			//}
			
			//productNumber1=bigLong+1;
			//Long size= new Long((long)oslist.size());
			productNumber1=productNumber*10+oslist.size()+1;
		}
		if(productNumber.toString().length()==14){
			
			/*List<OsProductSpecification> oslist= osProductService.getAllOsProductSpecification();
			Long bigLong = new Long((long)1);
			for(OsProductSpecification os:oslist){
				if(os.getProductSpecNumber().longValue()>=bigLong.longValue()){
					bigLong=os.getProductSpecNumber();
				}
			}
			productNumber1=bigLong+1;*/

			List<OsProductSpecification> oslist=osProductService.selectOsProductSpecificationByProductId(productIdLong);
			
			productNumber1=(productNumber/10)*10+oslist.size()+1;
			
		}
		//OsProductSpecification productSpecification1 =osProductService.getosProductSpecificationBySpecNumber(productNumber);
		OsProductSpecification productSpecification =new  OsProductSpecification();
		//productSpecification.setProductId(osProductService.selectProductIdByNameAndSellerId(proname,seller.getSellerId()));
		
		//Long productIdLong= (Long) session.getAttribute("productId");
		productSpecification.setProductId(productIdLong);
		productSpecification.setScore(Integer.valueOf(proscore));
		BigDecimal showPrice = new BigDecimal (proprice);
		productSpecification.setPrice(showPrice);
		productSpecification.setStock(Integer.valueOf(prostock));
		//productSpecification.setPrice(productSpecification1.getPrice());
		//productSpecification.setStock(productSpecification1.getStock());
		productSpecification.setProductSpecNumber(productNumber1);
		
		String spec="";
		List<OsSpecificationAttribute> osalist= osProductService.selectAllOsSpecificationAttribute();
		for(OsSpecificationAttribute osa:osalist){
			if(procolor.equals(osa.getName())){
				Long color=osa.getSpecAttrId();
				spec+=String.valueOf(color);
			}
		}
		spec+=",";
		for(OsSpecificationAttribute osa:osalist){
				if(prosize.equals(osa.getName())){
					Long size=osa.getSpecAttrId();
					spec+=String.valueOf(size);
				}
			}
		productSpecification.setSpec(spec);
		int result=osProductService.insertOsProductSpecification(productSpecification);
        if(0!=result){
        	session.setAttribute("phoneSize", "1");
        	//osProductService.deleteByProductSpecNumber(productNumber);
        }
        OsProductImage opi = new OsProductImage();
        opi.setProductId(productIdLong);
        opi.setPicImg("images/goods/201902/"+proimg+".jpg");
        String sort1 = proimg.substring(proimg.length()-1, proimg.length());
        byte sort = Byte.parseByte(sort1);
        opi.setSort(sort);
        byte status = Byte.parseByte("1");
        opi.setStatus(status);
        List<OsProductImage> opilist =osProductService.getProductImages(productIdLong);
		if(opilist.size()<Integer.parseInt(sort1)){
			osProductService.insertOsProductImage(opi);
		}
		OsProductParameter opp=new OsProductParameter();
		opp.setProductId(productIdLong);
		opp.setName("介绍");
		opp.setValue(prointro);
		List<OsProductParameter> opplist =osProductService.getProductParameter(productIdLong);
		opp.setSort(opplist.size());
		if(null!=prointro&&opplist.size()==0){
			osProductService.insertOsProductParameter(opp);
		}
		
        return "redirect:/index"; 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
        //信息
    //    OsProduct osProduct = osProductService.getProductDetil(productNumber);
		
		//商品详细介绍
	//	OsProductDetail detail = osProductService.getProductDetail(osProduct.getProductId());
		//图片
	//	List<OsProductImage> productImages = osProductService.getProductImages(osProduct.getProductId());
		//参数
	//	List<OsProductParameter> productParameter = osProductService.getProductParameter(osProduct.getProductId());
		//规格
	//	List<KindVO> kindVOs = osProductService.getProductKind(osProduct.getProductId());
	//	Map<String, Object> map =  osProductService.getProductSpecification(osProduct.getProductId());
	//	request.setAttribute("product",osProduct);
	//	request.setAttribute("detail",detail);
		//request.setAttribute("productImages",productImages);
		//request.setAttribute("productParameter",productParameter);
		//request.setAttribute("kindVOs",kindVOs);
	//	request.setAttribute("productSpecifications", JSONObject.fromObject(map));
	//	return "/product/sellerproduct_detail";
	}
	
	@RequestMapping("/detail/insertother")
	public String insetotherproductattr(HttpServletRequest request,HttpSession session,
			
			@RequestParam("proimg") String proimg
			) {

		Long productIdLong= (Long) session.getAttribute("productId");	
		OsProductImage opi = new OsProductImage();
        opi.setProductId(productIdLong);
        List<OsProductImage> opilist =osProductService.getProductImages(productIdLong);
        opi.setPicImg("images/goods/201902/"+proimg+".jpg");
        String sort1 = String.valueOf(opilist.size()+1);
        byte sort = Byte.parseByte(sort1);
        opi.setSort(sort);
        byte status = Byte.parseByte("1");
        opi.setStatus(status);
        
		int result=osProductService.insertOsProductImage(opi);
		
		return "redirect:/index"; 
		
		
		
		
	}
	

	
	
}
