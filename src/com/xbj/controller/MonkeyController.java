package com.xbj.controller;

import com.xbj.domain.Monkey;
import com.xbj.service.MonkeyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/monkey")
public class MonkeyController {
    @Autowired
    private MonkeyService ms;

    //登录
    @RequestMapping("/loginCkeck")
    public String login(HttpSession session, HttpServletResponse response, String monkeyName, String password, Integer remember){
        Monkey monkey = ms.loginCkeck(monkeyName, password);
        if(monkey == null){
            return "login";
        }else {
           session.setAttribute("monkey2",monkey);
           if(remember==30){
               session.setMaxInactiveInterval(30 * 24 * 60 * 60);
               //设置cookie
               Cookie cookie = new Cookie("JSESSIONID",session.getId());
               cookie.setMaxAge(30 * 24 * 60 * 60);
               //将cookie相应给浏览器
               response.addCookie(cookie);
           }
        }

        return "redirect:list";
    }
    @RequestMapping("/list")
    public String listAll(Model model, Monkey monkey,String monkeyName,String address){
        Monkey monkey1 = new Monkey();
        monkey1.setAddress(address);
        monkey1.setMonkeyName(monkeyName);

        List<Monkey> monkeys = ms.listAll(monkey);
        //System.out.println(monkeys);
        model.addAttribute("monkeys",monkeys);
        model.addAttribute("monkey1", monkey1);
        return "listMonkey";
    }

    @RequestMapping("/add")
    public String insertMonkey(Monkey monkey){
        ms.insertMonkey(monkey);
        return "redirect:list";
    }

    @ResponseBody
    @RequestMapping("/checkName")
    public String checkName(String param,String oldName){
        //System.out.println(param+"222");

        if(param.equals(oldName)){
            return "y";
        }

        boolean b = ms.checkName(param);
        if(b){
            return "姓名重复，另取";
        }
        return "y";
    }

    @RequestMapping("/toMdofy")
    public String toMdofy(Model model,Integer MonkeyId){
        Monkey monkey = ms.findById(MonkeyId);
        model.addAttribute("monkey",monkey);
        return "modifyMonkey";
    }

    @RequestMapping("/modify")
    public String modify(Monkey monkey){
        ms.modifyMonkey(monkey);
        return "redirect:list";
    }

    @RequestMapping("/delete")
    public String delete(Integer MonkeyId){
        ms.deleteMonkey(MonkeyId);
        return "redirect:list";
    }
}
