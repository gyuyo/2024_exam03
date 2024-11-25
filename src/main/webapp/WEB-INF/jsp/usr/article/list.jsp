<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="목록" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section class="mt-8 flex-1">
	<div class="container mx-auto">
		<div class="table-box">
			<div class="w-9/12 mx-auto">
				<div>총 : ${articlesCnt }개</div>
			</div>
			<div class="w-9/12 mx-auto">
				<table class="table">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
					<c:forEach var="article" items="${articles }">
						<tr>
							<td>${article.getId() }</td>
							<td class="hover:underline"><a href="detail?id=${article.getId() }">${article.getTitle() }</a></td>
							<td>${article.getLoginId() }</td>
							<td>${article.getRegDate().substring(2,16) }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="w-9/12 mx-auto btns mt-3 text-sm flex justify-between">
			<button onclick="history.back();">뒤로가기</button>
			<c:if test="${rq.getLoginedMemberId() != -1 }">
				<div class="flex">
					<a href="/usr/article/write" class="p-5">글작성</a>
				</div>
			</c:if>
		</div>
		<div class="join flex justify-center">
  			<a href="#" class="join-item btn btn-square text-white bg-black" type="radio">1</a>
			</div>
		</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>