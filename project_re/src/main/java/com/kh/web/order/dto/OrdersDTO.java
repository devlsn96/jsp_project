package com.kh.web.order.dto;

public class OrdersDTO {
	 private int orderNum;
	    private String userId;
	    private int totalPrice;
	    private int totalProdCnt;
	    private String addrDetail;
	    private String zipCode;
	    private String tel;
	    private String req;
		public int getOrderNum() {
			return orderNum;
		}
		public void setOrderNum(int orderNum) {
			this.orderNum = orderNum;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public int getTotalPrice() {
			return totalPrice;
		}
		public void setTotalPrice(int totalPrice) {
			this.totalPrice = totalPrice;
		}
		public int getTotalProdCnt() {
			return totalProdCnt;
		}
		public void setTotalProdCnt(int totalProdCnt) {
			this.totalProdCnt = totalProdCnt;
		}
		public String getAddrDetail() {
			return addrDetail;
		}
		public void setAddrDetail(String addrDetail) {
			this.addrDetail = addrDetail;
		}
		public String getZipCode() {
			return zipCode;
		}
		public void setZipCode(String zipCode) {
			this.zipCode = zipCode;
		}
		public String getTel() {
			return tel;
		}
		public void setTel(String tel) {
			this.tel = tel;
		}
		public String getReq() {
			return req;
		}
		public void setReq(String req) {
			this.req = req;
		}
}
