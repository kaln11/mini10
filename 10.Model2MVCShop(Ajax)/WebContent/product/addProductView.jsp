<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	
 <link href="/css/bootstrap-imageupload.css" rel="stylesheet">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

   <script src="/javascript/bootstrap-imageupload.js"></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button:contains('제품등록')" ).on("click" , function() {
				fncAddProduct();
			});
			
			$( "button:contains('수 정')" ).on("click" , function() {
				fncUpdateProduct();
			});
			
			 var $imageupload = $('.imageupload');
	            $imageupload.imageupload();

	            $('#imageupload-disable').on('click', function() {
	                $imageupload.imageupload('disable');
	                $(this).blur();
	            })

	            $('#imageupload-enable').on('click', function() {
	                $imageupload.imageupload('enable');
	                $(this).blur();
	            })

	            $('#imageupload-reset').on('click', function() {
	                $imageupload.imageupload('reset');
	                $(this).blur();
	            });
			
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
	
		
		function fncAddProduct() {
			
			var name = $("input[name='prodName']").val();
			var detail = $("textarea[name='prodDetail']").val();
			var manuDate = $("input[name='manuDate']").val();
			var price = $("input[name='price']").val();			
			var filename = $("input[name='fileName']").val();		
			var urlname = $('#url').val();
		
			if(name == null || name.length<1){
				alert("상품명은 반드시 입력하여야 합니다.");
				return;
			}
			if(detail == null || detail.length<1){
				alert("상품상세정보는 반드시 입력하여야 합니다.");
				return;
			}
			if(manuDate == null || manuDate.length<1){
				alert("제조일자는 반드시 입력하셔야 합니다.");
				return;
			}
			if(price == null || price.length<1){
				alert("가격은 반드시 입력하셔야 합니다.");
				return;
			}
			
			if(filename == null || filename.length<1){
				
				alert("사진은 반드시 넣으셔야 합니다.");
				return;
			
			}
			var replaceDate = $("input[name='manuDate']").val().replace(/-/g, '');
			$("input[name='manuDate']").val(replaceDate)
			
			$("form").attr("method" , "POST").attr("action" , "/Product/addProduct").submit();
		}
		
		function fncUpdateProduct() {
			
			var name = $("input[name='prodName']").val();
			var detail = $("textarea[name='prodDetail']").val();
			var manuDate = $("input[name='manuDate']").val();
			var price = $("input[name='price']").val();
			var filename = $("input[name='fileName']").val();
			
			if(name == null || name.length<1){
				alert("상품명은 반드시 입력하여야 합니다.");
				return;
			}
			if(detail == null || detail.length<1){
				alert("상품상세정보는 반드시 입력하여야 합니다.");
				return;
			}
			if(manuDate == null || manuDate.length<1){
				alert("제조일자는 반드시 입력하셔야 합니다.");
				return;
			}
			if(price == null || price.length<1){
				alert("가격은 반드시 입력하셔야 합니다.");
				return;
			}
			if(filename == null || filename.length<1){
				
				$("input[name='fileName']").val('${product.fileName}');
			
			}
			var replaceDate = $("input[name='manuDate']").val().replace(/-/g, '');
			$("input[name='manuDate']").val(replaceDate)
				
			$("form").attr("method" , "POST").attr("action" , "/Product/updateProduct?menu=manage").submit();
		}
		
	 $(function() {
			 
			 $('input[name="manuDate"]').datepicker({
					dateFormat: "yymmdd",
					minDate: -3650
				});
			 
		});		  
	</script>		
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<br></br><br></br><br></br><br></br>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	 <c:if test="${ empty product }">
	
	<div class="container">
	
		<h1 class="bg-primary text-center">제 품 등 록</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">제 품 명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="제품명입력해주세요" >		      
		    </div>		    
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">제품상세정보</label>
		    <div class="col-sm-4">
		      <textarea  rows="5" class="form-control" id="prodDetail" name="prodDetail" placeholder="제품상세정보입력해주세요"></textarea>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input  type="text" class="form-control" id="manuDate" name="manuDate" placeholder="제품제조입력해주세요" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="가격을 입력해주세요">
		    </div>
		  </div>
		  
		<!--   <div class="form-group">
				<label class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
				<div class="col-sm-4">
					<input	type="file" class="form-control" name="fileName"/>
				</div>
			</div> -->
			
			<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
			<div class="col-sm-4">
			<div class="imageupload panel panel-default">                
                <div class="file-tab panel-body" align="center">                
                    <label class="btn btn-primary btn-file pull-right"  >                    
                        <span>Browse</span>
                   <input type="file" name="fileName" >                                        
                    </label>
                    <button type="button" class="btn btn-primary pull-right">Remove</button><br/>                   
                </div>
               
            </div>

</div></div>
		 		  
		 		  <br/><br/><br/><br/>
		 		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >제품등록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
 	</c:if>
 	
 	 <c:if test="${ !empty product }">
 	 <div class="container">
	
		<h1 class="bg-primary text-center">제품정보수정</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<input type="hidden" name="prodNo" value="${product.prodNo}"/>
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">제 품 명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}" placeholder="${product.prodName}">		      
		    </div>		    
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">제품상세정보</label>
		    <div class="col-sm-4">
		      <textarea  rows="5" class="form-control" id="prodDetail" name="prodDetail" placeholder="${product.prodDetail}">${product.prodDetail}</textarea>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input  type="text" class="form-control" id="manuDate" name="manuDate"  value="${product.manuDate}" placeholder="${product.manuDate}" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" value="${product.price}" placeholder="${product.price}">
		    </div>
		  </div>
		  
		  <%-- <div class="form-group">
				<label class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
				<div class="col-sm-4">
					<input id="input-6"	type="file" multiple class="file-loading" name="fileName" value="${product.fileName}" placeholder="${product.fileName}" readonly>
				</div>
			</div> --%>
			
			<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
			<div class="col-sm-4">
			<div class="imageupload panel panel-default">    
			<img alt="사진" src="../images/uploadFiles/${product.fileName}" height="240" width="320"  align="middle"/>              
                <div class="file-tab panel-body" align="center">                
                    <label class="btn btn-primary btn-file pull-right"  >                    
                        <span>Browse</span>
                   <input type="file" name="fileName" >                                        
                    </label>
                    <button type="button" class="btn btn-primary pull-right">Remove</button><br/>                   
                </div>
               
            </div>

</div></div>
       
     
<br/><br/><br/><br/>

		 		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		     </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		 </div>
 	 </c:if>
	<!--  화면구성 div end /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp" />
</body>

</html>