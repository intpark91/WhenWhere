package com.whenwhere.user.cont;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.whenwhere.util.CustomUserDetails;
 
@Controller
public class LoginController {
     
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
     
    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public void login(HttpSession session) {   	
        logger.info("Welcome login! {}", session.getId());
    }
     
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public void logout(HttpSession session) {
        CustomUserDetails userDetails = (CustomUserDetails)session.getAttribute("userLoginInfo");        
        logger.info("Welcome logout! {}, {}", session.getId(), userDetails.getUsername());
         
         
        session.invalidate();
    }
     
    @RequestMapping(value = "login_success", method = RequestMethod.GET)
    public void login_success(HttpSession session) {
        CustomUserDetails userDetails = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getDetails();
        System.out.println("userDetails.getAuthorities() 컨트롤러 양"+userDetails.getAuthorities());
        logger.info("Welcome login_success! {}, {}", session.getId(), userDetails.getUsername() + "/" + userDetails.getPassword());
        session.setAttribute("userLoginInfo", userDetails);
        System.out.println("userDetails.getUsername() 컨트롤러 양"+userDetails.getUsername());       
        
    }
    
    
    @RequestMapping(value = "login_duplicate", method = RequestMethod.GET)
    public void login_duplicate() {    
        logger.info("Welcome login_duplicate!");
    }
     
}