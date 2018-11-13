<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css" href="../css/POcss.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	</script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
/* input, select { */
/* 	display: block; */
/* } */
/* .bg { */
/* 	background-color: #FDF5E6; */
/* 	/* 畫面間距 */ */
/* 	margin: 30px; */
/* } */
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	margin: 30px;
}

.left {
	width: 15%;
	float: left;
	text-align: center;
	height: 1500px;
}

.f {
	/* 方格排列 */
 	display: inline-block;
	width: 200px;
	height:50px;
	margin-bottom:5px;
}

.imgp {
/* 	padding: 0px; */
/* 	font-size: 11px; */
/* 	margin-right:10px; */
	float:left;
	height:35px;
	width:30px;
}

.card-text {
	font-size: 11px;
}

ul {
	font-family:微軟正黑體;
	font-size: 19px;
}
span {
	margin-left:1px;
}
.lr {
	width: 33%;
	float: left;
}

.dlr {
	width: 64%;
	float: left;
}
</style>
</head>
<<<<<<< HEAD
<%@ include file="../POInclude.jsp" %>
<body>
<div class="right">
=======

<body class="bg">
<h1><font face="微軟正黑體">採購系統</font></h1>
	<a href="POLoginSuccess.jsp" style="font-family:微軟正黑體;">回首頁</a>
	<div class="text-right" style="font-family:微軟正黑體;">
		${user.emp_dep}/${user.emp_name} ${user.emp_job},你好<a
			href='POLogout.controller'><button type="button" class="btn btn-primary btn-sm">登出</button></a>
	</div>
	<hr>
	<div class="left">
<%-- 		<br> <span>${sendok}</span> --%>

		<c:if test="${user.emp_level==1}">

		<ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link active" href="selectprice.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="home"></span>
                  	待詢價採購單 <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="POManagerSigner.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="users"></span>
                  	待處理採購單
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="signedorder.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="file"></span>
                  	待下單採購單
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="placedOrder.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="shopping-cart"></span>
                  	待收貨採購單
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Polist.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="layers"></span>
                  	待辦請款單
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="POSignStatement.controller">
                <img class="card-img-top imgp" src="../sysimg/s6.png">
                  <span data-feather="bar-chart-2"></span>
                 	 查詢採購單狀態
                </a>
              </li>

              <li class="nav-item">
                <a class="nav-link" href="StatusMain.jsp">
                <img class="card-img-top imgp" src="../sysimg/s6.png">
                  <span data-feather="layers"></span>
                  	查詢請款單狀態
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="POFinalStatement.controller">
                <img class="card-img-top imgp" src="../sysimg/s6.png">
                  <span data-feather="layers"></span>
                  	查詢結案請款單
                </a>
              </li>
            </ul>
		</c:if>
		<c:if test="${user.emp_level==2}">
		<ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link active" href="sendEmployee.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="home"></span>
                  	待分派採購單 <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="POManagerSigner.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="users"></span>
                  	待處理採購單
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="todoSignInvoice.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="file"></span>
                  	待審核請款單
                </a>
              </li>
             </ul>
		</c:if>		
	</div>
	<div class="right">
>>>>>>> branch 'master' of https://github.com/EEIT10301/PurchasingSystem.git
	<h1>請款單</h1>
	<br>
	<!-- 	<a href='Polist.controller'>回上一頁</a> -->
	<form class="form-inline" method="post"
		action="<c:url value="/Po/onloadimage.controller"/>"
		enctype="multipart/form-data" id="fileupload">
		<input type="hidden" value="${poid}" name="poid"> <input
			type="hidden" value="${user.emp_id}" name="Emp_id">
		<div class="lr">
			<div class="form-group mb-2">
				<label for="Emp_name" class="col-md-4">申請人</label> <input
					type="text" class="form-control col-md-5 mb-2" name="Emp_name"
					id="" readonly="readonly" value="${user.emp_name}">
			</div>
			<div class="form-group mb-2">
				<label for="Emp_dep" class="col-md-4">所屬部門</label> <input
					type="text" class="form-control col-md-5 mb-2" name="Emp_dep" id=""
					readonly="readonly" value="${user.emp_dep}">
			</div>
			<div class="form-group mb-2">
				<label for="Vendor_name" class="col-md-4">廠商名稱</label> <input
					type="text" class="form-control col-md-7 mb-2" name="Vendor_name"
					readonly="readonly" id=""
					value="${bean.pO_Vendor_InfoBean.vendor_name}">
			</div>
			<div class="form-group mb-2">
				<label for="Vendor_id" class="col-md-4">廠商統編</label> <input
					type="text" class="form-control col-md-5 mb-2" name="Vendor_id"
					readonly="readonly" id="" value="${bean.vendor_ID}">
			</div>
			<div class="form-group  mb-2">
				<label for="Total_price" class="col-md-4">請款金額</label> <input
					type="text" class="form-control col-md-5 mb-2" name="Total_price"
					readonly="readonly" id="" value="${bean.total_price}">
			</div>
			<div class="form-group  mb-2">
				<label for="Payment_method" class="col-md-4">付款方式</label> <input
					type="text" class="form-control col-md-5 mb-2"
					name="Payment_method" readonly="readonly" id=""
					value="${bean.pO_Vendor_InfoBean.payment_method}">
			</div>
			<div class="form-group  mb-2">
				<label for="Except_Payment_Date" class="col-md-4">預計付款日</label> <input
					type="text" class="form-control col-md-5 mb-2"
					name="Except_Payment_Date" readonly="readonly" id=""
					value="${paymentDate}">
			</div>
		</div>
		<div class="dlr">
			<div class="form-group  mb-2">
				<label for="Recript_date" class="col-md-2">憑證日期</label> <input
					type="date" class="form-control col-md-3 mb-2" name="Recript_date"
					id="" value="" required>
			</div>
			<div class="form-group  mb-2">
				<label class="col-md-2" for="Receiptpic">憑證圖檔</label><input
					class="mb-2" type="file" name="Receiptpic"
					id="" value="">
			</div>
			<div class="form-group  mb-2">
				<label class="col-md-2">審核人員</label> <select class="mb-2"
					name="selectPOManager">
					<c:forEach var="poman" items="${manager}">
						<option value="${poman.emp_id}">${poman.emp_name}
							${poman.emp_job}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group  mb-2">
				<label class="col-md-2">簽核意見</label>
				<textarea rows="2" cols="58" name="SignSug" class="col-md-6 mb-2"
					required>
		</textarea>
			</div>
			<div class=" text-right">
				<input class="btn" type="reset" value="重新輸入"> <input
					class="btn" type="submit" data-toggle="modal"
					data-target="#exampleModalCenter" value="送出">
			</div>

		<input class="btn btn-primary" type="reset" value="重新輸入"> <input
			class="btn btn-primary" type="submit"  id="opener" value="送出">
			<input type="hidden" value="${inv_id}" name="invid">
	</form>
	
	</div>
	
<%-- <c:if test="${not empty successmeg}"> --%>
<!-- 	<div id="dialog" title="Basic dialog"> -->
<%-- 		<p>${successmeg}${inv_id}</p> --%>
<!-- 	</div>	 -->
<%-- 	</c:if> --%>
<%-- 	<c:if test="${not empty errormeg}"> --%>
<!-- 	<div id="dialog" title="Basic dialog"> -->
<%-- 		<p>${errormeg}</p> --%>
<!-- 	</div>	 -->
<%-- 	</c:if> --%>
     
			
	
	<script>
$(document).ready(function(){
	var invid="${inv_id}";
	var successmeg="${successmeg}";
	var errormeg="${errormeg}";
	if(successmeg==="3"){
	alert("請款單:"+invid+"新增成功");
	window.location.href='http://localhost:8080/PurchasingSystem/Po/POLoginSuccess.jsp';}
	if(errormeg=="4"){
	alert("請款單:"+invid+"新增失敗");
	window.location.href='http://localhost:8080/PurchasingSystem/Po/POLoginSuccess.jsp';}
});
</script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
		</div>

</body>
</html>