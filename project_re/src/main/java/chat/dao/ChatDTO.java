package chat.dao;

import oracle.sql.DATE;

public class ChatDTO {
	String userID;
	int messageSequence;
	String message;
	String sendID;
	DATE messageDate;
	
	

	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getMessageSequence() {
		return messageSequence;
	}
	public void setMessageSequence(int messageSequence) {
		this.messageSequence = messageSequence;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getSendID() {
		return sendID;
	}
	public void setSendID(String sendID) {
		this.sendID = sendID;
	}
	public DATE getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(DATE messageDate) {
		this.messageDate = messageDate;
	}
	
	
	
}
