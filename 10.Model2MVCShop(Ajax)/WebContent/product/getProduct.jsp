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
			 $( "button:contains('구 매')" ).on("click" , function() {
					self.location = "/Purchase/addPurchaseView?prodNo=${product.getProdNo()}&userId=${user.getUserId()}"
				});
			
			 $( "button:contains('확 인')" ).on("click" , function() {
				 $(self.location).attr("href","/Product/listProduct?menu=search");
				});
			 
			 if($('input').val() != '판매중'){
				
				 $('img').before('<img src="../images/uploadFiles/SO.jpg" class="overlay" height="400" width="400" style="opacity:0.5;" />');
				
			 };
			 
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
	       <h3 class=" text-info">제품상세조회 :: "${product.proTranCode}"</h3>
	       <h5 class="text-muted">구매전에 <strong class="text-danger">제품들의 상세정보</strong>를 확인하세요.</h5>
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
	  		<div class="col-xs-4 col-md-2 "><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.getRegDate() }</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  		<c:if test='${user.role=="user" && product.proTranCode=="판매중"}'>	
	  			<button type="button" class="btn btn-primary">구 매</button>
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