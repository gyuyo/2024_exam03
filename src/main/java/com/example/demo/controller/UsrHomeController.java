package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.service.ArticleService;


@Controller
public class UsrHomeController {
	
	@GetMapping("/usr/home/main")
	public String main() {
		return "usr/home/main";
	}
	@GetMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
}
