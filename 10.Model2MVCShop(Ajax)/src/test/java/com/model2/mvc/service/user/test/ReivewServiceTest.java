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
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data 를 다양하게 Wiring 하자...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })
//@ContextConfiguration(locations = { "classpath:config/context-common.xml" })
public class ReivewServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
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
		review.setEpil("잇힝");
		
		reviewService.updateReview(review);
		
		Review clone = reviewService.getReview1(10011);
		
		Assert.assertEquals("잇힝", clone.getEpil());
		
	}
		

	
	
	
}