package com.kh.app.shopping.dao;

public class ShoppingCartDTO {
	private int CART_NUM;
	private String USER_ID;
	private int SHOP_CNT;
	private int SHOP_PRICE;
	
	public int getCART_NUM() {
		return CART_NUM;
	}
	public void setCART_NUM(int cART_NUM) {
		CART_NUM = cART_NUM;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public int getSHOP_CNT() {
		return SHOP_CNT;
	}
	public void setSHOP_CNT(int sHOP_CNT) {
		SHOP_CNT = sHOP_CNT;
	}
	public int getSHOP_PRICE() {
		return SHOP_PRICE;
	}
	public void setSHOP_PRICE(int sHOP_PRICE) {
		SHOP_PRICE = sHOP_PRICE;
	}
	

	
}
