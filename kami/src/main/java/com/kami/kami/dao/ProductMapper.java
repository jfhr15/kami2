package com.kami.kami.dao;

import java.util.ArrayList;

import com.kami.kami.vo.Product;
import com.kami.kami.vo.Productkind;

public interface ProductMapper {
	
	//상품종류 전체목록 출력
	public ArrayList<Productkind> selectproductkind();
	
	//상품종류 등록
	public int insertproductkind(Productkind pk);
	
	//상품종류 삭제
	public int deleteproductkind(Productkind pk);
	
	///////////////////////////////////////////////////////////////////////
	
	//상품 전체출력 및 검색출력 수정필요
	public ArrayList<Product> selectProduct();
	
	//상품등록
	public int insertProduct(Product product);
	
	//상품수정
	public int updateProduct(Product product);
	
	//하나의 상품만 검색
	public Product selectOneProduct(int productseq);
	
	
}
