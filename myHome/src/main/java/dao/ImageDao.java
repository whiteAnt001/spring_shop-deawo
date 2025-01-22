package dao;

import java.util.List;

import model.Imagebbs;
import model.StartEnd;

public interface ImageDao {
	Integer getMaxWid(); //가장 큰 이미지 게시글 번호 검색
	void putImagebbs(Imagebbs bbs); //이미지 게시글 insert
	List<Imagebbs> imageList(StartEnd se);
	Integer getTotal(); //이미지 게시글의 글 갯수 검색
	Imagebbs getImageDetail(Integer id); //글번호로 이미지를 검색
	Integer getReplyCount(Integer id); //답글 갯수 검색
	void updateImageBBS(Imagebbs bbs); //Imagebbs로 게시글 수정
	void deleteImageBBS(Integer id); //글번호로 게시글 삭제
	void updateOrderNo(Imagebbs bbs); //답글의 순서번호를 수정
}
