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
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/Product/listProduct?menu="+"${param.menu}").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		 });
		
		
		//============= userId 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
		/* alert ($(  "td:nth-child(1) > img" ).attr('id') );
			//==> DOM Object GET 3가지 방법 =1=> 1. $(tagName) : 2.(#id) : 3.$(.className)*/
			/* if($(  "td:nth-child(1) > img" ).attr('id') != '판매중'){
				$(  "td:nth-child(1) > img" ).before('<img src="../images/uploadFiles/SO.jpg" class="overlay" height="100" width="100" style="opacity:0.5;" />');
			}; 
			 */
			$(  "td:nth-child(1) > img" ).on("click" , function() {
				$(self.location).attr("href","/Product/getProduct?prodNo="+$(this).next().val()+"&menu="+"${param.menu}");
			});	
		});	
		
		
		//============= userId 에 회원정보보기  Event  처리 (double Click)=============
		 $(function() {
			 		 
			        $("td:nth-child(6)").on("click","h6 span",function() {
			        	
			           if($(this).text()=='판매중'){
			        	   alert($(this).val().trim());
			           };
			        });
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$(  "td:nth-child(5) > div" ).click(function() {
			
			if($(this).text() != '판매중'){
				var url="/review/goReview?prodNo="+$(this).next().val();
			
				 $(self.location).attr("href",url); 
			}
		});
					
			$(  "td:nth-child(6) > i" ).click(function() {

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
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<br></br>
		<div class="page-header text-info">
	       <h3>상품목록</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<c:if test='${param.menu=="manage"}'>
					<option value="0" ${ (search.searchCondition=="0" ? "selected" : "")}>상품번호</option>
				</c:if>
				<option value="1" ${ (search.searchCondition=="1" ? "selected" : "")}>상품명</option>
				<option value="2" ${ (search.searchCondition=="2" ? "selected" : "")}>상품가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="left">사진</th>
            <th align="left" >상품명</th>
            <th align="left">상품설명</th>
            <th align="left">가격</th>
            <th align="left">현재상태</th>
            
            <c:if test='${param.menu=="manage"}'>
            <th align="left">상품상세정보</th>
            </c:if>
            
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">			
			<tr>
			
			  <td align="left" title="Click : 상품정보 확인">	
			  <c:if test="${product.proTranCode != '판매중' }"	>
			  <img src="../images/uploadFiles/SO.jpg" class="overlay" height="100" width="100" style="opacity:0.5;" />
			  <input type="hidden" value="${product.prodNo}">	
			  </c:if> 		
			  <img alt="사진" src="../images/uploadFiles/${(product.fileName==null)?'why.jpg':product.fileName}" height="120" width="160" />
			 <input type="hidden" value="${product.prodNo}">			  
			  </td>
			  
			  <td align="left" >${product.prodName}</td>
			  <td align="left" >${product.prodDetail}</td>
			  <td align="left" >${product.price}</td>
			  <td align="left"title="Click : 상태정보 확인" ><div >${product.proTranCode}</div><input type="hidden" value="${product.prodNo}"></td>
			  
			  <c:if test='${param.menu=="manage"}'>
			  <td align="left" title="Click : 상품상세정보 확인">
			  	<i class="glyphicon glyphicon-list-alt" id= "${product.prodNo}"></i>
			  	<input type="hidden" value="${product.prodNo}">
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
</body>

</html>