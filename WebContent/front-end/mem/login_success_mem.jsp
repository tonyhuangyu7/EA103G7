<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="com.mem.model.*"%>
    
<html>
<head>
<script src="https://kit.fontawesome.com/d6c1e36c40.js" crossorigin="anonymous"></script>
<title>會員登入成功</title>
    
<style>

#container{
  padding-top: 50px;
  padding-bottom: 50px;
  margin:0 auto;
  width: 400px;
}

</style>
    
</head>
<body onload="getInfo()">

	<%@ include file="/front-end/headfinish.jsp"%>

	<div id="container">
<!-- 	<h3 style="margin-left:240px">功能列表</h3><br> -->
<!-- 	<FORM METHOD="post" ACTION="mem.do" name="form1"> -->
<!-- 		<input type="submit" value="個資查詢"  style="margin-left:250px"> -->
<%-- 		<input type="hidden" name="mem_no" value="${memVO2.mem_no}"> --%>
<!-- 		<input type="hidden" name="action" value="check_info"> -->
<!-- 	</FORM> -->
	
<!-- 	<FORM METHOD="post" ACTION="mem.do" name="form1"> -->
<!-- 		<input type="submit" value="個資和密碼修改"  style="margin-left:225px"> -->
<%-- 		<input type="hidden" name="mem_no" value="${memVO2.mem_no}"> --%>
<!-- 		<input type="hidden" name="action" value="Update_info"> -->
<!-- 	</FORM> -->
		
<!-- 	<FORM METHOD="post" ACTION="mem.do" name="form1"> -->
<!-- 		<input type="submit" value="登出"  style="margin-left:265px"> -->
<!-- 		<input type="hidden" name="action" value="logout"> -->
<!-- 	</FORM> -->

	<div class="list-group" style="text-align:center;">
	  <a class="list-group-item list-group-item-action"><i class="fas fa-users"></i>&ensp;會員功能列表</a>
	
	  <a href="<%=request.getContextPath() %>/front-end/mem/mem.do?action=Update_info&mem_no=${memVO2.mem_no}" class="list-group-item list-group-item-action list-group-item-primary"><i class="fas fa-utensils"></i>&ensp;密碼和個資修改</a>
	  <a href="<%=request.getContextPath() %>/front-end/mem/mem.do?action=check_info&mem_no=${memVO2.mem_no}" class="list-group-item list-group-item-action list-group-item-secondary"><i class="fas fa-utensils"></i>&ensp;個資查詢</a>
	  <a href="#" class="list-group-item list-group-item-action list-group-item-danger"><i class="fas fa-utensils"></i>&ensp;紅利專區</a>
	  <a href="#" class="list-group-item list-group-item-action list-group-item-success"></a>
	  <a href="#" class="list-group-item list-group-item-action list-group-item-warning"></a>
	  <a href="#" class="list-group-item list-group-item-action list-group-item-info"></a>
	  <a href="#" class="list-group-item list-group-item-action list-group-item-light"></a>
	  <a href="#" class="list-group-item list-group-item-action list-group-item-dark"></a>
	</div>

	</div>
	
<script>
	// 放在這邊不會有任何作用，小育已測試過...可以刪掉QQ
	//getMyInform 
	function getInfo() {
		$.ajax({
		     url:'<%=request.getContextPath() %>/front_inform/fi.do',
		     method:"POST",
		     dataType:"text",
		     data:{
		         action: 'getMyInform',
		     },
		     success:function(res){ },
		     error:function(err){},
		});
	}
	
</script>
	
	<jsp:include page="/front-end/front/footer.jsp" />
	
</body>
</html>