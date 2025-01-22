package dao;

import model.User_info;

public interface MyInformaionDao {
	User_info getUser(String id); //계정으로 정보 조회
	void updateInfomaion(User_info user);
}
