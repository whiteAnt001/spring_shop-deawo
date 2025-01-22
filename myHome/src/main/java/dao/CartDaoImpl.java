package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CartItem;
@Repository
public class CartDaoImpl implements CartDao{
	@Autowired
	private SqlSession session;
	public List<CartItem> selectCart(String id) {
		return this.session.selectList("cartMapper.selectCart", id);
	}

	@Override
	public void updateCart(CartItem cartItem) {
		this.session.update("cartMapper.updateCart",  cartItem);
	}

	@Override
	public void deleteCart(CartItem cartItem) {
		this.session.delete("cartMapper.deleteCart", cartItem);
	}

	@Override
	public void putCart(CartItem cartItem) {
		this.session.insert("cartMapper.putCart", cartItem);
	}

}
