package com.springlec.base.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springlec.base.dao.TestDao;
import com.springlec.base.model.TestDto;

@Service
public class TestDaoServiceImpl implements TestDaoService {
	
	@Autowired
	TestDao dao;

	@Override
	public List<TestDto> testDao() throws Exception {
		return dao.testDao();
	}

}
