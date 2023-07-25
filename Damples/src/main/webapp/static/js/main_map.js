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

    // 각 장소 마커를 선택하는 클래스
    const placeMarkers = document.querySelectorAll(".place-marker");

    // 클릭 이벤트 리스너 추가
    placeMarkers.forEach((placeMarker) => {
        placeMarker.addEventListener("click", handlePlaceClick);
    });

    // 장소 마커 클릭 시 실행할 함수
    function handlePlaceClick(event) {
        // 클릭된 장소의 정보를 가져옴
        const placeName = "서울대공원";
        const placeCategory = "공원";
        const placeAddress = "서울특별시 관악구 난향동";

        // 정보박스에 장소 정보 표시
        infoBox.innerHTML = `
            <h3>${placeName}</h3>
            <p>분류: ${placeCategory}</p>
            <p>주소: ${placeAddress}</p>
            <p>서울대공원은 서울시 관악구에 위치한 대규모 공원으로 자연과 문화를 즐길 수 있는 장소입니다. 특히 봄에는 벚꽃 축제가 열리며 많은 사람들이 찾는 명소입니다.</p>
            <!-- 상세페이지로 이동하지 않도록 링크를 제거합니다. -->
        `;

        // 정보박스의 위치 설정 (마커의 오른쪽으로 배치, 크기 축소)
        const markerRect = this.getBoundingClientRect();
        infoBox.style.display = "block";
        infoBox.style.top = `${markerRect.top}px`;
        infoBox.style.left = `${markerRect.right + 10}px`; // 오른쪽으로 10px 이동

        // 정보박스가 열려있는지 확인하고, 열려있으면 닫도록 처리
        if (infoBoxOpen) {
            infoBox.style.display = "none";
            infoBoxOpen = false;
        } else {
            infoBoxOpen = true;
        }
    }

    // 지도 영역과 기존 지도 관련 스크립트가 이곳에 들어갑니다.
    // ...

    // 다른 내용들...
    // ...
});














  
  
  
  
  
  

