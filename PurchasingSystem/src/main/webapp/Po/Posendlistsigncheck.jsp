<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<c:url value="/Po/podetailupdate.controller" />" method="post">
  <h2>採購單編號: ${poid1}</h2>
  <p>選擇廠商: ${AllPO_Vendors.vendor_name}<p>
   <Input type='hidden' name='AllPO_Vendors' value='${AllPO_Vendors.vendor_id}'>
<c:forEach var="Podetailbeans1" items="${Podetailbeans}">
<p>料號:${Podetailbeans1.part_No}<p>
<p>請購數量: ${Podetailbeans1.total_Qty}<p>
<p>預估價格: ${Podetailbeans1.market_Price}元<p>
<p>實際採購數量: ${Podetailbeans1.quotation}<p>
<p>實際採購價格: ${Podetailbeans1.total_Price}元<p>
<p>該物料總價格: ${Podetailbeans1.total_Price*Podetailbeans1.quotation}元<p>
	  <Input type='hidden' name='po_id' value='${Podetailbeans1.po_id}'>
     <Input type='hidden' name='part_No' value='${Podetailbeans1.part_No}'>
	 <Input type='hidden' name='market_Price' value='${Podetailbeans1.market_Price}'>
	<Input type='hidden' name='quotation' value='${Podetailbeans1.quotation}'>
	<Input type='hidden' name='total_Price' value='${Podetailbeans1.total_Price}'>
  <Input type='hidden' name='total_Qty' value='${Podetailbeans1.total_Qty}'>
</c:forEach>
<p>總採購價格 ${allListprice} 元<p>
<Input type='hidden' name='allListprice' value='${allListprice}'>
<p>簽和順序 1:
<select name="pomanger">
		<c:forEach var="pomangers1" items="${pomangers}">
		   <option value='${pomangers1.emp_id}'>採購部主管: ${pomangers1.emp_name} ${pomangers1.emp_job}		   
		    </option>
		</c:forEach>	 	
		</select><p>
<c:if test='${not empty boss}'>
<p>簽和順序 2: ${boss.emp_job}: ${boss.emp_name}  <p>
  <Input type='hidden' name='boss' value='${boss.emp_id}'>
</c:if>
    簽核意見:<p><textarea rows="5" cols="50"  name="SignSug"></textarea></p>
  <Input type='hidden' name='posta1' value='${posta1}'>
   <Input type='hidden' name='poid1' value='${poid1}'>	 
<p><Input type='submit' name='send' value='重新輸入'><p>
<p><Input type='submit' name='send' value='送出'><p>
</form>
</body>
</html>