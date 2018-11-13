<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../POInclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/POcss.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>採購分派作業</title>
</head>
<body>
	<c:if test="${not empty appmain}">
		
			<h2>待分派採購單 單號:${pomain.po_id}</h2>
			<form action="<c:url value="/Po/sendlist.controller" />" method="post">
			<c:forEach var="pomaindetail" items="${pomain.pO_DetailBean}">
				<p>項目:${pomaindetail.productListBean.pro_cate}</p>
				<p>料號:${pomaindetail.part_No}</p>
				<p>物料名稱:${pomaindetail.productListBean.pro_name}</p>
				<p>市價:${pomaindetail.market_Price}</p>
				<p>請購總數量:${pomaindetail.total_Qty}</p>
				<p>預估該項產品總金額:${pomaindetail.total_Qty*pomaindetail.market_Price}</p>
				<p>目前庫存:${pomaindetail.productListBean.pro_amount}</p>
			</c:forEach>
			<p>預估請購總金額: ${appmain.app_price}<p>
		<h2>請購單簽核情形 請購單編號 :${appmain.app_id}</h2>
		<c:forEach var="appsigningprocess" items="${appmain.app_SigningProcessBean}">
			<c:if test="${appsigningprocess.sig_rank==1}">
			<p>簽核同仁:${appsigningprocess.employeeBean.emp_dep} 
			${appsigningprocess.employeeBean.emp_name}
			${appsigningprocess.employeeBean.emp_job}
			 單據狀態:${appsigningprocess.app_sta} 
			 簽核日期:${appsigningprocess.sig_date}
			簽核狀態:${appsigningprocess.sig_sta} 簽核建議:${appsigningprocess.sig_sug}</p>	
				</c:if>			
		  </c:forEach>
			<c:forEach var="appsigningprocess" items="${appmain.app_SigningProcessBean}">
			<c:if test="${appsigningprocess.sig_rank==2}">
			<p>簽核主管:${appsigningprocess.employeeBean.emp_dep} 
			${appsigningprocess.employeeBean.emp_name}
			${appsigningprocess.employeeBean.emp_job}
			 單據狀態:${appsigningprocess.app_sta} 
			 簽核日期:${appsigningprocess.sig_date}
			簽核狀態:${appsigningprocess.sig_sta} 簽核建議:${appsigningprocess.sig_sug}</p>	
				</c:if>	
			</c:forEach>
			<c:forEach var="appsigningprocess" items="${appmain.app_SigningProcessBean}">
			<c:if test="${appsigningprocess.sig_rank==3}">
			<p>總經理:${appsigningprocess.employeeBean.emp_name}
			${appsigningprocess.employeeBean.emp_job}
			 單據狀態:${appsigningprocess.app_sta} 
			 簽核日期:${appsigningprocess.sig_date}
			簽核狀態:${appsigningprocess.sig_sta} 簽核建議:${appsigningprocess.sig_sug}</p>	
				</c:if>	
			</c:forEach>
				
		<p>指派人<p>
		<select name="employeesend">
		<c:forEach var="empbeansss" items="${empbeans}">
		   <option value='${empbeansss.emp_id}'>${empbeansss.emp_dep} ${empbeansss.emp_name} ${empbeansss.emp_job}		   
		    </option>
		</c:forEach>	 	
		</select>
		<br>
		    分派意見:<p><textarea rows="5" cols="50"  name="SignSug"></textarea></p>
	       	<Input type='hidden' name='po_manger' value='${SigningProcess.po_manger}'>
			<Input type='hidden' name='po_sta' value='${SigningProcess.po_sta}'>
		    <Input type='hidden' name='po_id' value='${SigningProcess.po_id}'>
			<Input type='hidden' name='sig_date' value='${SigningProcess.sig_date}'>
			<Input type='hidden' name='sig_sta' value='${seSigningProcessndl1.sig_sta}'>
			<Input type='hidden' name='sig_sug' value='${SigningProcess.sig_sug}'>
			<Input type='hidden' name='sig_rank' value='${SigningProcess.sig_rank}'>
			<Input type='submit' name='send' value='送出'>
		</form>
	</c:if>
	<c:if test="${not empty nosendlist}">
	<h2>${ nosendlist}</h2>
	</c:if>
	<%-- 	<c:if test="${not empty pomain}"> --%>
	<%-- 		<h2>${appmain.app_id}</h2> --%>
	<!-- 		<form action="" method="post"> -->
	<%-- 			<c:forEach var="appmaindetail" items="${appmain.appDetailBean}"> --%>
	<%-- 			<p>料號:${appmaindetail.part_no}</p> --%>
	<%-- 			<p>市價:${appmaindetail.pro_price}</p> --%>
	<%-- 			<p>總數量:${appmaindetail.app_amount}</p> --%>
	<%-- 			</c:forEach> --%>
	<!-- 		</form>		 -->
	<%-- 	</c:if> --%>
<script src="../js/app.js"></script>
</body>
</html>