package board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import board.mybatis.SqlMapConfig;


public class BoardDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession session;
	
	public BoardDAO() {
		session = factory.openSession(true);
	}
	
	public List<BoardDTO> getBoardList(int currentPage, int pageSize) {
	    int offset = (currentPage - 1) * pageSize; // Calculate offset for pagination
	    
	    Map<String, Object> params = new HashMap<>();
	    params.put("offset", offset);
	    params.put("pageSize", pageSize);
	    
	    return session.selectList("Board.getBoardList", params);
	}
	
	public int getTotalCount() {
	    return session.selectOne("Board.getTotalCount");
	}

	public BoardDTO getBoardDetail(int boardID) {
		BoardDTO board = new BoardDTO();
		board  = session.selectOne("Board.getBoardDetail", boardID);
			
		return board;
	}
}
