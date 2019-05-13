<%@include file="/WEB-INF/view/template/header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-md-5 col-md-offset-3"><br>
		   	<div class="panel panel-default text-center">
		   		<div class="panel-body">
		            <h3>Your payment of ${cart.grandTotal} has been failed. Please order again.</h3>
					<hr>
		            <a href="/" class="btn btn-default">OK</a>
		   		</div>
		   	</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/view/template/footer.jsp"%>