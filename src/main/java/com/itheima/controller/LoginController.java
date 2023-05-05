package com.itheima.controller;

import com.itheima.pojo.User;
import com.itheima.service.CourseService;
import com.itheima.service.CourseServiceimpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class LoginController {
    @Autowired
    @Qualifier("CourseServiceimpl")
    private CourseService courseService = new CourseServiceimpl();
    @RequestMapping("/course/allCourse")
    public String main(){
        return "/course/allCourse";
    }
    @RequestMapping("/goLogin")
    public String login(){
        return "login";
    }
    @RequestMapping("/login")
    public String login(HttpSession session, User user, Model model,RedirectAttributes redirectAttributes){
        String username=user.getUsername();
        String password=user.getPassword();
        System.out.println("login==>"+user);
        //把用户信息存在session中
        if (username==null||password==null){
            model.addAttribute("msg","用户名或密码不能为空！");
            return "login";
        }
        if(courseService.isUserExist(username,password))
        {
            session.setAttribute("USER_SESSION",user);
            return "main";
        }
        redirectAttributes.addFlashAttribute("message", "账号或密码错误");
        model.addAttribute("msg","用户名或密码错误，请重新登录！");
        return "login";
    }
    @RequestMapping("/goOut")
    public String goOut(HttpSession session){
        session.removeAttribute("USER_SESSION");
        return "redirect:goLogin";
    }
}
