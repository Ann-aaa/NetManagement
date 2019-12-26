package com.shop.dao;


import com.shop.po.Seller;

public interface SellerMapper {
    int deleteByPrimaryKey(Long sellerId);

    int insert(Seller record);

    int insertSelective(Seller record);

    Seller selectByPrimaryKey(Long sellerId);

    int updateByPrimaryKeySelective(Seller record);

    int updateByPrimaryKey(Seller record);

    Seller selectByTelephone(String telephone);
}