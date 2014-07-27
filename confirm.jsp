<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Fawlty Towers Guest Registration</title>
    <link rel="stylesheet" type="text/css" href="static/css/hotel.css">
  </head>
  <%@include file="static/loaddetails.jspf" %>
  <body>
    <h1>Fawlty Towers Guest Registration</h1>
    Thanks <%= givenName %>, please check your details below and click Edit or Confirm.<br><br>

    <%@include file="static/detailstable.jspf"%><br>

    <form id=editreservation action="hotel" method="POST" accept-charset="UTF-8">
      <%@include file="static/hiddenform.jspf" %>
      <input type="submit" value="Edit">
    </form><br>

    <form id=confirmreservation action="final" method="POST" accept-charset="UTF-8">
      <%@include file="static/hiddenform.jspf" %>
      <input type="submit" value="Confirm">
    </form><br>

    <form action="hotel">
      <input type="submit" value="Cancel">
    </form>
  </body>
</html>
