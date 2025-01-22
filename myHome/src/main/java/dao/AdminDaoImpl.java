package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import admin.OrderModify;
import admin.SalesInfoById;
@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private SqlSession session;
	
	public List<OrderModify> getAllOrders() {
		return this.session.selectList("adminMapper.getAllOrders");
	}

	public void modifyOrderState(OrderModify om) {
		this.session.update("adminMapper.modifyOrderState",om);
	}

	public List<SalesInfoById> getCustomerSales(String id) {
		return this.session.selectList("adminMapper.getSalesInfoById",id);
	}

}









