package dao;

import model.Sale;

public interface SaleDao { //매출정보 삽입 DAO
	Integer findMaxSaleId(); //주분번호 자동증가 메서드
	void create(Sale sale); //매출정보 삽입 메서드
}
