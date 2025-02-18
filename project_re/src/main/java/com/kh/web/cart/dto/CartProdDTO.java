package com.kh.web.cart.dto;

public class CartProdDTO {
    private int CART_NUM;           // CART_NUM
    private int PROD_NUM;           // PROD_NUM
    private int PROD_CNT;           // PROD_CNT
    private int PROD_PRICE;         // PROD_PRICE
    private ProductDTO product;

    // 기본 생성자
    public CartProdDTO() {}

    // 매개변수를 받는 생성자
    public CartProdDTO(int cartNum, int prodNum, int prodCnt, int prodPrice, ProductDTO product) {
        this.CART_NUM = cartNum;
        this.PROD_NUM = prodNum;
        this.PROD_CNT = prodCnt;
        this.PROD_PRICE = prodPrice;
        this.product = product;
    }

    public ProductDTO getProduct() {
      return product;
   }

   public void setProduct(ProductDTO product) {
      this.product = product;
   }

public int getCART_NUM() {
	return CART_NUM;
}

public void setCART_NUM(int cART_NUM) {
	CART_NUM = cART_NUM;
}

public int getPROD_NUM() {
	return PROD_NUM;
}

public void setPROD_NUM(int pROD_NUM) {
	PROD_NUM = pROD_NUM;
}

public int getPROD_CNT() {
	return PROD_CNT;
}

public void setPROD_CNT(int pROD_CNT) {
	PROD_CNT = pROD_CNT;
}

public int getPROD_PRICE() {
	return PROD_PRICE;
}

public void setPROD_PRICE(int pROD_PRICE) {
	PROD_PRICE = pROD_PRICE;
}

   
}
