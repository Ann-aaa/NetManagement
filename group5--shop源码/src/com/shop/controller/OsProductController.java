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

	@RequestMapping("/recommend/hot")
	public String recommendTop(HttpServletRequest request) {
		ArrayList<HotCategoryVO> categorys = osProductService.getHotCategory();
		request.setAttribute("categorys", categorys);
		return "/recommend/recommend_hot";
	}

	// 商品详情
	@RequestMapping("/detail/{productNumber}")
	public String productDetail(HttpServletRequest request, @PathVariable Long productNumber) {
		// 信息
		OsProduct osProduct = osProductService.getProductDetil(productNumber);
		// 商品详细介绍
		OsProductDetail detail = osProductService.getProductDetail(osProduct.getProductId());
		// 图片
		List<OsProductImage> productImages = osProductService.getProductImages(osProduct.getProductId());
		// 参数
		List<OsProductParameter> productParameter = osProductService.getProductParameter(osProduct.getProductId());
		// 规格
		List<KindVO> kindVOs = osProductService.getProductKind(osProduct.getProductId());
		Map<String, Object> map = osProductService.getProductSpecification(osProduct.getProductId());
		request.setAttribute("product", osProduct);
		request.setAttribute("detail", detail);
		request.setAttribute("productImages", productImages);
		request.setAttribute("productParameter", productParameter);
		request.setAttribute("kindVOs", kindVOs);
		request.setAttribute("productSpecifications", JSONObject.fromObject(map));
		return "/product/product_detail";
	}

	//获得固定位数随机数字的方法
	public static Long getRandom(int length) {
		String val = "";
		Random random = new Random();
		for (int i = 0; i < length; i++) {
			val += String.valueOf(random.nextInt(10));
		}
		return Long.valueOf(val);
	}

	//跳转到手机增加属性页面 或 商品详情页面
	@RequestMapping("/detail/seller/{productNumber}")
	public String productDetailSeller(HttpServletRequest request, HttpSession session,
			@PathVariable Long productNumber) {
		OsProduct osProduct = osProductService.getProductDetil(productNumber);
		String icon = (String) session.getAttribute("phoneSize");
		//'0'表示手机还没有添加手机颜色、内存的属性
		if ("0".equals(icon)) {
			OsProductCategory osProductCategory = osProductService.selectByProductId(osProduct.getProductId());
			if (osProductCategory.getCategoryId().intValue() == 33
					|| osProductCategory.getCategoryId().intValue() == 34) {
				session.setAttribute("productId", osProduct.getProductId());
				session.setAttribute("product", osProduct);
				return "/product/seller_phone";
			}
		}

		// 商品详细介绍
		OsProductDetail detail = osProductService.getProductDetail(osProduct.getProductId());
		// 图片
		List<OsProductImage> productImages = osProductService.getProductImages(osProduct.getProductId());
		// 参数
		List<OsProductParameter> productParameter = osProductService.getProductParameter(osProduct.getProductId());
		// 规格
		List<KindVO> kindVOs = osProductService.getProductKind(osProduct.getProductId());
		Map<String, Object> map = osProductService.getProductSpecification(osProduct.getProductId());
		request.setAttribute("product", osProduct);
		request.setAttribute("detail", detail);
		request.setAttribute("productImages", productImages);
		request.setAttribute("productParameter", productParameter);
		request.setAttribute("kindVOs", kindVOs);
		request.setAttribute("productSpecifications", JSONObject.fromObject(map));
		return "/product/sellerproduct_detail";
	}

	//跳转到增加手机属性页面
	@RequestMapping("/phone/complete")
	public String phoneCompleteI(HttpServletRequest request) {
		return "/product/seller_phone";
	}

	//增加手机属性
	@RequestMapping("/detail/insert/{productNumber}")
	public String productDetailInsert(HttpServletRequest request, HttpSession session,
			@RequestParam("prointro") String prointro, @RequestParam("proimg") String proimg,
			@RequestParam("procolor") String procolor, @RequestParam("prosize") String prosize,
			@RequestParam("prostock") String prostock, @RequestParam("proprice") String proprice,
			@RequestParam("proscore") String proscore,

			@PathVariable Long productNumber) {
		Long productIdLong = (Long) session.getAttribute("productId");
		Long productNumber1 = new Long(0);
		//当第一次增加手机颜色、内存属性时，使手机详情表的辨别码为14位数
		if (String.valueOf(productNumber).length() == 13) {
			List<OsProductSpecification> oslist = osProductService
					.selectOsProductSpecificationByProductId(productIdLong);
			productNumber1 = productNumber * 10 + oslist.size() + 1;
		}
		//当不是第一次加入手机属性时，使其辨别码加一
		if (productNumber.toString().length() == 14) {

			List<OsProductSpecification> oslist = osProductService
					.selectOsProductSpecificationByProductId(productIdLong);

			productNumber1 = (productNumber / 10) * 10 + oslist.size() + 1;

		}
		OsProductSpecification productSpecification = new OsProductSpecification();
		productSpecification.setProductId(productIdLong);
		productSpecification.setScore(Integer.valueOf(proscore));
		BigDecimal showPrice = new BigDecimal(proprice);
		productSpecification.setPrice(showPrice);
		productSpecification.setStock(Integer.valueOf(prostock));
		// productSpecification.setStock(productSpecification1.getStock());
		productSpecification.setProductSpecNumber(productNumber1);

		String spec = "";
		List<OsSpecificationAttribute> osalist = osProductService.selectAllOsSpecificationAttribute();
		for (OsSpecificationAttribute osa : osalist) {
			if (procolor.equals(osa.getName())) {
				Long color = osa.getSpecAttrId();
				spec += String.valueOf(color);
			}
		}
		spec += ",";
		for (OsSpecificationAttribute osa : osalist) {
			if (prosize.equals(osa.getName())) {
				Long size = osa.getSpecAttrId();
				spec += String.valueOf(size);
			}
		}
		//设置手机属性值
		productSpecification.setSpec(spec);
		int result = osProductService.insertOsProductSpecification(productSpecification);
		if (0 != result) {
			session.setAttribute("phoneSize", "1");
			// osProductService.deleteByProductSpecNumber(productNumber);
		}
		OsProductImage opi = new OsProductImage();
		opi.setProductId(productIdLong);
		opi.setPicImg("images/goods/201902/" + proimg + ".jpg");
		String sort1 = proimg.substring(proimg.length() - 1, proimg.length());
		byte sort = Byte.parseByte(sort1);
		opi.setSort(sort);
		byte status = Byte.parseByte("1");
		opi.setStatus(status);
		List<OsProductImage> opilist = osProductService.getProductImages(productIdLong);
		if (opilist.size() < Integer.parseInt(sort1)) {
			//添加手机图片
			osProductService.insertOsProductImage(opi);
		}
		//加入手机介绍
		OsProductParameter opp = new OsProductParameter();
		opp.setProductId(productIdLong);
		opp.setName("介绍");
		opp.setValue(prointro);
		List<OsProductParameter> opplist = osProductService.getProductParameter(productIdLong);
		opp.setSort(opplist.size());
		if (null != prointro && opplist.size() == 0) {
			//手机介绍不存在时就增加
			osProductService.insertOsProductParameter(opp);
		}

		for (OsProductParameter opp1 : opplist) {
			//若是手机介绍存在，就更新
			if (opp1.getName().equals("介绍")) {
				opp1.setValue(prointro);
				osProductService.updateOsProductParameterByPrimaryKey(opp1);
			}
		}

		return "redirect:/index";

	}

	//添加其他商品图片属性
	@RequestMapping("/detail/insertother")
	public String insetotherproductattr(HttpServletRequest request, HttpSession session,

			@RequestParam("proimg") String proimg) {

		Long productIdLong = (Long) session.getAttribute("productId");
		OsProductImage opi = new OsProductImage();
		opi.setProductId(productIdLong);
		List<OsProductImage> opilist = osProductService.getProductImages(productIdLong);
		opi.setPicImg("images/goods/201902/" + proimg + ".jpg");
		 //将图片进行排序
		String sort1 = String.valueOf(opilist.size() + 1);
		byte sort = Byte.parseByte(sort1);
		opi.setSort(sort);
		byte status = Byte.parseByte("1");
		opi.setStatus(status);
		 //增加商品图片
		int result = osProductService.insertOsProductImage(opi);

		return "redirect:/index";

	}

}
