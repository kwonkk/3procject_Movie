package com.movie.mapper;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.movie.domain.dto.MovieDTO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Slf4j
public class MovieMapperTests {
	
	@Autowired
	public MovieMapper movieMapper;
	
//	//영화조회
//	@Test
//	public void selectTest() {
//		
//		MovieDTO movieDTO = movieMapper.select(1);
//		System.out.println("��ȸ ���� : " + movieDTO);
//	}
//	
	//영화추가
//	@Test
//	public void insertTest() {
//		
//		MovieDTO movie = new MovieDTO();
//		
//		movie.setMovieName("테스트제목");
//		movie.setMovieInfo("테스트인포");
//		movie.setMovieRating("7");
//		movie.setMovieType("테스트타입");
//		movie.setMovieRelease("테스트릴리즈");
//		
//		movieMapper.insert(movie);
//	}
	
	@Test
	public void selectTest() {
		
		int movieId = 27;
		
		MovieDTO result = movieMapper.select(movieId);
		System.out.println("==============================");
		System.out.println(result);
		System.out.println("==============================");
		
		
	}
//	
//	@Test
//	public void deleteTest() {
//		
//		
//		movieMapper.delete(62);
//	}

}
