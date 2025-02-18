package com.kh.app.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kh.mybatis1.SqlMapConfig;

import jakarta.websocket.Session;

public class BoardDAO {
	
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession session;
	
	public BoardDAO() {
		session = factory.openSession(true);
	}
	
	public List<BoardDTO> getBoardList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		
		List<BoardDTO> boardList = new ArrayList<>();
		boardList = session.selectList("Board1.getBoardList", datas);
		return boardList;
	}

	public int getBoardCnt() {
		return session.selectOne("Board1.getBoardCnt");
	}
	
	public boolean insertBoard(BoardDTO board) {
		boolean result = false;
		if( session.insert("Board1.insertBoard", board )==1) {
			result = true;
		}
		return result;
	}
	
	public BoardDTO getDetail(int boardid) {
		return (BoardDTO)session.selectOne("Board1.getDetail", boardid);
	}

	public int getSeq() {
		return session.selectOne("Board1.getSeq");
	}
	
	
	  public boolean addReply(ReplyDTO reply) { 
		  boolean result = false;
		  if(session.insert("Board1.addReply",reply)==1) { 
			  result = true; 
		  } 
		  return result; 
	  }
	 

	public List<ReplyDTO> getReplys(int boardid) {
		return session.selectList("Board1.getReplys", boardid);
	}

	
	public boolean deleteReply(int commentnum) { 
		boolean result = false;
		
		if(session.delete("Board1.deleteReply", commentnum)==1) { 
	
			result = true; 
		}
	  
		return false; 
	}
	 
	
	public boolean deleteBoard(int boardid) {
		boolean result = false;
		if(session.delete("Board1.deleteBoard", boardid)==1) {
			result = true;
		}
		
		return result;
	}

	
	public boolean updateReply(int commentnum, String content) {
		 boolean result = false; 
		 HashMap<String, Object> datas = new HashMap<>();
		 datas.put("commentnum", commentnum);
		 datas.put("content", content);
	  
		if(session.update("Board1.updateReply",datas) ==1) { 
			  result = true; 
		}
	  
		return result; 
	}

	public boolean updateBoard(int boardid, String title, String content) {
		boolean result = false;
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("boardid", boardid);
		datas.put("title", title);
		datas.put("content", content);
		
		if(session.update("Board1.updateBoard", datas)==1) {
			result = true;
		}
		
		return result;
	}

	public String getPostOwnerId(int boardid) {
		 return session.selectOne("Board1.getPostOwnerId", boardid);
	}

	public String getReplyOwnerId(int commentnum) {
		return session.selectOne("Board1.getReplyOwnerId", commentnum);
	}

	
}
