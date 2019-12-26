package com.shop.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.shop.dao.OsAddressMapper;
import com.shop.dao.OsUserMapper;
import com.shop.po.OsAddress;
import com.shop.po.OsProduct;
import com.shop.po.OsUser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OsAddressService {

    @Autowired
    private OsAddressMapper osAddressMapper;
    private Page<OsAddress> l ;
    
    @Autowired
    private OsUserMapper osUserMapper;
    private Page<OsUser> j ;

    public Page<OsAddress> getL() {
        return l;
    }

    public void setL(Page<OsAddress> l) {
        this.l = l;
    }
    
    public Page<OsUser> getJ() {
        return j;
    }

    public void setJ(Page<OsUser> j) {
        this.j = j;
    }
    
    



    public List<OsAddress> listAddress(Long userId) {
        List<OsAddress> list = osAddressMapper.selectByUserId(userId);
        return list;
    }

    public OsAddress getAddress(Long addressId) {
        OsAddress osAddress = osAddressMapper.selectByAddressId(addressId);
        return osAddress;
    }

    //分页查询收货地址
    public List<OsAddress> pageAddressInfo(Integer page, Integer limit, Long userId) {
        PageHelper.startPage(page, limit);
        List<OsAddress> list = osAddressMapper.selectByUserId(userId);
        this. l = (Page<OsAddress>)list;
        return list;
    }
    //查询用户信息
    public List<OsUser> pageUserInfo(Integer page, Integer limit, Long userId) {
        PageHelper.startPage(page, limit);
        List<OsUser> list1 =  osUserMapper.selectByUserId(userId);
        this. j = (Page<OsUser>)list1;
        return list1;
    }

    //新增收货地址
    public int insertAddress(OsAddress osAddress) {
        int count = osAddressMapper.insertSelective(osAddress);
        return count;
    }

    //更新收货地址
    public int updatetAddress(OsAddress osAddress) {
        int count = osAddressMapper.updateByPrimaryKeySelective(osAddress);
        return count;
    }
    
    //更新用户信息
    public int updatetUser(OsUser osUser) {
        int count = osUserMapper.updateByPrimaryKeySelective(osUser);
        return count;
    }

    //删除收货地址
    public int deleteByAddressId(Long addressId) {
        int count = osAddressMapper.deleteByPrimaryKey(addressId);
        return count;
    }
}
