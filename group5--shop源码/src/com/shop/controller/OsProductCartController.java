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

	// 成功加入购物车
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

	//添加购物车商品
	@RequestMapping(value = "", method = RequestMethod.POST)
	@ResponseBody
	public Object create(@RequestParam(value = "productSpecNumber", required = true) Long productSpecNumber,
			HttpSession session, HttpServletRequest request) {
		if (session.getAttribute("user") != null) {
			CartVO cartVO = osProductCartService.insertProductCart(productSpecNumber, session);
			session.setAttribute("cart", cartVO);//购物车列表
			System.out.println(cartVO.toString());
			System.out.println(productSpecNumber.toString());
			return new OsResult(1, productSpecNumber.toString());//成功加入购物车
		} else {
			if (session.getAttribute("seller") != null) {
				OsProductSpecification ops = osProductService.getosProductSpecificationBySpecNumber(productSpecNumber);
				System.out.println(productSpecNumber.toString());
				System.out
						.println(productSpecNumber.toString().substring(0, productSpecNumber.toString().length() - 1));
				if (productSpecNumber.toString().length() == 14) {
					OsProduct osProduct = osProductService.selectByPrimaryKey(ops.getProductId());
					session.setAttribute("productId", ops.getProductId());
					session.setAttribute("product", osProduct);
					session.setAttribute("phoneSize", "0");
					System.out.println(productSpecNumber.toString());
					return new OsResult(2, productSpecNumber.toString());
				}
				if (productSpecNumber.toString().length() == 13) {
					OsProduct osProduct = osProductService.selectByPrimaryKey(ops.getProductId());
					session.setAttribute("productId", ops.getProductId());
					session.setAttribute("product", osProduct);
					System.out.println(productSpecNumber.toString());
					return new OsResult(3, productSpecNumber.toString());
				}
			}
			session.removeAttribute("seller");
			return new OsResult(401, "还未登录");
		}
	}

	//删除购物车商品
	@RequestMapping(value = "/{productSpecNumber}", method = RequestMethod.DELETE)
	@ResponseBody
	public Object deleteProductNumber(@PathVariable Long productSpecNumber, HttpSession session) {
		if (session.getAttribute("user") != null) {
			CartVO cartVO = osProductCartService.deleteProductCart(productSpecNumber, session);
			session.setAttribute("cart", cartVO);
			System.out.println(cartVO.toString());
			return new OsResult(1, productSpecNumber.toString());
		} else {
			return new OsResult(401, "还未登录");
		}
	}

	 //购物车列表
	@RequestMapping(value = "/list")
	public String list() {
		return "/product/product_cart_list";
	}

	 //修改购物车商品数量 新增
	@RequestMapping(value = "/add/{productSpecNumber}", method = RequestMethod.GET)
	@ResponseBody
	public Object addProductNumber(@PathVariable(value = "productSpecNumber") Long productSpecNumber, Integer buyNumber,
			HttpSession session) {
		if (session.getAttribute("user") != null) {
			CartVO cartVO = osProductCartService.insertProductCart(productSpecNumber, session, buyNumber);
			session.setAttribute("cart", cartVO);
			System.out.println(cartVO.toString());
			return new OsResult(1, productSpecNumber.toString());
		} else {

			return new OsResult(401, "还未登录");
		}
	}

	//修改购物车商品数量 去除
	@RequestMapping(value = "/delete/{productSpecNumber}", method = RequestMethod.GET)
	@ResponseBody
	public Object deProductNumber(@PathVariable(value = "productSpecNumber") Long productSpecNumber, Integer buyNumber,
			HttpSession session) {
		if (session.getAttribute("user") != null) {
			CartVO cartVO = osProductCartService.deProductCart(productSpecNumber, session, buyNumber);
			session.setAttribute("cart", cartVO);
			System.out.println(cartVO.toString());
			return new OsResult(1, productSpecNumber.toString());
		} else {
			return new OsResult(401, "还未登录");
		}
	}

	// 跳转到添加手机属性
	@RequestMapping("/phone/{productSpecNumber}")
	public String productPhone(HttpServletRequest request, HttpSession session, @PathVariable Long productSpecNumber) {
		String num = productSpecNumber.toString().substring(0, productSpecNumber.toString().length() - 1);

		OsProduct osProduct = osProductService.getProductDetil(Long.valueOf(num));
		session.setAttribute("productId", osProduct.getProductId());
		session.setAttribute("product", osProduct);
		return "/product/seller_phone";

	}

	// 跳转到添加其他类型商品属性的页面
	@RequestMapping("/otherpro/{productSpecNumber}")
	public String OtherProduct(HttpServletRequest request, HttpSession session, @PathVariable Long productSpecNumber) {

		OsProduct osProduct = osProductService.getProductDetil(productSpecNumber);
		session.setAttribute("productId", osProduct.getProductId());
		session.setAttribute("product", osProduct);
		return "/product/seller_otherattr";

	}

	// 更新库存
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Object update(@RequestParam(value = "productSpecNumber", required = true) Long productSpecNumber,
			HttpSession session, HttpServletRequest request) {

		if (session.getAttribute("seller") != null) {
			System.out.println(productSpecNumber.toString());
			OsProductSpecification ops = osProductService.getosProductSpecificationBySpecNumber(productSpecNumber);
			System.out.println(productSpecNumber.toString());
			System.out.println(
					"update1" + productSpecNumber.toString().substring(0, productSpecNumber.toString().length() - 1));
			if (productSpecNumber.toString().length() == 14) {
				System.out.println("14.1" + productSpecNumber.toString());
				session.setAttribute("osProductSpecification", ops);
				System.out.println(productSpecNumber.toString());
				return new OsResult(1, productSpecNumber.toString());
			}
			if (productSpecNumber.toString().length() == 13) {
				System.out.println("13.1" + productSpecNumber.toString());
				OsProduct osProduct = osProductService.selectByPrimaryKey(ops.getProductId());
				System.out.println(productSpecNumber.toString());

				session.setAttribute("osProductSpecification", ops);
				return new OsResult(1, productSpecNumber.toString());
			}
		}
		return new OsResult(401, "还未登录");

	}

	// 更新库存
	@RequestMapping("/updatesort/{productSpecNumber}")
	public String UpdateProduct(HttpServletRequest request, HttpSession session, @PathVariable Long productSpecNumber) {
		OsProductSpecification ops = osProductService.getosProductSpecificationBySpecNumber(productSpecNumber);
		System.out.println(productSpecNumber.toString() + "last");
		session.setAttribute("osProductSpecification", ops);

		return "/product/seller_update";

	}

	//跳转到更新商品库存的页面
	@RequestMapping("/update/stock/{productSpecNumber}")
	public String productUpdateStock(HttpServletRequest request, HttpSession session,
			@RequestParam("prosort") String prosort, @PathVariable Long productSpecNumber) {

		OsProductSpecification ops = osProductService.getosProductSpecificationBySpecNumber(productSpecNumber);
		System.out.println(productSpecNumber.toString() + "update");
		OsProductSpecification opsnew = ops;
		opsnew.setStock(Integer.valueOf(prosort));
		osProductService.updateByPrimaryKey(opsnew);

		return "redirect:/index";

	}

}
