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
import com.model2.mvc.service.purchase.PurchaseService;
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
public class PurchaseServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	//@Test
	public void testfindpur() throws Exception {
		
		Purchase purchase = new Purchase();
		
		purchase = purchaseService.getPurchase(10021);

		//==> console Ȯ��
		//System.out.println(user);
		
		//==> API Ȯ��
	//	Assert.assersEquals("user07", purchase.getBuyer().getUserId());
		Assert.assertEquals(10012, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("�쳢��", purchase.getDlvyRequest());
		
	}
	
	//@Test
	public void testPurList() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
	 	search.setPageSize(3);
		Map<String, Object> list = purchaseService.getSaleList(search);
		System.out.println("++++++++++++"+list);
		List<Purchase> test = (List<Purchase>)list.get("list");
		System.out.println(test);
		Assert.assertEquals("����",test.get(0).getReceiverName());
		
	}
	
	@Test
	public void testAddPur() throws Exception{
		User aa = new User();
		Product bb = new Product();
		Purchase purchase = new Purchase();
		purchase.setBuyer(aa);
		purchase.setPurchaseProd(bb);
		purchase.getBuyer().setUserId("user03");;
		purchase.getPurchaseProd().setProdNo(10022);
		purchase.setPaymentOption("1");
		purchase.setReceiverName("����");
		purchase.setReceiverPhone("11123");
		purchase.setDlvyAddr("�츮��");
		purchase.setDlvyRequest("����");
		purchase.setDlvyDate("12/05/11");
				
		purchaseService.addPurchase(purchase);
		
		Purchase check = purchaseService.getPurchase2(10022);
		
		Assert.assertEquals("����", check.getReceiverName());
	}
		   
	 //@Test
		public void testUpdatePur() throws Exception{
			User aa = new User();
			Product bb = new Product();
			Purchase purchase = new Purchase();
			purchase.setBuyer(aa);
			purchase.setPurchaseProd(bb);
			
			purchase.setPaymentOption("2");
			purchase.setReceiverName("������");
			purchase.setReceiverPhone("11123");
			purchase.setDlvyAddr("�츮��");
			purchase.setDlvyRequest("����");
			purchase.setDlvyDate("12/05/11");
			purchase.setTranNo(10110);
									
			purchaseService.updatePurcahse(purchase);
			
			Purchase purchase11 = purchaseService.getPurchase(10110);
			
			Assert.assertEquals("2  ", purchase11.getPaymentOption());
		}
		
	//	@Test
				public void testUpdatecode() throws Exception{
			
			Product product = new Product();
		      product.setProdNo(0);
			
					Purchase purchase = new Purchase();
					purchase.setTranCode("2");				
					purchase.setPurchaseProd(product);
					purchase.setTranNo(10049);
															
					purchaseService.updateTranCode(purchase);
					
					Purchase purchase11 = purchaseService.getPurchase(10049);
					
					Assert.assertEquals("2  ", purchase11.getTranCode());
				}
			
	
	
	
}