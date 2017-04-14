<%--
  Created by IntelliJ IDEA.
  User: Никита
  Date: 16.08.2016
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--<jsp:useBean id="status" class="java.lang.String" scope="request" />--%>


<fmt:setLocale value="${sessionScope.locale}" />
<fmt:setBundle basename="by.trepam.resources.locale" var="loc" />

<fmt:message bundle="${loc}" key="locale.add_film.create_film" var="create_film" />
<fmt:message bundle="${loc}" key="locale.add_film.download_poster" var="download_poster" />
<fmt:message bundle="${loc}" key="locale.add_film.download_frame" var="download_frame" />
<fmt:message bundle="${loc}" key="locale.add_film.enter_film_title" var="enter_film_title" />
<fmt:message bundle="${loc}" key="locale.add_film.choose_category" var="choose_category" />
<fmt:message bundle="${loc}" key="locale.add_film.choose_country" var="choose_country" />
<fmt:message bundle="${loc}" key="locale.add_film.age_rating" var="age_rating" />
<fmt:message bundle="${loc}" key="locale.add_film.duration" var="duration" />
<fmt:message bundle="${loc}" key="locale.add_film.budget" var="budget" />
<fmt:message bundle="${loc}" key="locale.add_film.studios" var="studios" />
<fmt:message bundle="${loc}" key="locale.add_film.release" var="release" />
<fmt:message bundle="${loc}" key="locale.format" var="format" />
<fmt:message bundle="${loc}" key="locale.enter_in_format" var="enter_in_format" />
<fmt:message bundle="${loc}" key="locale.add_film.description" var="description" />
<fmt:message bundle="${loc}" key="locale.file_format" var="file_format" />
<fmt:message bundle="${loc}" key="locale.choose_image" var="choose_image" />
<fmt:message bundle="${loc}" key="locale.create" var="create" />
<fmt:message bundle="${loc}" key="locale.change" var="change" />
<fmt:message bundle="${loc}" key="locale.change_film.changing_film" var="changing_film" />

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${changing_film}</title>
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
    <h1>${changing_film}</h1>

    <form action="Controller?command=change_film" method="post" enctype="multipart/form-data">

      <input type="hidden" name="id" value="${requestScope.film.id}">

      <br>

      <h4>${download_poster}</h4>
      <input type="file" name="picture">
      <input type="hidden" name="test" value="test">

      <br>

      <h4>${download_frame}</h4>
      <input type="file" name="frame">
      <input type="hidden" name="test" value="test">

      <br>


      <div class=" filmname descline">
        <h4>${enter_film_title}:</h4>
        <input class="form-control" name="title" type="text" value="${requestScope.film.title}" maxlength="100">
      </div>

      <div class="descline">
        <h4>${choose_category}:</h4>
        <div class="category">
          <script type="text/javascript">
            $(document).ready(function() {
              $('#category').multiselect();
            });
          </script>
          <select id="category" name="category" multiple="multiple">
            <c:forEach items="${requestScope.list_category}" var="category">
              <option <c:if test="${requestScope.list_category_film.contains(category)}">selected</c:if> value="${category}">${category}</option>
            </c:forEach>
          </select>
        </div>
      </div>

      <div class="descline">
        <h4>${choose_country}:</h4>
        <div class="country">
          <script type="text/javascript">
            $(document).ready(function() {
              $('#country').multiselect();
            });
          </script>
          <select id="country" name="country" multiple="multiple">
            <c:forEach items="${requestScope.list_country}" var="country">
              <option <c:if test="${requestScope.list_country_film.contains(country)}">selected</c:if> value="${country}">${country}</option>
            </c:forEach>
          </select>
        </div>
      </div>

      <div class=" filmname descline">
        <h4>${age_rating}:</h4>
        <label class="radio-inline"><input type="radio" name="age_rating" <c:if test="${requestScope.film.ageRating.getValue() == '+0'}">checked</c:if> value="+0">+0</label>
        <label class="radio-inline"><input type="radio" name="age_rating" <c:if test="${requestScope.film.ageRating.getValue() == '+6'}">checked</c:if> value="+6">+6</label>
        <label class="radio-inline"><input type="radio" name="age_rating" <c:if test="${requestScope.film.ageRating.getValue() == '+12'}">checked</c:if> value="+12">+12</label>
        <label class="radio-inline"><input type="radio" name="age_rating" <c:if test="${requestScope.film.ageRating.getValue() == '+16'}">checked</c:if> value="+16">+16</label>
        <label class="radio-inline"><input type="radio" name="age_rating" <c:if test="${requestScope.film.ageRating.getValue() == '+18'}">checked</c:if> value="+18">+18</label>
      </div>

      <div class="descline ">
        <h4>${duration}:</h4>
        <input class="form-control " name="duration" required type="number" value="${requestScope.film.length}" min="0" max="2000" >
      </div>

      <div class="descline ">
        <h4>${budget}:</h4>
        <input class="form-control " name="budget" type="number" required value="${requestScope.film.budget}" min="0" max="2000000000" >
      </div>

      <div class="descline ">
        <h4>${studios}:</h4>
        <input class="form-control " name="company" type="text" value="${requestScope.film.company}" maxlength="250" >
      </div>

      <div class="descline ">
        <h4>${release}:</h4>
        <input class="form-control " name="release" type="text" required pattern="\d{1,2}/\d{1,2}/\d{4}"
               title="${enter_in_format}" placeholder="${format}" value="${requestScope.film.getReleaseString()}" >
      </div>

      <div class="descline ">
        <h4>${description}:</h4>
        <fieldset class="form-group">
          <textarea class="form-control" name="description" rows="10">${requestScope.film.description}</textarea>
        </fieldset>
      </div>
      <button type="submit" onclick=" return validate(picture,frame)"   class="btn btnsearch"><span>${change}</span></button>
    </form>
  </div>
  <!--end of forms-->
  <!--footer-->
  <%@include file="/footer.jsp"%>
  <!--end of footer-->
</div>
</body>
</html>
<script type="text/javascript">
  function validate(elem,elem2){
    if(elem.value!='' && elem2.value!=''){
      if(elem.value.match(/\.(jpg|jpeg|png|gif)$/) && elem2.value.match(/\.(jpg|jpeg|png|gif)$/)) {
        return true;
      }else{
        alert("${file_format}");
        elem.focus();
        return false;
      }
    }else {
      alert("${choose_image}");
      elem.focus();
      return false;
    }
  }
</script>