package controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MyInformaionDao;
import dao.SalesDao;
import model.LoginUser;
import model.User_info;

@Controller
public class MypageController {
	@Autowired
	private MyInformaionDao MyInformaionDao;
	@Autowired
	private SalesDao salesDao;
	@RequestMapping(value="/mypage/history.html")
	public ModelAndView history(HttpSession session) {
		LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
		String id = loginUser.getId(); //계정을 찾는다.
		ModelAndView mav = new ModelAndView("index");
		List<Object[]> salesList = this.salesDao.getSales(id);
		mav.addObject("BODY", "salesHistory.jsp");
		mav.addObject("sales", salesList);
		return mav;
	}
	@RequestMapping(value="/mypage/modify.html")
	public ModelAndView modify(@Valid User_info user_info, BindingResult br) {
		ModelAndView mav = new ModelAndView("index");
		if(br.hasErrors()) {
			mav.addObject("BODY", "myInfo.jsp");
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		this.MyInformaionDao.updateInfomaion(user_info);
		User_info userInfo = this.MyInformaionDao.getUser(user_info.getUser_id());
		mav.addObject("BODY", "myInfoUpdateResult.jsp");
		mav.addObject(userInfo);
		return mav;
	}
	@RequestMapping(value="/mypage/myinfomation.html")
	public ModelAndView mypage(HttpSession session) {
		LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
		ModelAndView mav = new ModelAndView("index");
		User_info mypage = this.MyInformaionDao.getUser(loginUser.getId());
		mav.addObject("BODY", "myInfo.jsp");
		mav.addObject(mypage);
		return mav;
	}
	@RequestMapping(value="/mypage/index.html")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("BODY", "mypage.jsp");
		return mav;
	}
}
