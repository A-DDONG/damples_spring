document.addEventListener("DOMContentLoaded", () => {
  // 스크롤이란 클래스를 top_button 변수에 담음
  const top_button = document.querySelector(".scroll");
  // top버튼 누르면 위로 올라감
  top_button.addEventListener("click", () => {
    window.scroll({
      top: 0,
      left: 0,
      behavior: "smooth",
    });
  });

  // 스크롤을 상단으로 하면 버튼이 숨겨지고 하단으로 내려가면 버튼이 생긴다.
  window.addEventListener("scroll", function () {
    console.log(window.scrollY);
    if (window.scrollY <= 200) {
      top_button.style.display = "none";
    } else {
      top_button.style.display = "block";
    }
  });
});
