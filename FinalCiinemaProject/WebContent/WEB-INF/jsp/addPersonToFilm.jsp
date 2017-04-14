<%--
  Created by IntelliJ IDEA.
  User: Никита
  Date: 09.08.2016
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="status" class="java.lang.String" scope="request" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.locale}" />
<fmt:setBundle basename="by.trepam.resources.locale" var="loc" />

<fmt:message bundle="${loc}" key="locale.delete" var="delete" />
<fmt:message bundle="${loc}" key="locale.add_peron_to_film.adding" var="adding" />
<fmt:message bundle="${loc}" key="locale.add_peron_to_film.name_second_name" var="name_second_name" />
<fmt:message bundle="${loc}" key="locale.add_peron_to_film.function" var="function" />
<fmt:message bundle="${loc}" key="locale.add_peron_to_film.actor" var="actor" />
<fmt:message bundle="${loc}" key="locale.add_peron_to_film.role" var="role" />
<fmt:message bundle="${loc}" key="locale.add_peron_to_film.screenwriter" var="screenwriter" />
<fmt:message bundle="${loc}" key="locale.add_peron_to_film.director" var="director" />

<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${adding}</title>
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
    <h1>${adding}</h1>

    <div class="description  col-md-12 col-lg-12 col-xs-12 col-sm-12">
      <div class="cast  col-md-12 col-lg-12 col-xs-12 col-sm-12">

        <table class="table tablecast table-striped">
          <thead>
          <tr>
            <th>${name_second_name}</th>
            <th>${function}</th>
            <th>${delete}</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${requestScope.list_person_in_film}" var="person_in_film">
            <tr>
              <td><a href="Controller?command=to_person&person_id=${person_in_film.id}">${person_in_film.firstName} ${person_in_film.lastName}</a></td>
              <td>
                <c:choose>
                  <c:when test="${person_in_film.function =='ACTOR'}">
                    ${actor}
                  </c:when>
                  <c:when test="${person_in_film.function =='DIRECTOR'}">
                    ${director}
                  </c:when>
                  <c:when test="${person_in_film.function =='SCREENWRITER'}">
                    ${screenwriter}
                  </c:when>
                </c:choose>
              </td>
              <td>
                <form method="post" action="Controller">
                  <input type="hidden" name="id" value="${person_in_film.id}">
                  <input type="hidden" name="type_person" value="${person_in_film.function}">
                  <input type="hidden" name="command" value="delete_person_from_film">
                  <button type="submit" class="btn btnsearch" >${delete}</button>
                </form>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>

      </div>
    </div>

    <div class="description  col-md-12 col-lg-12 col-xs-12 col-sm-12">
      <div class="cast  col-md-12 col-lg-12 col-xs-12 col-sm-12">

        <table class="table tablecast table-striped">
          <thead>
          <tr>
            <th>${name_second_name}</th>
            <th>${director}</th>
            <th>${actor}(${role})</th>
            <th>${screenwriter}</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${requestScope.list_person}" var="person">
            <tr>
              <td><a href="Controller?command=to_person&person_id=${person.id}">${person.firstName} ${person.lastName}</a></td>
              <td>
                <form method="post" action="Controller">
                  <input type="hidden" name="id" value="${person.id}">
                  <input type="hidden" name="type_person" value="director">
                  <input type="hidden" name="command" value="add_person_to_film">
                  <button type="submit" class="btn btnsearch" >${director}</button>
                </form>
              </td>
              <td>
                <form method="post" action="Controller">
                  <input type="hidden" name="id" value="${person.id}">
                  <input type="hidden" name="type_person" value="actor">
                  <input type="text" name="role">
                  <input type="hidden" name="command" value="add_person_to_film">
                  <button type="submit" class="btn btnsearch" >${actor}</button>
                </form>
              </td>
              <td>
                <form method="post" action="Controller">
                  <input type="hidden" name="id" value="${person.id}">
                  <input type="hidden" name="type_person" value="screenwriter">
                  <input type="hidden" name="command" value="add_person_to_film">
                  <button type="submit" class="btn btnsearch" >${screenwriter}</button>
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
