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
    Your room booking is complete. See you soon, <%= givenName %>!<br><br>

    <%@include file="static/detailstable.jspf" %><br>

    <form action="hotel">
      <input type="submit" value="New Reservation">
    </form>
  </body>
</html>

