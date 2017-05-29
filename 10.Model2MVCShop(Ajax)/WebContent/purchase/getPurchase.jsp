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
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button:contains('수 정')" ).on("click" , function() {
					self.location = "/Purchase/updatePurchaseView?tranNo=${purchase.tranNo}"
				});
			
			 $( "button:contains('확 인')" ).on("click" , function() {
				 $(self.location).attr("href","/Product/listProduct?menu=search");
				});
			 
			 $( "button:contains('수정불가')" ).on("click" , function() {
					alert("물건이 발송되어 수정이 불가합니다.");
				});
		});
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<br></br><br></br>
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">제품구매정보</h3>
	       <h5 class="text-muted">제품의 구매정보가<strong class="text-danger">정확한 정보인지</strong>를 확인하세요.</h5>
	    </div>
	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매번호</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.tranNo}</div>
		</div>
		
		<hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제품사진</strong></div>
			<div class="col-xs-8 col-md-4"><img alt="사진" src="/images/uploadFiles/${product.fileName}" width="400"/></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>제품설명</strong></div>
			<div class="col-xs-8 col-md-4">${product.getProdDetail()}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가		격</strong></div>
			<div class="col-xs-8 col-md-4">${product.getPrice() }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>제품등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.getRegDate() }</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자ID</strong></div>
		    <div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		  <hr/>
		  
		 <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>제품수령자이름</strong></div>
		     <div class="col-xs-8 col-md-4">${user.userName}</div>
		</div>
		  <hr/>
		  
		  <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>제품구매방법</strong></div>
		    <div class="col-xs-8 col-md-4">${(purchase.paymentOption=='1')?'현금구매':'신용구매'}</div>
		</div>
		  <hr/>
		  
		  <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>제품수령연락처</strong></div>
		   <div class="col-xs-8 col-md-4">${(user.phone==null)?'000-0000-0000':user.phone}</div>
		</div>
		  <hr/>
		  
		    <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>제품수령주소</strong></div>
		   <div class="col-xs-8 col-md-4">${(user.addr==null)?'없음':user.addr}</div>
		</div>
		    <hr/>
		  <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매요청사항</strong></div>
		     <div class="col-xs-8 col-md-4">${(purchase.dlvyRequest==null)?'좋은하루 되세요.':purchase.dlvyRequest}</div>
		</div>
		  <hr/>
		 <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>배송희망일자</strong></div>
		    <div class="col-xs-8 col-md-4">${(purchase.dlvyDate==null)?'빠른배송':purchase.dlvyDate}</div>
		</div>
				
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>주문일자</strong></div>
		    <div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  		<c:if test='${user.role=="user" && product.proTranCode == "구매완료"}'>	
	  			<button type="button" class="btn btn-primary">수 정</button>
	  		</c:if>
	  		<c:if test='${user.role=="user" && product.proTranCode != "구매완료"}'>	
	  			<button type="button" class="btn btn-primary">수정불가</button>
	  		</c:if>
	  		<c:if test='${user.role=="admin"}'>	
	  			<button type="button" class="btn btn-primary">배송상태변경</button>
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