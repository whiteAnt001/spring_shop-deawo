 package dao;

import java.util.List;

import model.Board;
import model.StartEnd;

public interface BoardDao {
	
	List<Board> getBoardList(StartEnd se);
	List<Board> getBoardByTitle(StartEnd se); //재목으로 게시글 검색
	Integer getBoardCountByTitle(String title); //입력한 title을 갖고있는 게시글의 총 갯수 검색
	Integer totalCount();//전체 게시글의 갯수 리턴
	void updateBoard(Board board);//게시글 변경(제목,내용) 
	void deleteBoard(Integer seq);//게시글 삭제 메서드
	Integer getMaxSeq();//가장 큰 글번호 검색
	void putBoard(Board bbs);//게시글 삽입 메서드
	List<Board> readBoard(Integer pageNo);//게시글 목록 검색
	Board readDetail(Integer seq);//글번호로 게시글 검색
}
