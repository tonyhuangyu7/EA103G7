<%@page import="com.time_peri.model.TimePeriService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.res_order.model.*"%>
<%
	ResOrderService resOrderSvc = new ResOrderService();
	List<ResOrderVO> list = resOrderSvc.getOneMemberResOrder("MEM0010", "end");
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員訂位歷史紀錄</title>
<link rel=stylesheet type="text/css" href="<%=request.getContextPath()%>/front-end/css/getMemberResSeat.css">
<jsp:include page="/front-end/headfinish.jsp"></jsp:include>

<style>
#table-1, #table-1 td {
	background: #555;
    color: #fff;
	border: 0;
	width: 100%;
	border-radius: 5px;
	text-align: center;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

</style>

</head>
<body>
<div class="container get_member_res_seat" >
<table id="table-1">
	<tr>
		<td><h3 style="margin-bottom:0;">訂位歷史紀錄</h3></td>
	</tr>
</table>
<table class="table table-striped table-hover mx-auto w-auto">
	<tr>
		<th>桌位</th>
		<th>訂餐編號</th>
		<th>預約訂位日期</th>
		<th>用餐時段</th>
		<th>人數</th>
		<th>訂位狀態</th>
	</tr>
	<%@ include file="pages/page1.file"%>
	<jsp:useBean id="map_info_sts" class="java.util.HashMap"/>
		<c:set target="${map_info_sts}" property="2" value="完成"/>
		<c:set target="${map_info_sts}" property="3" value="取消訂位"/>
	<jsp:useBean id="timePeriSvc" scope="page" class="com.time_peri.model.TimePeriService" />
	<jsp:useBean id="resDetailSvc" scope="page" class="com.res_detail.model.ResDetailService" />
	<jsp:useBean id="seatSvc" scope="page" class="com.seat.model.SeatService" />
	<c:forEach var="resOrderVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	<c:if test="${resOrderVO.info_sts gt 1}">
		<tr>
			<td>
				<c:forEach var="resDetailVO" items="${resDetailSvc.getAllResNO(resOrderVO.res_no)}">
					${seatSvc.getOneSeat(resDetailVO.seat_no).seat_f}樓_${seatSvc.getOneSeat(resDetailVO.seat_no).seat_name}桌<br> 
				</c:forEach>
			</td>
			<td>
				<c:if test="${not empty resOrderVO.meal_order_no}">
					${resOrderVO.meal_order_no}
				</c:if> 
				<c:if test="${empty resOrderVO.meal_order_no}">
					<c:if test="${resOrderVO.info_sts gt 1}">  
						<input type="hidden" name="res_no" value="${resOrderVO.res_no}">
						<font color="red">未訂餐</font><br>
					</c:if>
				</c:if>
			</td>
<!-- 			<td> -->
<%-- 				${resOrderVO.mem_no} --%>
<!-- 			</td> -->
<!-- 			<td> -->
<%-- 				<c:if test="${not empty resOrderVO.emp_no}"> --%>
<%-- 					${resOrderVO.emp_no} --%>
<%-- 				</c:if>  --%>
<%-- 				<c:if test="${empty resOrderVO.emp_no}"> --%>
<!-- 					無 -->
<%-- 				</c:if> --%>
<!-- 			</td> -->
<!-- 			<td> -->
<%-- 				<fmt:formatDate value="${resOrderVO.res_time}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
<!-- 			</td> -->
			<td>
				${resOrderVO.res_date}
			</td>
			<td>
				${timePeriSvc.getOneTimePeri(resOrderVO.time_peri_no).time_start}
			</td>
			<td>
				${resOrderVO.people}
			</td>
			<td>
				<c:forEach  var="item" items="${map_info_sts}">
					<c:if test="${item.key eq resOrderVO.info_sts}">
						<c:if test="${item.key eq 3}">
							<font style="color: red" >${item.value}</font>
						</c:if>
						<c:if test="${item.key ne 3}">
							<font style="color: blue" >${item.value}</font>
						</c:if>
					</c:if>
				</c:forEach>
			</td>
		</tr>
		</c:if>
	</c:forEach>
</table>

<%@ include file="pages/page2.file"%>
<input class="btn btn-primary" type="button" value="回首頁" onclick="location.href='<%=request.getContextPath()%>/back-end/seat_obj/addSeatObj.jsp'">
<input class="btn btn-secondary" type="button" value="回桌訂位畫面" onclick="location.href='<%=request.getContextPath()%>/front-end/res_order/orderSeat.jsp'">
</div>
<footer>
<jsp:include page="/front-end/footer.jsp"></jsp:include>
</footer>
<script src="<%=request.getContextPath()%>/front-end/js/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/front-end/js/sweetalert.min.js"></script>
<script src="<%=request.getContextPath()%>/front-end/js/getMemberResSeatEnd.js"></script>
</body>
</html>