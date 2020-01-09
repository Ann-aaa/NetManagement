package com.shop.controller;

import com.shop.po.OsCategory;
import com.shop.po.OsProduct;
import com.shop.po.Seller;
import com.shop.service.OsCategoryService;
import com.shop.service.OsProductService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

@Controller
public class OsCategoryListController {

    @Autowired
    private OsCategoryService osCategoryService;
    @Autowired
    private OsProductService osProductService;

   // 类目列表
    @RequestMapping(value = "/list")
    public String list(
            @RequestParam(value = "categoryId", required = false, defaultValue = "1") String reqCategoryId,
            @RequestParam(value = "sort", required = false, defaultValue = "0") String reqSort,
            @RequestParam(value = "page", required = false, defaultValue = "1") String reqPage,
            @RequestParam(value = "limit", required = false, defaultValue = "4") Integer limit,
            HttpServletRequest request) {

        // 请求参数:类目ID,如果类目ID不存在或者不为Long类型,则默认1/全部商品
        Long categoryId = StringUtils.isNumeric(reqCategoryId) ? Long.valueOf(reqCategoryId) : 1;
        // 请求参数:排序方式,如果排序方式不存在或者不为Integer类型,则默认0/推荐排序
        Integer sort = StringUtils.isNumeric(reqSort) ? Integer.valueOf(reqSort) : 0;
        // 请求参数:分页,如果分页不存在或者不为Integer类型,则默认1/默认页数
        Integer page = StringUtils.isNumeric(reqPage) ? Integer.valueOf(reqPage) : 1;

        // 查找当前类目信息
        OsCategory category = osCategoryService.getByCategoryId(categoryId);
        if (category != null) {

            // 通过类目ID、排序、分页查找商品列表
            List<OsProduct> products = osProductService.pageProductInfo(categoryId,sort,page,limit);

            // 根据类目ID查找子类目
            List<OsCategory> lowerCategories = osCategoryService.listLowerCategories(categoryId);

            // 根据类目ID查找上级类目列表
            List<OsCategory> upperCategories = osCategoryService.listUpperCategories(categoryId);
            com.shop.common.PageInfo info = new  com.shop.common.PageInfo(page.intValue(), limit.intValue(), "", "");

            info.setTotal((int) osProductService.getL().getTotal());
            request.setAttribute("sort", reqSort);
            request.setAttribute("category", category);
            request.setAttribute("products", products);
            request.setAttribute("pageInfo", info);
            request.setAttribute("lowerCategories", lowerCategories);
            request.setAttribute("upperCategories", upperCategories);
        }
        return "/product/product_list";
    }

//商家列表    
    @RequestMapping(value = "/seller/list")
    public String slist(
            @RequestParam(value = "categoryId", required = false, defaultValue = "1") String reqCategoryId,
            @RequestParam(value = "sort", required = false, defaultValue = "0") String reqSort,
            @RequestParam(value = "page", required = false, defaultValue = "1") String reqPage,
            @RequestParam(value = "limit", required = false, defaultValue = "4") Integer limit,
            HttpServletRequest request) {

        // 请求参数:类目ID,如果类目ID不存在或者不为Long类型,则默认1/全部商品
        Long categoryId = StringUtils.isNumeric(reqCategoryId) ? Long.valueOf(reqCategoryId) : 1;
        // 请求参数:排序方式,如果排序方式不存在或者不为Integer类型,则默认0/推荐排序
        Integer sort = StringUtils.isNumeric(reqSort) ? Integer.valueOf(reqSort) : 0;
        // 请求参数:分页,如果分页不存在或者不为Integer类型,则默认1/默认页数
        Integer page = StringUtils.isNumeric(reqPage) ? Integer.valueOf(reqPage) : 1;

        // 查找当前类目信息
        OsCategory category = osCategoryService.getByCategoryId(categoryId);
        if (category != null) {

        	Seller seller=(Seller) request.getSession().getAttribute("seller");
        	Long ssellerId = seller.getSellerId();
        	List<OsProduct> products = osProductService.selectBySellerId(ssellerId);
            // 根据类目ID查找子类目
            List<OsCategory> lowerCategories = osCategoryService.listLowerCategories(categoryId);

            // 根据类目ID查找上级类目列表
            List<OsCategory> upperCategories = osCategoryService.listUpperCategories(categoryId);
            com.shop.common.PageInfo info = new  com.shop.common.PageInfo(page.intValue(), limit.intValue(), "", "");


            request.setAttribute("sort", reqSort);
            request.setAttribute("category", category);
            request.setAttribute("products", products);
            request.setAttribute("pageInfo", info);
            request.setAttribute("lowerCategories", lowerCategories);
            request.setAttribute("upperCategories", upperCategories);
        }
        return "/product/product_seller";
    }  
}
