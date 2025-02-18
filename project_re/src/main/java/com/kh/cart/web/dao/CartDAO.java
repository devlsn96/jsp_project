package com.kh.cart.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.kh.web.cart.dto.CartDTO; // 경로 확인
import com.kh.mybatis.SqlMapConfig;

public class CartDAO {
    private SqlSessionFactory sqlSessionFactory;

    public CartDAO() {
        sqlSessionFactory = SqlMapConfig.getFactory();
    }

    public void createCart(String userId) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) { // true for auto-commit
            CartDTO cart = new CartDTO();
            cart.setUserId(userId);
            sqlSession.insert("CartMapper.createCart", cart);
        }
    }

    public CartDTO getCartByUserId(int userId) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne("CartMapper.getCartByUserId", userId);
        }
    }

    public void updateCartTotal(int cartNum, int totalQuantity, int totalPrice) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) { // true for auto-commit
            CartDTO cart = new CartDTO();
            cart.setCartNum(cartNum);
            cart.setProdCnt(totalQuantity);
            cart.setProdPrice(totalPrice);
            sqlSession.update("CartMapper.updateCartTotal", cart);
        }
    }
}
