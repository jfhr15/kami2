package com.kami.kami.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kami.kami.vo.Board;



public interface BoardMapper {
	/** 게시글을 조회하는 메서드 
	 * @param map 
	 * @param rb */
	List<Board> select(Map<String, String> map, RowBounds rb);

	/** 게시글 한 개 등록하는 메서드 */
	int insert(Board board);

	/** 게시글 한 개 조회 */
	Board selectOne(int boardseq);
	
	/** 게시글 한 개 삭제 */
	int delete(int boardseq);

	int update(Board board);

	/** 전체 글 개수 조회 
	 * @param map 
	 **/
	int boardCount(Map<String, String> map);
}
