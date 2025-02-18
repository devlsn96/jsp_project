package com.kh.app.board.dao;

public class BoardDTO {
	private int boardid;
	private String title;
	private String content;
	private String userid;
	private int boardtype;
	private int BOARDSEQ;
	
	public int getBOARDSEQ() {
		return BOARDSEQ;
	}

	public void setBOARDSEQ(int bOARDSEQ) {
		BOARDSEQ = bOARDSEQ;
	}

	public int getBoardid() {
		return boardid;
	}

	public void setBoardid(int boardid) {
		this.boardid = boardid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getBoardtype() {
		return boardtype;
	}

	public void setBoardtype(int boardtype) {
		this.boardtype = boardtype;
	}
	
	
}
