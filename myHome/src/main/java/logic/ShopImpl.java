	package logic;
	
	import java.sql.Timestamp;
	import java.util.Calendar;
	import java.util.List;
	
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Service;
	
	import dao.ItemDao;
	import dao.SaleDao;
	import dao.SaleDetailDao;
	import model.Cart;
	import model.Item;
	import model.ItemSet;
	import model.Sale;
	import model.SaleDetail;
	import model.User;
	
	@Service
	 public class ShopImpl implements Shop {
	    @Autowired
	    private SaleDao saleDao;
	    @Autowired
	    private SaleDetailDao saleDetailDao;
	    @Autowired
	    private ItemDao itemDao;
	
	    @Override
	    public Integer calculateTotal(List<ItemSet> itemList) {
	        int totalAmount = 0; // 총액이 저장될 변수 선언
	        for (ItemSet itemSet : itemList) {
	            int price = itemSet.getItem().getPrice(); // 상품의 가격을 추출
	            int quantity = itemSet.getQuantity(); // 상품의 갯수를 추출
	            totalAmount += price * quantity; // 총합을 계산
	        }
	        return totalAmount;
	    }
	
		@Override
	    public void checkout(User user, Cart cart) {
	       Sale sale = createSale(user, cart); // Sale을 생성하고 Sale 안에 SaleDetail을 추가
	        entrySale(sale); // Sale과 SaleDetail 저장
	    }
	
	    private Sale createSale(User user, Cart cart) {
	        Sale sale = new Sale();
	        sale.setSaleId(getNewSaleId());
	        sale.setUser(user); // 구매자 설정
	        sale.setUserId(user.getUser_id()); // 구매자 계정 설정
	        Timestamp currentTime = getCurrentTime();
	        sale.setSaleTime(currentTime);
	        //List<ItemSet> itemList = new ArrayList<ItemSet>();
	        List<String> codeList = cart.getCodeList(); //장바구니에서 상품코드 목록을 가져온다.
	        List<Integer> numList = cart.getNumList(); //장바구니에서 상품갯수 목록을 가져온다.
	        for (int i = 0; i < codeList.size(); i++) {
	        	String code = codeList.get(i); //i번째 상품코드를 가져온다.
	        	Item item = this.itemDao.getItem(code); //code에 있는 상품번호로 상품을 찾는다.
	        	Integer number = numList.get(i); //i번째 상품 번호를 가져온다.
	        	ItemSet itemSet = new ItemSet(item, number);
	            int saleDetailId = i + 1;
	            SaleDetail saleDetail = createSaleDetail(sale, saleDetailId, itemSet, currentTime);
	            sale.addSaleDetail(saleDetail);
	            System.out.println(saleDetailId);
	        } // 모든 상품이 처리될 때까지 반복
	        return sale;
	   }
	
	    private SaleDetail createSaleDetail(Sale sale, int saleDetailId, ItemSet itemSet, Timestamp currentTime) {
	        return new SaleDetail(sale, saleDetailId, itemSet, currentTime);
	   }
	
	    private Timestamp getCurrentTime() {
	        return new Timestamp(Calendar.getInstance().getTimeInMillis());
	    }
	
	    private Integer getNewSaleId() {
	        Integer id = this.saleDao.findMaxSaleId() + 1;// 매출번호 생성
	        return id;
	    }
	
	    private void entrySale(Sale sale) {
	        this.saleDao.create(sale);
	        List<SaleDetail> saleDetailList = sale.getsaleDetailList();
	        for (SaleDetail saleDetail : saleDetailList) {
	            this.saleDetailDao.create(saleDetail); // saleDetail로 변수명 수정
	        }
	    }
	}
