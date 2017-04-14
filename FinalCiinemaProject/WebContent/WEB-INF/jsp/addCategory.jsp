<%--
  Created by IntelliJ IDEA.
  User: Никита
  Date: 05.08.2016
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.locale}" />
<fmt:setBundle basename="by.trepam.resources.locale" var="loc" />

<fmt:message bundle="${loc}" key="locale.add_category.category_name" var="category_name" />
<fmt:message bundle="${loc}" key="locale.add_category.delete_category" var="delete_category" />
<fmt:message bundle="${loc}" key="locale.delete" var="delete" />
<fmt:message bundle="${loc}" key="locale.add_category.enter_category_name" var="enter_category_name" />
<fmt:message bundle="${loc}" key="locale.add_category.error_message" var="error_message" />
<fmt:message bundle="${loc}" key="locale.create" var="create" />

<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${editing_categories}</title>
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
    <h1>${editing_categories}</h1>

    <div class="description  col-md-12 col-lg-12 col-xs-12 col-sm-12">
      <div class="cast  col-md-12 col-lg-12 col-xs-12 col-sm-12">


          <table class="table tablecast table-striped">
            <thead>
            <tr>
              <th>${category_name}</th>
              <th>${delete_category}</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.list_category}" var="category">
              <tr>
                <td>${category}</td>
                <td>
                  <form method="post" action="Controller">
                    <input type="hidden" name="id" value="${category.id}">
                    <input type="hidden" name="command" value="delete_category">
                    <button type="submit" class="btn btnsearch" >${delete}</button>
                  </form>
                </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>

      </div>
    </div>

    <form method="post" action="Controller">
      <input type="hidden" name="command" value="add_category">
      <div class=" filmname descline">
        <h4>${enter_category_name}:</h4>
        <input class="form-control" name="category" required type="text" maxlength="45">
      </div>
      <c:if test="${requestScope.status == true}">
        <div>
        <c:out value="${error_message}" />
        </div>
      </c:if>
      <button type="submit" class="btn btnsearch"><span>${create}</span></button>
    </form>
  </div>
  <!--end of forms-->
  <!--footer-->
  <%@include file="/footer.jsp"%>
  <!--end of footer-->
</div>
</body>
</html>
