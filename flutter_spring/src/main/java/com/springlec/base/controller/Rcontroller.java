package com.springlec.base.controller;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class Rcontroller {
	
	@GetMapping("connect_r")
	public ResponseEntity<String> connectR(HttpServletRequest request) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	    double sepalLength = Double.parseDouble(request.getParameter("sepalLength"));
	    double sepalWidth = Double.parseDouble(request.getParameter("sepalWidth"));
	    double petalLength = Double.parseDouble(request.getParameter("petalLength"));
	    double petalWidth = Double.parseDouble(request.getParameter("petalWidth"));
	    
	    System.out.println(sepalLength + sepalWidth + petalLength + petalWidth);
	    
	    String result = "";

	    RConnection conn;
		try {
			conn = new RConnection();
			// " "안에 있는 코드는 R code
			conn.voidEval("library(randomForest)"); // library 불러오기
			// AI 불러오기
			conn.voidEval("rf <- readRDS('/Library/Tomcat/webapps/ROOT/Flutter/Rserve/randomForest_iris.rds')");
			// AI 구동하기
			conn.voidEval("result <- as.character(predict(rf, (list(Sepal.Length=" + sepalLength 
					+ ", Sepal.Width=" + sepalWidth 
					+ ", Petal.Length=" + petalLength 
					+ ", Petal.Width=" + petalWidth 
					+ "))))");
			// 값을 Java로 넘겨줌 (return)
			result = conn.eval("result").asString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ResponseEntity.ok(result);	}
	

}
