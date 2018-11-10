<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		background-repeat:no-repeat;
		background-size:100%;
		margin:0;
		padding:0;
		font-family:'微軟正黑體';
		background-attachment:fixed;
	}
	#back{
		z-index:-1;
		width:100%;
		height:100%;
		position:fixed;
		background-color:rgba(255,255,255,0.5);
	}
	.topTen{
		height:70%;
		width:180px;
		background-color: white;
	    font-size: 1.05em;
		top:210px;
		left:0;
		z-index:99;
	    margin-left:10px;
		text-align:center;
	}
	.prolist{
		display: flex;
		width:70%;
		margin:0 auto;
		flex-wrap:wrap;
	}
	.prolist{
	
		display: flex;
		margin:0 auto;
		flex-wrap:wrap;
	}
	.pro{
	    float:left;
		flex: 0 0 33.3;
		margin:10px;
	}
	.pro img{
		width:300px;
		height:300px;
	}
	.pro1{
		flex: 0 0 33.3;
		margin:10px;
	}
	.pro1 img{
		width:100px;
		height:100px;
	}
	.pro p{
		text-align:center;
	}
	.pro input{
		width:120px;
		background-color: white;
		font-size: 1.05em;
	}
	.pro input{
	   margin:20
		width:120px;
		background-color: white;
		font-size: 1.05em;
	}
	#history{
		padding-left:250px;
	}	
</style>
</head>
<body>

<h3>${user.emp_id} ${user.emp_level} ${user.emp_name}</h3>
<c:if test="${empty Categlory}">

<h3>產品大項</h3>
<%-- <form action="<c:url value="/Apply/ApplySend.controller" />" method="post"> --%>
<!-- <select name="Categorly"> -->
<!-- 　<option value="零組件">零組件</option> -->
<!-- 　<option value="PC">PC</option> -->
<!-- 　<option value="主板組件">主板組件</option> -->
<!-- 　<option value="組合材號">組合材料</option> -->
<!-- 　<option value="說明書">說明書</option> -->
<!-- </select> -->
<!-- <input type="submit" value="送出"> -->
<!-- </form> -->
<a href='ApplySend.controller?Categorly=零組件'>零組件</a>
<a href='ApplySend.controller?Categorly=PC'>PC</a>
<a href='ApplySend.controller?Categorly=主板組件'>主板組件</a>
<a href='ApplySend.controller?Categorly=組合材號'>組合材號</a>
<a href='ApplySend.controller?Categorly=說明書'>說明書</a>
</c:if>
<c:if test="${not empty Categlory}">
<h3>產品大項: ${Categlory}</h3>
</c:if>

<c:if test="${cartnumber>0}">
<h3>請購清單: 已加入${cartnumber}項產品</h3>
</c:if>
<h3>${cate}</h3>
<h3>${errors.cate}</h3>
<a href='ApplyShopping.controller?send=search'>請購清單</a>
<%-- <form action="<c:url value="/Apply/ApplyShopping.controller" />" method="post"> --%>
<!-- <Input type='submit' name='send' value='查詢清單'> -->
<!-- </form> -->
 <div class="prolist">
<form action="<c:url value="/Apply/ApplyShoppingaddcart.controller" />" method="post">
<c:forEach var="pro" items="${product}">
<div class='pro'>
<p>料號:${pro.part_no}<p>
<p>產品名稱:${pro.pro_name}<p>
<p>產品大項:${pro.pro_cate}<p>
<p>規格簡述:${pro.pro_spe}<p>
<p>規格詳述:${pro.pro_intro}<p>
<p>平均購買價格:${pro.pro_price}<p>
<p>目前庫存:${pro.pro_amount}<p>
<p>請購數量:<input type="text" name="productamount" value=""><p>
  <Input type='hidden' name=part_no value='${pro.part_no}'><P/>
  <Input type='hidden' name='pro_cate' value='${pro.pro_cate}'><P/>
  <Input type='hidden' name='pro_name' value='${pro.pro_name}'><P/>
  <Input type='hidden' name='pro_spe' value='${pro.pro_spe}'><P/>
  <Input type='hidden' name='pro_intro' value='${pro.pro_intro}'><P/>
  <Input type='hidden' name='pro_price' value='${pro.pro_price}'><P/>
  <Input type='hidden' name='pro_amount' value='${pro.pro_amount}'><P/>
  <Input type='hidden' name='pro_img' value='${pro.pro_img}'><P/>
  <Input type='hidden' name='pro_date' value=''><P/>
</div>
</c:forEach>
 <c:if test="${not empty product}">
 <div class='topTen'>

  <Input type='submit' name='send' value='加入請購清單'>
  </div>
  </c:if>
</form>
</div>

</body>
</html>