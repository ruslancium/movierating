<%--
  Created by IntelliJ IDEA.
  User: Никита
  Date: 16.08.2016
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="status" class="java.lang.String" scope="request" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.locale}" />
<fmt:setBundle basename="by.trepam.resources.locale" var="loc" />

<fmt:message bundle="${loc}" key="locale.change" var="change" />
<fmt:message bundle="${loc}" key="locale.changing" var="changing" />
<fmt:message bundle="${loc}" key="locale.list_user.changing_users" var="changing_users" />
<fmt:message bundle="${loc}" key="locale.list_user.login" var="login" />
<fmt:message bundle="${loc}" key="locale.list_user.status" var="status" />

<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${changing_users}</title>
  <link type="text/css"  rel="stylesheet"  href="<c:url value="/WebContent/css/bootstrap.min.css"/>" />
  <link type="text/css"  rel="stylesheet" href="<c:url value="/WebContent/css/style.css"/>"/>
</head>
<body>

<div class="container content col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 ">
  <!--navbar-->
  <%@include file="/navbar.jsp"%>
  <!--end of navbar-->
  <!--forms-->
  <div class="searchcontainer col-md-12 col-lg-12">
    <h1>${changing_users}</h1>

    <div class="description  col-md-12 col-lg-12 col-xs-12 col-sm-12">
      <div class="cast  col-md-12 col-lg-12 col-xs-12 col-sm-12">
        <table class="table tablecast table-striped">
          <thead>
          <tr>
            <th>${login}</th>
            <th>${status}</th>
            <th>${changing}</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${requestScope.list_user}" var="user">
            <tr>
              <td><a href="Controller?command=to_user_page&user_id=${user.id}">${user.login}</a></td>
              <td>${user.status}</td>
              <td>
                <form method="post" action="Controller">
                  <input type="hidden" name="user_id" value="${user.id}">
                  <input type="hidden" name="command" value="to_user_page">
                  <button type="submit" class="btn btnsearch">${change}</button>
                </form>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <!--end of forms-->
  <!--footer-->
  <%@include file="/footer.jsp"%>
  <!--end of footer-->
</div>
</body>
</html>