package com.kh.web.order.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.kh.web.order.dto.OrdersDTO;
import com.kh.mybatis.SqlMapConfig;

public class OrdersDAO {
    private SqlSessionFactory sqlSessionFactory;

    public OrdersDAO() {
        sqlSessionFactory = SqlMapConfig.getFactory(); // MyBatis 세션 팩토리 설정
    }

    // 주문 조회
    public OrdersDTO getOrder(int orderNum) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne("com.kh.web.order.dao.OrdersDAO.getOrder", orderNum); // namespace 추가
        }
    }

    // 주문 추가
    public void insertOrder(OrdersDTO order) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
            sqlSession.insert("com.kh.web.order.dao.OrdersDAO.insertOrder", order); // namespace 추가
        }
    }

 // 주문 저장 후 생성된 주문 번호 반환
    public int saveOrder(OrdersDTO order) {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            session.insert("com.kh.web.order.dao.OrdersDAO.insertOrder", order); // Mapper 경로와 동일하게 설정
            return order.getOrderNum(); // 생성된 주문 번호 반환
        }
    }
}
