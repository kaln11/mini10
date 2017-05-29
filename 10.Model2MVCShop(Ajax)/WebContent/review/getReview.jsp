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
	

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/star-rating.css" media="all" type="text/css"/>
    <link rel="stylesheet" href="../themes/krajee-fa/theme.css" media="all" type="text/css"/>
    <link rel="stylesheet" href="../themes/krajee-svg/theme.css" media="all" type="text/css"/>
    <link rel="stylesheet" href="../themes/krajee-uni/theme.css" media="all" type="text/css"/>
    
    <script src="../javascript/star-rating.js" type="text/javascript"></script>
    <script src="../themes/krajee-fa/theme.js" type="text/javascript"></script>
    <script src="../themes/krajee-svg/theme.js" type="text/javascript"></script>
    <script src="../themes/krajee-uni/theme.js" type="text/javascript"></script>
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
#abc{
    font:Verdana, Geneva, sans-serif;
    font-size:18px;
    text-align:left;
    background-color:#0F0;
    height:50px;
    vertical-align:middle;
}
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			 $('.kv-gly-star').rating({
		            containerClass: 'is-star'
		        });
		        $('.kv-gly-heart').rating({
		            containerClass: 'is-heart',
		            defaultCaption: '{rating} hearts',
		            starCaptions: function (rating) {
		                return rating == 1 ? 'One heart' : rating + ' hearts';
		            },
		            filledStar: '<i class="glyphicon glyphicon-heart"></i>',
		            emptyStar: '<i class="glyphicon glyphicon-heart-empty"></i>'
		        });
		        $('.kv-fa').rating({
		            theme: 'krajee-fa',
		            filledStar: '<i class="fa fa-star"></i>',
		            emptyStar: '<i class="fa fa-star-o"></i>'
		        });
		        $('.kv-fa-heart').rating({
		            defaultCaption: '{rating} hearts',
		            starCaptions: function (rating) {
		                return rating == 1 ? 'One heart' : rating + ' hearts';
		            },
		            theme: 'krajee-fa',
		            filledStar: '<i class="fa fa-heart"></i>',
		            emptyStar: '<i class="fa fa-heart-o"></i>'
		        });
		        $('.kv-uni-star').rating({
		            theme: 'krajee-uni',
		            filledStar: '&#x2605;',
		            emptyStar: '&#x2606;'
		        });
		        $('.kv-uni-rook').rating({
		            theme: 'krajee-uni',
		            defaultCaption: '{rating} rooks',
		            starCaptions: function (rating) {
		                return rating == 1 ? 'One rook' : rating + ' rooks';
		            },
		            filledStar: '&#9820;',
		            emptyStar: '&#9814;'
		        });
		        $('.kv-svg').rating({
		            theme: 'krajee-svg',
		            filledStar: '<span class="krajee-icon krajee-icon-star"></span>',
		            emptyStar: '<span class="krajee-icon krajee-icon-star"></span>'
		        });
		        $('.kv-svg-heart').rating({
		            theme: 'krajee-svg',
		            filledStar: '<span class="krajee-icon krajee-icon-heart"></span>',
		            emptyStar: '<span class="krajee-icon krajee-icon-heart"></span>',
		            defaultCaption: '{rating} hearts',
		            starCaptions: function (rating) {
		                return rating == 1 ? 'One heart' : rating + ' hearts';
		            },
		            containerClass: 'is-heart'
		        });

		        $('.rating,.kv-gly-star,.kv-gly-heart,.kv-uni-star,.kv-uni-rook,.kv-fa,.kv-fa-heart,.kv-svg,.kv-svg-heart').on(
		                'change', function () {
		                    console.log('Rating selected: ' + $(this).val());
		                });
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button:contains('작성완료')" ).on("click" , function() {
				 $("form").attr("method" , "POST").attr("action" , "/review/addReview").submit();
				});
			
			 $( "button:contains('확 인')" ).on("click" , function() {
				 $(self.location).attr("href","/Product/listProduct?menu=search");
				});
			 			 
		});
		
	</script>
	
</head>
<form>
<body>
<input type="hidden" name="reid.userId" value="${user.userId}">
<input type="hidden" name="reprod.prodNo" value="${product.prodNo}">
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
		
		<div class="row" >
	  		<div class="col-xs-4 col-md-2" ><strong>별 점</strong></div>
        <div><input type="text" class="kv-fa rating-loading" name="score" data-size="md" title="" value="${review.score}"></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>리 뷰</strong></div>
			<div class="col-xs-8 col-md-4">  <textarea  rows="5" class="form-control" id="epil" name="epil" >${review.epil}</textarea></div>
		</div>
			<hr/>
		
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  		
	  		
	  		
	  			<button type="button" class="btn btn-primary">확 인</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
</body>
</form>
</html>