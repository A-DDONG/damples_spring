package com.damples.damdam.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.damples.damdam.dao.EventDao;
import com.damples.damdam.dao.TourDao;
import com.damples.damdam.models.EventDto;
import com.damples.damdam.models.TourDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {

//   private final TourService tourService;
   private final TourDao tourDao;
   private final EventDao eventDao;
   
   public HomeController(TourDao tourDao, EventDao eventDao) {
      this.tourDao = tourDao;
      this.eventDao = eventDao;
   }

   private void addCommonData(Model model) {
       List<TourDto> tourList = tourDao.selectAll();
       List<EventDto> eventList = eventDao.selectAll();

       // 현재의 날짜를 가져옵니다.
       LocalDate currentDate = LocalDate.now();

       // 현재 날짜 이후의 이벤트만 필터링합니다.
       List<EventDto> upcomingEvents = eventList.stream()
               .filter(event -> {
                   LocalDate eventDate = LocalDate.parse(event.getDate(), DateTimeFormatter.ofPattern("yyyy-MM-dd")); // Use appropriate format
                   return eventDate.isAfter(currentDate) || eventDate.isEqual(currentDate);
               })
               .sorted(Comparator.comparing(EventDto::getDate)) // 날짜에 따라 이벤트를 정렬합니다.
               .limit(3) // 처음 3개의 이벤트만 가져옵니다.
               .collect(Collectors.toList());

       List<TourDto> hotplaceList = new ArrayList<>();
       List<TourDto> meokbangList = new ArrayList<>();
       List<TourDto> accList = new ArrayList<>();
       
       
       for (TourDto tour : tourList) {
           switch (tour.getMain_category()) {
               case "hotplace":
                   // 좌표값이 NULL인 경우 해당 마커를 건너뜁니다.
                   if (tour.getTour_x_coord() == 0 && tour.getTour_y_coord() == 0) {
                       continue;
                   }
                   hotplaceList.add(tour);
                   break;
               case "meokbang":
                   if (tour.getTour_x_coord() == 0 && tour.getTour_y_coord() == 0) {
                       continue;
                   }
                   meokbangList.add(tour);
                   break;
               case "acc":
                   if (tour.getTour_x_coord() == 0 && tour.getTour_y_coord() == 0) {
                       continue;
                   }
                   accList.add(tour);
                   break;
               default:
                   break;
           }
       }
       model.addAttribute("HOTPLACE_LIST", hotplaceList);
       model.addAttribute("MEOKBANG_LIST", meokbangList);
       model.addAttribute("ACC_LIST", accList);
       
       log.debug("핫플 리스트 {} : ",hotplaceList);
       
       // 현재 월의 이벤트 리스트를 모델에 추가합니다.
       model.addAttribute("EVENT_LIST", upcomingEvents);
   }
   
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Model model) {

      addCommonData(model);
       
       return "home";
   }

   @RequestMapping(value = "/info", method=RequestMethod.GET)
   public String info() {
      
      
      return "info";
   }
   
   @RequestMapping(value = "/tourist", method=RequestMethod.GET)
   public String detail_list(Model model) {
      addCommonData(model);
      
      return "detail_list";
   }
   
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detail(String tourCode, Model model) {
        TourDto tourDto = tourDao.selectById(tourCode);
        model.addAttribute("TOUR", tourDto);
        return "detail";
        
    }

}



