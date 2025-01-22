package dao;

import java.util.List;

import admin.OrderModify;
import admin.SalesInfoById;

public interface AdminDao {
	List<OrderModify> getAllOrders();//모든 계정의 주문정보 검색
	void modifyOrderState(OrderModify om);//배송정보 update
	List<SalesInfoById> getCustomerSales(String id);
	//고객 계정으로 매출상세 정보 검색
}
