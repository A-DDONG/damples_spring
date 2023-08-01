package com.callor.dample.controller;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.callor.dample.config.QualifierConfig;
import com.callor.dample.model.BoardDto;
import com.callor.dample.model.FileDto;
import com.callor.dample.persistance.FileDao;
import com.callor.dample.service.BoardService;
import com.callor.dample.service.FileService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/news")
public class NewsController {


	protected final BoardService boardService;
	protected final FileService fileService;

	private final FileDao fileDao;

	
	public NewsController(BoardService boardService, 
			@Qualifier(QualifierConfig.SERVICE.FILE_V2)	FileService fileService, FileDao fileDao) {
		this.boardService = boardService;
		this.fileService = fileService;
		this.fileDao = fileDao;
	}

	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET)
	public String home(FileDto fileDto, BoardDto boardDto, Model model) {
		List<BoardDto> boardList = boardService.selectCategory("소식");
		model.addAttribute("WRITES", boardList);
		return "news/home";
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
			return "redirect:/news";
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
		return "news/detail";
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
			return "redirect:/news/{b_seq}/detail";

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
		
		return "redirect:/news";
	}

	@ModelAttribute("WRITE")
	public BoardDto boardDto() {
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yy.MM.dd HH:mm");
		String strDate = dateFormat.format(date);

		BoardDto boardDto = BoardDto.builder().b_date(strDate).build();

		return boardDto;
	}
}
