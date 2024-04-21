package com.springlec.base.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.HospitalDao;
import com.springlec.base.model.HospitalDto;

@Service
public class HospitalDaoServiceImpl implements HospitalDaoService {

	@Autowired
	HospitalDao dao;

	@Override
	public List<HospitalDto> hospitalDaoService() throws Exception {
		return dao.hospitalDao();
	}

	@Override
	public List<HospitalDto> hospitalLocationDaoService(String dutyName) throws Exception {
		String dutyNameLike = "%" + dutyName + "%";
		return dao.hospitalLocationDao(dutyNameLike);
	}

}
