package com.kami.kami.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kami.kami.vo.Board;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSession session;
	
	public List<Board> boardList(String searchItem, String searchWord, int startRecord, int countPerPage) {
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		BoardMapper dao = session.getMapper(BoardMapper.class);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchItem", searchItem);
		map.put("searchWord", searchWord);
		// System.out.println(map);
		List<Board> list = dao.select(map, rb);
		
		return list;
	}

	public int boardRegist(Board board) {
		BoardMapper dao = session.getMapper(BoardMapper.class);
		
		int result = dao.insert(board);
		
		return result;
	}

	public Board boardDetail(int boardseq) {
		BoardMapper dao = session.getMapper(BoardMapper.class);
		Board board = dao.selectOne(boardseq);
		
		return board;
	}

	public int boardDelete(int boardseq) {
		BoardMapper dao = session.getMapper(BoardMapper.class);
		int result = dao.delete(boardseq);
		
		return result;
		
	}

	public Board seletOne(int boardseq) {
		BoardMapper dao = session.getMapper(BoardMapper.class);
		Board board = dao.selectOne(boardseq);
		
		return board;
	}

	public int update(Board board) {
		BoardMapper dao = session.getMapper(BoardMapper.class);
		int result = dao.update(board);
		
		return result;
	}

	public int totalBoardCount(String searchItem, String searchWord) {
		BoardMapper dao = session.getMapper(BoardMapper.class);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchItem", searchItem);
		map.put("searchWord", searchWord);
		
		int boardCount = dao.boardCount(map);
		
		return boardCount;
	}
}
