package com.project.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.project.review.model.Review;

@Repository
public interface ReviewDAO {

	public int insertReview(
			@Param("orderItemId") int orderItemId, 
			@Param("userId") int userId, 
			@Param("userName") String userName, 
			@Param("productId") int productId, 
			@Param("content") String content, 
			@Param("point") int point); 
	
	public List<Review> selectReviewByProductId(int productId);
}
