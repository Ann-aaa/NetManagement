package com.shop.service;

import com.shop.dao.SellerMapper;
import com.shop.dao.OsUserMapper;
import com.shop.po.OsUser;
import com.shop.po.Seller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

@Service
public class OsSellerService {

    @Autowired
    private SellerMapper SellerMapper;

    public void insertSeller(Seller seller) {
        SellerMapper.insertSelective(seller);
    }

    public Seller selectSeller(String loginName, String loginPassword) {
        Seller seller = SellerMapper.selectByTelephone(loginName);
        return seller;
    }
}
