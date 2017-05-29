package com.model2.mvc.web.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.review.ReviewService;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 Controller
@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	///Field
	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
		
	public ReviewController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping( value="addReview", method=RequestMethod.GET )
	public String addReview(@ModelAttribute("review")Review review, Model model) throws Exception{
	
		int result = reviewService.addReview(review);
		int prodNo =review.getReprod().getProdNo();
		Purchase purchase = purchaseService.getPurchase2(prodNo);
		purchase.setTranCode("4");
		purchaseService.updateTranCode(purchase);
		
		
		model.addAttribute("review",reviewService.getReview1(prodNo));
		model.addAttribute("result",result);
		
		return "redirect:/review/goReview";
	}
	
	@RequestMapping( value="updateTran", method=RequestMethod.GET )
	public String trancode(	@ModelAttribute("prodNo")int prodNo,Model model) throws Exception{
		Product product= productService.getProduct(prodNo);
		if(product.getProTranCode().equals("구매완료")){			
		Purchase purchase = new Purchase();		
		purchase.setPurchaseProd(product);
		purchase.setTranCode("1");
		purchaseService.updateTranCode(purchase);
		model.addAttribute("product",productService.getProduct(prodNo));
		return "forward:/review/updateTran.jsp";
		}else if( product.getProTranCode().equals("배송중")){			
			Purchase purchase = new Purchase();			
			purchase.setPurchaseProd(product);
			purchase.setTranCode("2");
			purchaseService.updateTranCode(purchase);
			model.addAttribute("product",productService.getProduct(prodNo));
			return "forward:/review/updateTran.jsp";
		}else if( product.getProTranCode().equals("배송완료")){
			model.addAttribute("product",productService.getProduct(prodNo));
			return "forward:/review/addReview.jsp";
		}	else if( product.getProTranCode().equals("구매확정")){
			model.addAttribute("review",reviewService.getReview1(prodNo));
			model.addAttribute("product",productService.getProduct(prodNo));
			return "forward:/review/getReview.jsp";
			
		}
		
		return "redirect:../index.jsp";
	}
	
	@RequestMapping( value="goReview", method=RequestMethod.GET )
	public String goreview(@ModelAttribute("prodNo")int prodNo,Model model) throws Exception{
		Product product = productService.getProduct(prodNo);
		model.addAttribute("product",product);
		
		
		if(product.getProTranCode().equals("구매완료")){
			
			return "forward:/review/updateTran.jsp";
		}else{
			return  "forward:/review/updateTran";
		}
		
	}
	
/*	
	@RequestMapping( value="getReview", method=RequestMethod.GET )
	public String getReview( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		Review review = reviewService.getUser(userId);
		// Model 과 View 연결
		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping( value="getJsonUser/{userId}", method=RequestMethod.GET )
	public void getJsonUser(	@PathVariable String userId, 
									 			Model model) throws Exception{
		
		System.out.println("/getJsonUser/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model 과 View 연결
		model.addAttribute("user", user);
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	

	@RequestMapping( value="updateReview", method=RequestMethod.GET )
	public String updateReview( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/user/updateUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model 과 View 연결
		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}*/

}