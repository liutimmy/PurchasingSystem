<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty appmain}">
		
				<h2>待分派採購單 單號:${pomain.po_id}</h2>
			<form action="<c:url value="/Po/sendlist.controller" />" method="post">
			<c:forEach var="pomaindetail" items="${pomain.pO_DetailBean}">
				<p>料號:${pomaindetail.part_No}</p>
				<p>市價:${pomaindetail.market_Price}</p>
				<p>總數量:${pomaindetail.total_Qty}</p>
			</c:forEach>
		<h2>請購單簽核狀態</h2>
		<c:forEach var="appsigningprocess" items="${appmain.app_SigningProcessBean}">
			<p>簽核主管:${appsigningprocess.app_manger} 單據狀態:${appsigningprocess.app_sta} 
			採購單ID:${appsigningprocess.app_id} 簽核日期:${appsigningprocess.sig_date}
			簽核狀態:${appsigningprocess.sig_sta} 簽核建議:${appsigningprocess.sig_sug}</p>			
		</c:forEach>
		<p>指派人<p>
		<select name="employeesend">
		<c:forEach var="empbeansss" items="${empbeans}">
		   <option value='${empbeansss.emp_id}'>${empbeansss.emp_dep} ${empbeansss.emp_name} ${empbeansss.emp_job}		   
		    </option>
		</c:forEach>	 	
		</select>
		<br>
		    簽核意見:<p><textarea rows="5" cols="50"  name="SignSug">
             </textarea><font color="red"></font><p>
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
</body>
</html>