<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Fawlty Towers Guest Registration</title>
    <link rel="stylesheet" type="text/css" href="css/hotel.css">
    <link rel="stylesheet" type="text/css" href="css/smoothness/jquery-ui.css">
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.ui.datepicker-en-AU.js"></script>
    <script>
      $(function() {
        $(".datepicker").datepicker();
      });
    </script>
  </head>
  <body>
    <h1>Fawlty Towers Guest Registration</h1>
    Welcome, please complete the form below to request a reservation.<br><br>


    <form id=reservation action="reservation" method="POST">

      <%-- if givenNameEmpty is null, givenNameEmpty was not set. If givenNameEmpty is not null, it must be true, so we should prompt the user to fill in givenname --%>
      <% String givenNameEmpty = (String) request.getAttribute("givennameempty"); %>
      <% if(!(givenNameEmpty == null)) { %>
        <label for=givenname class=error>This field must be completed</label><br>
      <% } %>

      <% String givenName = request.getParameter("givenname"); %>
      <% if(givenName == null) { %>
        <% givenName = ""; %>
      <% } %>
      <label for=givenname>Given Name:</label><br>
      <input type="text" id=givenname name=givenname value=<%= givenName %> ><br>

      <% String SNEmpty = (String) request.getAttribute("snempty"); %>
      <% if(!(SNEmpty == null)) { %>
        <label for=sn class=error>This field must be completed</label><br>
      <% } %>

      <% String SN = request.getParameter("sn"); %>
      <% if(SN == null) { %>
        <% SN = ""; %>
      <% } %>
      <label for=sn>Last Name:</label><br>
      <input type="text" id=sn name=sn value=<%= SN %> ><br>

      <% String adultsOutOfRange= (String) request.getAttribute("adultsoutofrange"); %>
      <% if(!(adultsOutOfRange == null)) { %>
        <label for=address class=error>Please enter a number of adults between 1 and 4</label><br>
      <% } %>

      <% String adults = request.getParameter("adults"); %>
      <% if(adults == null) { %>
        <% adults = ""; %>
      <% } %>
      <label for=adults>Adults:</label><br>
      <input type="number" id=adults name=adults value=2 min=1 max=4 value=${param.children}><br>

      <% String childrenOutOfRange= (String) request.getAttribute("childrenoutofrange"); %>
      <% if(!(childrenOutOfRange == null)) { %>
        <label for=address class=error>Please enter a number of children between 0 and 4</label><br>
      <% } %>

      <% String children = request.getParameter("children"); %>
      <% if(children == null) { %>
        <% children = ""; %>
      <% } %>
      <label for=children>Children:</label><br>
      <input type="number" id=children name=children value=0 min=0 max=4 value={param.children}><br>

      <% String addressEmpty = (String) request.getAttribute("addressempty"); %>
      <% if(!(addressEmpty == null)) { %>
        <label for=address class=error>This field must be completed</label><br>
      <% } %>

      <% String address = request.getParameter("address"); %>
      <% if(address == null) { %>
        <% address = ""; %>
      <% } %>
      <label for=address>Residential Address:</label><br>
      <textarea id=address name=address form=reservation><%= address %></textarea><br>

      <% String telEmpty = (String) request.getAttribute("telempty"); %>
      <% if(!(telEmpty == null)) { %>
        <label for=tel class=error>This field must be completed</label><br>
      <% } %>

      <% String tel = request.getParameter("tel"); %>
      <% if(tel == null) { %>
        <% tel = ""; %>
      <% } %>
      <label for=tel>Telephone:</label><br>
      <input type="text" id=tel name=tel value=<%= tel %> ><br>

      <% String arriveInvalid = (String) request.getAttribute("arriveinvalid"); %>
      <% String arrivePast = (String) request.getAttribute("arrivepast"); %>
      <% if(!(arriveInvalid == null)) { %>
        <label for=tel class=error>Please enter a date in the format DD/MM/YYYY</label><br>
      <% } else if(!(arrivePast == null)) { %>
        <label for=tel class=error>Please enter a date in the future</label><br>
      <% } %>

      <% String arrive = request.getParameter("arrive"); %>
      <% if(arrive == null) { %>
        <% arrive = ""; %>
      <% } %>
      <label for=arrive>Arrive:</label><br>
      <input type="date" id=arrive name=arrive class=datepicker value=<%= arrive %> ><br>

      <% String departInvalid = (String) request.getAttribute("departinvalid"); %>
      <% String arriveAfterDepart = (String) request.getAttribute("arriveafterdepart"); %>
      <% if(!(departInvalid == null)) { %>
        <label for=tel class=error>Please enter a date in the format DD/MM/YYYY</label><br>
      <% } else if(!(arriveAfterDepart == null)) { %>
        <label for=tel class=error>Please enter a departure date which is after the arrival date</label><br>
      <% } %>

      <% String depart = request.getParameter("depart"); %>
      <% if(depart == null) { %>
        <% depart = ""; %>
      <% } %>
      <label for=depart>Depart:</label><br>
      <input type="date" id=depart name=depart class=datepicker value=<%= depart %> ><br>

      <input type=submit value="Submit">
    </form>
  </body>
</html>
