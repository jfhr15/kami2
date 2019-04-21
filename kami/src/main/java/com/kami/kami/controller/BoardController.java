package com.kami.kami.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kami.kami.dao.BoardDAO;
import com.kami.kami.util.PageNavigator;
import com.kami.kami.vo.Board;

@Controller
public class BoardController {

	@Autowired
	BoardDAO dao;
	
	@RequestMapping(value = "/goBoard", method = RequestMethod.GET)
	public String goBoard(
			@RequestParam(value="searchItem",  defaultValue="title" ) String searchItem, 
			@RequestParam(value="searchWord",  defaultValue="" ) String searchWord, 
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			Model model) {
		
		// DB 접속 코드 
				int totalRecoundCount = dao.totalBoardCount(searchItem, searchWord);   // search한것의 전체 게시글 수  
				PageNavigator navi = new PageNavigator(currentPage, totalRecoundCount);
				List<Board> boardList = dao.boardList(searchItem, searchWord, navi.getStartRecord(), navi.getCountPerPage());
			
				model.addAttribute("boardList", boardList);
				model.addAttribute("navi", navi);
				model.addAttribute("searchWord", searchWord);
				model.addAttribute("searchItem", searchItem);
		
		
		return "board/board";
	}
	
	
	@RequestMapping(value="/boardDetail", method=RequestMethod.GET)
	public String boardDetail(int boardseq, Model model) {
		
		Board board = dao.boardDetail(boardseq);
		

		model.addAttribute("board", board);

		return "board/boardDetail";
	}
	
	@RequestMapping(value="/goBoardRegist", method=RequestMethod.GET)
	public String goBoardRegist(HttpSession session) {
		
		return "board/boardRegist";
	}
	
	@RequestMapping(value="/boardRegist", method=RequestMethod.POST)
	public String boardRegist(HttpSession session, Board board) {
		board.setId((String)session.getAttribute("loginId"));
		
		dao.boardRegist(board);
		
		return "board/board";
	}
}
