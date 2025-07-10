package com.smhrd.web.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.smhrd.web.dao.BoardDAO;
import com.smhrd.web.entity.Board;

// ~~Application (main method 가지고있는 파일) 
// 하위 패키지로 해당하는 파일들을 생성

// FC가 업무를 지시하는 역할을 하는 일반 자바클래스(POJO)
// --> 해당하는 파일을 통해서만, jsp or html문서를 화면에 띄울 수 있다.
@Controller 
//--> Spring Container가 해당하는 파일을 scan할 수 있게끔 해주는 annotation
// annotation은 선언구문보다 위쪽에 작성하는 것이 원칙이다.
public class BoardController {

	// Spring boot는 RequestMapping을 선호하지 않는다! 
	// 정확한 전송방식을 지정하는 것을 권장
	@GetMapping("/")
	public String board(Model model) {
		// Model -> request 경량화 버전
		// 내가 직접 생성할 필요없이, 매개변수로 받아오면 알아서 container 전달 
		
		// 1. DAO 생성 
		BoardDAO dao = new BoardDAO();
		// 2. DAO 사용
		List<Board> boardList = dao.selectBoard();
		// 3. 결과를 받아와서, request 영역에 데이터를 바인딩 
		model.addAttribute("boardList", boardList);
		return "board";
		// --> 이동해야할 페이지를 리턴 
		// ViewResolver 논리적인 주소값을 물리적인 주소값으로 변환
		// 내가 설정한 prefix + board + suffix 
		// * forward 방식으로 이동 : 요청 1번, 응답 1번 
		// --> 초기 요청 url이 변하지 않고, 요청 객체가 다음 페이지까지 유효하다.
		// * redirect 방식 : 요청 2번, 응답 2번 
		
	}
	
	
	
	
	
}







