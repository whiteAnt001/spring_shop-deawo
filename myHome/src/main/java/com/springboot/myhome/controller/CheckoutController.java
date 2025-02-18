package com.springboot.myhome.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.myhome.exception.CartEmptyException;
import com.springboot.myhome.exception.LoginRequiredException;
import com.springboot.myhome.model.Cart;
import com.springboot.myhome.model.Item;
import com.springboot.myhome.model.ItemSet;
import com.springboot.myhome.model.LoginUser;
import com.springboot.myhome.model.User;
import com.springboot.myhome.service.ItemService;
import com.springboot.myhome.service.LoginService;
import com.springboot.myhome.service.ShopService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class CheckoutController {
	@Autowired
	private LoginService loginService;
	@Autowired
	private ItemService itemService;
	
	@ExceptionHandler
	public String handleCartEmpty(CartEmptyException ex) {
		return "cartEmpty";//뷰이름
	}
	@ExceptionHandler
	public String handleLoginEmpty(LoginRequiredException ex) {
		return "dummyLogin";//뷰이름
	}
	
	@GetMapping(value="/checkout/checkout.html")
	public ModelAndView checkout(HttpSession session,
			HttpServletResponse response) throws IOException{
		LoginUser user = (LoginUser)session.getAttribute("loginUser");//세션에서 계정을 찾는다.
		ModelAndView mav = new ModelAndView("index");
		if(user == null) {
			//mav.addObject("BODY","loginRequired.jsp");
			throw new LoginRequiredException("로그인 되어있지 않습니다.");
		}//로그인을 하지 않고 계산하러 가기를 누른 경우
		Cart cart = (Cart)session.getAttribute("CART");//세션에서 장바구니를 찾는다.
		if(cart == null || cart.getCodeList().isEmpty()) {
			throw new CartEmptyException("카트가 비어있습니다.");
			//mav.addObject("BODY","cartEmpty.jsp");
		}//장바구니가 없거나 비어있는 상태에서 계산하러 가기를 누른 경우
		//User customer = this.userDao.getUserInfo(user.getId());
		User customer = this.loginService.getUserInfo(user.getId());
		mav.addObject("BODY","checkout.jsp");
		mav.addObject("loginUser",customer);
		List<ItemSet> itemList = new ArrayList<ItemSet>();  
		List<String> codeList = cart.getCodeList();//장바구니에서 상품코드 목록을 가져온다.
		List<Integer> numList = cart.getNumList();//장바구니에서 상품갯수 목록을 가져온다.
		for(int i=0; i < codeList.size(); i++) {
			String code = codeList.get(i);//i번째 상품코드를 가져온다.
			//Item item = this.itemDao.getItem(code);//상품코드로 상품을 찾는다.
			Item item = this.itemService.getItem(code);
			Integer number = numList.get(i);//i번째 상품의 갯수를 가져온다.
			ItemSet is = new ItemSet(item, number);
			itemList.add(is);
		}//상품코드의 갯수만큼 반복
		
		Integer totalAmount = this.shopService.calculateTotal(itemList);//this.shop.calculateTotal(itemList);
		mav.addObject("itemList",itemList);//장바구니에 있는 상품의 목록을 저장
		mav.addObject("totalAmount", totalAmount);//장바구니에 있는 상품의 총액을 저장
		return mav;
	}
	
	@Autowired
	private ShopService shopService;
}










