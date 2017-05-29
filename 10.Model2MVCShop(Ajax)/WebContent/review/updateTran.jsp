<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
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
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button:contains('발 송')" ).on("click" , function() {
					self.location = "/review/updateTran?tran=${product.proTranCode}&prodNo=${product.getProdNo()}"
				});
			
			 $( "button:contains('수 령')" ).on("click" , function() {
				 self.location = "/review/updateTran?tran=${product.proTranCode}&prodNo=${product.getProdNo()}"
				});
			 
			 $( "button:contains('리뷰작성')" ).on("click" , function() {
				 self.location = "/review/updateTran?tran=${product.proTranCode}&prodNo=${product.getProdNo()}"
				});
			 
			 $( "button:contains('리뷰보기')" ).on("click" , function() {
				 self.location = "/review/updateTran?tran=${product.proTranCode}&prodNo=${product.getProdNo()}"
				});
			
			 $( "button:contains('확 인')" ).on("click" , function() {
				 $(self.location).attr("href","/Product/listProduct?menu=search");
				});
			 
		});
		
	</script>
	
</head>

<body>
<input type="hidden" value="${product.proTranCode}">
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<br></br><br></br>
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">제품상태상세조회 :: "${product.proTranCode}"</h3>	      
	    </div>
	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>제 품 명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제품사진</strong></div>
			<div class="col-xs-8 col-md-4"><img alt="사진" src="/images/uploadFiles/${(product.fileName==null)?'why.jpg':product.fileName}" width="400"/></div>
		</div>
		
		<hr/>
		
		<c:if test='${user.role=="user" && product.proTranCode=="구매완료"}'>	
		<div class="jumbotron">
  <h1>구매해주셔서 감사합니다.</h1>      
  <p>판매자가 발송중입니다. 상품이 도착할때까지 기다려주세요.</p>
</div>
</c:if>
		<c:if test='${user.role=="admin" && product.proTranCode=="구매완료"}'>	
		<div class="jumbotron">
  <h1>구매자가 나타났습니다.</h1>      
  <p>물품을 발송후 발송버튼을 눌러주세요.</p>
</div>
</c:if>

		<c:if test='${user.role=="user" && product.proTranCode=="배송중"}'>	
		<div class="jumbotron">
  <h1>판매자가 물품을 발송하였습니다. </h1>      
  <p>상품이 수령하셨다면 수령버튼을 눌러주세요.</p>
</div>
</c:if>
		<c:if test='${user.role=="admin" && product.proTranCode=="배송중"}'>	
		<div class="jumbotron">
  <h1>물품이 배송중입니다.</h1>      
  <p>구매자가 물품을 받은후 확인할때까지 기다려주세요.</p>
</div>
</c:if>

<c:if test='${user.role=="user" && product.proTranCode=="배송완료"}'>	
		<div class="jumbotron">
  <h1>판매자가 보낸 물품을 확인하세요. </h1>      
  <p>리뷰를 작성하셔야만 구매가 확정됩니다.</p>
</div>
</c:if>
		<c:if test='${user.role=="admin" && product.proTranCode=="배송완료"}'>	
		<div class="jumbotron">
  <h1>구매자가 물품을 확인중입니다.</h1>      
  <p>구매자가 리뷰를 작성할때까지 기다려주세요.</p>
</div>
</c:if>

<c:if test='${user.role=="admin" && product.proTranCode=="구매확정"}'>	
		<div class="jumbotron">
  <h1>구매가 확정된 물품입니다.</h1>      
  <p>리뷰를 확인해보세요.</p>
</div>
</c:if>	
					
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  		<c:if test='${user.role=="admin" && product.proTranCode=="구매완료"}'>	
	  			<button type="button" class="btn btn-primary">발 송</button>
	  		</c:if>
	  		<c:if test='${user.role=="user" && product.proTranCode=="배송중"}'>	
	  			<button type="button" class="btn btn-primary">수 령</button>
	  		</c:if>
	  		<c:if test='${user.role=="user" && product.proTranCode=="배송완료"}'>	
	  			<button type="button" class="btn btn-primary">리뷰작성</button>
	  		</c:if>
	  		<c:if test='${product.proTranCode=="구매확정"}'>	
	  			<button type="button" class="btn btn-primary">리뷰보기</button>
	  		</c:if>
	  			<button type="button" class="btn btn-primary">확 인</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
</body>

</html>