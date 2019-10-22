package com.guaseed.ams.service;

import com.guaseed.ams.AmsApplicationTests;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

/**
 * @Author: intent
 * @Date: 19-10-22 下午3:39
 */
class UserServiceTest extends AmsApplicationTests {
    @Autowired
    UserService userService;

    @Test
    void getUserCount() {
        Assert.isTrue(userService.count() == 1, "users count not 1");
    }
}