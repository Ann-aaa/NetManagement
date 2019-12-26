package com.shop.controller;

import java.math.BigDecimal;
import java.util.List;

import com.shop.common.OsResult;
import com.shop.po.OsProduct;
import com.shop.po.OsProductCategory;
import com.shop.po.OsProductImage;
import com.shop.po.OsProductParameter;
import com.shop.po.OsProductSpecification;
import com.shop.po.OsSpecificationAttribute;
import com.shop.service.OsProductCartService;
import com.shop.service.OsProductService;
import com.shop.vo.CartVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class OsProductCartController {

    @Autowired
    private OsProductCartService osProductCartService;
    @Autowired
    private OsProductService osProductService;

    /**
     * GET 成功加入购物车
     * @return
     */
    @RequestMapping(value = "/{productSpecNumber}")
    public String view(@PathVariable Long productSpecNumber, HttpSession session, HttpServletRequest request) {
        // 用户已登录,查看购物车列表是否有该商品
        Boolean flag = osProductCartService.getProductExsit(productSpecNumber, session);
        OsProduct osProduct = osProductService.getProductBySpecNumber(productSpecNumber);
        request.setAttribute("product", osProduct);
        if (flag == false) {
            // 重定向到购物车列表
            System.out.println("flag is false");
            return "/product/product_cart_info";
        }
        return "/product/product_cart_info";
    }

    /**
     * POST 添加购物车商品
     *
     * @return
     */
    @RequestMapping(value = "", method = RequestMethod.POST)
    @ResponseBody
    public Object create(@RequestParam(value = "productSpecNumber", required = true) Long productSpecNumber,
                         HttpSession session,HttpServletRequest request) {
        if(session.getAttribute("user") != null) {
            CartVO cartVO = osProductCartService.insertProductCart(productSpecNumber, session);
            session.setAttribute("cart", cartVO);
            System.out.println(cartVO.toString());
            System.out.println(productSpecNumber.toString());
            return new OsResult(1, productSpecNumber.toString());
        } else {
        	if(session.getAttribute("seller") != null){
        	OsProductSpecification ops =osProductService.getosProductSpecificationBySpecNumber(productSpecNumber);
        	System.out.println(productSpecNumber.toString());
        	System.out.println(productSpecNumber.toString().substring(0,productSpecNumber.toString().length()-1));
        	//OsProductCategory osProductCategory=osProductService.selectByProductId(ops.getProductId());
    		//if(osProductCategory.getCategoryId().intValue()==33||osProductCategory.getCategoryId().intValue()==34){
    		if(productSpecNumber.toString().length()==14){	
        	OsProduct osProduct = osProductService.selectByPrimaryKey(ops.getProductId());
    			session.setAttribute("productId", ops.getProductId());
    			session.setAttribute("product",osProduct);
    			session.setAttribute("phoneSize","0");
    			System.out.println(productSpecNumber.toString());
            	return new OsResult(2, productSpecNumber.toString());
    		}
    		if(productSpecNumber.toString().length()==13){	
            	OsProduct osProduct = osProductService.selectByPrimaryKey(ops.getProductId());
        			session.setAttribute("productId", ops.getProductId());
        			session.setAttribute("product",osProduct);
        			//session.setAttribute("phoneSize","0");
        			System.out.println(productSpecNumber.toString());
                	return new OsResult(3, productSpecNumber.toString());
        		}
        }
        	session.removeAttribute("seller");
            return new OsResult(401,"还未登录");
        }
    }

    /**
     * DELETE 删除购物车商品
     *
     * @return
     */
    @RequestMapping(value = "/{productSpecNumber}", method = RequestMethod.DELETE)
    @ResponseBody
    public Object deleteProductNumber(@PathVariable Long productSpecNumber,
                         HttpSession session) {
        if(session.getAttribute("user") != null) {
            CartVO cartVO = osProductCartService.deleteProductCart(productSpecNumber, session);
            session.setAttribute("cart", cartVO);
            System.out.println(cartVO.toString());
            return new OsResult(1, productSpecNumber.toString());
        } 
        else {
            return new OsResult(401,"还未登录");
        }
    }



    /**
     * GET 购物车列表
     * @return
     */
    @RequestMapping(value = "/list")
    public String list() {
        return "/product/product_cart_list";
    }

    /**
     *  修改购物车商品数量 新增
     *
     * @return
     */
    @RequestMapping(value = "/add/{productSpecNumber}", method = RequestMethod.GET)
    @ResponseBody
    public Object addProductNumber(@PathVariable(value = "productSpecNumber") Long productSpecNumber,Integer buyNumber,
                         HttpSession session) {
        if(session.getAttribute("user") != null) {
            CartVO cartVO = osProductCartService.insertProductCart(productSpecNumber, session, buyNumber);
            session.setAttribute("cart", cartVO);
            System.out.println(cartVO.toString());
            return new OsResult(1, productSpecNumber.toString());
        } else {
        	
            return new OsResult(401,"还未登录");
        }
    }
    /**
     *  修改购物车商品数量 去除
     *
     * @return
     */
    @RequestMapping(value = "/delete/{productSpecNumber}", method = RequestMethod.GET)
    @ResponseBody
    public Object deProductNumber(@PathVariable(value = "productSpecNumber") Long productSpecNumber,
                                      Integer buyNumber, HttpSession session) {
        if(session.getAttribute("user") != null) {
            CartVO cartVO = osProductCartService.deProductCart(productSpecNumber, session, buyNumber);
            session.setAttribute("cart", cartVO);
            System.out.println(cartVO.toString());
            return new OsResult(1, productSpecNumber.toString());
        } else {
            return new OsResult(401,"还未登录");
        }
    }
    
    
    @RequestMapping("/phone/{productSpecNumber}")
	public String productPhone(HttpServletRequest request,
			HttpSession session,
			@PathVariable Long productSpecNumber) {
		String num=productSpecNumber.toString().substring(0,productSpecNumber.toString().length()-1);
		
		OsProduct osProduct = osProductService.getProductDetil(Long.valueOf(num));
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
		//String icon=(String) session.getAttribute("phoneSize");
		//if("0".equals(icon)){
		//OsProductCategory osProductCategory=osProductService.selectByProductId(osProduct.getProductId());
		//if(osProductCategory.getCategoryId().intValue()==33||osProductCategory.getCategoryId().intValue()==34){
			session.setAttribute("productId", osProduct.getProductId());
			session.setAttribute("product",osProduct);
			return "/product/seller_phone";
		//}
		//}
		
		
		
		//商品详细介绍
	/*	OsProductDetail detail = osProductService.getProductDetail(osProduct.getProductId());
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
		return "/product/sellerproduct_detail";*/
	}
    
    

    @RequestMapping("/otherpro/{productSpecNumber}")
	public String OtherProduct(HttpServletRequest request,
			HttpSession session,
			@PathVariable Long productSpecNumber) {
		//String num=productSpecNumber.toString().substring(0,productSpecNumber.toString().length()-1);
		
		OsProduct osProduct = osProductService.getProductDetil(productSpecNumber);
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
		//String icon=(String) session.getAttribute("phoneSize");
		//if("0".equals(icon)){
		//OsProductCategory osProductCategory=osProductService.selectByProductId(osProduct.getProductId());
		//if(osProductCategory.getCategoryId().intValue()==33||osProductCategory.getCategoryId().intValue()==34){
			session.setAttribute("productId", osProduct.getProductId());
			session.setAttribute("product",osProduct);
			return "/product/seller_otherattr";
		//}
		//}
		
		
		
		//商品详细介绍
	/*	OsProductDetail detail = osProductService.getProductDetail(osProduct.getProductId());
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
		return "/product/sellerproduct_detail";*/
	}
	
    
    
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Object update(@RequestParam(value = "productSpecNumber", required = true) Long productSpecNumber,
                         HttpSession session,HttpServletRequest request) {
        
        	if(session.getAttribute("seller") != null){
        		System.out.println(productSpecNumber.toString());
        	OsProductSpecification ops =osProductService.getosProductSpecificationBySpecNumber(productSpecNumber);
        	System.out.println(productSpecNumber.toString());
        	System.out.println("update1"+productSpecNumber.toString().substring(0,productSpecNumber.toString().length()-1));
        	//OsProductCategory osProductCategory=osProductService.selectByProductId(ops.getProductId());
    		//if(osProductCategory.getCategoryId().intValue()==33||osProductCategory.getCategoryId().intValue()==34){
    		if(productSpecNumber.toString().length()==14){	
    			System.out.println("14.1"+productSpecNumber.toString());
        	//OsProduct osProduct = osProductService.selectByPrimaryKey(ops.getProductId());
    		//	session.setAttribute("productId", ops.getProductId());
    		//	session.setAttribute("product",osProduct);
    		//	session.setAttribute("phoneSize","0");
    			//OsProductSpecification ops =osProductService.getosProductSpecificationBySpecNumber(productSpecNumber);
            	
    			session.setAttribute("osProductSpecification", ops);
    			System.out.println(productSpecNumber.toString());
            	return new OsResult(1, productSpecNumber.toString());
    		}
    		if(productSpecNumber.toString().length()==13){
    			//if(null!=osProductService.getosProductSpecificationBySpecNumber(productSpecNumber)){
    			//OsProductSpecification ops =osProductService.getosProductSpecificationBySpecNumber(productSpecNumber);
            	System.out.println("13.1"+productSpecNumber.toString());
            	OsProduct osProduct = osProductService.selectByPrimaryKey(ops.getProductId());
        			//session.setAttribute("productId", ops.getProductId());
        			//session.setAttribute("product",osProduct);
        			//session.setAttribute("phoneSize","0");
        			System.out.println(productSpecNumber.toString());

        			session.setAttribute("osProductSpecification", ops);
                	return new OsResult(1, productSpecNumber.toString());
    			//}else{
    			//	System.out.println(productSpecNumber.toString());
    			//	return new OsResult(2, productSpecNumber.toString());
    			//}
        		}
        	}
        	//session.removeAttribute("seller");
            return new OsResult(401,"还未登录");
        
    }
    
    
    
    
    
    
	
}
