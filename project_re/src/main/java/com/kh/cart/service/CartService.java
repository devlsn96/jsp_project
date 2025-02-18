package com.kh.cart.service;

import java.util.List;
import com.kh.cart.web.dao.CartProdDAO;
import com.kh.web.cart.dto.CartProdDTO;

public class CartService {
    private CartProdDAO cartProdDAO = new CartProdDAO(); // DAO 객체 생성

    // 사용자 장바구니의 상품 목록을 가져오는 메서드
    public List<CartProdDTO> getCartProducts(int cartNum) {
        // 데이터베이스에서 실제 상품 목록 가져오기
        return cartProdDAO.getCartProducts(cartNum);
    }

    // 장바구니에 상품 추가하는 메서드
    public void addProductToCart(int cartNum, int prodNum, int prodCnt, int prodPrice) {
        cartProdDAO.addProductToCart(cartNum, prodNum, prodCnt, prodPrice);
    }

    // 장바구니에서 상품 삭제하는 메서드
    public void removeProductFromCart(int cartNum, int prodNum) {
        cartProdDAO.removeProductFromCart(cartNum, prodNum);
    }
}
