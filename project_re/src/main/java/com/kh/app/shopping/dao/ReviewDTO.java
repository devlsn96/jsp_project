package com.kh.app.shopping.dao;

import java.sql.Date;

public class ReviewDTO {
	private int REVIEWID;
    private int PROD_NUM;
    private String USER_ID;
    private String REVIEW_CONTENTS;
    private Date REVIEW_DATE;
    private String IMAGES_PATH;
    private double RATING;
    
	public int getREVIEWID() {
		return REVIEWID;
	}
	public void setREVIEWID(int rEVIEWID) {
		REVIEWID = rEVIEWID;
	}
	public int getPROD_NUM() {
		return PROD_NUM;
	}
	public void setPROD_NUM(int pROD_NUM) {
		PROD_NUM = pROD_NUM;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getREVIEW_CONTENTS() {
		return REVIEW_CONTENTS;
	}
	public void setREVIEW_CONTENTS(String rEVIEW_CONTENTS) {
		REVIEW_CONTENTS = rEVIEW_CONTENTS;
	}
	public Date getREVIEW_DATE() {
		return REVIEW_DATE;
	}
	public void setREVIEW_DATE(Date rEVIEW_DATE) {
		REVIEW_DATE = rEVIEW_DATE;
	}
	public String getIMAGES_PATH() {
		return IMAGES_PATH;
	}
	public void setIMAGES_PATH(String iMAGES_PATH) {
		IMAGES_PATH = iMAGES_PATH;
	}
	public double getRATING() {
		return RATING;
	}
	public void setRATING(double rATING) {
		RATING = rATING;
	}
    
	
}
