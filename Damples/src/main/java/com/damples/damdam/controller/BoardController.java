package com.damples.damdam.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.damples.damdam.config.QualifierConfig;
import com.damples.damdam.dao.FileDao;
import com.damples.damdam.models.BoardDto;
import com.damples.damdam.models.FileDto;
import com.damples.damdam.service.BoardService;
import com.damples.damdam.service.FileService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/board")
public class BoardController {

	protected final BoardService boardService;
	protected final FileService fileService;

	private final FileDao fileDao;

	public BoardController(BoardService boardService,
		@Qualifier(QualifierConfig.SERVICE.FILE_V2) FileService fileService, FileDao fileDao) {
		this.boardService = boardService;
		this.fileService = fileService;
		this.fileDao = fileDao;
	}

	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET)
	public String home(Model model) {
		List<BoardDto> boardList = boardService.selectAll();
		model.addAttribute("WRITES", boardList);
		return "board/home";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String insert(@ModelAttribute("WRITE") BoardDto boardDto) {
		return "board/write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String insert(
			@ModelAttribute("WRITE") BoardDto boardDto,
			MultipartHttpServletRequest b_images, Model model) {
		try {
			int result = boardService.insert(boardDto);
			if (b_images.getFile("b_images").getSize() > 0) {
				List<FileDto> files = fileService.filesUp(b_images);
				fileDao.insertfile(files, boardDto.getB_seq());
				int ff = boardService.updateImg(boardDto);
			}
			return "redirect:/board";
		} catch (Exception e) {
			e.printStackTrace();
			String message = e.getMessage();
			model.addAttribute("MESSAGE", message);
			return "board/write";
		}

	}

	@RequestMapping(value = "/{b_seq}/detail", method = RequestMethod.GET)
	public String detail(@PathVariable("b_seq") String bseq, BoardDto boardDto, Model model) {
		int result = boardService.viewcountup(boardDto);
		boardDto = boardService.findBySeq(bseq);
		model.addAttribute("WRITE", boardDto);
		List<FileDto> files = fileDao.findByBSeq(boardDto.getB_seq());
		model.addAttribute("FILES", files);
		return "board/detail";
	}

	@RequestMapping(value = "/image_delete", method = RequestMethod.GET)
	public String image_delete(String seq) {

		long seqNum = Long.valueOf(seq);
		FileDto fileDto = fileDao.findByid(seqNum);
		fileService.delete(fileDto.getI_uploadName());
		int result = fileDao.deletefile(seqNum);
		return "redirect:/board/detail?seq=" + fileDto.getI_bseq();
	}

	@RequestMapping(value = "/{b_seq}/update", method = RequestMethod.GET)
	public String update(@PathVariable("b_seq") String bseq, Model model) {
		BoardDto boardDto = boardService.findBySeq(bseq);
		model.addAttribute("WRITE", boardDto);
		model.addAttribute("STATE", "UPDATE");
		return "board/write";
	}

	@RequestMapping(value = "/{b_seq}/update", method = RequestMethod.POST)
	public String update(@PathVariable("b_seq") String bseq,
			MultipartHttpServletRequest b_images, @ModelAttribute("WRITE") BoardDto boardDto, Model model) {
		String fileName = null;
		try {
			int result = boardService.update(boardDto);
			if (b_images.getFile("b_images").getSize() > 0) {
				List<FileDto> files = fileService.filesUp(b_images);
				fileDao.insertfile(files, boardDto.getB_seq());
			}
			return "redirect:/board/{b_seq}/detail";

		} catch (Exception e) {
			e.printStackTrace();
			String message = e.getMessage();
			model.addAttribute("MESSAGE", message);
			return "board/write";
		}
	}

	@RequestMapping(value = "/{b_seq}/delete", method = RequestMethod.GET)
	public String delete(@PathVariable("b_seq") String bseq) {
		return "board/delete";
	}

	@RequestMapping(value = "/{b_seq}/delete", method = RequestMethod.POST)
	public String delete(@PathVariable("b_seq") String bseq, @ModelAttribute("WRITE") BoardDto boardDto, Model model) {
		try {
			int result = boardService.delete(boardDto);
		} catch (Exception e) {
			e.printStackTrace();
			String message = e.getMessage();
			model.addAttribute("MESSAGE", message);
			return "board/delete";
		}
		
		long seqNum = Long.valueOf(bseq);
		FileDto fileDto = fileDao.findByid(seqNum);
		int result = fileDao.deletefile(seqNum);
		
		return "redirect:/board";
	}

	@ModelAttribute("WRITE")
	public BoardDto boardDto() {
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yy.MM.dd HH:mm");
		String strDate = dateFormat.format(date);

		BoardDto boardDto = BoardDto.builder().b_date(strDate).build();

		return boardDto;
	}
	
	@ResponseBody
	@RequestMapping(value = "/name/search", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public List<BoardDto> contentSearch(
			@RequestParam(name = "b_content", required = false, defaultValue = "-1") String content) {

		if (content.equals("-1")) {
			return null;
		}
		List<BoardDto> boardList = boardService.findByContent(content);
		return boardList;
	}

}
