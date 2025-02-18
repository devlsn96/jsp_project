package com.kh.cart.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kh.web.cart.dto.CartChangeDTO;
import com.kh.web.cart.dto.CartProdDTO; // 경로 확인
import com.kh.web.cart.dto.JoinProdDTO;
import com.kh.app.board.dao.BoardDTO;
import com.kh.mybatis.SqlMapConfig;

import java.util.ArrayList;
import java.util.List;

public class JoinProdDAO {
    private SqlSessionFactory sqlSessionFactory;

    public JoinProdDAO() {
        sqlSessionFactory = SqlMapConfig.getFactory();
    }

    public List<JoinProdDTO> getCartProducts(int cartNum){
    	try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
    		List<JoinProdDTO> joinprod = new ArrayList<>();
    		
    		joinprod = sqlSession.selectList("Join.getJoinProd",cartNum);
       		return joinprod;
        }
    }
    
    
    
    public void setJoinProd(CartChangeDTO cartnum){
    	try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
    		sqlSession.update("Join.setJoinProd", cartnum);
    		sqlSession.commit();
        }
    }
    
    public void deleteJoinProd(CartChangeDTO cartnum){
    	try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
    		sqlSession.delete("Join.deleteJoinProd", cartnum);
    		sqlSession.commit();
        }
    }
    // 결제 정보 가져오는 메서드 추가
    public List<JoinProdDTO> getCheckoutProducts(int cartNum) {
        System.out.println("Getting checkout products for cartNum: " + cartNum);
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            List<JoinProdDTO> checkoutProducts = sqlSession.selectList("Join.getCheckoutProducts", cartNum);
            System.out.println("checkoutProducts : " + checkoutProducts);
            return checkoutProducts;
        }
    }
    //cartnum 가져오기
    public int getCartNum(String userId){	
    	int cartNum=1;
    	try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
    		cartNum = sqlSession.selectOne("CartMapper.getCartNum", userId);
        }
    	return cartNum;
        
    }
    
    //prodNum에 따른 JoinProd 값 가져오기
    public JoinProdDTO getJoin(int PROD_NUM){	
    	JoinProdDTO jdto = new JoinProdDTO();
    	try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
    		jdto = sqlSession.selectOne("Join.getJoin", PROD_NUM);
        }
    	return jdto;
        
    }
}
