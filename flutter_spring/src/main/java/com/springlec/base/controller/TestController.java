package com.springlec.base.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.google.gson.Gson;
import com.springlec.base.model.TestDto;
import com.springlec.base.service.TestDaoService;

@Controller
public class TestController {
	
	@Autowired
	Gson gson;
	@Autowired
	TestDaoService service;
	
	@GetMapping("/test")
	public ResponseEntity<String> test(Model model) throws Exception {
		
		List<TestDto> testDtos = null;
		String testJson = "";
		
		try {
			testDtos = service.testDao();
			testJson = gson.toJson(testDtos);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.ok(testJson);
	} // test End
	
	
	
} // TestController End
