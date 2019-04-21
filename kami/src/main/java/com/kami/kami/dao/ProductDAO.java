package com.kami.kami.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kami.kami.vo.Product;
import com.kami.kami.vo.Productkind;

@Repository
public class ProductDAO {

	@Autowired
	SqlSession session;
	
	//상품종류 전체목록 출력
	public ArrayList<Productkind> selectproductkind(){
		 ArrayList<Productkind> pList = new ArrayList<Productkind>();
		 ProductMapper mapper = session.getMapper(ProductMapper.class);
			try {
				pList = mapper.selectproductkind();
			} catch (Exception e) {
				e.printStackTrace();
				return pList;
			}
			return pList;
	}
	
	
	//상품종류 등록
	public int insertproductkind(Productkind pk) {
		int result = 0;
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		try {
			result = mapper.insertproductkind(pk);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	//상품종류 삭제
	public int deleteproductkind(Productkind pk) {
		int result = 0;
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		try {
			result = mapper.deleteproductkind(pk);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	

	///////////////////////////////////////////////////////////////////////
	
	//상품 전체출력 및 검색출력 수정필요
	public ArrayList<Product> selectProduct() {
		 ArrayList<Product> pList = new ArrayList<Product>();
		 ProductMapper mapper = session.getMapper(ProductMapper.class);
			try {
				pList = mapper.selectProduct();
			} catch (Exception e) {
				e.printStackTrace();
				return pList;
			}
			return pList;
	}
	
	//상품등록
	public int insertProduct(Product product) {
		int result = 0;
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		try {
			result = mapper.insertProduct(product);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	//상품수정
	public int updateProduct(Product product) {
		int result = 0;
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		try {
			result = mapper.updateProduct(product);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	//하나의 상품만 검색
	public Product selectOneProduct(int productseq) {
		Product product = new Product();
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		try {
			product = mapper.selectOneProduct(productseq);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return product;
	}
	
	
}
