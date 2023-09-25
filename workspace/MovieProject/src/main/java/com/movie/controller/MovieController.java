package com.movie.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MovieController {
	

	@GetMapping("/main")
	public void GETMainPage() {
		
		log.info("메인 페이지 진입");
	}

}