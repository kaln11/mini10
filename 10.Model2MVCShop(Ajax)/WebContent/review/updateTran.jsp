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
		
		//============= ȸ���������� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button:contains('�� ��')" ).on("click" , function() {
					self.location = "/review/updateTran?tran=${product.proTranCode}&prodNo=${product.getProdNo()}"
				});
			
			 $( "button:contains('�� ��')" ).on("click" , function() {
				 self.location = "/review/updateTran?tran=${product.proTranCode}&prodNo=${product.getProdNo()}"
				});
			 
			 $( "button:contains('�����ۼ�')" ).on("click" , function() {
				 self.location = "/review/updateTran?tran=${product.proTranCode}&prodNo=${product.getProdNo()}"
				});
			 
			 $( "button:contains('���亸��')" ).on("click" , function() {
				 self.location = "/review/updateTran?tran=${product.proTranCode}&prodNo=${product.getProdNo()}"
				});
			
			 $( "button:contains('Ȯ ��')" ).on("click" , function() {
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
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">��ǰ���»���ȸ :: "${product.proTranCode}"</h3>	      
	    </div>
	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� ǰ ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ����</strong></div>
			<div class="col-xs-8 col-md-4"><img alt="����" src="/images/uploadFiles/${(product.fileName==null)?'why.jpg':product.fileName}" width="400"/></div>
		</div>
		
		<hr/>
		
		<c:if test='${user.role=="user" && product.proTranCode=="���ſϷ�"}'>	
		<div class="jumbotron">
  <h1>�������ּż� �����մϴ�.</h1>      
  <p>�Ǹ��ڰ� �߼����Դϴ�. ��ǰ�� �����Ҷ����� ��ٷ��ּ���.</p>
</div>
</c:if>
		<c:if test='${user.role=="admin" && product.proTranCode=="���ſϷ�"}'>	
		<div class="jumbotron">
  <h1>�����ڰ� ��Ÿ�����ϴ�.</h1>      
  <p>��ǰ�� �߼��� �߼۹�ư�� �����ּ���.</p>
</div>
</c:if>

		<c:if test='${user.role=="user" && product.proTranCode=="�����"}'>	
		<div class="jumbotron">
  <h1>�Ǹ��ڰ� ��ǰ�� �߼��Ͽ����ϴ�. </h1>      
  <p>��ǰ�� �����ϼ̴ٸ� ���ɹ�ư�� �����ּ���.</p>
</div>
</c:if>
		<c:if test='${user.role=="admin" && product.proTranCode=="�����"}'>	
		<div class="jumbotron">
  <h1>��ǰ�� ������Դϴ�.</h1>      
  <p>�����ڰ� ��ǰ�� ������ Ȯ���Ҷ����� ��ٷ��ּ���.</p>
</div>
</c:if>

<c:if test='${user.role=="user" && product.proTranCode=="��ۿϷ�"}'>	
		<div class="jumbotron">
  <h1>�Ǹ��ڰ� ���� ��ǰ�� Ȯ���ϼ���. </h1>      
  <p>���並 �ۼ��ϼž߸� ���Ű� Ȯ���˴ϴ�.</p>
</div>
</c:if>
		<c:if test='${user.role=="admin" && product.proTranCode=="��ۿϷ�"}'>	
		<div class="jumbotron">
  <h1>�����ڰ� ��ǰ�� Ȯ�����Դϴ�.</h1>      
  <p>�����ڰ� ���並 �ۼ��Ҷ����� ��ٷ��ּ���.</p>
</div>
</c:if>

<c:if test='${user.role=="admin" && product.proTranCode=="����Ȯ��"}'>	
		<div class="jumbotron">
  <h1>���Ű� Ȯ���� ��ǰ�Դϴ�.</h1>      
  <p>���並 Ȯ���غ�����.</p>
</div>
</c:if>	
					
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  		<c:if test='${user.role=="admin" && product.proTranCode=="���ſϷ�"}'>	
	  			<button type="button" class="btn btn-primary">�� ��</button>
	  		</c:if>
	  		<c:if test='${user.role=="user" && product.proTranCode=="�����"}'>	
	  			<button type="button" class="btn btn-primary">�� ��</button>
	  		</c:if>
	  		<c:if test='${user.role=="user" && product.proTranCode=="��ۿϷ�"}'>	
	  			<button type="button" class="btn btn-primary">�����ۼ�</button>
	  		</c:if>
	  		<c:if test='${product.proTranCode=="����Ȯ��"}'>	
	  			<button type="button" class="btn btn-primary">���亸��</button>
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