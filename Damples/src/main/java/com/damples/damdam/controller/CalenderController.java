package com.damples.damdam.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.damples.damdam.models.ORDER_VO;

public class CalenderController {
	@RequestMapping(value="/po/list.do",method = RequestMethod.GET)
	public String  list(
	        @ModelAttribute("searchVO")  ORDER_VO searchVO ,
	        HttpServletRequest request,
	        @RequestParam(required = false, value = "sYear") String sYear,
	        @RequestParam(required = false, value = "sMonth") String sMonth,
	        ModelMap model ) throws Exception {
	 
	 
	    try{
	 
	        java.util.Calendar cal = java.util.Calendar.getInstance();
	 
	        //현재 년도, 월, 일
	        int nYear = cal.get ( cal.YEAR );
	        int nMonth = cal.get ( cal.MONTH ) + 1 ;
	        int nDate = cal.get ( cal.DATE ) ;
	 
	        int iYear = nYear;
	        int iMonth = nMonth;
	 
	        if(!StringUtils.isEmpty(sYear)) iYear = Integer.parseInt(sYear);
	        if(!StringUtils.isEmpty(sMonth)) iMonth = Integer.parseInt(sMonth);
	 
	        //전월,다음월
	        int preYear = iYear;
	        int preMonth = iMonth - 1;
	        int nextYear = iYear;
	        int nextMonth = iMonth + 1;
	        if(iMonth == 12){
	            nextYear = iYear + 1;
	            nextMonth = 1;
	        }
	 
	        if(iMonth == 1){
	            preYear = iYear - 1;
	            preMonth = 12;
	        }
	 
	        model.addAttribute("iYear",iYear);
	        model.addAttribute("iMonth",iMonth);
	        model.addAttribute("preYear",preYear);
	        model.addAttribute("preMonth",preMonth);
	        model.addAttribute("nextYear",nextYear);
	        model.addAttribute("nextMonth",nextMonth);
	 
	 
	 
	        //공휴일 목록
	        String iMonth2 = String.format("%02d", iMonth);
	 
	        Map<String, String> holidayList = getHolidayList(iYear + iMonth2);
	 
	        model.addAttribute("holidayList",holidayList);
	 
	 
	        //출하일이 해당월인 일정목록
	        searchVO.setPO_DATE(iYear + "-" + iMonth2);
	        //List<ORDER_VO> orderList = gnb01Lnb02Snb02Service.getOrderList(searchVO);
	       // model.addAttribute("orderList",orderList);
	 
	 
	    }catch(Exception e){
	        System.out.println("/po/list.do : " + e.toString());
	    }
	 
	    return "tiles:bsite/po/list";
	 
	}

	private Map<String, String> getHolidayList(String string) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
