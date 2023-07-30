document.addEventListener("DOMContentLoaded", () => {
  const navTabs = document.querySelectorAll(".nav li");
  const mapDivs = document.querySelectorAll(".main.map");
  const tourCategories = document.querySelectorAll(".tour-category");

  // 네비게이션 탭을 클릭했을 때 실행할 함수
  function handleTabClick(event) {
    const selectedMap = this.getAttribute("data-map");

    // 모든 탭과 지도에서 active 클래스 제거
    navTabs.forEach((tab) => {
      tab.classList.remove("active");
    });
    mapDivs.forEach((mapDiv) => {
      mapDiv.classList.remove("active");
    });
    tourCategories.forEach((category) => {
      category.classList.remove("active");
    });

    // 선택된 탭과 지도에 active 클래스 추가
    this.classList.add("active");
    const selectedMapDiv = document.getElementById(selectedMap + "-map");
    if (selectedMapDiv) {
      selectedMapDiv.classList.add("active");
    }

    // 선택된 항목들과 동일한 카테고리를 가진 서브 항목에 active 클래스 추가
    const selectedCategory = this.getAttribute("data-map");
    tourCategories.forEach((category) => {
      if (category.getAttribute("data-category") === selectedCategory) {
        category.classList.add("active");
      }
    });
  }

  // 각 탭에 클릭 이벤트 리스너 추가
  navTabs.forEach((tab) => {
    tab.addEventListener("click", handleTabClick);
  });
});
document.addEventListener("DOMContentLoaded", () => {
  const infoBox = document.querySelector(".info-box");
  let infoBoxOpen = false; // 정보박스가 열려있는지를 확인하기 위한 변수

  // // 클릭 이벤트 리스너 추가: 정보박스를 닫기 위해 infoBox 요소를 클릭하면 닫힘
  // infoBox.addEventListener("click", (event) => {
  //     event.stopPropagation(); // 정보박스를 클릭했을 때 상세페이지로 이동하지 않도록 이벤트 전파 중지
  // });

  document.addEventListener("click", (e) => {
    if (infoBoxOpen) {
      infoBox.style.display = "none";
      infoBoxOpen = false;
    }
  });

  // 각 장소 마커를 선택하는 클래스
  const placeMarkers = document.querySelectorAll(".place-marker");

  // 클릭 이벤트 리스너 추가
  placeMarkers.forEach((placeMarker) => {
    placeMarker.addEventListener("click", handlePlaceClick);
  });

  // 장소 마커 클릭 시 실행할 함수
  function handlePlaceClick(event) {
    const placeName = this.getAttribute("data-place");
    const placeCategory = this.getAttribute("data-category");
    const placeAddress = this.getAttribute("data-address");
    const tourCode = this.getAttribute("data-tour-code");
    const tourImageCode = this.getAttribute("data-image-code");

    // 정보박스에 장소 정보 표시
    infoBox.innerHTML = `
                <h3>${placeName}</h3>
                <p>${tourImageCode}</p>
                <p>주소: ${placeAddress}</p>
                <!-- 여기서 서버로 해당 tourCode를 전달하여 필요한 데이터를 가져오는 로직을 추가하면 됩니다. -->
            `;

    // 정보박스의 위치 설정 (마커의 오른쪽에 오게 조정)
    const markerRect = this.getBoundingClientRect();
    const scrollY = window.scrollY || window.pageYOffset;
    const infoBoxRightOffset = 15; // 정보박스를 오른쪽으로 10px 이동

    // 마커의 오른쪽에 정보박스를 배치하되, 스크롤의 위치에 따라 위치를 조정
    infoBox.style.display = "block";
    infoBox.style.top = `${markerRect.top + scrollY}px`;
    infoBox.style.left = `${markerRect.right + infoBoxRightOffset}px`;

    // 정보박스가 열려있는지 확인하고, 열려있으면 닫도록 처리
    if (infoBoxOpen) {
      infoBox.style.display = "none";
      infoBoxOpen = false;
    } else {
      infoBoxOpen = true;
    }

    // 이벤트 전파를 중지하여 document의 클릭 이벤트가 실행되지 않도록 합니다.
    event.stopPropagation();
  }

  // 지도 영역과 기존 지도 관련 스크립트가 이곳에 들어갑니다.
  // ...

  // 다른 내용들...
  // ...
});
