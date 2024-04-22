package com.springlec.base.service;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Service;

@Service
public class DangjinRconnectServiceImpl implements DangjinRconnectService {
	
	@Override
	public String DangjinRconnect() throws Exception {
		
		int Age = 50;
		int Sex = 0;
		int BMI = 35;
		int HeartDiseaseorAttack = 1;
		int Fruits = 0;
		int HvyAlcoholConsump = 1;
		int GenHlth = 1;
		int HighBP = 1;

		String result = "";
		
		RConnection conn;
		conn = new RConnection();
		// " "안에 있는 코드는 R code
		conn.voidEval("library(randomForest)"); // library 불러오기
		// AI 불러오기
		conn.voidEval("rf <- readRDS('/Users/won/DJ-App/R/project_randomForest_1-2.rds')");
		// AI 구동하기
		conn.voidEval("result <- as.character(predict(rf, (list(" + 
				"Age=" + Age + 
				", Sex=" + Sex + 
				", BMI=" + BMI + 
				", HeartDiseaseorAttack=" + HeartDiseaseorAttack + 
				", Fruits=" + Fruits + 
				", HvyAlcoholConsump=" + HvyAlcoholConsump + 
				", GenHlth=" + GenHlth + 
				", HighBP=" + HighBP + 
				"))))");
		// 값을 Java로 넘겨줌 (return)
		result = conn.eval("result").asString();

		return result;
	} // DangjinRconnect End

} // DangjinRconnectServiceImpl End
