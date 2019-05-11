package com.ravi.musicstore.repository;

import java.util.List;

import com.ravi.musicstore.model.Product;
import com.ravi.musicstore.model.ProductComment;
import org.springframework.data.repository.CrudRepository;

public interface ProductCommentRepository extends CrudRepository<ProductComment, Long>{
	List<ProductComment> findByProduct(Product product);
}
