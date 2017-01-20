package com.molbase.service.system.impl;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.molbase.mapper.system.UserMapper;
import com.molbase.model.system.User;
import com.molbase.service.system.IUserService;

/**
 * 
 * @date 2017年1月20日 下午5:37:01
 * @author lanlong.li
 * @desc
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {


}