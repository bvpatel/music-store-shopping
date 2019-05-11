package com.ravi.musicstore.service;

import java.util.List;

import com.ravi.musicstore.model.Category;
import com.ravi.musicstore.model.Product;

public interface ProductService {
	
	void getVisited(Long productId);
	
	List<Product> getProductsByMainCategory(String mainCategoryName);
	
	List<Product> getProductsByCategory(Category category);
	
	List<Product> getAllProducts();
	
	Product getProductById(Long productId);
	
	void save(Product product);
	
	void delete(Long productId);
	
	List<Product> sort(List<Product> products, String sortType);
}
