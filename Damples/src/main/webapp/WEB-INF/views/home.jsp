<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>메인화면</title>
<link rel="stylesheet" href="${rootPath}/static/css/home.css?0002">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script>
    $(document).ready(function () {
      $(function () {

        $('.main_tab > li:first-child').addClass('active');
        $('#main_menu01').addClass('active');

        $('.main_tab > li > a').on('click', function (e) {
          let tabNum = $(this).parent('li').index() + 1;
          $('.main_tab > li, #main_menu01, .main_tab_menu').removeClass('active');
          $(this).parent('li').addClass('active');
          $('#main_menu0' + tabNum).addClass('active');
          return false;
        });
      });
    });
  </script>
<script>
    $(document).ready(function () {
      function convertTime() {
        var now = new Date();

        var year = now.getFullYear();
        var month = now.getMonth() + 1;
        var date = now.getDate();

        return year + " 년 " + month + " 월 " + date + " 일 ";
      }

      var currentTime = convertTime();
      $(".nowtime").append(currentTime);
    });
  </script>

<script>
    let url = "https://api.openweathermap.org/data/2.5/weather?q=damyang&appid=6cf9a99f768ce493e58c351ccf43588a&lang=kr&units=metric";

    fetch(url)
      .then((response) => {
        return response.json();
      })
      .then((json) => {
        console.log(json);

        let result =
          "현재온도 : " +
          Math.floor(json.main.temp) +
          "°C<br>"; //소수점 버림 온도를 찍어줌
        let icon = json.weather[0].icon; //아이콘 받아옴
        document.getElementById("humidity").innerHTML = result; //result를 humidity라는 id를 가진 span에 innerHTML로 표시
        let iconurl = document.getElementById("ic"); //img id를 iconurl이라는 이름으로 받아옴
        iconurl.src = "../img/icon/" + icon + ".png"; //iconurl로 src를 설정해줌
      });
  </script>
<script>
    function goToPage(hash) {
      window.location.href = '../sogae/sogae_002.html' + hash;
    }
  </script>


<style>
.main_wrap .maib_tab_list01 {
	display: none;
}

.main_wrap .maib_tab_list01.active {
	display: block;
}

.main_tab_menu {
	display: none;
}

.main_tab_menu.active {
	display: block;
}

/* .course_cont {display: none;}
       .course_cont.active {display: block;} */
.tooltip {
	position: absolute;
	display: none;
}

.swiper-slide img {
	height: 240px;
}
</style>
</head>

<body>
	<div id="wrapper">
		<div class="header">
			<h3 onclick="location.href='${rootPath}'">
				담양 HOT PLACE!
				</h3>
				<h1 onclick="location.href='${rootPath}'">DAMPLES</h1>

				<div class="head_menu">
					<ul class="head_menu_tab">
						<li class="active"><a href="../sogae/sogae_001.html">소개</a>
							<ul class="head_drop">
								<li><a href="../sogae/sogae_001.html">담양군 소개</a></li>
								<li><a href="../sogae/sogae_002.html">주요 관광지</a></li>
							</ul></li>
						<li><a href="../html/sosik_001.html">소식</a>
							<ul class="head_drop">
								<li><a href="../html/sosik_001.html">담양군 소식</a></li>
								<li><a href="../html/event.html">행사일정</a></li>
							</ul></li>
						<li><a href="../html/course_001.html">코스추천</a> <!-- <ul class="head_drop">
                    <li><a href="#">서브 메뉴 7</a></li>
                    <li><a href="#">서브 메뉴 8</a></li>
                    <li><a href="#">서브 메뉴 9</a></li>
                  </ul> --></li>
						<li><a href="../html/review_001.html">리뷰</a> <!-- <ul class="head_drop">
                    <li><a href="#">서브 메뉴 10</a></li>
                    <li><a href="#">서브 메뉴 11</a></li>
                    <li><a href="#">서브 메뉴 12</a></li>
                  </ul> --></li>
					</ul>

					<div class="search_box">
						<input type="text" placeholder="검색어를 입력해주세요">
						<button type="button" class="btn_search">
							<img src="../doc/search.png" alt="검색">
						</button>
					</div>
				</div>
		</div>
		<div class="container">

			<div class="main_wrap">
				<!-- 담플스메인 -->
				<div class="dam_main">

					<ul class="main_tab">
						<li class="active"><a href="#">핫플</a></li>
						<li><a href="#">먹방</a></li>
						<li><a href="#">숙박</a></li>
					</ul>

					<div class="main_tab_menu active" id="main_menu01">

						<div class="main_tab_cont">

							<div class="main_cont_top">
								<img src="../doc/핫플지도.png" alt="지도이미지" usemap="#image-map">
								<map name="image-map">
									<area target="" alt="가마골" title=""
										href="../sogae/sogae_002_hotplace_003.html"
										coords="392,139,18" shape="circle"
										onmouseover="showImage(this, '../img/mark/hotplace_mark_01.png', 360,100)">
									<area target="" alt="용마루길" title=""
										href="../sogae/sogae_002_hotplace_008.html"
										coords="356,217,18" shape="circle"
										onmouseover="showImage(this, '../img/mark/hotplace_mark_02.png', 320, 180)">
									<area target="" alt="추억의골목" title=""
										href="../sogae/sogae_002_hotplace_006.html"
										coords="420,271,18" shape="circle"
										onmouseover="showImage(this, '../img/mark/hotplace_mark_03.png', 390, 230)">
									<area target="" alt="딜라이트담양" title=""
										href="../sogae/sogae_002_hotplace_009.html"
										coords="333,379,18" shape="circle"
										onmouseover="showImage(this, '../img/mark/hotplace_mark_04.png', 300, 340)">
									<area target="" alt="한재골" title=""
										href="../sogae/sogae_002_hotplace_004.html"
										coords="186,445,18" shape="circle"
										onmouseover="showImage(this, '../img/mark/hotplace_mark_05.png', 150, 410)">
									<area target="" alt="관방제림" title=""
										href="../sogae/sogae_002_hotplace_005.html"
										coords="468,419,18" shape="circle"
										onmouseover="showImage(this, '../img/mark/hotplace_mark_06.png', 440, 380)">
									<area target="" alt="메타세콰이어" title=""
										href="../sogae/sogae_002_hotplace_007.html"
										coords="391,477,18" shape="circle"
										onmouseover="showImage(this, '../img/mark/hotplace_mark_07.png', 360, 440)">
									<area target="" alt="소쇄원" title=""
										href="../sogae/sogae_002_hotplace_002.html"
										coords="459,676,24" shape="circle"
										onmouseover="showImage(this, '../img/mark/hotplace_mark_08.png', 420, 650)">
								</map>

							</div>

							<div class="main_cont_bottom">

								<img src="../doc/hotplace_tit.png" alt="HOT PLACE"
									onclick="goToPage('#course_1')">
								<div class="sub_title">
									<p class="check">&check;</p>
									<p class="main_bottom_sub_title" alt="유적지">유적지</p>
								</div>
								<div class="swiper swiper1">
									<ul class="hot_place_info swiper-wrapper">
										<li class="swiper-slide"><img
											src="../img/hotplace/죽녹원_여름1.jpg" alt="죽녹원이미지"
											onclick="location.href='../sogae/sogae_002_hotplace_001.html'">
											<p class="hot_place_title">
												<span class="hp_title">죽녹원</span> <span class="hp_sub">생태전시관,
													인공폭포, 생태연못, 야외공연장과 2.2km에 달하는 8가지 주제의 산책로를 통한 다양한 테마의 여행
													구성에 적합</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/hotplace/소쇄원_광풍각.jpg" alt="소쇄원이미지"
											onclick="location.href='../sogae/sogae_002_hotplace_002.html'">
											<p class="hot_place_title">
												<span class="hp_title">소쇄원</span> <span class="hp_sub">한국의
													민간정원 중에서 최고라는 칭송을 받는 소쇄원은 500년 가까운 세월이 흘러간 오늘까지도 많은 이들로부터
													사랑을 받고있는 곳</span>
											</p></li>
									</ul>
									<div class="swiper-button-next"></div>
									<div class="swiper-button-prev"></div>
								</div>


								<!-- <img src="../doc/main_event_sub_02.png" alt="자연생활"> -->
								<div class="sub_title">
									<p class="check">&check;</p>
									<p class="main_bottom_sub_title" alt="자연생활">자연생활</p>
								</div>
								<div class="swiper swiper1">
									<ul class="hot_place_info swiper-wrapper">
										<li class="swiper-slide"><img
											src="../img/hotplace/메타세콰이어_봄.jpg" alt="메타세콰이어이미지"
											onclick="location.href='../sogae/sogae_002_hotplace_003.html'">
											<p class="hot_place_title">
												<span class="hp_title">메타세콰이어</span> <span class="hp_sub">1박
													2일 및 각종영화 촬영지, 분위기와 힐링 모두 챙겨 건강해지는 기분을 느낄 수 있는 곳</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/hotplace/용마루길1.jpg" alt="용마루길이미지"
											onclick="location.href='../sogae/sogae_002_hotplace_004.html'">
											<p class="hot_place_title">
												<span class="hp_title">용마루길</span> <span class="hp_sub">최근
													보수 공사를 통해 노후구간 교체와 안전사고 예방을 해 더욱 더 깔끔해지고 멋져진 산책로 코스, 담양호
													전체를 수변길을 통해 보고, 출렁다리의 재미를 느낄 수 있는 곳</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/hotplace/가마골.jpg" alt="가마골이미지"
											onclick="location.href='../sogae/sogae_002_hotplace_005.html'">
											<p class="hot_place_title">
												<span class="hp_title">가마골</span> <span class="hp_sub">자연적으로
													만들어진 계곡과 그 길을 따라 조성된 생태공원을 동시에 즐길 수 있고, 주변 가까운 곳에 식당과 숙소가
													있어 힐링과 휴식 그리고 가족 나들이에 적합</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/hotplace/한재골1.jpg" alt="한재골이미지"
											onclick="location.href='../sogae/sogae_002_hotplace_006.html'">
											<p class="hot_place_title">
												<span class="hp_title">한재골</span> <span class="hp_sub">하류보단
													상류에서 놀기 적합하고, 나무의 그늘과 계곡의 시원함이 더해져 여름 피서지로 안성 맞춤</span>
											</p></li>
									</ul>
									<div class="swiper-button-next"></div>
									<div class="swiper-button-prev"></div>
								</div>

								<p class="check">&check;</p>
								<p class="main_bottom_sub_title" alt="자연생활">산책</p>
								<div class="swiper swiper1">
									<ul class="hot_place_info swiper-wrapper">
										<li class="swiper-slide"><img
											src="../img/hotplace/관방제림_가을.jpg" alt="관방제림이미지"
											onclick="location.href='../sogae/sogae_002_hotplace_007.html'">
											<p class="hot_place_title">
												<span class="hp_title">관방제림</span> <span class="hp_sub">쭉
													뻗은 산책로를 보유해 걷기, 자전거 타기에 좋으며 곳곳에 있는 포토스팟으로 유명한 곳</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/hotplace/추억의골목1.jpg" alt="추억의골목이미지"
											height="269px"
											onclick="location.href='../sogae/sogae_002_hotplace_008.html'">
											<p class="hot_place_title">
												<span class="hp_title">추억의골목</span> <span class="hp_sub">옛날의
													길거리 모습, 추억이 떠오르는 레트로 감성 핫플레이스가족, 연인, 친구 모두와 함께 가기 좋은 곳으로
													다양하고 특별한 컨셉의 포토스팟과 볼거리가 있는 곳</span>
											</p></li>
									</ul>
									<div class="swiper-button-next"></div>
									<div class="swiper-button-prev"></div>
								</div>
								<p class="check">&check;</p>
								<p class="main_bottom_sub_title" alt="체험">체험</p>
								<div class="swiper swiper1">
									<ul class="hot_place_info swiper-wrapper">
										<li class="swiper-slide"><img
											src="../img/hotplace/딜라이트담양_외관.jpg" alt="딜라이트담양이미지"
											onclick="location.href='../sogae/sogae_002_hotplace_009.html'">
											<p class="hot_place_title">
												<span class="hp_title">딜라이트담양</span> <span class="hp_sub">천
													년의 역사를 간직한 담양의 생태와 인문학을 재해석하여 체험형 미디어를 전시한 담양의 최대규모 미디어 아트
													전시관</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/hotplace/테테루테마파크1.jpg" alt="테테루테마파크이미지"
											height="269px"
											onclick="location.href='../sogae/sogae_002_hotplace_010.html'">
											<p class="hot_place_title">
												<span class="hp_title">테테루테마파크</span> <span class="hp_sub">계절별
													썰매장, 빙어잡이는 물론, 이쁜 산책길을 겸비한 가든까지 힐링과 재미를 모두 챙길 수 있는 곳</span>
											</p></li>
									</ul>
									<div class="swiper-button-next"></div>
									<div class="swiper-button-prev"></div>
								</div>
							</div>
						</div>
					</div>


					<div class="main_tab_menu" id="main_menu02">
						<div class="main_tab_cont">
							<div class="main_cont_top">
								<img src="../doc/먹방지도.png" alt="지도이미지" usemap="#image-map2">
								<map name="image-map2">
									<area target="" alt="항아리" title=""
										href="../sogae/sogae_002_mukbang_001.html" coords="387,135,25"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/mukbang_mark_01.png', 360,90)">
									<area target="" alt="요리온" title=""
										href="../sogae/sogae_002_mukbang_002.html" coords="264,276,25"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/mukbang_mark_02.png', 230,230)">
									<area target="" alt="담순로153" title=""
										href="../sogae/sogae_002_mukbang_007.html" coords="454,249,25"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/mukbang_mark_03.png', 430,200)">
									<area target="" alt="프룩커피" title=""
										href="../sogae/sogae_002_mukbang_008.html" coords="182,366,25"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/mukbang_mark_04.png', 150,320)">
									<area target="" alt="대나무국수" title=""
										href="../sogae/sogae_002_mukbang_003.html" coords="374,370,22"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/mukbang_mark_05.png', 340,330)">
									<area target="" alt="무화과나무" title=""
										href="../sogae/sogae_002_mukbang_009.html" coords="425,351,22"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/mukbang_mark_06.png', 390,310)">
									<area target="" alt="뚝방국수" title=""
										href="../sogae/sogae_002_mukbang_004.html" coords="342,405,21"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/mukbang_mark_07.png', 310,370)">
									<area target="" alt="아우터베이크하우스" title=""
										href="../sogae/sogae_002_mukbang_010.html" coords="280,457,22"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/mukbang_mark_08.png', 250,420)">
									<area target="" alt="소예르" title=""
										href="../sogae/sogae_002_mukbang_011.html" coords="500,460,22"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/mukbang_mark_09.png', 470,420)">
									<area target="" alt="트루와지엠" title=""
										href="../sogae/sogae_002_mukbang_012.html" coords="320,574,22"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/mukbang_mark_10.png', 290, 540)">
									<area target="" alt="담양애꽃" title=""
										href="../sogae/sogae_002_mukbang_005.html" coords="374,548,22"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/mukbang_mark_11.png', 340, 510)">
									<area target="" alt="대가" title=""
										href="../sogae/sogae_002_mukbang_006.html" coords="449,694,22"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/mukbang_mark_12.png', 420,660)">
								</map>
							</div>
							<div class="main_cont_bottom">
								<img src="../doc/mukbang_tit.png" alt="mukbang"
									onclick="goToPage('#course_2')">
								<p class="check">&check;</p>
								<p class="main_bottom_sub_title" alt="맛집">맛집</p>
								<div class="swiper swiper1">
									<ul class="hot_place_info swiper-wrapper">
										<li class="swiper-slide"><img
											src="../img/meokbang/식당/항아리레스토랑카페돈까스.jpg" alt="항아리레스토랑이미지"
											onclick="location.href='../sogae/sogae_002_mukbang_001.html'">
											<p class="hot_place_title">
												<span class="hp_title">항아리</span> <span class="hp_sub">추월산과
													담양댐이 둘러싸여 있으며 실제 항아리로 지붕을 만들어 내부 인테리어를 하여 독특하고 색다른 분위기와 함께
													양식 뿐만 아니라 커피와 전통차를 즐길 수 있는 곳</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/meokbang/식당/요리온스테이크.jpg" alt="요리온이미지"
											onclick="location.href='../sogae/sogae_002_mukbang_002.html'">
											<p class="hot_place_title">
												<span class="hp_title">요리온</span> <span class="hp_sub">신선한
													재료로 인위적이기보단 부드럽고 순한 맛을 표현하여 연인과 함께 가기 좋은 곳</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/meokbang/식당/뚝방국수비빔국수.jpg" alt="뚝방국수이미지"
											onclick="location.href='../sogae/sogae_002_mukbang_003.html'">
											<p class="hot_place_title">
												<span class="hp_title">뚝방국수</span> <span class="hp_sub">시원한
													멸치국수와 새콤달콤 열무비빔국수가 일품이며 영산강이 앞에 있어 산책하기 좋은 곳</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/meokbang/식당/원조대나무국수외관.jpg" alt="원조대나무국수이미지"
											onclick="location.href='../sogae/sogae_002_mukbang_004.html'">
											<p class="hot_place_title">
												<span class="hp_title">원조대나무국수</span> <span class="hp_sub">40년
													전통 국수집으로 푸짐하고 진한 멸치국수와 댓잎계란이 일품인 간단하게 먹기 좋은 곳</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/meokbang/식당/담양애꽃_음식.jpg" alt="담양애꽃이미지"
											onclick="location.href='../sogae/sogae_002_mukbang_005.html'">
											<p class="hot_place_title">
												<span class="hp_title">담양애꽃</span> <span class="hp_sub">다양한
													반찬과 메인인 떡갈비, 죽순밥 등으로 담양의 색을 느껴볼 수 있는 곳</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/meokbang/식당/대가사진.jpg" alt="대가이미지"
											onclick="location.href='../sogae/sogae_002_mukbang_006.html'">
											<p class="hot_place_title">
												<span class="hp_title">대가</span> <span class="hp_sub">메인
													요리인 생선구이와 아이들이 좋아하는 떡갈비로 가족과 함께 방문하기 좋은 곳</span>
											</p></li>
									</ul>
									<div class="swiper-button-next"></div>
									<div class="swiper-button-prev"></div>
								</div>
								<p class="check">&check;</p>
								<p class="main_bottom_sub_title" alt="카페">카페</p>
								<div class="swiper swiper1">
									<ul class="hot_place_info swiper-wrapper">
										<li class="swiper-slide"><img
											src="../img/meokbang/카페/담순로153케익.jpg" alt="담순로153이미지"
											onclick="location.href='../sogae/sogae_002_mukbang_007.html'">
											<p class="hot_place_title">
												<span class="hp_title">담순로153</span> <span class="hp_sub">주문제작
													가능한 수제 케이크와 수제 디저트와 함께 커피를 즐길 수 있는 곳</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/meokbang/카페/프룩커피_외관.jpg" alt="프룩커피이미지"
											onclick="location.href='../sogae/sogae_002_mukbang_008.html'">
											<p class="hot_place_title">
												<span class="hp_title">프룩커피</span> <span class="hp_sub">벽돌집
													감성과 개구리 마크 인테리어로 눈을 끄는 사진 잘나오기로 유명한 핫플!</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/meokbang/카페/무화과나무케익.jpg" alt="무화과나무이미지"
											onclick="location.href='../sogae/sogae_002_mukbang_009.html'">
											<p class="hot_place_title">
												<span class="hp_title">무화과나무</span> <span class="hp_sub">수제로
													만든 고퀄리티 케이크와 디저트 가게로 특히 달달한 마카롱과 조각 케잌이 맛있는 곳</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/meokbang/카페/아우터베이크하우스외관.jpg" alt="아우터이미지"
											onclick="location.href='../sogae/sogae_002_mukbang_010.html'">
											<p class="hot_place_title">
												<span class="hp_title">아우터베이크하우스</span> <span class="hp_sub">넓은
													마당에서 존맛 딸기타르트 연인과 함께 사진도 찍고 커피도 마시기 좋은 곳</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/meokbang/카페/소예르커피.jpg" alt="소예르이미지"
											onclick="location.href='../sogae/sogae_002_mukbang_011.html'">
											<p class="hot_place_title">
												<span class="hp_title">소예르</span> <span class="hp_sub">분위기
													좋은 대박 인테리어와 맛있는 커피 그리고 인기많은 딸기케이크!</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/meokbang/카페/트루와지엠.jpg" alt="트루와지엠이미지"
											onclick="location.href='../sogae/sogae_002_mukbang_012.html'">
											<p class="hot_place_title">
												<span class="hp_title">트루와지엠</span> <span class="hp_sub">어서와
													꽁떼잠봉뵈르는 처음이지? 색다른 디저트와 커피 그리고 멋있는 인테리어</span>
											</p></li>
									</ul>
									<div class="swiper-button-next"></div>
									<div class="swiper-button-prev"></div>
								</div>
							</div>

						</div>
					</div>

					<div class="main_tab_menu" id="main_menu03">
						<div class="main_tab_cont">
							<div class="main_cont_top">
								<img src="../doc/숙박지도.png" alt="지도이미지" usemap="#image-map3"
									name="hotel" id="map">
								<map name="image-map3">
									<area target="" alt="글리제977" title=""
										href="../sogae/sogae_002_sukbak_001.html" coords="389,126,34"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/sukbak_mark_01.png', 360,70)">
									<area target="" alt="까망감스테이" title=""
										href="../sogae/sogae_002_sukbak_002.html" coords="350,169,34"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/sukbak_mark_02.png', 320, 120)">
									<area target="" alt="라온캠핑장" title=""
										href="../sogae/sogae_002_sukbak_004.html" coords="400,295,34"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/sukbak_mark_03.png', 370, 240)">
									<area target="" alt="선인장호스텔" title=""
										href="../sogae/sogae_002_sukbak_005.html" coords="167,392,22"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/sukbak_mark_04.png', 130, 350)">
									<area target="" alt="당나귀숲" title=""
										href="../sogae/sogae_002_sukbak_007.html" coords="356,464,22"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/sukbak_mark_05.png', 330, 420)">
									<area target="" alt="호텔드몽드" title=""
										href="../sogae/sogae_002_sukbak_008.html" coords="495,482,22"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/sukbak_mark_06.png', 470, 440)">
									<area target="" alt="담양을담다" title=""
										href="../sogae/sogae_002_sukbak_006.html" coords="386,576,22"
										shape="circle"
										onmouseover="showImage(this, '../img/mark/sukbak_mark_07.png', 360, 540)">
								</map>

							</div>
							<div class="main_cont_bottom">
								<img src="../doc/lodgment_tit.png" alt="숙박"
									onclick="goToPage('#course_3')">
								<p class="check">&check;</p>
								<p class="main_bottom_sub_title" alt="캠핑">캠핑</p>
								<div class="swiper swiper1">
									<ul class="hot_place_info swiper-wrapper">
										<li class="swiper-slide"><img
											src="../img/sukbak/캠핑/라온캠핑장2.jpg" alt="라온캠핑장이미지이미지"
											onclick="location.href='../sogae/sogae_002_sukbak_004.html'">
											<p class="hot_place_title" href="">
												<span class="hp_title">라온캠핑장</span> <span class="hp_sub">조용한
													마을 안에서 이웃과 같이 사는 느낌의 감성 게스트하우스, 분위기 있는 사진 가능!</span>
											</p></li>
									</ul>
									<div class="swiper-button-next"></div>
									<div class="swiper-button-prev"></div>
								</div>
								<p class="check">&check;</p>
								<p class="main_bottom_sub_title" alt="호텔">호텔</p>
								<div class="swiper swiper1">
									<ul class="hot_place_info swiper-wrapper">
										<li class="swiper-slide"><img
											src="../img/sukbak/호텔/호텔드몽드외관.jpg" alt="호텔드몽드이미지"
											onclick="location.href='../sogae/sogae_002_sukbak_08.html'">
											<p class="hot_place_title">
												<span class="hp_title">호텔드몽드</span> <span class="hp_sub">분위기,
													감성 모두 OK 가까운 거리에 메타프로방스와 세콰이어길까지 완벽</span>
											</p></li>
									</ul>
									<div class="swiper-button-next"></div>
									<div class="swiper-button-prev"></div>
								</div>
								<p class="check">&check;</p>
								<p class="main_bottom_sub_title" alt="펜션">펜션</p>
								<div class="swiper swiper1">
									<ul class="hot_place_info swiper-wrapper">
										<li class="swiper-slide"><img
											src="../img/sukbak/펜션/글리제977_외관.jpg" alt="글리제977이미지"
											onclick="location.href='../sogae/sogae_002_sukbak_001.html'">
											<p class="hot_place_title">
												<span class="hp_title">글리제977</span> <span class="hp_sub">산과
													호수에 둘려쌓여 자연을 느낄수 있는 공간, 힐링 테마에 적절한 곳</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/sukbak/펜션/까망감스테이_외관.jpg" alt="까망감스테이이미지"
											onclick="location.href='../sogae/sogae_002_sukbak_002.html'">
											<p class="hot_place_title">
												<span class="hp_title">까망감스테이</span> <span class="hp_sub">추월산에
													둘러 쌓여 넓은 마당과 호수가 있어 편안한 휴식이 가능한 곳</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/sukbak/펜션/소아르호텔외관.jpg" alt="소아르호텔이미지"
											onclick="location.href='../sogae/sogae_002_sukbak_003.html'">
											<p class="hot_place_title">
												<span class="hp_title">소아르호텔</span> <span class="hp_sub">깔끔하고
													세련된 인테리어의 숙소와 카페감성을 모두 챙긴 곳</span>
											</p></li>
									</ul>
									<div class="swiper-button-next"></div>
									<div class="swiper-button-prev"></div>
								</div>
								<p class="check">&check;</p>
								<p class="main_bottom_sub_title" alt="게하">게스트하우스</p>
								<div class="swiper swiper1">
									<ul class="hot_place_info swiper-wrapper">
										<li class="swiper-slide"><img
											src="../img/sukbak/게하/담양을담다외부.jpg" alt="담양을담다이미지"
											onclick="location.href='../sogae/sogae_002_sukbak_006.html'">
											<p class="hot_place_title">
												<span class="hp_title">담양을담다</span> <span class="hp_sub">전원주택
													컨셉의 게스트 하우스, 주요 관광지와 가까워 간단한 여행을 하며 이용하기 좋은 곳</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/sukbak/게하/선인장호스텔외관.jpg" alt="선인장호스텔이미지"
											onclick="location.href='../sogae/sogae_002_sukbak_005.html'">
											<p class="hot_place_title">
												<span class="hp_title">선인장호스텔</span> <span class="hp_sub">야외바베큐를
													즐길 수 있는 게스트하우스, 감성과 숙박을 모두 챙길 수 있는 곳</span>
											</p></li>
										<li class="swiper-slide"><img
											src="../img/sukbak/게하/당나귀숲.jpg" alt="당나귀숲이미지"
											onclick="location.href='../sogae/sogae_002_sukbak_007.html'">
											<p class="hot_place_title">
												<span class="hp_title">당나귀숲</span> <span class="hp_sub">조용한
													마을 안에서 이웃과 같이 사는 느낌의 감성 게스트하우스, 분위기 있는 사진 가능!</span>
											</p></li>
									</ul>
									<div class="swiper-button-next"></div>
									<div class="swiper-button-prev"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="main_event">
						<div class="main_event_calender"
							onclick="location.href='../html/event.html'">
							<img src="../doc/main_event.png" alt="이달의 행사">
							<ul class="event_info">
								<li><span>06.01 ~ 06.30</span>
									<p>일정없음</p></li>
								<li><span>06.01 ~ 06.30</span>
									<p>일정없음</p></li>
								<li><span>06.01 ~ 06.30</span>
									<p>일정없음</p></li>
							</ul>
						</div>
						<div class="naver_search">
							<form action="https://search.naver.com/search.naver"
								target="_new">
								<input name="query" type="text" placeholder="네이버 검색">
								<button type="submit" class="btn_search">
									<img src="../doc/search.png" alt="검색">
								</button>
							</form>
						</div>
						<div class="card"
							onclick="window.open('https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EB%8B%B4%EC%96%91%EB%82%A0%EC%94%A8')">
							<p class="nowtime"></p>
							<h2>담양군</h2>
							<img id="ic" src="" /> <br /> <span id="humidity"></span>
						</div>
						<div class="banner">
							<div class="blog"
								onclick="window.open('https://blog.naver.com/damyanggun')">
								<img src="../doc/블로그.png" alt="블로그이미지">
							</div>
							<div class="instagram"
								onclick="window.open('https://www.instagram.com/damyang.gun/')">
								<img src="../doc/인스타.png" alt="인스타이미지">
							</div>
							<div class="youtube"
								onclick="window.open('https://www.youtube.com/channel/UCFS5qcsGXRQku904_ygBSqw')">
								<img src="../doc/유튜브.png" alt="유튜브이미지">
							</div>
							<div class="damyang_web"
								onclick="window.open('https://www.damyang.go.kr/tour/index.damyang')">
								<img src="../doc/문화관광.png" alt="문환관광이미지">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer"></div>
	</div>
	<link rel="stylesheet"
		href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<script>
    var swiper = new Swiper(".swiper1", {
      slidesPerView: 3,
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      }
    });
  </script>

	<script>
    function showImage(area, imagePath, offsetX, offsetY) {
      // var imageWidth = 200; // 이미지의 가로 크기 (픽셀 단위)
      // var imageHeight = 150; // 이미지의 세로 크기 (픽셀 단위)

      var imageElement = document.createElement('img');
      imageElement.src = imagePath;
      imageElement.style.position = 'fixed';

      // 이미지를 area의 위치에 따라 조정
      var areaRect = area.getBoundingClientRect();
      var imageLeft = areaRect.left + offsetX; // 이미지의 왼쪽 위치
      var imageTop = areaRect.top + offsetY; // 이미지의 상단 위치

      imageElement.style.left = imageLeft + 'px';
      imageElement.style.top = imageTop + 'px';
      // imageElement.style.width = imageWidth + 'px';
      // imageElement.style.height = imageHeight + 'px';
      document.body.appendChild(imageElement);

      area.addEventListener('mouseout', function () {
        imageElement.remove();
      });
    }
  </script>

</body>

</html>