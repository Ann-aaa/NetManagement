package com.shop.controller;

import com.shop.common.OsResult;
import com.shop.po.*;
import com.shop.service.OsAddressService;
import com.shop.service.OsOrderService;
import com.shop.service.OsProductService;
import com.shop.service.OsSellerService;
import com.shop.util.GetRandom;
import com.shop.vo.CartVO;
import com.shop.vo.ShoppingCartVO;

import org.apache.hadoop.hive.ql.parse.HiveParser_IdentifiersParser.intervalLiteral_return;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.Date;
import java.util.List;
@Controller
@RequestMapping("/buy")
public class OsOrderBuyController {

    @Autowired
    private OsAddressService osAddressService;
    @Autowired
    private OsOrderService osOrderService;
    @Autowired
    private OsProductService osProductService;
    @Autowired
    private OsSellerService osSellerService;

    /**
     * GET 填写订单信息
     *
     * @return
     */
    @RequestMapping(value = "/checkout")
    public String checkout(HttpSession session, HttpServletRequest request) {
        OsUser user = (OsUser) session.getAttribute("user");
        // 收货地址
        List<OsAddress> addresses = osAddressService.listAddress(user.getUserId());
        request.setAttribute("addresses", addresses);

        // 购物车选中商品
        CartVO cartVO = (CartVO) session.getAttribute("cart");
        request.setAttribute("cart", cartVO);

        return "/order/order_buy_checkout";
    }

    /**
     * POST 提交订单
     *
     * @return
     */
    @RequestMapping(value = "/confirm", method = RequestMethod.POST )
    @ResponseBody
    public Object confirm(OsOrder order, @RequestParam(value = "addressId") Long addressId, HttpSession session) {
        OsUser user = (OsUser) session.getAttribute("user");
        CartVO cart = (CartVO) session.getAttribute("cart");
        // 收货地址
        OsAddress address = osAddressService.getAddress(addressId);
        if (address != null) {
            Long num = GetRandom.getNumber();
            order.setOrderNumber(num);
            order.setBuyNumber(cart.getTotalNumber());
            order.setCreateTime(new Date());
            order.setOrderAmount(cart.getTotalPrice());
            order.setOrderStatus(new Byte("2"));//2 付款
            order.setUserId(user.getUserId());
            order.setPayAmount(cart.getTotalPrice());
            //保存order 拿到orderid
            Long oderId = osOrderService.saveOsOder(order);
            order.setOrderId(oderId);
            //保存订单商品
            List<ShoppingCartVO> shoppingCartVOs = cart.getShoppingCartVOs();
            for (ShoppingCartVO vo : shoppingCartVOs) {
            	
            	OsProductSpecification	osProductSpecification=osProductService.getosProductSpecificationBySpecNumber(vo.getProductSpecNumber());
            	if(null==osProductSpecification.getSalesVolume()){
            		
            		int sales=vo.getBuyNumber();
            		osProductSpecification.setSalesVolume(Integer.valueOf(sales));
            		System.out.println(sales);
            	}else{
            		
            	int sales= osProductSpecification.getSalesVolume().intValue()+vo.getBuyNumber().intValue();
            	osProductSpecification.setSalesVolume(Integer.valueOf(sales));
            	System.out.println(sales);
            	}
            	
            	int stock = osProductSpecification.getStock().intValue()-vo.getBuyNumber().intValue();
            	System.out.println(stock);
            	osProductSpecification.setStock(Integer.valueOf(stock));
            	osProductService.updateByPrimaryKey(osProductSpecification);
            	
            	Seller seller=osSellerService.selectByPrimaryKey(vo.getSellerId());
            	seller.setPrice(seller.getPrice().add(vo.getProductAmount()));
            	osSellerService.updateByPrimaryKey(seller);
            	
            	
                OsOrderProduct osOrderProduct = new OsOrderProduct();
                osOrderProduct.setOrderId(oderId);
                osOrderProduct.setProductNumber(vo.getProductNumber());
                osOrderProduct.setName(vo.getName());
                osOrderProduct.setBuyNumber(vo.getBuyNumber());
                osOrderProduct.setPicImg(vo.getPicImg());
                osOrderProduct.setProductSpecNumber(vo.getProductSpecNumber());
                osOrderProduct.setSellerId(vo.getSellerId());
                List<String> l = vo.getSpecificationName();
                String s = "";
                if(l == null) {
                    s = "";
                } else {
                    for (String ll : l) {
                        s += ll + " ";
                    }
                }
                osOrderProduct.setProductSpecName(s);
                osOrderProduct.setPrice(vo.getPrice());
                osOrderProduct.setProductNumber(vo.getProductNumber());
                osOrderProduct.setProductAmount(vo.getProductAmount());
               // osOrderProduct.setSellerId(vo.getSellerId());

                osOrderService.saveOrderProduct(osOrderProduct);
            }

            //保存订单配送收货地址
            OsOrderShipment orderShipment = new OsOrderShipment();
            orderShipment.setOrderId(oderId);
            BeanUtils.copyProperties(address, orderShipment);
            osOrderService.saveOrderShioment(orderShipment);

            //保存订单状态
            OsOrderStatus osOrderStatus = new OsOrderStatus();
            osOrderStatus.setOrderId(oderId);
            osOrderStatus.setOrderStatus(new Byte("2"));
            osOrderStatus.setCreateTime(new Date());
            osOrderStatus.setCreateStatus(new Byte("0"));
            osOrderStatus.setRemarks("付款成功");
            osOrderService.saveOrderStatus(osOrderStatus);

            return new OsResult(1, String.valueOf(num));
        }
        return null;
    }
    
    /**
     * GET 确认订单
     *
     * @return
     */
    @RequestMapping(value = "/confirm/{orderNumber}")
    public String confirmShow( @PathVariable Long orderNumber, HttpSession session, HttpServletRequest request) {
        OsUser user = (OsUser) session.getAttribute("user");
        OsOrder order = osOrderService.getByOrderNumber(orderNumber, user.getUserId());

        if (order != null) {

            List<OsOrderProduct> osOrderProducts = osOrderService.getOrderProductByOrderNumber(order.getOrderId());

            OsOrderShipment osOrderShipment = osOrderService.getOrderShipmentByOrderId(order.getOrderId());

            request.setAttribute("order", order); // 订单信息
            request.setAttribute("orderProducts", osOrderProducts);// 订单详情表
            request.setAttribute("orderShipment", osOrderShipment);// 订单配送表
            return "/order/order_buy_confirm";
        }

        return "/order/order_buy_confirm";
//        return "/order/order_success";
    }
    
   
}
