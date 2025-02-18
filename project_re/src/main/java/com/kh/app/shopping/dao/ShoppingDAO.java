package com.kh.app.shopping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.kh.mybatis.SqlMapConfig;
import com.kh.web.cart.dto.CartChangeDTO;
import com.kh.web.cart.dto.CartProdDTO;
import com.kh.web.cart.dto.ProductDTO;

public class ShoppingDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession session;
	
	public ShoppingDAO() {
		session = factory.openSession(true);
	}
	
	// 6개의 상품 가져오기
    public List<ProductDTO> getProductList() {
        List<ProductDTO> shoppingList = session.selectList("Shopping.getProductList");
        
        return shoppingList;
    }
    
    // 전체 상품 가져오기
    public List<ProductDTO> getAllProductList() {
        List<ProductDTO> shoppingList = session.selectList("Shopping.getAllProductList");
        
        return shoppingList;
    }
    
    // 카테고리별 상품 가져오기
    public List<ProductDTO> getCategoryProductList(String prod_category){
        List<ProductDTO> shoppingCategoryList = session.selectList("Shopping.getCategoryProductList", prod_category);
        
        return shoppingCategoryList;
    }

    // detailview 상품 페이지로 넘어갈때 prod_num값 전달
    public ProductDTO getDetail(int prod_num) {
    	return (ProductDTO)session.selectOne("Shopping.getDetail", prod_num);
    }
    
    // detailview 리뷰 출력을 위한 prod_num값 전달
    public List<ReviewDTO> getReviewList(int prod_num) {
        return session.selectList("Shopping.getReviewList", prod_num);
    }

    // 전체리뷰
	public List<ReviewDTO> getAllReviewList() {
		List<ReviewDTO> reviewAllList = session.selectList("Shopping.getAllReviewList");
        
        return reviewAllList;
	}
	
	// REVIEWID값 자동 시퀀스
	public int getSeq() { return session.selectOne("Shopping.getSeq"); }
	
	// 리뷰
	public boolean addReview(ReviewDTO review) {
		boolean result = false;
		if(session.insert("Shopping.addReview", review) == 1) {
			result = true;
		}
		
		return result;
	}
	public boolean insertReview(ReviewDTO review) {
		boolean result = false;
		if(session.insert("Shopping.insertReview", review) == 1) {
			result = true;
		}
		
		return result;
	}
	
	// REVIEWID number 자동 시퀀스
	/*
	 * public int getSeq() { return session.selectOne("Shopping.getSeq"); }
	 */
	
	
	// SHOPPING_CART, CART_PROD 테이블 CART_NUM, CART_NUM 자동 시퀀스
	public int getShoCartSeq(String userId) {
		return session.selectOne("Shopping.getShoCartSeq",userId); 
	}
	
	public int getShoCartNum(String userId) {
		return session.selectOne("Shopping.getShoCartNum",userId); 
	}

	public boolean addCartNum(String userId) {
		boolean result = false;
		if(session.insert("Shopping.addShoCartNum",userId)==1) {
			result = true;
		}
		return result;
	}
	public boolean insertCart(CartProdDTO cart) {
		boolean result = false;
		if(session.insert("Shopping.insertCart", cart) == 1) {
			result = true;
		}
		
		return result;
	}

}
