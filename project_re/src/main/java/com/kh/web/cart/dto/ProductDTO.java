package com.kh.web.cart.dto;

public class ProductDTO {
	 	private int prod_num;           // PROD_NUM
	    private String prod_category;   // PROD_CATEGORY
	    private String prod_name;       // PROD_NAME
	    private int prod_price;         // PROD_PRICE
	    private String prod_image;
	    
		public int getProd_num() {
			return prod_num;
		}
		public void setProd_num(int prod_num) {
			this.prod_num = prod_num;
		}
		public String getProd_category() {
			return prod_category;
		}
		public void setProd_category(String prod_category) {
			this.prod_category = prod_category;
		}
		public String getProd_name() {
			return prod_name;
		}
		public void setProd_name(String prod_name) {
			this.prod_name = prod_name;
		}
		public int getProd_price() {
			return prod_price;
		}
		public void setProd_price(int prod_price) {
			this.prod_price = prod_price;
		}
		public String getProd_image() {
			return prod_image;
		}
		public void setProd_image(String prod_image) {
			this.prod_image = prod_image;
		}  
	    
	    
}
