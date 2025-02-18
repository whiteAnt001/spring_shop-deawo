package com.springboot.myhome.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@GetMapping(value="/home/index.html")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}
}
