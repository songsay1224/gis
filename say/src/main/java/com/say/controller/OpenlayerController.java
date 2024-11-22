package com.say.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.say.service.OpenlayerService;

@Controller
public class OpenlayerController {
	
	@Autowired
	private OpenlayerService oservice;
	
	
	
	 @GetMapping("/search2.do") public String
	  searchOpenlayers2(@RequestParam("query") String query, Model model) { // 결과리스트 초기화남양주 
		  List<Map<String, Object>> uniqueResults = new ArrayList<>();
	  
	  if (query != null && !query.trim().isEmpty()) { // 검색 결과 가져오기
	  List<Map<String, Object>> searchResults = oservice.getZone(query); // 수정된 부분
	  
	  // X와 Y 좌표 기준으로 중복 제거 
	  Set<String> uniqueCoordinates = new HashSet<>(); for
	  (Map<String, Object> result : searchResults) { String coordinateKey =
	  result.get("X") + "," + result.get("Y"); if
	  (uniqueCoordinates.add(coordinateKey)) { uniqueResults.add(result); } }
	  
	  // 검색 결과를 시스템 로그로 출력 
	  System.out.println("검색 결과 개수: " + uniqueResults.size());
	  for (Map<String, Object> item : uniqueResults) {
	  System.out.println("좌표: { \"x\": " + item.get("X") + ", \"y\": " +
	  item.get("Y") + " }"); } }
	  
	  // 결과를 모델에 추가 
	  model.addAttribute("list", uniqueResults);
	  System.out.println("검색어: " + query); 
	  
	  return "gis/open"; }
}
