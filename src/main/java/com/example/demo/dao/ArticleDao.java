package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.dto.Article;

@Mapper
public interface ArticleDao {
	
	@Insert("""
			INSERT INTO article
				SET regDate = NOW()
					, updateDate = NOW()
					, boardId = #{boardId}
					, memberId = #{loginedMemberId}
					, title = #{title}
					, `body` = #{body}
			""")
	public void doWrite(int loginedMemberId, int boardId, String title, String body);
	
	@Select("""
			SELECT * 
				FROM article
				WHERE boardId = #{boardId}
			""")
	public List<Article> getArticleByBoardId(int boardId);
	
	@Update("""
			UPDATE article
				SET updateDate = NOW()
					, title = #{title}
					, `body` = #{body}
				WHERE id = #{id}
			""")
	public void doModify(int id, String title, String body);
	
	@Delete("""
			DELETE FROM article
				WHERE id = #{id}
			""")
	public void doDelete(int id);
	
	@Select("""
			SELECT a.*
					, m.loginId
				FROM article AS a
				INNER JOIN `member` AS m
				ON a.memberId = m.id
				WHERE a.id = #{id}
			""")
	public Article getArticleById(int id);
		
	@Select("""
			SELECT LAST_INSERT_ID();
			""")
	public int getLastInsertId();
}
