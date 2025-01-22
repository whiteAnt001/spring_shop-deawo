package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.ItemDao;
import dao.UserDao;
import logic.Shop;
import model.Cart;
import model.LoginUser;
import model.User;
import utils.javaScriptUtils;

@Controller
public class EndController {
	@Autowired
	private Shop shop;
	@Autowired
	private UserDao userDao;
	@Autowired
	private ItemDao itemDao;
	
	@RequestMapping(value="/end/end.html")
	public ModelAndView end(HttpSession session, HttpServletResponse response) throws IOException {
		LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
		User user = this.userDao.getUserInfo(loginUser.getId());
		if(loginUser == null) {
			javaScriptUtils.alert(response, "로그인 되어있지 않습니다.");
		}
		Cart cart = (Cart)session.getAttribute("CART");
		if(cart == null || cart.getCodeList().isEmpty()) {
			javaScriptUtils.alert(response, "카트가 비어있습니다.");
		}
		this.shop.checkout(user, cart);
		cart.clearAll();
		this.itemDao.deleteCart(user.getUser_id());
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("BODY", "itemBuyEnd.jsp");
		return mav;
	}
}