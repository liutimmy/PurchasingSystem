<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<title>財務系統</title>
<style>
.bg {

/* 	background-image:  	  linear-gradient(to right bottom,   */
/*       rgba(50, 0, 50, 0.1),  */
/*       rgba(50, 0, 50, 0.1)),  */
/*   	url('https://images.unsplash.com/photo-1495464101292-552d0b52fe41?auto=format&fit=crop&w=1350&q=80'); */
  	background-color: #FDF5E6;
  		margin: 30px;
  	
}

.f {
	/* 方格排列 */
	display: inline-block;
	width: 13rem;
	height: 16rem;
}

.ff {
	color:black;
}

.m {
	/* 畫面內縮 */
	margin: 30px;
}

.text-center{
position: absolute;
  	top: 200px;
  	left:250px;
}
</style>
</head>

<body class="bg m">
	<h3 class="ff">財務系統</h3>

	<div class="text-right ff">
		${user.emp_dep}/${user.emp_name} ${user.emp_job},你好 <a
			href='AccountLogout.controller'><button type="button"
				class="btn btn-white btn-sm">登出</button></a>
	</div>
		<hr>
	<div class="text-center">
		<c:if test="${user.emp_level==2}">
			<div class="card bg-light f">
				<a href="ToDoAssignInvoice.controller" class="btn"> <img
					class="card-img-top" src="../sysimg/s1.png" style="padding: 10px;"></a>
				<div class="card-body">
					<h5 class="card-title">待分派請款單</h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href="ToDoSignInvoice.controller" class="btn"> <img
					class="card-img-top" src="../sysimg/s2.png" style="padding: 10px;"></a>
				<div class="card-body">
					<h5 class="card-title">待簽核請款單</h5>
				</div>
			</div>

		</c:if>
		<c:if test="${user.emp_level==1}">
			<div class="card bg-light f">
				<a href="ToDoSignlevel1.controller" class="btn"><img
					class="card-img-top" src="../sysimg/s2.png" style="padding: 10px;"></a>
				<div class="card-body">
					<h5 class="card-title">待簽核請款單</h5>
				</div>
			</div>
		</c:if>
		<div class="card bg-light f">
			<a href="StatusMainAcc.jsp" class="btn"><img class="card-img-top"
				src="../sysimg/s4.png" style="padding: 10px;"></a>
			<div class="card-body">
				<h5 class="card-title">查詢請款單狀態</h5>
			</div>
		</div>
		<div class="card bg-light f">
			<a href="ShowAccountPayableList.controller" class="btn"><img
				class="card-img-top" src="../sysimg/s3.png" style="padding: 10px;"></a>
			<div class="card-body">
				<h5 class="card-title">查詢廠商款項明細</h5>
			</div>
		</div>
	</div>

</body>
</html>
