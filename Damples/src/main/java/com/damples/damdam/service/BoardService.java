package com.damples.damdam.service;

import java.util.List;

import org.springframework.ui.Model;

import com.damples.damdam.models.BoardDto;

public interface BoardService {
	
	public List<BoardDto> selectAll();
	
	public List<BoardDto> selectCategory(String Category);

	public int insert(BoardDto boardDto) throws Exception;

	public BoardDto findBySeq(String bseq);

	public int update(BoardDto boardDto) throws Exception;
	
	public int delete(BoardDto boardDto) throws Exception;

	public int viewcountup(BoardDto boardDto);
	
	public int updateImg(BoardDto btDto);
	
	public List<BoardDto> findByContent(String content);
	public List<BoardDto> selectPage(String page);
	public void selectPage(String page, Model model);
	public void selectPage(String page, Model model, String search);

}
