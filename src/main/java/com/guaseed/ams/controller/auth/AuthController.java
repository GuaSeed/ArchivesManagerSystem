package com.guaseed.ams.controller.auth;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @Author: intent
 * @Date: 19-10-22 下午3:58
 */
@Controller
public class AuthController {
    @GetMapping(value = "/login")
    public String login() {
        return "login";
    }
}
