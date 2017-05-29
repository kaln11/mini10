<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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
			 $( "button:contains('수 정')" ).on("click" , function() {
				fncupdatePurchase();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
						
		});	
	
		
		function fncupdatePurchase() {
			
			var payment = $("#paymentOption").val();			
			var rephone = $("#receiverPhone").val();
			var readdr = $("#receiverAddr").val();
			var req = $("#dlvyRequest").val();
			var redate = $("#dlvyDate").val();
			
			if(payment == null || payment.length<1){
				alert("구매방법은 반드시 선택하셔야합니다.");
				return;
			}
			if(rephone == null || rephone.length<1){
				alert("수령자연락처는 반드시 입력하여야 합니다.");
				return;
			}
			if(readdr == null || readdr.length<1){
				alert("수령주소는 반드시 입력하셔야 합니다.");
				return;
			}
			if(redate == null || redate.length<1){
				alert("수령희망일자는 반드시 입력하셔야 합니다.");
				return;
			}
			if(req == null || req.length<1 || req == ''){
				
				 $("#dialog-confirm").dialog({
				      resizable: false,
				      height: "auto",
				      width: 400,
				      modal: true,
				      buttons: {
				        "Agree": function() {
				        	$("#dlvyRequest").val('좋은하루 되세요.');		
				        	fncupdatePurchase();
				        },
				        Cancel: function() {
				          $( this ).dialog( "close" );
				        }
				      }
				});
				 return;
				}
			
			
			var redate = $("#dlvyDate").val().replace(/-/g, '');
			$("#dlvyDate").val(redate)
				
		 $("form").attr("method" , "POST").attr("action" , "/Purchase/updatePurchase").submit(); 
		} 
		
	 $(function() {	
		 
		 $('div[role="group"] button:nth-child(1)').on('click',function(){
			 $('div[role="group"] button:nth-child(2)').attr('class','btn btn-primary');
			 $('div[role="group"] button:nth-child(1)').attr('class','btn btn-danger');
			 $("input[name='paymentOption']").val('1');			
		 });
		 
		  $('div[role="group"] button:nth-child(2)').on('click',function(){
			  $('div[role="group"] button:nth-child(1)').attr('class','btn btn-primary');
			  $('div[role="group"] button:nth-child(2)').attr('class','btn btn-danger');
			  $("input[name='paymentOption']").val('2');		
		 }); 
		  
		  if($('#paymentOption').val() == '1'){
			  $('div[role="group"] button:nth-child(1)').attr('class','btn btn-danger');
			  $("input[name='paymentOption']").val('1');
			  
		  }else{
			  $('div[role="group"] button:nth-child(2)').attr('class','btn btn-danger');
			  $("input[name='paymentOption']").val('2');
			  
		  }
			 
			 $('input[name="dlvyDate"]').datepicker({
					dateFormat: "yymmdd",
					minDate: -3650
				});
			 
		});		  
	</script>		
    
</head>

<body>
<input type="hidden" value="${purchase.paymentOption}">
<div id="dialog-confirm" title="요청사항을 적지않았습니다.">
  <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>아무것도 적지않으면 자동으로'좋은하루되세요' 가 입력됩니다. 동의하십니까?</p>
</div>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<br></br><br></br><br></br><br></br>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">제품구매정보입력</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<input type="hidden" name="purchaseProd.prodNo" value="${product.prodNo}"/>
		
		<div class="form-group">
			<label class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
			<div class="col-sm-4">
			
			<img alt="사진" src="../images/uploadFiles/${product.fileName}" height="240" width="320"  align="middle"/>              
              
</div></div>
		
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">제 품 명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}" placeholder="${product.prodName}" readonly>		      
		    </div>		    
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">제품상세정보</label>
		    <div class="col-sm-4">
		      <textarea  rows="5" class="form-control" id="prodDetail" name="prodDetail" placeholder="${product.prodDetail}" readonly>${product.prodDetail}</textarea>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">제품등록일자</label>
		    <div class="col-sm-4">
		      <input  type="text" class="form-control" id="regDate" name="regDate"  value="${product.regDate}" placeholder="${product.regDate}" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" value="${product.price}" placeholder="${product.price}" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">구매자ID</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="buyer.userId" name="buyer.userId" value="${user.userId}" placeholder="${user.userId}" readonly>
		    </div>
		  </div>
		  
		   <div class="form-group">
		   <input type="hidden"  name="paymentOption"	id="paymentOption" value="${purchasepaymentOption}">
		    <label class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		    <div class="col-sm-4">
		      <div class="btn-group" role="group" aria-label="payment">
		      <button class="btn btn-primary"    value="1" type="button">현금구매</button>
  

<button class="btn btn-primary"  value="2" type="button">
  신용구매
  </button>
</div>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">제품수령자이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}" placeholder="${purchase.receiverName}" >
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">제품수령연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${(purchase.receiverPhone==null)?'000-0000-0000':purchase.receiverPhone}" placeholder="${(purchase.receiverPhone==null)?'000-0000-0000':purchase.receiverPhone}" >
		    </div>
		  </div>
		  
		     <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">제품수령주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverAddr" name="receiverAddr" value="${(purchase.dlvyAddr==null)?'없음':purchase.dlvyAddr}" placeholder="${(purchase.dlvyAddr==null)?'없음':purchase.dlvyAddr}" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
		    <div class="col-sm-4" >
		      <textarea  rows="5" class="form-control" id="dlvyRequest" name="dlvyRequest" >${(purchase.dlvyRequest)==null || (purchase.dlvyRequest)=="" ? '좋은하루 되세요.':purchase.dlvyRequest}</textarea>
		      
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		    <div class="col-sm-4">
		      <input  type="text" class="form-control" id="dlvyDate" name="dlvyDate" value="${purchase.dlvyDate}" placeholder="${purchase.dlvyDate}" readonly>
		    </div>
		  </div>
		  
		  
		  	    
<br/><br/><br/><br/>

		 		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 소</a>
		     </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		 </div>

	<!--  화면구성 div end /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp" />
</body>

</html>