package controller;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.ImageDao;
import model.Imagebbs;
import model.LoginUser;
import model.StartEnd;
import utils.FileValidator;

@Controller
public class ImageController {
	@Autowired
	private FileValidator fileValidator;
	@Autowired
	private ImageDao imageDao;
	
	@RequestMapping(value="/image/imageReplyForm.html")
	public ModelAndView replyform(Integer id, Integer parentid, Integer groupid) {
		ModelAndView mav = new ModelAndView("index");
		Imagebbs imagebbs = this.imageDao.getImageDetail(id);
		imagebbs.setContent(null);
		imagebbs.setW_date(null);
		imagebbs.setImagename(null);
		imagebbs.setGroup_id(groupid);
		imagebbs.setParent_id(parentid);
		
		mav.addObject("title", "RE]"+imagebbs.getTitle()); //답글의 제목 : 원글 제목 앞에 RE]를 붙인다.
		mav.addObject("BODY", "imageWriteForm.jsp"); //form:form
		mav.addObject("bbsimage", imagebbs); //Imagebbs를 주입
		return mav;
	}
	@RequestMapping(value="/image/updateDo.html")
	public ModelAndView updateDo(Imagebbs imagebbs, HttpSession session) {
		ModelAndView mav = new ModelAndView("index");
		if (imagebbs == null) {
		    throw new IllegalArgumentException("Imagebbs object is null");
		}
		MultipartFile multifile = imagebbs.getImage(); //선택한 파일을 불러온다.
		if (multifile == null) {
		    throw new IllegalArgumentException("No file uploaded");
		}
		if(! multifile.getOriginalFilename().equals("")) { //파일이름이 존재하는 경우 (파일 변경)
			String fileName = null;
			String path = null;
			OutputStream os = null;
			fileName = multifile.getOriginalFilename(); //이미지 파일의 이름을 획득
			ServletContext ctx = session.getServletContext();
			path = ctx.getRealPath("/upload/"+fileName);
			System.out.println("변경된 이미지 경로 :" + path);
			try {
				os = new FileOutputStream(path);
				BufferedInputStream bis = new BufferedInputStream(multifile.getInputStream()); //선택한 파일을 연다.
				byte[] buffer = new byte[8156]; //8K크기로 배열 생성
				int read = 0; //실제로 읽은 수 
				while((read = bis.read(buffer)) > 0) { //원본 파일에서 읽은 바이트 수가 0보다 클동안 반복
					os.write(buffer, 0 ,read);
				}
			}catch (Exception e) {
				System.out.println("변경된 이미지 업로드 중 문제발생");
			}finally {
				try {
					if(os != null) {
						os.close();
					}
				}catch(Exception e) {
					
				}
			}//업로드 종료
			imagebbs.setImagename(fileName); //Imagebbs의 파일이름을 새 파일이름으로 변경
		}
		//DB에서 이미지 게시글을 수정한다
		this.imageDao.updateImageBBS(imagebbs);
		mav.addObject("BODY", "imageUpdateResult.jsp");
		return mav;
	}
	@RequestMapping(value="/image/modify.html")
	public ModelAndView modify(Integer id) {
		ModelAndView mav = new ModelAndView("index");
		Imagebbs imagebbs = this.imageDao.getImageDetail(id);
		mav.addObject(imagebbs);
		mav.addObject("BODY", "imageUpdateForm.jsp");
		return mav;
	}
	@RequestMapping(value="/image/deleteDo.html")
	public ModelAndView deleteDo(Imagebbs imagebbs) {
		ModelAndView mav = new ModelAndView("index");
		//글번호로 답글이 존재하는 게시글인지를 검색한다.(Oracle Query)
		int replyCount = this.imageDao.getReplyCount(imagebbs.getW_id());
		if(replyCount > 0) { //답글이 존재하는 경우(삭제불가)
			mav.addObject("BODY", "imageDeleteResult.jsp?R=NO");
		}else { //답글이 없는 경우(삭제가능)
			this.imageDao.deleteImageBBS(imagebbs.getW_id());
			mav.addObject("BODY", "imageDeleteResult.jsp");
		}
		return mav;
		
	}
	@RequestMapping(value="/image/delete.html")
	public ModelAndView delete(Integer id) {
		ModelAndView mav = new ModelAndView("index");
		Imagebbs imagebbs = this.imageDao.getImageDetail(id); //글번호로 이미지 게시글을 조회
		mav.addObject(imagebbs); //조회된 결과를 주입
		mav.addObject("BODY", "imageDeleteForm.jsp");
		return mav;
		
	}
	
	@RequestMapping(value="/image/detail.html")
	public ModelAndView detail(Integer ID, HttpSession session) {
		LoginUser user = (LoginUser)session.getAttribute("loginUser");
		ModelAndView mav = new ModelAndView("index");
		Imagebbs imagebbs = this.imageDao.getImageDetail(ID);
		if(user == null) { //로그인을 안 함
			mav.addObject("BODY", "imageDetail.jsp");
		}else { //로그인을 함
			if(user.getId().equals(imagebbs.getWriter())) { //작성자
				mav.addObject("BODY", "imageDetailOwner.jsp");
			}else { //작성자가 아님
				mav.addObject("BODY", "imageDetailReply.jsp");
			}
		}
		mav.addObject("DETAIL", imagebbs);
		return mav;
	}
	
	@RequestMapping(value="/image/imageList.html")
	public ModelAndView list(Integer PAGE_NUM) {
		int currentPage = 1;
		if(PAGE_NUM != null) {
			currentPage = PAGE_NUM;
		}
		int count = this.imageDao.getTotal();
		int startRow = 0;
		int endRow = 0;
		int totalPageCount = 0;
		if (count > 0) {
			totalPageCount = count / 5;
			if(count % 5 != 0) {
				totalPageCount++;
			}
			startRow = (currentPage - 1) * 5;
			endRow = ((currentPage - 1) * 5) + 6;
			if(endRow > count) {
				endRow = count;
			}
		}
		StartEnd se = new StartEnd();
		se.setStart(startRow);
		se.setEnd(endRow);
		List<Imagebbs> imageList = this.imageDao.imageList(se); //DB에ㅓ 이미지 게시글 5개를 검색	
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("BODY","imageList.jsp");
		mav.addObject("START", startRow);
		mav.addObject("END", endRow);
		mav.addObject("TOTAL", count);
		mav.addObject("currentPage", currentPage);
		mav.addObject("LIST", imageList);
		mav.addObject("pageCount", totalPageCount);
		return mav;
	}
	
	@RequestMapping(value="/image/write.html")
	public ModelAndView write(@Valid @ModelAttribute("bbsimage")Imagebbs imagebbs, BindingResult br, HttpSession session) {
		this.fileValidator.validate(imagebbs, br); //파일 선택 유무를 검사
		ModelAndView mav = new ModelAndView("index");
		if(br.hasErrors()) {
			mav.addObject("BODY", "imageWriteForm.jsp");
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		//이미지 파일 업로드 및, DB에 저장
		MultipartFile multipart = imagebbs.getImage(); //선택한 파일을 넣는다.
		String fileName = null;
		String path = null;
		OutputStream os = null;
		fileName = multipart.getOriginalFilename(); //선택한 파일의 이름을 찾는다.
		ServletContext ctx = session.getServletContext();
		path = ctx.getRealPath("/upload/" + fileName);
		System.out.println("업로드 경로" + path);
		try {
			os = new FileOutputStream(path); //outputstram을 생성한다(파일생성)
			BufferedInputStream bis = new BufferedInputStream(multipart.getInputStream()); //inputStram을 생성한다 = 원본파일을 읽을 수 있도록 한다.
			byte[] buffer = new byte[8156]; // 8k 크기로 배열 생성
			int read = 0; //원본파일에서 일긍ㄴ 바이트 수를 저장할 변수
			while((read = bis.read(buffer)) > 0) { //원본파일에서 읽은 바이트 수가 0이상이라면 반복
				os.write(buffer, 0, read); //생성된 파일에 출력 (원본 파일에서 읽은 바이트를 파일에 출력)
			}
		}catch (Exception e) {
			System.out.println("파일 업로드 중 문제발생");
		}finally {
			try {
				if(os != null) {
					os.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		imagebbs.setImagename(fileName); //업로드 된 파일 이름을 Imagebbs에 설정
		int maxNum = this.imageDao.getMaxWid() + 1; //글번호 생성(현재 존재하는 최대 글번호 + 1)
		if(imagebbs.getParent_id() == null) { //원글인 경우
			imagebbs.setParent_id(0); //부모글 번호를 0으로 설정
			imagebbs.setOrder_no(0); //답글 순서 번호를 0으로 설정
			imagebbs.setGroup_id(maxNum); //그룹번호를 글번호와 동일하게 설정
		}else { //답글인 경우
			this.imageDao.updateOrderNo(imagebbs);
		}
		imagebbs.setW_id(maxNum); //글번호 설정
		LoginUser user = (LoginUser)session.getAttribute("loginUser"); //세션에서 LoginUser를 찾는다.
		imagebbs.setWriter(user.getId()); //작성자의 계정을 저장
		this.imageDao.putImagebbs(imagebbs); //DB에 insert한다.
		mav.addObject("BODY","imageWriteResult.jsp");
		return mav;
	}
	
	@RequestMapping(value="/image/imageWrite.html")
	public ModelAndView writeform() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("bbsimage", new Imagebbs());
		mav.addObject("BODY","imageWriteForm.jsp");
		return mav;
	}
}
