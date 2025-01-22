package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.JavaScriptUtils;

import dao.ItemDao;
import dao.UserDao;
import logic.Shop;
import model.Cart;
import model.Item;
import model.ItemSet;
import model.LoginUser;
import model.User;
import utils.javaScriptUtils;



@Controller
public class CheckoutController {
	@Autowired
	private Shop shop;
	@Autowired
	private UserDao userDao;
	@Autowired
	private ItemDao itemDao;
	
	@RequestMapping(value="/checkout/checkout.html")
	public ModelAndView checkout(HttpSession session, HttpServletResponse response) throws IOException {
		LoginUser user = (LoginUser)session.getAttribute("loginUser");
		ModelAndView mav = new ModelAndView("index");
		if(user == null) {//로그인 되어있지 않은 경우
			mav.addObject("BODY", "loginRequired.jsp");
		}
		//장바구니가 비어있는 상태에서 계산하러가기를 누른 경우
		Cart cart = (Cart)session.getAttribute("CART"); //세션에서 장바구니를 찾는다.
		if(cart == null || cart.getCodeList().isEmpty()) { //카트 codeList가 비어있는경우 (카트에 아이템이 없는 경우)
			javaScriptUtils.alert(response, "카트가 비어있습니다.");
		}
		User customer = this.userDao.getUserInfo(user.getId());
		mav.addObject("BODY", "checkout.jsp");
		mav.addObject("loginUser", customer);
		List<ItemSet> itemList = new ArrayList<ItemSet>();
		List<String> codeList = cart.getCodeList(); //장바구니에서 상품코드 목록을 가져옴
		List<Integer> numList = cart.getNumList(); //장바구니에서 상품갯수 목록을 가져옴
		for(int i = 0; i < codeList.size(); i++) {
			String code = codeList.get(i); //i번째 상품코드를 가져온다.
			Item item = this.itemDao.getItem(code); //i번째 상품코드로 상품을 찾는다.
			Integer number = numList.get(i); //i번째 상품의 갯수를 가져온다
			ItemSet is = new ItemSet(item, number); //상품과 갯수를 저장
			itemList.add(is); // itemList에 담는다.
		}
		
		Integer totalAmount = this.shop.calculateTotal(itemList);
		mav.addObject("itemList",itemList);
		mav.addObject("totalAmount", totalAmount);
		return mav;
	}
}
