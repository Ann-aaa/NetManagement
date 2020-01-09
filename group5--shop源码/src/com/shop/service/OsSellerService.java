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
	private SellerMapper sellerMapper;

	public void insertSeller(Seller seller) {
		sellerMapper.insertSelective(seller);
	}

	public Seller selectSeller(String loginName, String loginPassword) {
		Seller seller = sellerMapper.selectByTelephone(loginName);
		return seller;
	}

	public Seller selectByPrimaryKey(Long sellerId) {
		return sellerMapper.selectByPrimaryKey(sellerId);
	}

	public int updateByPrimaryKey(Seller record) {
		return sellerMapper.updateByPrimaryKey(record);
	}
}
