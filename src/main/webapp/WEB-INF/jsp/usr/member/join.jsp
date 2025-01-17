<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="회원가입" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<script>

	let validLoginId = null;

	const joinForm_onSubmit = function(form) {
		form.loginId.value = form.loginId.value.trim();
		form.loginPw.value = form.loginPw.value.trim();
		form.name.value = form.name.value.trim();
		
		if (form.loginId.value.length == 0) {
			alert('아이디를 입력해주세요');
			form.loginId.focus();
			return;
		}
		
		if(form.loginId.value != validLoginId) {
			alert('사용불가한 아이디입니다.');
			form.loginId.focus();
			return;
		}
		
		if (form.loginPw.value.length == 0) {
			alert('비밀번호를 입력해주세요');
			form.loginPw.focus();
			return;
		}
		
		if (form.loginPw.value != form.loginPwChk.value) {
			alert('비밀번호가 일치하지 않습니다');
			form.loginPw.focus();
			return;
		}
		
		if (form.name.value.length == 0) {
			alert('이름를 입력해주세요');
			form.name.focus();
			return;
		}
		
		form.submit();
	}
	
	const loginIdChk = function(el) {
		el.value = el.value.trim();
		
		if(el.value.length == 0) {
			$('#empty').show();
			$('#success').hide();
			$('#error').hide();
			return;
		}

		$.ajax({
			url : '/usr/member/loginIdChk',
			type : 'GET',
			data : {
				loginId : el.value
			},
			dataType : 'json',
			success : function(data) {
				if (data.success) {
					$('#success').show();
					$('#error').hide();
					$('#empty').hide();
					validLoginId = el.value;
				} else {
					$('#success').hide();
					$('#error').show();
					$('#empty').hide();
					validLoginId = null;
				}
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		})
	}
</script>

<section class="mt-8 flex-1">
	<div class="container mx-auto">
		<form action="doJoin" method="post" onsubmit="joinForm_onSubmit(this); return false;">
			<div class="join-table w-9/12 mx-auto">
				<table class="table table-lg mx-auto">
					<tr>
						<td>
							<label class="input input-bordered flex items-center gap-2 bg-black">
							  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="h-4 w-4 opacity-70 bg-black">
							    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z" />
							  </svg><input class="grow" id = "id" type="text" name="loginId" placeholder="아이디를 입력해주세요" onblur = "loginIdChk(this)" />
							</label>
							<p id="error" style="color: red; display: none; margin-left: 40px;">이미 사용중인 아이디입니다.</p>
							<p id="empty" style="color: red; display: none; margin-left: 40px;">아이디를 입력해주세요.</p>
							<p id="success" style="color: green; display: none; margin-left: 40px;">사용가능한 아이디입니다.</p>
						</td>
					</tr>
					<tr>
						<td>
							<label class="input input-bordered flex items-center gap-2 bg-black">
							  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="h-4 w-4 opacity-70">
							    <path fill-rule="evenodd" d="M14 6a4 4 0 0 1-4.899 3.899l-1.955 1.955a.5.5 0 0 1-.353.146H5v1.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-2.293a.5.5 0 0 1 .146-.353l3.955-3.955A4 4 0 1 1 14 6Zm-4-2a.75.75 0 0 0 0 1.5.5.5 0 0 1 .5.5.75.75 0 0 0 1.5 0 2 2 0 0 0-2-2Z" clip-rule="evenodd" />
							  </svg><input class="grow" type="text" name="loginPw" placeholder="비밀번호를 입력해주세요" />
							</label>
						</td>
					</tr>
					<tr>
						<td>
							<label class="input input-bordered flex items-center gap-2 bg-black">
							  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="h-4 w-4 opacity-70">
							    <path fill-rule="evenodd" d="M14 6a4 4 0 0 1-4.899 3.899l-1.955 1.955a.5.5 0 0 1-.353.146H5v1.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-2.293a.5.5 0 0 1 .146-.353l3.955-3.955A4 4 0 1 1 14 6Zm-4-2a.75.75 0 0 0 0 1.5.5.5 0 0 1 .5.5.75.75 0 0 0 1.5 0 2 2 0 0 0-2-2Z" clip-rule="evenodd" />
							  </svg><input class="grow" type="text" name="loginPwChk" placeholder="비밀번호를 재입력해주세요" />
							</label>
						</td>
					</tr>
					<tr>
						<td>
							<label class="input input-bordered flex items-center gap-2 bg-black">
							  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="h-4 w-4 opacity-70">
							    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z" />
							  </svg><input class="grow" type="text" name="name" placeholder="이름을 입력해주세요" />
							</label>
						</td>
					</tr>
					<tr>
						<td>
							<div class="flex justify-center">
								<button class="btn btn-active btn-wide">회원가입</button>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</form>
		
		<div class="btns w-9/12 mt-3 mx-auto text-sm flex justify-between">
			<button onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>