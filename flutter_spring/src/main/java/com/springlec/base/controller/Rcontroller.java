package com.springlec.base.controller;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.springlec.base.service.DangjinRconnectService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class Rcontroller {

	@Autowired
	DangjinRconnectService service;

	@GetMapping("connect_r")
	public ResponseEntity<String> connectR(HttpServletRequest request) throws Exception {

		request.setCharacterEncoding("utf-8");

		double sepalLength = Double.parseDouble(request.getParameter("sepalLength"));
		double sepalWidth = Double.parseDouble(request.getParameter("sepalWidth"));
		double petalLength = Double.parseDouble(request.getParameter("petalLength"));
		double petalWidth = Double.parseDouble(request.getParameter("petalWidth"));

		System.out.println(sepalLength + sepalWidth + petalLength + petalWidth);

		String result = "";

		RConnection conn;
		conn = new RConnection();
		// " "안에 있는 코드는 R code
		conn.voidEval("library(randomForest)"); // library 불러오기
		// AI 불러오기
		conn.voidEval("rf <- readRDS('/Library/Tomcat/webapps/ROOT/Flutter/Rserve/randomForest_iris.rds')");
		// AI 구동하기
		conn.voidEval("result <- as.character(predict(rf, (list(Sepal.Length=" + sepalLength + ", Sepal.Width="
				+ sepalWidth + ", Petal.Length=" + petalLength + ", Petal.Width=" + petalWidth + "))))");
		// 값을 Java로 넘겨줌 (return)
		result = conn.eval("result").asString();
		return ResponseEntity.ok(result);
		
	} // connectR Method End

	@GetMapping("/dangjin/r")
	public ResponseEntity<String> dangjinR(HttpServletRequest request) throws Exception {

		request.setCharacterEncoding("utf-8");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String weight = request.getParameter("weight");
		String height = request.getParameter("height");
		String alcohol = request.getParameter("alcohol");
		String fruit = request.getParameter("fruit");
		String heart = request.getParameter("heart");
		String highBp = request.getParameter("highBp");
		String genHlth = request.getParameter("genHlth");
		
		String result = service.DangjinRconnect(age, gender, weight
				, height, alcohol, fruit, heart, highBp, genHlth);
		
		return ResponseEntity.ok(result);
		
	} // dangjinR Method End
	
	@GetMapping("/testpath")
	public void testPath(HttpServletRequest request) throws Exception {
		System.out.println(request.getServletContext().getRealPath("/"));
	}

} // Rcontroller Class End
