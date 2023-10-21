package com.phyho.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.Getter;

@Controller
public class IndexController {

	@Autowired
	private IndexService indexService;

	@GetMapping("index")
	public String index() {

		return "index";
	}
	
	@GetMapping("map")
	public String map() {

		return "map";
	}
	
	@GetMapping("test")
	public String test() {

		return "test";
	}
	
	@GetMapping("default")
	public String testtest(Model model) {
		List<Map<Object, String>> list = indexService.member();
		//System.out.println(list);
		model.addAttribute("list", list);
		return "default";
	}

	@GetMapping("members")
	public String members(Model model) {
		List<Map<Object, String>> list = indexService.member();
		//System.out.println(list);
		model.addAttribute("list", list);
		return "members";
	}
	
	@GetMapping("/")
	public String boardList(Model model) {
		List<Map<Object, String>> boardList = indexService.boardList();
		//System.out.println(list);
		model.addAttribute("list", boardList);
		return "board";
	}
	
}
