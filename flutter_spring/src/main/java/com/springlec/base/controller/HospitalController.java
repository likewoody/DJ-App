package com.springlec.base.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.google.gson.Gson;
import com.springlec.base.model.HospitalDto;
import com.springlec.base.service.HospitalDaoService;

@Controller
public class HospitalController {
	
	@Autowired
	Gson gson;
	@Autowired
	HospitalDaoService service;
	
	@GetMapping("/hospital")
	public ResponseEntity<String> hospital() throws Exception {
		
		System.out.println("hospital 접속");
		
		List<HospitalDto> hospitalDtos = null;
		String hostpitalJson = "";
		
		try {
			hospitalDtos = service.hospitalDaoService();
			hostpitalJson = gson.toJson(hospitalDtos);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.ok(hostpitalJson);
	} // hospital End
	
	@GetMapping("/hospitaltest")
	public ResponseEntity<String> hospitalTest() throws Exception {
		
		System.out.println("hospital 접속");
		
		return ResponseEntity.ok("hospital 접속");
	} // hospitalTest End



} // HospitalController End
