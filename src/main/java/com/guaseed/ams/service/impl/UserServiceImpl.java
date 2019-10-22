package com.guaseed.ams.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.guaseed.ams.dao.UserDao;
import com.guaseed.ams.model.dataobject.User;
import com.guaseed.ams.service.UserService;
import org.springframework.stereotype.Service;

/**
 * @Author: intent
 * @Date: 19-10-22 下午3:39
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserDao, User> implements UserService {
}
