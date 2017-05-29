package com.model2.mvc.web.product;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
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
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default;

import sun.management.jmxremote.ConnectorBootstrap.DefaultValues;

@Controller
@RequestMapping("/Product/*")
public class ProductController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public ProductController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
			
	@RequestMapping(value="addProduct",method=RequestMethod.POST)
	   public String addProduct(@ModelAttribute("product")Product product
	                    ,HttpSession session,Model model
	                     ) throws Exception{
		//파일경로를 가져와서 경로 때고 확장자 포함해서 파일이름으로 String저장
		Path p = Paths.get(product.getFileName());
		String refileName = p.getFileName().toString();
		
		//저장할곳 설정
		String target = "C:\\workspace\\10.Model2MVCShop(Ajax)\\WebContent\\images\\uploadFiles\\"
				+refileName;
		//가져올곳 설정
		File sourceFile = new File(product.getFileName());
		
		FileInputStream inputStream =null;
		FileOutputStream outputStream = null;
		FileChannel fcin = null;
		FileChannel fcout = null;
		
	
		
		inputStream = new FileInputStream(sourceFile);
		outputStream = new FileOutputStream(target);
		
		fcin = inputStream.getChannel();
		fcout = outputStream.getChannel();
		
		long size = fcin.size();
		fcin.transferTo(0, size, fcout);
		
			
		fcout.close();
			
		fcin.close();
			
		outputStream.close();
			
		inputStream.close();	
	      
			product.setFileName(refileName);
	      productService.addProduct(product);
	      model.addAttribute("product",product);
		return "forward:/Product/listProduct?menu=manage";
	}	
	
	@RequestMapping(value="listProduct")
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/Product/listProduct");		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
						
		return "forward:/product/listProduct.jsp";
	}
	
	@RequestMapping(value="regProduct")
	public String regProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/Product/listProduct");		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.getRegList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
						
		return "forward:../Index1.jsp";
	}
	
	@RequestMapping(value="regJSON")
	public void regJSON( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/Product/listProduct");		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.getRegList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
	}
	
	@RequestMapping(value="getProduct")
	   public String getProduct(@RequestParam("prodNo")int prodNo
	                     ,Model model,@RequestParam("menu")String menu
	                     ) throws Exception{
	      model.addAttribute("product",productService.getProduct(prodNo));
	      
	      if(menu.equals("manage")){
	    	  System.out.println("forward:/product/addProductView.jsp");
	    	  return "forward:/product/addProductView.jsp";
	       }
	    
	    	  return "forward:/product/getProduct.jsp";
	      
	   }
	
	@RequestMapping( value="getJsonProduct/{prodNo}", method=RequestMethod.GET )
	public void getProductJSON(	@PathVariable int prodNo, 
									 			Model model) throws Exception{
		
		 model.addAttribute("product",productService.getProduct(prodNo));
	}
	
	@RequestMapping(value="updateProduct")
	   public String updateProduct(@ModelAttribute("product")Product product ,Model model,@RequestParam("menu")String menu
	       ,HttpSession session              ) throws Exception{
  
		if(product.getFileName()==null || product.getFileName().length() < 1){
			Product clone = new Product();
			clone = productService.getProduct(product.getProdNo());
			product.setFileName(clone.getFileName());
		}else{
			
			Path p = Paths.get(product.getFileName());
			String refileName = p.getFileName().toString();
			
			//저장할곳 설정
			String target = "C:\\workspace\\10.Model2MVCShop(Ajax)\\WebContent\\images\\uploadFiles\\"
					+refileName;
			//가져올곳 설정
			File sourceFile = new File(product.getFileName());
			
			FileInputStream inputStream =null;
			FileOutputStream outputStream = null;
			FileChannel fcin = null;
			FileChannel fcout = null;
			
		
			
			inputStream = new FileInputStream(sourceFile);
			outputStream = new FileOutputStream(target);
			
			fcin = inputStream.getChannel();
			fcout = outputStream.getChannel();
			
			long size = fcin.size();
			fcin.transferTo(0, size, fcout);
			
				
			fcout.close();
				
			fcin.close();
				
			outputStream.close();
				
			inputStream.close();	
		      
				product.setFileName(refileName);
			
		}
		
	    productService.updateProduct(product);
	    model.addAttribute("product",productService.getProduct(product.getProdNo()));
	    model.addAttribute("menu",menu);
	    return "forward:/product/getProduct.jsp";
	   }

}
