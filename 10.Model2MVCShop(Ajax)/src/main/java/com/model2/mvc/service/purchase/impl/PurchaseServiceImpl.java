package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;


@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDAO;

	public PurchaseServiceImpl() {	
		System.out.println(this.getClass());
	}

	@Override
	public void addPurchase(Purchase purchase) throws Exception {
		purchaseDAO.insertPurchase(purchase);
	}

	@Override
	public Purchase getPurchase(int tranNo) throws Exception {
		return purchaseDAO.findPurchase(tranNo);
	}

	@Override
	public Purchase getPurchase2(int prodNo) throws Exception {
		return purchaseDAO.findPurchase2(prodNo);
	}

	@Override
	public Map<String,Object> getPurchaseList( String buyerId,Search search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", buyerId);
		map.put("search", search);
		List<Purchase> list= purchaseDAO.getPurchaseList(map);
		int totalCount = purchaseDAO.purchaseListCount(buyerId);
		
		Map<String, Object> map01 = new HashMap<String, Object>();
		map01.put("list", list );
		map01.put("totalCount", new Integer(totalCount));
	
		return map01;
	}

	@Override
	public  Map<String,Object> getSaleList(Search search) throws Exception {
		List<Purchase> list= purchaseDAO.getSaleList(search);
		int totalCount = purchaseDAO.saleListCount();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
	
		return map;
	}

	@Override
	public void updatePurcahse(Purchase purchase) throws Exception {
		purchaseDAO.updatePurchase(purchase);
	}

	@Override
	public void updateTranCode(Purchase purchase) throws Exception {
		purchaseDAO.updateTranCode(purchase);
	}

}
