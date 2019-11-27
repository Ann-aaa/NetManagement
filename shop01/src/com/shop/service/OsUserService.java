package com.shop.service;

import com.shop.dao.OsUserMapper;
import com.shop.po.OsUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

@Service
public class OsUserService {

    @Autowired
    private OsUserMapper osUserMapper;

    public void insertUser(OsUser user) {
        osUserMapper.insertSelective(user);
    }

    public OsUser selectUser(String loginName, String loginPassword) {
        OsUser user = osUserMapper.selectByTelephone(loginName);
        return user;
    }
}
