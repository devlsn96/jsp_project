package com.kh.web.cart.dto;

public class CartDTO {
	 private int cartNum;           // CART_NUM
	    private String userId;           // USER_ID
	    private int prodCnt;           // PROD_CNT (장바구니에 담긴 총 상품 수량)
	    private int prodPrice;         // PROD_PRICE (총 가격)
		public int getCartNum() {
			return cartNum;
		}
		public void setCartNum(int cartNum) {
			this.cartNum = cartNum;
		}

		public int getProdCnt() {
			return prodCnt;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public void setProdCnt(int prodCnt) {
			this.prodCnt = prodCnt;
		}
		public int getProdPrice() {
			return prodPrice;
		}
		public void setProdPrice(int prodPrice) {
			this.prodPrice = prodPrice;
		}
}
