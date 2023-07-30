<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="main event">
	<div class="main event news">
		<p class="event_title">이달의 행사</p>
		<div class="line"></div>
		<c:forEach items="${EVENT_LIST}" var="event" begin="0" end="2">
			<ul>
				<li><span>${event.date}</span>
					<p>${event.event_info}</p></li>
			</ul>
		</c:forEach>
	</div>
	<div class="naver_search">
		<form action="https://search.naver.com/search.naver" target="_new">
			<input name="query" type="text" placeholder="네이버 검색">
			<button type="submit" class="btn_search">
				<img src="${rootPath}/static/images/search.png" alt="검색">
			</button>
		</form>
	</div>
	<div class="card"
		onclick="window.open('https://search.naver.com/search.naver?where=nexearch&amp;sm=top_hty&amp;fbm=0&amp;ie=utf8&amp;query=%EB%8B%B4%EC%96%91%EB%82%A0%EC%94%A8')">
		<p class="nowtime"></p>
		<h2>담양군</h2>
		<img id="ic" src=""> <br> <span id="humidity"><br></span>
	</div>
	<div class="banner">
		<div class="blog"
			onclick="window.open('https://blog.naver.com/damyanggun')">
			<img src="${rootPath}/static/images/블로그.png" alt="블로그이미지" />
		</div>
		<div class="instagram"
			onclick="window.open('https://www.instagram.com/damyang.gun/')">
			<img src="${rootPath}/static/images/인스타.png" alt="인스타이미지" />
		</div>
		<div class="youtube"
			onclick="window.open('https://www.youtube.com/channel/UCFS5qcsGXRQku904_ygBSqw')">
			<img src="${rootPath}/static/images/유튜브.png" alt="유튜브이미지" />
		</div>
		<div class="damyang_web"
			onclick="window.open('https://www.damyang.go.kr/tour/index.damyang')">
			<img src="${rootPath}/static/images/문화관광.png" alt="문화관광이미지" />
		</div>
	</div>

</div>
