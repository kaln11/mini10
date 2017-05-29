<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
		
		//============= ȸ���������� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button:contains('�� ��')" ).on("click" , function() {
					self.location = "/Purchase/updatePurchaseView?tranNo=${purchase.tranNo}"
				});
			
			 $( "button:contains('Ȯ ��')" ).on("click" , function() {
				 $(self.location).attr("href","/Product/listProduct?menu=search");
				});
			 
			 $( "button:contains('�����Ұ�')" ).on("click" , function() {
					alert("������ �߼۵Ǿ� ������ �Ұ��մϴ�.");
				});
		});
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<br></br><br></br>
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">��ǰ��������</h3>
	       <h5 class="text-muted">��ǰ�� ����������<strong class="text-danger">��Ȯ�� ��������</strong>�� Ȯ���ϼ���.</h5>
	    </div>
	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>���Ź�ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.tranNo}</div>
		</div>
		
		<hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ����</strong></div>
			<div class="col-xs-8 col-md-4"><img alt="����" src="/images/uploadFiles/${product.fileName}" width="400"/></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ����</strong></div>
			<div class="col-xs-8 col-md-4">${product.getProdDetail()}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��		��</strong></div>
			<div class="col-xs-8 col-md-4">${product.getPrice() }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ�������</strong></div>
			<div class="col-xs-8 col-md-4">${product.getRegDate() }</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>������ID</strong></div>
		    <div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		  <hr/>
		  
		 <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ�������̸�</strong></div>
		     <div class="col-xs-8 col-md-4">${user.userName}</div>
		</div>
		  <hr/>
		  
		  <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ���Ź��</strong></div>
		    <div class="col-xs-8 col-md-4">${(purchase.paymentOption=='1')?'���ݱ���':'�ſ뱸��'}</div>
		</div>
		  <hr/>
		  
		  <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ���ɿ���ó</strong></div>
		   <div class="col-xs-8 col-md-4">${(user.phone==null)?'000-0000-0000':user.phone}</div>
		</div>
		  <hr/>
		  
		    <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ�����ּ�</strong></div>
		   <div class="col-xs-8 col-md-4">${(user.addr==null)?'����':user.addr}</div>
		</div>
		    <hr/>
		  <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>���ſ�û����</strong></div>
		     <div class="col-xs-8 col-md-4">${(purchase.dlvyRequest==null)?'�����Ϸ� �Ǽ���.':purchase.dlvyRequest}</div>
		</div>
		  <hr/>
		 <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����������</strong></div>
		    <div class="col-xs-8 col-md-4">${(purchase.dlvyDate==null)?'�������':purchase.dlvyDate}</div>
		</div>
				
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�ֹ�����</strong></div>
		    <div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
		</div>
				
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  		<c:if test='${user.role=="user" && product.proTranCode == "���ſϷ�"}'>	
	  			<button type="button" class="btn btn-primary">�� ��</button>
	  		</c:if>
	  		<c:if test='${user.role=="user" && product.proTranCode != "���ſϷ�"}'>	
	  			<button type="button" class="btn btn-primary">�����Ұ�</button>
	  		</c:if>
	  		<c:if test='${user.role=="admin"}'>	
	  			<button type="button" class="btn btn-primary">��ۻ��º���</button>
	  		</c:if>
	  			<button type="button" class="btn btn-primary">Ȯ ��</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
</body>

</html>