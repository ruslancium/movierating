<%--
  Created by IntelliJ IDEA.
  User: Никита
  Date: 16.08.2016
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="status" class="java.lang.String" scope="request" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.locale}" />
<fmt:setBundle basename="by.trepam.resources.locale" var="loc" />

<fmt:message bundle="${loc}" key="locale.list_film.changing_films" var="changing_films" />
<fmt:message bundle="${loc}" key="locale.list_film.title" var="title" />
<fmt:message bundle="${loc}" key="locale.changing" var="changing" />
<fmt:message bundle="${loc}" key="locale.deleting" var="deleting" />
<fmt:message bundle="${loc}" key="locale.change" var="change" />
<fmt:message bundle="${loc}" key="locale.delete" var="delete" />



<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${changing_films}</title>
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
    <h1>${changing_films}</h1>

    <div class="description  col-md-12 col-lg-12 col-xs-12 col-sm-12">
      <div class="cast  col-md-12 col-lg-12 col-xs-12 col-sm-12">


        <table class="table tablecast table-striped">
          <thead>
          <tr>
            <th>${title}</th>
            <th>${changing}</th>
            <th>${deleting}</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${requestScope.list_film}" var="film">
            <tr>
              <td><a href="Controller?command=to_film&film_id=${film.id}">${film.title}</a></td>
              <td>
                <form method="post" action="Controller">
                  <input type="hidden" name="id" value="${film.id}">
                  <input type="hidden" name="command" value="to_change_film">
                  <button type="submit" class="btn btnsearch" >${change}</button>
                </form>
              </td>
              <td>
                <form method="post" action="Controller">
                  <input type="hidden" name="id" value="${film.id}">
                  <input type="hidden" name="command" value="delete_film">
                  <button type="submit" class="btn btnsearch" >${delete}</button>
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