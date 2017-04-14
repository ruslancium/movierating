<%--
  Created by IntelliJ IDEA.
  User: Никита
  Date: 19.09.2016
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.locale}" />
<fmt:setBundle basename="by.trepam.resources.locale" var="loc" />

<fmt:message bundle="${loc}" key="locale.change_user_status.changing_status" var="changing_status" />
<fmt:message bundle="${loc}" key="locale.change_user_status.status" var="status" />
<fmt:message bundle="${loc}" key="locale.change" var="change" />


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${changing_status}</title>
  <link type="text/css"  rel="stylesheet"  href="<c:url value="/WebContent/css/bootstrap.min.css"/>" />
  <link type="text/css"  rel="stylesheet" href="<c:url value="/WebContent/css/style.css"/>"/>
</head>
<body>

<div class="container content col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 ">
  <!--navbar-->
  <%@include file="/navbar.jsp"%>
  <!--end of navbar-->
  <!--forms-->
  <div class="titlereview col-md-12 col-lg-12">
    <h1>${changing_status}</h1>
    <form action="Controller" method="post" id="review">
      <input type="hidden" name="command" value="change_user_status">
      <input type="hidden" name="user_id" value="${requestScope.user_id}">
      <div class="reviewrating">
        <div class="descline">
          <h4>${status}:</h4>
          <input name="user_status" required type="number" value="${requestScope.user_status}">
        </div>
        <button type="submit" class="btn"><span>${change}</span></button>
      </div>
    </form>
  </div>
  <!--end of forms-->
  <!--footer-->
  <%@include file="/footer.jsp"%>
  <!--end of footer-->
</div>
</body>
</html>