package com.kh.web.order.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.kh.web.order.dto.OrderProdDTO;
import com.kh.mybatis.SqlMapConfig;

public class OrderProdDAO {
    private SqlSessionFactory sqlSessionFactory;

    public OrderProdDAO() {
        sqlSessionFactory = SqlMapConfig.getFactory();
    }

    // 주문 상품 추가
    public void addOrderProd(OrderProdDTO orderProd) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
            sqlSession.insert("com.kh.web.order.dao.OrderProdDAO.addOrderProd", orderProd); // Mapper 경로 확인
        }
    }
}
