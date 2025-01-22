package dao;

import model.LoginUser;
import model.User;

public interface UserDao {
	LoginUser getLoginUser(LoginUser user);//로그인에 사용
	void putUser(User user);//가입자 삽입
	User getUserInfo(String id); //유저 정보
}
