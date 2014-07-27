<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Fawlty Towers Guest Registration</title>
    <link rel="stylesheet" type="text/css" href="static/css/hotel.css">
    <link rel="stylesheet" type="text/css" href="static/css/smoothness/jquery-ui.css">
    <script src="static/js/jquery-1.11.1.min.js"></script>
    <script src="static/js/jquery-ui.min.js"></script>
    <script src="static/js/jquery.ui.datepicker-en-AU.js"></script>
    <script>
      $(function() {
        $(".datepicker").datepicker();
      });
    </script>
  </head>
  <body>
    <h1>Fawlty Towers Guest Registration</h1>
    Welcome, please complete the form below to request a reservation.<br><br>


    <form id=reservation action="reservation" method="POST" accept-charset="UTF-8">

      <%-- if givenNameEmpty is null, givenNameEmpty was not set. If givenNameEmpty is not null, it must have been set by validate, so we should prompt the user to fill in givenname --%>
      <% String givenNameEmpty = (String) request.getAttribute("givennameempty"); %>
      <% if(givenNameEmpty != null) { %>
        <label for=givenname class=error>This field must be completed</label><br>
      <% } %>

      <% String givenName = request.getParameter("givenname"); %>
      <% if(givenName == null) { %>
        <% givenName = ""; %>
      <% } %>
      <label for=givenname>Given Name:</label><br>
      <input type="text" id=givenname name=givenname value=<%= givenName %>><br>

      <% String SNEmpty = (String) request.getAttribute("snempty"); %>
      <% if(SNEmpty != null) { %>
        <label for=sn class=error>This field must be completed</label><br>
      <% } %>

      <% String SN = request.getParameter("sn"); %>
      <% if(SN == null) { %>
        <% SN = ""; %>
      <% } %>
      <label for=sn>Last Name:</label><br>
      <input type="text" id=sn name=sn value=<%= SN %>><br>

      <% String adultsOutOfRange= (String) request.getAttribute("adultsoutofrange"); %>
      <% if(adultsOutOfRange != null) { %>
        <label for=adults class=error>Please enter a number of adults between 1 and 4</label><br>
      <% } %>

      <% String adults = request.getParameter("adults"); %>
      <% if(adults == null) { %>
        <% adults = "1"; %>
      <% } %>
      <label for=adults>Adults:</label><br>
      <input type="number" id=adults name=adults min=1 max=4 value=<%= adults %>><br>

      <% String childrenOutOfRange= (String) request.getAttribute("childrenoutofrange"); %>
      <% if(childrenOutOfRange != null) { %>
        <label for=children class=error>Please enter a number of children between 0 and 4</label><br>
      <% } %>

      <% String children = request.getParameter("children"); %>
      <% if(children == null) { %>
        <% children = "0"; %>
      <% } %>
      <label for=children>Children:</label><br>
      <input type="number" id=children name=children min=0 max=4 value=<%= children %>><br>

      <% String addressEmpty = (String) request.getAttribute("addressempty"); %>
      <% if(addressEmpty != null) { %>
        <label for=address class=error>This field must be completed</label><br>
      <% } %>

      <% String address = request.getParameter("address"); %>
      <% if(address == null) { %>
        <% address = ""; %>
      <% } %>
      <label for=address>Residential Address:</label><br>
      <textarea id=address name=address form=reservation><%= address %></textarea><br>

      <% String telEmpty = (String) request.getAttribute("telempty"); %>
      <% if(telEmpty != null) { %>
        <label for=tel class=error>This field must be completed</label><br>
      <% } %>

      <% String tel = request.getParameter("tel"); %>
      <% if(tel == null) { %>
        <% tel = ""; %>
      <% } %>
      <label for=tel>Telephone:</label><br>
      <input type="text" id=tel name=tel value=<%= tel %>><br>

      <% String arriveInvalid = (String) request.getAttribute("arriveinvalid"); %>
      <% String arrivePast = (String) request.getAttribute("arrivepast"); %>
      <% if(arriveInvalid != null) { %>
        <label for=arrive class=error>Please enter a date in the format DD/MM/YYYY</label><br>
      <% } else if(arrivePast != null) { %>
        <label for=arrive class=error>Please enter a date in the future</label><br>
      <% } %>

      <% String arrive = request.getParameter("arrive"); %>
      <% if(arrive == null) { %>
        <% arrive = ""; %>
      <% } %>
      <label for=arrive>Arrive:</label><br>
      <input type="date" id=arrive name=arrive class=datepicker value=<%= arrive %>><br>

      <% String departInvalid = (String) request.getAttribute("departinvalid"); %>
      <% String arriveAfterDepart = (String) request.getAttribute("arriveafterdepart"); %>
      <% if(departInvalid != null) { %>
        <label for=depart class=error>Please enter a date in the format DD/MM/YYYY</label><br>
      <% } else if(arriveAfterDepart != null) { %>
        <label for=depart class=error>Please enter a departure date which is after the arrival date</label><br>
      <% } %>

      <% String depart = request.getParameter("depart"); %>
      <% if(depart == null) { %>
        <% depart = ""; %>
      <% } %>
      <label for=depart>Depart:</label><br>
      <input type="date" id=depart name=depart class=datepicker value=<%= depart %>><br>

      <input type=submit value="Submit">
    </form>
  </body>
</html>
