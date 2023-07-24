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
