package com.model2.mvc.service.review.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.review.ReviewDao;
import com.model2.mvc.service.review.ReviewService;

@Service("reviewServiceImpl")
public class reviewServiceImpl implements ReviewService{

	
	@Autowired
	@Qualifier("reviewDaoImpl")
	private ReviewDao reviewDAO;
	
	public reviewServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public int addReview(Review review) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.addReview(review);
	}

	@Override
	public Review getReview1(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.getReview1(prodNo);
	}

	@Override
	public Review getReview2(String userId) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.getReview2(userId);
	}

	@Override
	public void updateReview(Review review) throws Exception {
		// TODO Auto-generated method stub
		reviewDAO.updateReview(review);
	}

}
