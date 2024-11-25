package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ArticleDao;
import com.example.demo.dto.Article;

@Service
public class ArticleService {

	private ArticleDao articleDao;

	public ArticleService(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}

	public void doWrite(int boardId, int memberId, String title, String body) {
		articleDao.doWrite(boardId, memberId, title, body);
	}

	public List<Article> getArticleByBoardId(int boardId) {
		return articleDao.getArticleByBoardId(boardId);
	}

	public void doModify(int id, String title, String body) {
		articleDao.doModify(id, title, body);
	}

	public void doDelete(int id) {
		articleDao.doDelete(id);
	}

	public Article getArticleById(int id) {
		return articleDao.getArticleById(id);
	}
	
	public int getLastInsertId() {
		return articleDao.getLastInsertId();
	}
}
