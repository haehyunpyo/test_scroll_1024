package com.phyho.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IndexService {

	@Autowired
	private IndexDAO indexDao;

	public List<Map<Object, String>> member() {
		return indexDao.member();
	}

	public List<Map<Object, String>> boardList() {
		return indexDao.boardList();
	}
}
