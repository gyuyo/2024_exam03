<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="비밀번호확인" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<section class="mt-8 flex-1">
	<div class="container mx-auto">
		<form action="/usr/member/doCheckPw" method="POST">
			<div class="login-table w-9/12 mx-auto">
				<table class="table">
					<tr>
						<th>비밀번호</th>
						<td>
							<label class="input input-bordered flex items-center gap-2 bg-black">
							  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="h-4 w-4 opacity-70">
							    <path fill-rule="evenodd" d="M14 6a4 4 0 0 1-4.899 3.899l-1.955 1.955a.5.5 0 0 1-.353.146H5v1.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-2.293a.5.5 0 0 1 .146-.353l3.955-3.955A4 4 0 1 1 14 6Zm-4-2a.75.75 0 0 0 0 1.5.5.5 0 0 1 .5.5.75.75 0 0 0 1.5 0 2 2 0 0 0-2-2Z" clip-rule="evenodd" />
							  </svg><input class="grow" type="text" name="loginPw" placeholder="비밀번호를 입력해주세요" />
							</label>
						</td>
					</tr>
				</table>
			</div>
			<div class="btns w-9/12 mt-3 mx-auto text-sm flex justify-between">
				<button type="button" onclick="history.back();">뒤로가기</button>
				<button type="submit">확인</button>
			</div>
		</form>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>