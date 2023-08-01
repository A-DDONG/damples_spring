package com.callor.dample.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.callor.dample.model.BoardDto;
import com.callor.dample.model.PageDto;
import com.callor.dample.persistance.BoardDao;
import com.callor.dample.persistance.FileDao;
import com.callor.dample.service.BoardService;

@Service
public class BoardServiceImplV1 implements BoardService {

	protected final BoardDao boardDao;
	protected final FileDao fileDao;

	public BoardServiceImplV1(BoardDao boardDao, FileDao fileDao) {
		this.boardDao = boardDao;
		this.fileDao = fileDao;
	}

	@Override
	public List<BoardDto> selectAll() {
		return boardDao.selectAll();
	}

	@Override
	public int insert(BoardDto boardDto) throws Exception {
		if (boardDto.getB_title().isBlank() || boardDto.getB_content().isBlank() || boardDto.getB_nickname().isBlank()
				|| boardDto.getB_password().isBlank()) {
			throw new Exception("NO");
		}
		return boardDao.insert(boardDto);
	}

	@Override
	public BoardDto findBySeq(String bseq) {
		// TODO Auto-generated method stub
		return boardDao.findBySeq(bseq);
	}

	@Override
	public int update(BoardDto boardDto) throws Exception {
		String getpw = boardDto.getB_password();
		long bseq = boardDto.getB_seq();
		if (boardDto.getB_title().isBlank() || boardDto.getB_content().isBlank() || boardDto.getB_nickname().isBlank()
				|| boardDto.getB_password().isBlank()) {
			throw new Exception("NO");
		}
		if (getpw == "") {
			throw new Exception("NONE");
		} else if (!boardDao.findPW(bseq).getB_password().equals(getpw)) {
			throw new Exception("PASS_WORD");
		}
		return boardDao.update(boardDto);

	}

	@Override
	public int viewcountup(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return boardDao.countup(boardDto);
	}

	@Override
	public int delete(BoardDto boardDto) throws Exception {
		String getpw = boardDto.getB_password();
		long bseq = boardDto.getB_seq();

		if (getpw == "") {
			throw new Exception("NONE");
		} else if (!boardDao.findPW(bseq).getB_password().equals(getpw)) {
			throw new Exception("PASS_WORD");
		}
		return boardDao.delete(boardDto);
	}

	@Override
	public List<BoardDto> selectCategory(String Category) {
		// TODO Auto-generated method stub
		return boardDao.selectCategory(Category);
	}

	@Override
	public int updateImg(BoardDto btDto) {
		String originName = fileDao.findByBseq(btDto.getB_seq()).getI_uploadName();
		btDto.setB_image(originName);

		return boardDao.updateImg(btDto);

	}
	
	public List<BoardDto> findByContent(String content) {
		return boardDao.findByContent(content.trim());
	}

	@Override
	public List<BoardDto> selectPage(String page) {
		try {

			int intPageNum = Integer.valueOf(page);
			// intPageNum = (intPageNum - 1) * 10;
			intPageNum = --intPageNum * 10;

			int intLimit = 10;
			return boardDao.selectPage(intLimit, intPageNum);

		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void selectPage(String page, Model model) {
		int totalCount = boardDao.selectCount();
		int intPageNum = Integer.valueOf(page);
		PageDto pageDto = PageDto.builder().pageNum(intPageNum).totalCount(totalCount).build();

		int offSetCount = (intPageNum - 1) * pageDto.getLimitCount();
		List<BoardDto> boards = boardDao.selectPage(pageDto.getLimitCount(), pageDto.getOffSetNum());

		model.addAttribute("WRITES", boards);
		model.addAttribute("PAGINATION", pageDto);

	}

	@Override
	public void selectPage(String page, Model model, String search) {
		String[] searchs = search.split(" ");

		List<String> searchList = Arrays.asList(searchs);

		int totalCount = boardDao.selectSearchCount(searchList);

		int intPageNum = Integer.valueOf(page);

		PageDto pageDto = PageDto.builder()
				.pageNum(intPageNum)
				.totalCount(totalCount).build();

		List<BoardDto> boards = boardDao.selectSearchPage(
			pageDto.getLimitCount(),
			pageDto.getOffSetNum(), searchList);

		model.addAttribute("WRITES", boards);
		model.addAttribute("PAGINATION", pageDto);

	}

}
