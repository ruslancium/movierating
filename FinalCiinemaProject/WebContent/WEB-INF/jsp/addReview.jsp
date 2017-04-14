<%--
  Created by IntelliJ IDEA.
  User: Никита
  Date: 01.09.2016
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.locale}" />
<fmt:setBundle basename="by.trepam.resources.locale" var="loc" />

<fmt:message bundle="${loc}" key="locale.add_review.review" var="review" />
<fmt:message bundle="${loc}" key="locale.add_review.your_mark" var="your_mark" />
<fmt:message bundle="${loc}" key="locale.add_review.your_review" var="your_review" />
<fmt:message bundle="${loc}" key="locale.add_review.estimate" var="estimate" />
<fmt:message bundle="${loc}" key="locale.add_review.create_review" var="create_review" />

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${create_review}</title>
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
    <h1>${review}<a href="Controller?command=to_film&film_id=${requestScope.film_id}"> ${requestScope.film_title}</a></h1>
    <form action="Controller" method="post" id="review">
      <input type="hidden" name="command" value="add_review">
      <input type="hidden" name="film_id" value="${requestScope.film_id}">
      <input type="hidden" name="user_id" value="${requestScope.user_id}">
      <div class="reviewrating">
        <div class="descline">
          <h4>${your_mark}:</h4>
        </div>
        <c:forEach begin="1" end="10" var="val">
          <label class="radio-inline"><input type="radio" name="grade" value="${val}">${val}</label>
        </c:forEach>
        <div class="descline">
          <h4>${your_review}:</h4>
        </div>
        <fieldset class="form-group">
          <textarea class="form-control" name="review_text"  required  rows="10"></textarea>
        </fieldset>
        <button type="submit" class="btn"><span>${estimate}</span></button>
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
