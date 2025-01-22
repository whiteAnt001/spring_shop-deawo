package dao;

import java.util.List;

import model.CartItem;

public interface CartDao {
	List<CartItem> selectCart(String id);
	void updateCart(CartItem cartItem);
	void deleteCart(CartItem cartItem);
	void putCart(CartItem cartItem);
	
}
