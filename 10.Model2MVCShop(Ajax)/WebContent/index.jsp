<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html  lang = 'ko'>
<head >
<meta charset="EUC-KR">
<meta name='viewport'	 content='width=device-width, initial-scale=1.0'	/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	<link href="../css/full.css" rel="stylesheet">

<style type="text/css">
body{
padding-top : 70px;
}
IMG.displayed {
    display: block;
    margin-left: auto;
    margin-right: auto }
</style>
<script type="text/javascript">
$(function() {
	
	/* $(location).attr('href', '/Product/regProduct'); */
	var page = $(this).attr('targetPage');
	$.ajax("/Product/regJSON/",{
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data:{
					currentPage:page,
					searchCondition:$('[name="searchCondition"]').val(),
					searchKeyword:$('[name="searchKeyword"]').val(),
					searchValueLow:$('[name="searchValueLow"]').val(),
					searchValueHigh:$('[name="searchValueHigh"]').val()
				},
				success : function(J , status) {
					/* alert(J.list[0].prodNo+"/"+J.list[1].prodNo+"/"+J.list[2].prodNo); */
					$('img[alt="First slide"]').attr('src','/images/uploadFiles/'+J.list[0].fileName).css('height','480').css('width','640');
					$('img[alt="Second slide"]').attr('src','/images/uploadFiles/'+J.list[1].fileName).css('height','480').css('width','640');
					$('img[alt="Third slide"]').attr('src','/images/uploadFiles/'+J.list[2].fileName).css('height','480').css('width','640');
					//$( "tbody tr" ).remove();
				/* 	for(var i=0;i<J.list.length;i++){
						//alert(J.list[i].prodNo);
						$($('.prodItem')[i]).attr('sendValue',J.list[i].prodNo);
						$($('.table_index')[i]).html(i+1);
						$($('.table_price')[i]).html(J.list[i].price);
						$($('.table_prodStock')[i]).html(J.list[i].prodStock);
						$($('.table_prodTranCode')[i]).html(J.list[i].prodTranCode);
						$($('.updateProduct, .getProduct')[i]).html(J.list[i].prodName);

						if('${param.menu=="manage"}'){
							$($('.table_regDate')[i]).html(J.list[i].regDate);
						}else{
							$($('.table_image')[i]).attr('src','/images/uploadFiles/'+J.list[i].fileName)
							$($('.table_image')[i]).attr('name',J.list[i].fileName)
							$($('.table_image')[i]).attr('prodImg',J.list[i].fileName);
						}
					} */
				}
			});
	
	$('.text-white').css('color','white');
	
		$('a:contains("회원가입")').on("click" , function() {
			self.location = "/user/addUser"
		});
		
		$('.jumbotron').css('background-color','rgba( 255, 255, 255, 0)');
		/* $('body').css('opacity','0.5'); */
		
	/* 	$('img[alt="first slide"]').on("click", function(){
			if(${user}==null || ${user}==""){
				alert("Log in 후에 이용해주세요");
			}
		}); */
	
});	
</script>
<title>Welcome Model2 MVC Shop</title>
</head>

  <body class = "full" >
<jsp:include page="/layout/toolbar.jsp" />

      <div class="container">
    <div class="jumbotron">    
        <h1 class="text-white">Welcome <i class="glyphicon glyphicon-gift"></i> Model2 MVC Shop</h1>
        
        <c:if test="${ empty user }">
        <p class="text-white">매일매일 업데이트 되는 상품들을 만나보세요.</p>
        <p><a class="btn btn-danger btn" type="button">회원가입  <i class="glyphicon glyphicon-hand-left"></i></a></p>
      </c:if>
      
      <c:if test="${ !empty user }">
        <p class="text-white">매일매일 업데이트 되는 상품들을 확인해보세요.</p>
      </c:if>      
      </div>
       </div>
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <img src="https://c.tribune.com.pk/2015/02/833072-Tesla_AppleWatch_ELEKSlabs_-1423075435-350-640x480.png" alt="First slide" class="displayed  img-rounded" height="480" width="640">
          </div>
          <div class="item">
            <img src="http://www.rmkstore.com/getIconLogo.do?productId=14817&fileName=image2.jpg&isLarge=1" alt="Second slide" class="displayed img-rounded" height="480" width="640">
          </div>
          <div class="item">
            <img src="http://static3.businessinsider.com/image/5748559191058422008c551a-640/main_shwood%201%20.jpg" alt="Third slide" class="displayed img-rounded" height="480" width="640">
          </div>
        </div>
       <!--  <a class="carousel-control-prev" href="#carousel-example-generic" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carousel-example-generic" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a> -->
      </div>
           

<jsp:include page="/layout/footer.jsp" />
</body> 

</html>
