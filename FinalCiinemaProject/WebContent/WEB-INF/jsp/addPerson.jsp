<%--
  Created by IntelliJ IDEA.
  User: Никита
  Date: 07.08.2016
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.locale}" />
<fmt:setBundle basename="by.trepam.resources.locale" var="loc" />

<fmt:message bundle="${loc}" key="locale.create" var="create" />

<fmt:message bundle="${loc}" key="locale.add_person.create_person" var="create_person" />
<fmt:message bundle="${loc}" key="locale.add_person.download_photo" var="download_photo" />
<fmt:message bundle="${loc}" key="locale.add_person.enter_name" var="enter_name" />
<fmt:message bundle="${loc}" key="locale.add_person.enter_second_name" var="enter_second_name" />
<fmt:message bundle="${loc}" key="locale.add_person.sex" var="sex" />
<fmt:message bundle="${loc}" key="locale.add_person.enter_birtday" var="enter_birtday" />
<fmt:message bundle="${loc}" key="locale.add_person.enter_place" var="enter_place" />
<fmt:message bundle="${loc}" key="locale.add_person.error_message" var="error_message" />
<fmt:message bundle="${loc}" key="locale.format" var="format" />
<fmt:message bundle="${loc}" key="locale.enter_in_format" var="enter_in_format" />
<fmt:message bundle="${loc}" key="locale.add_person.information" var="information" />
<fmt:message bundle="${loc}" key="locale.add_person.male" var="male" />
<fmt:message bundle="${loc}" key="locale.add_person.female" var="female" />
<fmt:message bundle="${loc}" key="locale.file_format" var="file_format" />
<fmt:message bundle="${loc}" key="locale.choose_image" var="choose_image" />
<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${create_person}</title>
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
    <h1>${create_person}</h1>

    <form action="Controller?command=add_person"  method="post" enctype="multipart/form-data">

      <br>

      <h4>${download_photo}</h4>
      <input type="file" name="picture">
      <input type="hidden" name="test" value="test">

      <br>

      <div class=" filmname descline">
        <h4>${enter_name}:</h4>
        <input class="form-control" name="name" required type="text" maxlength="100">
      </div>

      <div class=" filmname descline">
        <h4>${enter_second_name}:</h4>
        <input class="form-control" name="second_name" required type="text" maxlength="100">
      </div>

      <div class="descline">
        <h4>${sex}:</h4>
      </div>
      <label class="radio-inline"><input type="radio" name="gender" checked value="male">${male}</label>
      <label class="radio-inline"><input type="radio" name="gender" value="female">${female}</label>

      <div class=" filmname descline">
        <h4>${enter_birtday}:</h4>
        <input class="form-control" name="date_of_birth" required type="text" pattern="\d{1,2}/\d{1,2}/\d{4}"
               title="${enter_in_format}" placeholder="${format}">
      </div>

      <div class=" filmname descline">
        <h4>${enter_place}:</h4>
        <input class="form-control" name="place_of_birth" required type="text" maxlength="250">
      </div>

      <div class="descline ">
        <h4>${information}:</h4>
        <fieldset class="form-group">
          <textarea class="form-control" name="description" required rows="10"></textarea>
        </fieldset>
      </div>

      <c:if test="${requestScope.status == true}">
        <div>
          <c:out value="${error_message}" />
        </div>
      </c:if>
      <button type="submit" onclick=" return validate(picture)"  class="btn btnsearch"><span>${create}</span></button>
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
  function validate(elem){
    if(elem.value!=''){
      if(elem.value.match(/\.(jpg|jpeg|png|gif)$/)) {
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