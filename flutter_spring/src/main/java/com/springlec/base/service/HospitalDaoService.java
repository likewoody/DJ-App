package com.springlec.base.service;

import java.util.List;

import com.springlec.base.model.HospitalDto;

public interface HospitalDaoService {
	
	public List<HospitalDto> hospitalDaoService() throws Exception;
	
	public List<HospitalDto> hospitalLocationDaoService(String dutyName) throws Exception;

}
