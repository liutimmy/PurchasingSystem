<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#message{
color:red;
text-size:10px;
}

.right {
	width: 75%;
	float: right;
	text-align: center;
	height: 1500px;
}

.nav nav-tabs {
	width: 75%;
}

.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	margin: 30px;
}


.f {
	/* 方格排列 */
	display: inline-block;
	width: 200px;
	height: 50px;
	margin-bottom: 5px;
}

.imgp {
	/* 	padding: 0px; */
	/* 	font-size: 11px; */
	/* 	margin-right:10px; */
	float: left;
	height: 35px;
	width: 30px;
}

.card-text {
	font-size: 11px;
}

ul {
	font-family: 微軟正黑體;
	font-size: 19px;
}

span {
	margin-left: 1px;
}
</style>
</head>
<%@ include file="../POIncludeforAcc.jsp"%>
<body class="bg">
<c:if test="${not empty sendsuccessmeg}">
		<h2 id="message">${sendsuccessmeg}${inv_id}</h2>
	</c:if>
	<c:if test="${not empty senderrormeg}">
		<h2 id="message">${senderrormeg}</h2>
	</c:if>
	<c:if test="${not empty returnsuccessmeg}">
		<h2 id="message">${returnsuccessmeg}${inv_id}</h2>
	</c:if>
	<c:if test="${not empty returnerrormeg}">
		<h2 id="message">${returnerrormeg}</h2>
	</c:if>

<c:if test="${empty listtodosign and empty backInvoiceSign}">
		<h2>目前無請款單需要簽核</h2>
		<hr>
		<h2>無退回請款單</h2>
</c:if>

<div class="right">
	<c:if test="${not empty listtodosign}">
		<h2>待簽核請款單</h2>
		<hr>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
				<th>請款單單號</th>
				<th>承辦人姓名</th>
				<th>廠商名稱</th>
				<th>總金額</th>
				<th></th>
			</tr>
</thead>
				<tbody>
			<c:forEach var="show" items="${listtodosign}">
				<tr>
					<td>${show.inv_id}</td>
					<td>${show.employeeBean.emp_name}</td>
					<td>${show.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
					<td>$${show.total_price}</td>
					<td><a href="SignInvoiceForm.controller?invid=${show.inv_id}"><button type="button" class="btn btn-primary btn-sm">審核請款單</button></a></td>
				</tr>
			</c:forEach>
		</table>
		</c:if>
		<hr>
		<c:if test="${not empty backInvoiceSign}">
			<h2>退回請款單</h2>
			<table class="table table-striped table-hover">
		<thead>
					<tr>
					<th>請款單單號</th>
					<th>承辦人姓名</th>
					<th>廠商名稱</th>
					<th>總金額</th>
					<th></th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="show2" items="${backInvoiceSign}">
					<tr>
						<td>${show2.inv_id}</td>
						<td>${show2.employeeBean.emp_name}</td>
						<td>${show2.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
						<td>$${show2.total_price}</td>
						<td><a
							href="SignInvoiceFormBack.controller?invid=${show2.inv_id}">查看</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</c:if>
</div>
	<script src="../js/app.js"></script>
</body>
</html>