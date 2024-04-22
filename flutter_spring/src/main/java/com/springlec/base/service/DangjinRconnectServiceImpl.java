package com.springlec.base.service;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Service;

@Service
public class DangjinRconnectServiceImpl implements DangjinRconnectService {

	@Override
	public String DangjinRconnect(String age, String gender, 
			String weight, String height, String alcohol, String fruit,
			String heart, String highBp, String genHlth) throws Exception {
		
		double Weight = Integer.parseInt(weight);
		double Height = Integer.parseInt(height) / 100;
		int Sex = 0;
		int Age = Integer.parseInt(age);
		int AgeResult = 0;
		
		if(gender.equals("female")) {
			Sex = 0;
		} else {
			Sex = 1;
		}
		
		if(Age < 24) {
			AgeResult = 1;
		}else if(Age < 29) {
			AgeResult = 2;
		}else if(Age < 34) {
			AgeResult = 3;
		}else if(Age < 39) {
			AgeResult = 4;
		}else if(Age < 44) {
			AgeResult = 5;
		}else if(Age < 49) {
			AgeResult = 6;
		}else if(Age < 54) {
			AgeResult = 7;
		}else if(Age < 59) {
			AgeResult = 8;
		}else if(Age < 64) {
			AgeResult = 9;
		}else if(Age < 69) {
			AgeResult = 10;
		}else if(Age < 74) {
			AgeResult = 11;
		}else if(Age < 79){
			AgeResult = 12;
		}else {
			AgeResult = 13;
		}
		
		System.out.println(AgeResult);

		double BMI = Weight / (Height * Height);
		int HeartDiseaseorAttack = Integer.parseInt(heart);
		int Fruits = Integer.parseInt(fruit);
		int HvyAlcoholConsump = Integer.parseInt(alcohol);
		int GenHlth = Integer.parseInt(genHlth);
		int HighBP = Integer.parseInt(highBp);

		String result = "";

		RConnection conn;
		conn = new RConnection();
		// " "안에 있는 코드는 R code
		conn.voidEval("library(randomForest)"); // library 불러오기
		// AI 불러오기
		conn.voidEval("rf <- readRDS('/Users/won/DJ-App/R/project_randomForest_1-2.rds')");
		// AI 구동하기
		conn.voidEval("result <- as.character(predict(rf, (list(" + "Age=" + AgeResult + ", Sex=" + Sex + ", BMI=" + BMI
				+ ", HeartDiseaseorAttack=" + HeartDiseaseorAttack + ", Fruits=" + Fruits + ", HvyAlcoholConsump="
				+ HvyAlcoholConsump + ", GenHlth=" + GenHlth + ", HighBP=" + HighBP + "))))");
		// 값을 Java로 넘겨줌 (return)
		result = conn.eval("result").asString();

		return result;
	} // DangjinRconnect End

} // DangjinRconnectServiceImpl End
