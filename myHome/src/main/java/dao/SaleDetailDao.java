package dao;

import model.SaleDetail;

public interface SaleDetailDao { //매출 상세정보 테이블에 삽입
	void create(SaleDetail detail); //상세정보 삽입
}
