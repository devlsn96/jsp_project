package com.kh.cart.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.kh.web.cart.dto.CartProdDTO; // 경로 확인
import com.kh.mybatis.SqlMapConfig;

import java.util.List;

public class CartProdDAO {
    private SqlSessionFactory sqlSessionFactory;

    public CartProdDAO() {
        sqlSessionFactory = SqlMapConfig.getFactory();
    }

    public void addProductToCart(int cartNum, int prodNum, int prodCnt, int prodPrice) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) { // true for auto-commit
            CartProdDTO cartProd = new CartProdDTO();
            cartProd.setCART_NUM(cartNum);
            cartProd.setPROD_NUM(prodNum);
            cartProd.setPROD_CNT(prodCnt);
            cartProd.setPROD_PRICE(prodPrice);
            
            if(!getProductToCart(cartProd)) {
            	sqlSession.update("CartProdMapper.updateProductToCart", cartProd);
            }else {
            	sqlSession.insert("CartProdMapper.addProductToCart", cartProd);
            }
        }
    }
    
    public boolean getProductToCart(CartProdDTO cdto) {
    	boolean check = false;
    	try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) { // true for auto-commit
    		if(sqlSession.selectOne("CartProdMapper.getCartprodNum", cdto)==null) {
    			check=true;
    		}
        }
    	return check;
    }

    public List<CartProdDTO> getCartProducts(int cartNum) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList("CartProdMapper.getCartProducts", cartNum);
        }
    }

    public void removeProductFromCart(int cartNum, int prodNum) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) { // true for auto-commit
        	CartProdDTO cartProd = new CartProdDTO(cartNum, prodNum, 0, 0, null); // 수량과 가격은 0으로 설정
            sqlSession.delete("CartProdMapper.removeProductFromCart", cartProd);
            
        }
    }
}
