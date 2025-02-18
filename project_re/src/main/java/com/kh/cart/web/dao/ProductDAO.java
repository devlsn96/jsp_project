package com.kh.cart.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.kh.web.cart.dto.ProductDTO; 
import com.kh.mybatis.SqlMapConfig;

import java.util.List;

public class ProductDAO {
    private SqlSessionFactory sqlSessionFactory;

    public ProductDAO() {
        sqlSessionFactory = SqlMapConfig.getFactory();
    }

    public ProductDTO getProductById(int prodNum) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne("ProductMapper.getProductById", prodNum);
        }
    }

    public List<ProductDTO> getAllProducts() {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList("ProductMapper.getAllProducts");
        }
    }
}
