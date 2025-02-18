package chat.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import board.mybatis.SqlMapConfig;

public class ChatDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession session;
	
	public ChatDAO() {
		session = factory.openSession(true);
	}
	
	public List<ChatDTO> getChatList(String userID){
		List<ChatDTO> chat = new ArrayList<>();
		chat = session.selectList("Chat.getChatList",userID);
		
		return chat;
	}
	
	public boolean insertChat(ChatDTO chat) {
		if(session.insert("Chat.insertChat",chat)==1) {
			return true;
		}
		
		return false;
	}
}
