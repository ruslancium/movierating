<%--
  Created by IntelliJ IDEA.
  User: Никита
  Date: 29.08.2016
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="status" class="java.lang.String" scope="request" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.locale}" />
<fmt:setBundle basename="by.trepam.resources.locale" var="loc" />

<fmt:message bundle="${loc}" key="locale.change_user.change_profile" var="change_profile" />
<fmt:message bundle="${loc}" key="locale.change_user.download_photo" var="download_photo" />
<fmt:message bundle="${loc}" key="locale.change_user.enter_name" var="enter_name" />
<fmt:message bundle="${loc}" key="locale.change_user.enter_second_name" var="enter_second_name" />
<fmt:message bundle="${loc}" key="locale.change_user.sex" var="sex" />
<fmt:message bundle="${loc}" key="locale.change_user.male" var="male" />
<fmt:message bundle="${loc}" key="locale.change_user.female" var="female" />
<fmt:message bundle="${loc}" key="locale.change_user.enter_birthday" var="enter_birthday" />
<fmt:message bundle="${loc}" key="locale.change_user.information" var="information" />
<fmt:message bundle="${loc}" key="locale.change" var="change" />
<fmt:message bundle="${loc}" key="locale.file_format" var="file_format" />
<fmt:message bundle="${loc}" key="locale.choose_image" var="choose_image" />
<fmt:message bundle="${loc}" key="locale.format" var="format" />
<fmt:message bundle="${loc}" key="locale.enter_in_format" var="enter_in_format" />


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${change_profile}</title>
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
    <h1>${change_profile}</h1>

      <br>

      <form action="Controller?command=change_user" method="post" enctype="multipart/form-data">
          <h4>${download_photo}</h4>
          <input type="file" name="picture">
          <input type="hidden" name="test" value="test">
          <c:out value="${status}" />

      <input type="hidden" name="id" value="${requestScope.user.id}">

      <br>

      <div class=" filmname descline">
        <h4>${enter_name}:</h4>
        <input class="form-control" name="first_name" type="text" value="${requestScope.user.firstName}" maxlength="100">
      </div>

      <div class=" filmname descline">
        <h4>${enter_second_name}:</h4>
        <input class="form-control" name="last_name" type="text" value="${requestScope.user.lastName}" maxlength="100">
      </div>

      <div class="descline">
        <h4>${sex}:</h4>
      </div>
        <label class="radio-inline"><input type="radio" name="gender" <c:if test="${requestScope.user.gender == 'MALE'}">checked</c:if> <c:if test="${requestScope.user.gender == null}">checked</c:if>  value="male">${male}</label>
        <label class="radio-inline"><input type="radio" name="gender" <c:if test="${requestScope.user.gender == 'FEMALE'}">checked</c:if>  value="female">${female}</label>


      <div class=" filmname descline">
        <h4>${enter_birthday}:</h4>
        <input class="form-control" name="date_of_birth" required pattern="\d{1,2}/\d{1,2}/\d{4}"
               title="${enter_in_format}" placeholder="${format}" value="${requestScope.user.getBirthString()}" type="text">
      </div>

      <div class="descline ">
        <h4>${information}:</h4>
        <fieldset class="form-group">
          <textarea class="form-control" name="description" rows="10">${requestScope.user.information}</textarea>
        </fieldset>
      </div>



      <button type="submit" onclick=" return validate(picture)"  class="btn btnsearch"><span>${change}</span></button>
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