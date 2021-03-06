package com.shop.dao;

import java.util.List;

import com.shop.po.OsUser;

public interface OsUserMapper {
    int deleteByPrimaryKey(Long userId);

    int insert(OsUser record);

    int insertSelective(OsUser record);

    OsUser selectByPrimaryKey(Long osUserId);

    int updateByPrimaryKeySelective(OsUser record);

    int updateByPrimaryKey(OsUser record);

    OsUser selectByTelephone(String telephone);
    
    List<OsUser> selectByUserId(Long userId);
}