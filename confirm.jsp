<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Fawlty Towers Guest Registration</title>
    <link rel="stylesheet" type="text/css" href="style/hotel.css">
  </head>
  <body>
    <h1>Fawlty Towers Guest Registration</h1>
    Thank you for making a reservation, <%= request.getParameter("givenname") %><br><br>


    <table>
      <tr>
        <th colspan=2>Your details:</th>
      </tr>
      <tr>
        <td>Name</td>
        <td><%= request.getParameter("givenname") %> <%= request.getParameter("sn") %></td>
      </tr>
      <tr>
        <td>Adults</td>
        <td><%= request.getParameter("adults") %></td>
      </tr>
      <tr>
        <td>Children</td>
        <td><%= request.getParameter("children") %></td>
      </tr>
      <tr>
        <td>Address</td>
        <td><%= request.getParameter("address") %></td>
      </tr>
      <tr>
        <td>Suburb or Town</td>
        <td><%= request.getParameter("suburb") %></td>
      </tr>
      <tr>
        <td>State</td>
        <td><%= request.getParameter("state").toUpperCase() %></td>
      </tr>
      <tr>
        <td>Postcode</td>
        <td><%= request.getParameter("postcode") %></td>
      </tr>
      <tr>
        <td>Telephone</td>
        <td><%= request.getParameter("tel") %></td>
      </tr>
      <tr>
        <td>Arrive</td>
        <td><%= request.getParameter("arrive") %></td>
      </tr>
      <tr>
        <td>Depart</td>
        <td><%= request.getParameter("depart") %></td>
      </tr>
    </table>
  </body>
</html>
