package com.model2.mvc.service.review.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.review.ReviewDao;

@Repository("reviewDaoImpl")
public class reviewDaoImpl implements ReviewDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public reviewDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public int addReview(Review review) throws Exception {
		// TODO Auto-generated method stub		
		return sqlSession.insert("ReviewMapper.insertreview",review);
	}

	@Override
	public Review getReview1(int prodNo) throws Exception {
		// TODO Auto-generated method stub		
		return sqlSession.selectOne("ReviewMapper.getprod",prodNo);
	}

	@Override
	public Review getReview2(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ReviewMapper.getuser",userId);
	}

	@Override
	public void updateReview(Review review) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("ReviewMapper.updatereview",review);
	}

}
