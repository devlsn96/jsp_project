package com.kh.web.order.dto;

public class OrderProdDTO {
	private int orderNum;    // 주문 번호 (FK)
    private int prodNum;     // 상품 번호 (FK)
    private int prodCnt;     // 상품 수량
    private int prodPrice;   // 상품 가격

    // Getters and Setters
    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    public int getProdNum() {
        return prodNum;
    }

    public void setProdNum(int prodNum) {
        this.prodNum = prodNum;
    }

    public int getProdCnt() {
        return prodCnt;
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
