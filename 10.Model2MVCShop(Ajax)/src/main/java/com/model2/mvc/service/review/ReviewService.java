package com.model2.mvc.service.review;

import com.model2.mvc.service.domain.Review;

public interface ReviewService {
	
	public int addReview(Review review)throws Exception;
	
	public Review getReview1(int prodNo)throws Exception;
	
	public Review getReview2(String userId)throws Exception;
	
	public void updateReview(Review review)throws Exception;

}
