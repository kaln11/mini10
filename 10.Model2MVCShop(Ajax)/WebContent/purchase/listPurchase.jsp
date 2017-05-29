<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
        .table > tbody > tr > td {
     vertical-align: middle;
}

.overlay
{
padding-left:5px;
position: absolute;
margin-left: 3px;
margin-top: 15px;
}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			var role = $('#role').val();
			$("#currentPage").val(currentPage)
			if(role == 'admin'){
			$("form").attr("method" , "POST").attr("action" , "/Purchase/listSale").submit();
		}else{
			$("form").attr("method" , "POST").attr("action" , "/Purchase/listPurchase?userId=${sessionScope.user.userId}").submit();
		}
		}
		
				
		//============= userId 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
			 
			 $(  "td:nth-child(4) > div" ).click(function() {
					
					if($(this).text() != '판매중'){
						
						var url="/review/goReview?prodNo="+$(this).next().val();
					
						 $(self.location).attr("href",url);  
					}
				});
			 
			 $(  "td:nth-child(1) > span" ).hover(function() {

					var prodNo = $(this).next().val();
					
					$.ajax( 
							{
								url : "/Product/getJsonProduct/"+prodNo ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {

									var displayValue = "<h6>"
																+"상품번호 : "+JSONData.product.prodNo+"<br/>"
																+"제품명 : "+JSONData.product.prodName+"<br/>"
																+"가격 : "+JSONData.product.price+"<br/>"
																+"제작년도 : "+JSONData.product.manuDate+"<br/>"
																+"등록일 : "+JSONData.product.regDate+"<br/>"
																+"상품상태 : "+"<span>"+JSONData.product.proTranCode
																+"</span]>"
																+"</h6>";
																
																
									$("h6").remove();
									$(this).val(prodNo);
									$( "#span"+prodNo+"" ).html(displayValue);
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					
			});
		});	
		
		
		//============= userId 에 회원정보보기  Event  처리 (double Click)=============
		 $(function() {
			 						
			        $("td:nth-child(5)").on("click","h6 span",function() {
			        	
			           if($(this).text()=='구매확정'){
			        	   alert($(this).text());
			           };
			        });
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		
			$(  "td:nth-child(5) > i" ).click(function() {

					var prodNo = $(this).next().val();
					
					$.ajax( 
							{
								url : "/Product/getJsonProduct/"+prodNo ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {

									var displayValue = "<h6>"
																+"상품번호 : "+JSONData.product.prodNo+"<br/>"
																+"제품명 : "+JSONData.product.prodName+"<br/>"
																+"가격 : "+JSONData.product.price+"<br/>"
																+"제작년도 : "+JSONData.product.manuDate+"<br/>"
																+"등록일 : "+JSONData.product.regDate+"<br/>"
																+"상품상태 : "+"<span>"+JSONData.product.proTranCode
																+"</span]>"
																+"</h6>";
																
																
									$("h6").remove();
									$( "#"+prodNo+"" ).html(displayValue);
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					
			});
			
			//==> 아래와 같이 정의한 이유는 ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
			
			
		});	
	
	</script>
	
</head>

<body >
<form>
	<input type="hidden" value="${user.role}" id="role">
	<input type="hidden" id="currentPage" name="currentPage" value=""/>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<br></br>
		<div class="page-header text-info">
	       <h3>판매상품목록</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    	<input type="hidden" id="currentPage" name="currentPage" value=""/>
		    </div>
		    
		   
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="left">구매번호</th>
            
            <th align="left">구매인ID</th>
            <th align="left">수령인이름</th>
            <th align="left">현재상태</th>
            
            <c:if test='${user.role=="admin"}'>
            <th align="left">상품상세정보</th>
            </c:if>
            
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">			
			<tr>
			
			  <td align="left" title="Click : 상품정보 확인">
			  <span id="span${purchase.purchaseProd.prodNo}" class="btn btn-primary">${purchase.tranNo}</span>
			  <input type="hidden" value="${purchase.purchaseProd.prodNo}">
			   </td>
			  
			 
			  <td align="left" >${purchase.buyer.userId}</td>
			  <td align="left" >${purchase.receiverName}</td>
			  <td align="left" ><div>${purchase.tranCode}</div><input type="hidden" value="${purchase.purchaseProd.prodNo}"></td>
			  
			  <c:if test='${user.role=="admin"}'>
			  <td align="left" title="Click : 상품상세정보 확인">
			  	<i class="glyphicon glyphicon-list-alt" id= "${purchase.purchaseProd.prodNo}"></i>
			  	<input type="hidden" value="${purchase.purchaseProd.prodNo}">
			  </td>
			  </c:if>
			  
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	<jsp:include page="/layout/footer.jsp" />
	</form>
</body>

</html>