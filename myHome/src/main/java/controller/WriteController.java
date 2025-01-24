package controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.BoardDao;
import model.Board;
import model.Imagebbs;
import model.LoginUser;
import model.StartEnd;

@Controller
public class WriteController {
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(value="/write/search.html")
	public ModelAndView search(String title, Integer pageNo) {
		int currentPage = 1;
		if(pageNo != null) currentPage = pageNo;
		int count = this.boardDao.getBoardCountByTitle(title);//title을 제목으로 가진 이미지 게시글의 갯수를 검색
		int startRow = 0; int endRow = 0; int totalPageCount = 0;
		if(count > 0) {
			totalPageCount = count / 5;
			if(count % 5 != 0) totalPageCount++;
			startRow = (currentPage - 1) * 5;
			endRow = ((currentPage - 1) * 5) + 6;
			if(endRow > count) endRow = count;
		}
		StartEnd se = new StartEnd(); se.setStart(startRow); se.setEnd(endRow); se.setTitle(title);
		List<Board> boardList = this.boardDao.getBoardByTitle(se);//DB에서 title을 제목으로 가진 이미지 게시글을 5개 검색한다.
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("BODY","boardByTitleResult.jsp");
		mav.addObject("START",startRow); 
		mav.addObject("END", endRow);
		mav.addObject("TOTAL", count);	
		mav.addObject("currentPage",currentPage);
		mav.addObject("BOARD",boardList); 
		mav.addObject("pageCount",totalPageCount);
		mav.addObject("title", title);
		return mav;
	}
	@RequestMapping(value="/write/modify.html")
	public ModelAndView modify(Integer SEQ,String TITLE,String CONTENT,String BTN) {
		if(BTN.equals("수정")) {
			Board bbs = new Board();
			bbs.setSeq(SEQ); bbs.setTitle(TITLE); bbs.setContent(CONTENT);
			this.boardDao.updateBoard(bbs);//글번호의 게시글 변경
		}else if(BTN.equals("삭제")) {
			this.boardDao.deleteBoard(SEQ);//글번호의 게시글 삭제
		}
		//수정 혹은 삭제 작업 후 다시 목록으로 돌아간다.
		ModelAndView mav = new ModelAndView("redirect:/write/read.html");
		return mav;
	}
	
	@RequestMapping(value="/write/detail.html")
	public ModelAndView detail(Integer SEQ) {
		Board bbs = this.boardDao.readDetail(SEQ);//글번호로 게시글 검색
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("BODY","boardDetail.jsp");//검색된 게시글을 출력하는 JSP 이름
		mav.addObject("BOARD", bbs);//JSP에서 검색된 게시글 데이터를 가져갈 때 사용하는 이름
		return mav;
	}
	
	@RequestMapping(value="/write/read.html")
	public ModelAndView read(Integer PAGE_NUM) {
		int currentPage = 1;
		if(PAGE_NUM != null) currentPage = PAGE_NUM;
		int count = this.boardDao.totalCount();//이미지 게시글의 갯수를 검색
		int startRow = 0; int endRow = 0; int totalPageCount = 0;
		if(count > 0) {
			totalPageCount = count / 5;
			if(count % 5 != 0) totalPageCount++;
			startRow = (currentPage - 1) * 5;
			endRow = ((currentPage - 1) * 5) + 6;
			if(endRow > count) endRow = count;
		}
		StartEnd se = new StartEnd(); se.setStart(startRow); se.setEnd(endRow);
		List<Board> boardList = this.boardDao.getBoardList(se);//DB에서 이미지 게시글을 5개 검색한다.
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("BODY","boardList.jsp");
		mav.addObject("START",startRow); 
		mav.addObject("END", endRow);
		mav.addObject("TOTAL", count);	
		mav.addObject("currentPage",currentPage);
		mav.addObject("BOARD",boardList); 
		mav.addObject("pageCount",totalPageCount);
		return mav;
	}
	
	@RequestMapping(value="/write/entryBoard.html")
	public ModelAndView entryBoard(@Valid Board board, BindingResult br,
			HttpSession session) {
		ModelAndView mav = new ModelAndView("index");
		if(br.hasErrors()) {
			mav.addObject("BODY","write_board.jsp");
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		//글번호(자동증가), 작성자(HttpSession에서 가져온다)를 설정한다.
		LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
		board.setId(loginUser.getId());//계정 설정
		this.boardDao.putBoard(board);
		mav.addObject("BODY","writeBoardResult.jsp");
		return mav;
	}
	
	@RequestMapping(value="/write/write.html")
	public ModelAndView input() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject(new Board());
		mav.addObject("BODY","write_board.jsp");
		return mav;
	}
}










