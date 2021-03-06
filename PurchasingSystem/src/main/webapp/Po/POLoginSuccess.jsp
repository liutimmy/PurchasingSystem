<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready(
			function() {
				var row = 5;
				$.ajax({
					url : "LoginSucessSelectPoSignList.do",
					type : "GET",
					success : function(data) {
						if (document.URL.indexOf("#") == -1) {
							url = document.URL + "#";
							location = "#";
							location.reload(true);
						}
					}
				});
				
				
				$("#myInput").on("keyup",function() {
							var value = $(this).val().toLowerCase();
							$("#selectAll tr").filter(function() {
										$(this).toggle($(this).text().tolowerCase()
														.indexOf(value) > -1)
									});
						});

			});
</script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<title>採購系統</title>
<style>
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
/* 	margin: 30px; */
}

.f {
	/* 方格排列 */
	display: inline-block;
	width: 13rem;
	height: 14rem;
	margin-right: 10px;
}

.imgp {
	padding: 10px;
}

.btn:link,
.btn:visited {
  	text-transform: uppercase;
  	text-decoration: none;
  	padding: 10px 20px;
  	display: inline-block;
  	border-radius: 100px;
  	transition: all .2s;
  	position: relative;
/* :visited 被訪問過的樣式 */
/* :link 還沒被訪問的樣式 */
}

.btn:hover {
  	transform: translateY(-3px);
  	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
/*   	:hover 滑鼠滑過的樣式 */
}

.btn:active {
  	transform: translateY(-1px);
  	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
/*   	:active 滑鼠按下的樣式 */
}

nav{
background-color: rgb(248, 219, 166);
padding-top:30px;
padding-left:30px;
padding-right:30px;
}


</style>
</head>
<body class="bg">

<nav>
	<h1><font face="微軟正黑體">採購系統</font></h1>
	<div class="text-right"><font face="微軟正黑體">
		${user.emp_dep}/${user.emp_name} ${user.emp_job},你好 </font><a
			href='POLogout.controller'><button type="button" class="btn btn-white btn-sm">登出</button></a>
		<hr>
	</div>
</nav>
	<div class="text-center">
<%-- 		<br> <span>${sendok}</span> --%>

		<c:if test="${user.emp_level==1}">
			<div class="card bg-light f">
				<a href='selectprice.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s16.png"></a>
				<div class="card-body">
					<h5 class="card-title">
						<font face="微軟正黑體">待詢價採購單<span class="badge badge-danger">${queryUndoneNo}</span></font> 
					</h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='POManagerSigner.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s15.png"></a>
				<div class="card-body">
					<h5 class="card-title">
						<font face="微軟正黑體">待處理採購單<span class="badge badge-danger">${pOUndoListsNo}</span></font>
					</h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='signedorder.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s17.png"></a>
				<div class="card-body">
					<h5 class="card-title">
						<font face="微軟正黑體">待下單採購單<span class="badge badge-danger">${unPlacedOrderNo}</span></font>
					</h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='placedOrder.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s18.png"></a>
				<div class="card-body">
					<h5 class="card-title">
						<font face="微軟正黑體">待收貨採購單<span class="badge badge-danger">${unReceivedGoodsNo}</span></font>
					</h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='Polist.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s14.png"></a>
				<div class="card-body">
					<h5 class="card-title">
						<font face="微軟正黑體">待處理請款單<span class="badge badge-danger">${noSignInv}</span></font>
					</h5>
				</div>
			</div>
			<br>
			<br>
			<br>
			<div class="card bg-light f">
				<a href='POSignStatement.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s19.png"></a>
				<div class="card-body">
					<h5 class="card-title">
						<font face="微軟正黑體">查詢採購單狀態</font>
					</h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='queryStatus.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s24.png"></a>
				<div class="card-body">
					<h5 class="card-title">
						<font face="微軟正黑體">查詢請款單狀態</font>
					</h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='POFinalStatement.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s2.png"></a>
				<div class="card-body">
					<h5 class="card-title">
					<font face="微軟正黑體">查詢已結案採購單</font>
					</h5>
				</div>
			</div>
			
<!-- 			------- -->
				<div class="card bg-light f">
				<a href='POVendor.jsp' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s23.png"></a>
				<div class="card-body">
					<h5 class="card-title">
					<font face="微軟正黑體">廠商更新</font>
					</h5>
				</div>
			</div>
			
			
		</c:if>
		<c:if test="${user.emp_level==2}">
			<div class="card bg-light f">
				<a href='sendEmployee.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s21.png"></a>
				<div class="card-body">
					<h5 class="card-title">
						<font face="微軟正黑體">待分派採購單<span class="badge badge-danger">${unAssignedEmpNo}</span></font>
					</h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='POManagerSigner.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s15.png"></a>
				<div class="card-body">
					<h5 class="card-title">
						<font face="微軟正黑體">待處理採購單<span class="badge badge-danger">${pOUndoListsNo}</span></font>
					</h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='todoSignInvoice.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s14.png"></a>
				<div class="card-body">
					<h5 class="card-title">
						<font face="微軟正黑體">待審核請款單<span class="badge badge-danger">${noSignInvforBoss}</span></font>
					</h5>
				</div>
			</div>
			<br>
			<br>
			<br>
			<div class="card bg-light f">
				<a href='POSignStatement.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s19.png"></a>
				<div class="card-body">
					<h5 class="card-title">
						<font face="微軟正黑體">查詢採購單狀態</font>
					</h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='queryStatus.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s24.png"></a>
				<div class="card-body">
					<h5 class="card-title">
						<font face="微軟正黑體">查詢請款單狀態</font>
					</h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='POFinalStatement.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s2.png"></a>
				<div class="card-body">
					<h5 class="card-title">
					<font face="微軟正黑體">查詢已結案採購單</font>
					</h5>
				</div>
		</c:if>
	</div>
<!-- 	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" -->
<!-- 		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" -->
<!-- 		crossorigin="anonymous"></script> -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
</body>
</html>