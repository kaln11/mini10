package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

@Controller
@RequestMapping("/Purchase/*")
public class PurchaseController {
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public PurchaseController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addPurchase")
	public String AddPurchase(@ModelAttribute("purchase")Purchase purchase,Model model) throws Exception {
		
		purchaseService.addPurchase(purchase);
		model.addAttribute("purchase",purchaseService.getPurchase2(purchase.getPurchaseProd().getProdNo()));
		model.addAttribute("product",productService.getProduct(purchase.getPurchaseProd().getProdNo()));
		return "forward:/purchase/getPurchase.jsp";
	}
	
	@RequestMapping(value="addPurchaseView")
	public String AddPurchaseView(@RequestParam("prodNo")int prodNo,@RequestParam("userId")String userId,Model model)throws Exception{
		
		User user = userService.getUser(userId);
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product",product);		
		model.addAttribute("user",user);
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	@RequestMapping(value="getPurchase")
	public String GetPurchaseAction(@RequestParam("tranNo")int tranNo,Model model)throws Exception{
		
		Purchase clone = purchaseService.getPurchase(tranNo);
		model.addAttribute("purchase",clone);
		model.addAttribute("product",clone.getPurchaseProd().getProdNo());
		
		return "forward:/purchase/getPurchase.jsp";
	}
	
	@RequestMapping( value="getJsonPurchase/{tranNo}", method=RequestMethod.GET )
	public void GetPurchaseJSON(	@PathVariable int tranNo, 
									 			Model model) throws Exception{
		
		model.addAttribute("purchase",purchaseService.getPurchase(tranNo));
	}
	
	@RequestMapping( value="listPurchase" )
	public String listPurchase( @ModelAttribute("search") Search search ,@RequestParam("userId") String buyerId, Model model , HttpServletRequest request) throws Exception{
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=purchaseService.getPurchaseList(buyerId, search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/purchase/listPurchase.jsp";
	}
	
	@RequestMapping( value="listSale" )
	public String listSale( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=purchaseService.getSaleList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/purchase/listPurchase.jsp";
	}
	
	@RequestMapping( value="updatePurchaseView" )
	public String UpdatePurchaseView( @RequestParam("tranNo")int tranNo , Model model , HttpServletRequest request) throws Exception{
		
		Purchase clone = purchaseService.getPurchase(tranNo);
		model.addAttribute("purchase",clone);
		model.addAttribute("product",productService.getProduct(clone.getPurchaseProd().getProdNo()));
		
		
		return "forward:/purchase/updatePurchaseView.jsp";
	}
	
	@RequestMapping( value="updatePurchase" )
	public String UpdatePurchase( @ModelAttribute("purchase")Purchase purchase,Model model) throws Exception{
		
		purchaseService.updatePurcahse(purchase);
		model.addAttribute("purchase",purchaseService.getPurchase2(purchase.getPurchaseProd().getProdNo()));
		model.addAttribute("product",productService.getProduct(purchase.getPurchaseProd().getProdNo()));
		return "forward:/purchase/getPurchase.jsp";
	}
	
	@RequestMapping( value="updateTranCode" )
	public String UpdateTranCode( @RequestParam("tranNo")int tranNo) throws Exception{
		
		Purchase purchase = new Purchase();
		Product product = new Product();
		User user = new User();
		purchase.setPurchaseProd(product);
		purchase.setBuyer(user);
		purchase = purchaseService.getPurchase(tranNo);
		purchase.setTranCode("1");
		
		purchaseService.updatePurcahse(purchase);
		
		return "redirect:/Product/listProduct?menu=search";
	}
	
	@RequestMapping( value="updateTranCodeByProd" )
	public String UpdateTranCodeByProd( @RequestParam("prodNo")int prodNo) throws Exception{
		
		Purchase purchase = new Purchase();
		Product product = new Product();
		User user = new User();
		purchase.setPurchaseProd(product);
		purchase.setBuyer(user);
		purchase = purchaseService.getPurchase2(prodNo);
		purchase.setTranCode("1");
		
		purchaseService.updateTranCode(purchase);
		
		return "redirect:/Product/listProduct?menu=manage";
	}

}
