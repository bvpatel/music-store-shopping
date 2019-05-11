package com.ravi.musicstore.repository;

import java.util.List;

import com.ravi.musicstore.model.Category;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface CategoryRepository extends CrudRepository<Category, Long>{
	
	List<Category> findAllByMainCategoryName(String mainCategoryName);
	
	List<Category> findAllBySubCategoryName(String subCategoryName);
	
	@Query(value = "SELECT DISTINCT sub_category_name from category" , nativeQuery = true)
	List<String> findAllSubCategoryName();
	
	@Query(value = "SELECT DISTINCT main_category_name from category" , nativeQuery = true)
	List<String> findAllMainCategoryName();
}
