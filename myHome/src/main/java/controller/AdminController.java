package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import admin.OrderModify;
import admin.SalesInfoById;
import dao.AdminDao;

@Controller
public class AdminController {
	@Autowired
	private AdminDao adminDao;
	
	@RequestMapping(value="/admin/deliverylist.html")
	public ModelAndView orderlist() {
		ModelAndView mav = new ModelAndView("index");
		List<OrderModify> allOrders = this.adminDao.getAllOrders();
		mav.addObject("BODY","allOrderList.jsp");
		mav.addObject("allOrders",allOrders);
		return mav;
	}
	
	@RequestMapping(value="/admin/deliverymenu.html")
	public ModelAndView menu() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("BODY","deliveryMenu.jsp");
		return mav;
	}
	
	@RequestMapping(value="/admin/orderModify.html")
	public ModelAndView modify(String user_id, Integer sale_id,
									Integer sale_detail_id, Integer state) {
		OrderModify om = new OrderModify();
		om.setUser_id(user_id); om.setSale_id(sale_id); om.setState(state);
		om.setSale_detail_id(sale_detail_id);
		this.adminDao.modifyOrderState(om);//고객의 배송정보 update
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("BODY","orderModifyResult.jsp");
		mav.addObject("user_id",user_id);
		return mav;
	}
	
	@RequestMapping(value="/admin/order.html")
	public ModelAndView order(String ID) {
		ModelAndView mav = new ModelAndView("index");
		List<SalesInfoById> salesList = this.adminDao.getCustomerSales(ID);
		mav.addObject("BODY","customerOrderList.jsp");
		mav.addObject("salesList",salesList);
		return mav;
	}
	
	@RequestMapping(value="/admin/delivery.html")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("BODY","findCustomer.jsp");//주문 고객 정보 검색 JSP
		return mav;
	}
}


