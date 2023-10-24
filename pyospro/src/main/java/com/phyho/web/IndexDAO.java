package com.phyho.web;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface IndexDAO {

	List<Map<Object, String>> member();

	List<Map<Object, String>> boardList();

	List<Map<String, Object>> moreList(Integer bno);

	List<Map<String, Object>> preList(Integer bno);

}
