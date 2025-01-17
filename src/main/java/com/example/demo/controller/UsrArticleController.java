package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;
import com.example.demo.dto.Rq;
import com.example.demo.service.ArticleService;
import com.example.demo.util.Util;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrArticleController {

	private ArticleService articleService;

	public UsrArticleController(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	@GetMapping("/usr/article/write")
	public String write() {
		return "usr/article/write";
	}
	
	@PostMapping("/usr/article/doWrite")
	@ResponseBody
	public String doWrite(HttpServletRequest req, int boardId, String title, String body) {
		
		Rq rq = (Rq) req.getAttribute("rq");
		
		articleService.doWrite(rq.getLoginedMemberId(), boardId, title, body);
		
		int id = articleService.getLastInsertId();

		return Util.jsReturn(String.format("%d번 게시물을 작성했습니다", id), String.format("detail?id=%d", id));
	}

	@GetMapping("/usr/article/list")
	public String list(Model model, int boardId) {

		List<Article> articles = articleService.getArticleByBoardId(boardId);

		model.addAttribute("articles", articles);

		return "usr/article/list";
	}

	@GetMapping("/usr/article/detail")
	public String detail(Model model, int id) {

		Article article = articleService.getArticleById(id);

		model.addAttribute("article", article);

		return "usr/article/detail";
	}

	@GetMapping("/usr/article/modify")
	public String modify(Model model, int id) {

		Article article = articleService.getArticleById(id);

		model.addAttribute("article", article);

		return "usr/article/modify";
	}

	@PostMapping("/usr/article/doModify")
	@ResponseBody
	public String doModify(Model model, int id, String title, String body) {
		
		Article article = articleService.getArticleById(id);

		model.addAttribute("article", article);

		articleService.doModify(id, title, body);

		return Util.jsReturn(String.format("%d번 게시물을 수정했습니다", id), String.format("detail?id=%d", id));
	}

	@GetMapping("/usr/article/doDelete")
	@ResponseBody
	public String doDelete(int id, int boardId) {

		articleService.doDelete(id);

		return Util.jsReturn(String.format("%d번 게시물을 삭제했습니다", id), String.format("list?boardId=%d", boardId));
	}

}
