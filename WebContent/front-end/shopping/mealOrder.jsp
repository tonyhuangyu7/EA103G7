<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.meal_order.model.*" %>
<%@ page import="com.meal_order_detail.model.*" %>
<%@ page import="java.util.*" %>

<% 
	String mem_no = "MEM0001";				//模擬假資料
	MealOrderService mealOrderSrv = new MealOrderService();
	List<MealOrderVO> list = mealOrderSrv.searchByMemNo(mem_no);
	request.setAttribute("list", list);
	request.setAttribute("mem_no",mem_no);	//模擬假資料
%>
<jsp:useBean id="mealOrderSrv2" scope="page" class="com.meal_order.model.MealOrderService"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/front-end/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MealOrder</title>
<style>
*{
/* font-family:Microsoft JhengHei; */
/*   box-sizing: border-box; */
/*   margin:0; */
}
.container{
/*   border:2px solid red; */
}
#cate{
text-align:center;
}
.row{
/*   border:1px solid green; */
  height:100px; 
  
}
.col,.col-4,.col-2{
  border:1px dashed black;
}
#header,#content div,#content{
  height:50px;
}
#header div{
background-color: lightgray;
font-weight: bolder;
}
#content a{
color:black;
font-weight: bolder;
}
#content a:hover{
color:darkgray;
font-weight: bolder;
text-decoration: underline;
}
</style>
</head>
<body>
<jsp:include page="/front-end/headfinish.jsp" flush="true"/>
<div class="container">
<div class="row">${mem_no} 的訂餐訂單</div>
  <div id="header" class="row">
    <div class="col-2">訂餐編號：</div>
<!--     <div class="col-2">會員編號：</div> -->
    <div class="col-2">訂餐時間：</div>
    <div class="col-2">預計取餐時間：</div>
    <div class="col">訂單金額：</div>
    <div class="col">通知狀態：</div>
    <div class="col">付款狀態：</div>
    <div class="col">訂單狀態：</div>
  </div>
  <%@ include file="orderPage1.file"%>
<c:forEach var="mealOrderVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
<%-- <c:if test="${mealOrderVO.mem_no == mem_no}"> --%>
    
  
  <div id="content" class="row">
    <div class="col-2"><a href="<%= request.getContextPath() %>/MealOrderServlet.do?meal_order_no=${mealOrderVO.meal_order_no}&action=memOrder&reqURL=<%= request.getServletPath()%>&whichPage=<%= whichPage%>">${mealOrderVO.meal_order_no}</a></div>
<%--     <div class="col-2">${mealOrderVO.mem_no}</div> --%>
    <div class="col-2">${mealOrderSrv2.dateFormat(mealOrderVO.order_time)}</div>
    <div class="col-2">${mealOrderSrv2.dateFormat(mealOrderVO.pickup_time)}</div>
    <div class="col">${mealOrderVO.amount}</div>
    <div class="col">${mealOrderVO.noti_sts == 0 ?'未通知':'已通知'}</div>
    <div class="col">${mealOrderVO.pay_sts == 0?'未付款':'已付款'}</div>
    <div class="col">
    <c:if test="${mealOrderVO.meal_order_sts == 0}">已取消</c:if>
    <c:if test="${mealOrderVO.meal_order_sts == 1}">未派工</c:if>
    <c:if test="${mealOrderVO.meal_order_sts == 2}">已派工</c:if>
    <c:if test="${mealOrderVO.meal_order_sts == 3}">已出餐</c:if>
    <c:if test="${mealOrderVO.meal_order_sts == 4}">已完成</c:if></div>
<%--   	<form action="<%= request.getContextPath() %>/MealOrderServlet.do" method="POST"> --%>
<!--   <div class="col"> -->
<%--   	<input type="hidden" name="meal_order_no" value="${mealOrderVO.meal_order_no}"/> --%>
<!--   	<input type="hidden" name="action" value="search"/> -->
<!--   	<input type="submit" value="訂單詳細"/> -->
<!--   </div> -->
<!--   	</form> -->
  </div>
<%--   </c:if> --%>
  </c:forEach>
  <%@ include file="orderPage2.file"%>
    
</div>
<jsp:include page="/front-end/footer.jsp" flush="true"/>
</body>
</html>