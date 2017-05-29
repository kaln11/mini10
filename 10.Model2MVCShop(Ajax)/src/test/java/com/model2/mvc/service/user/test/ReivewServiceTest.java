package com.model2.mvc.service.user.test;


import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.review.ReviewDao;
import com.model2.mvc.service.review.ReviewService;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;


/*
 *	FileName :  UserServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data �� �پ��ϰ� Wiring ����...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })
//@ContextConfiguration(locations = { "classpath:config/context-common.xml" })
public class ReivewServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;

	//@Test
	public void testaddre() throws Exception {
		
		User user = new User();
		Product product = new Product();
		
		user.setUserId("user08");
		product.setProdNo(10011);
		
		Review review = new Review();
		
		review.setReid(user);
		review.setReprod(product);
		review.setScore(3);
		review.setEpil("notbad");
		
		int result = reviewService.addReview(review);
		
		Assert.assertEquals(1, result);
		
	}
	
	//@Test
	public void getprod() throws Exception{
		
		Review review = reviewService.getReview1(10012);
		
		Assert.assertEquals(2, review.getReNo());
		
	}
	
	//@Test
	public void getuser() throws Exception{
		
		Review review = reviewService.getReview2("user08");
		
		Assert.assertEquals(3, review.getReNo());
		
	}
	
	@Test
	public void update() throws Exception{
		Product product = new Product();
		product.setProdNo(10011);
Review review = new Review();
review.setReprod(product);
		review.setScore(4);
		review.setEpil("����");
		
		reviewService.updateReview(review);
		
		Review clone = reviewService.getReview1(10011);
		
		Assert.assertEquals("����", clone.getEpil());
		
	}
		

	
	
	
}