<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Bonus_Order: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>IBM Bonus_Order: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Bonus_Order: Home</p>

<h3>資料查詢:</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllBonus_Order.jsp'>List</a> all Emps.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/bonus_order/forwarded" >
        <b>請輸入紅利商品訂單編號:</b>
        <input type="text" name="bo_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="bonus_orderSvc" scope="page" class="com.bonus_order.model.Bonus_OrderService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/bonus_order/forwarded" >
       <b>請選擇紅利商品訂單編號:</b>
       <select size="1" name="bo_no">
         <c:forEach var="bonus_orderVO" items="${bonus_orderSvc.all}" > 
          <option value="${bonus_orderVO.bo_no}">${bonus_orderVO.bo_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/bonus_order/forwarded" >
       <b>請選擇會員編號:</b>
       <select size="1" name="bo_no">
         <c:forEach var="bonus_orderVO" items="${bonus_orderSvc.all}" > 
          <option value="${bonus_orderVO.bo_no}">${bonus_orderVO.mem_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>
 

<h3>員工管理</h3>

<ul>
  <li><a href='addBonus_Order.jsp'>Add</a> a new Bonus_Order.</li>
</ul>

</body>
</html>