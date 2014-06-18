<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Fawlty Towers Guest Registration</title>
    <link rel="stylesheet" type="text/css" href="style/hotel.css">
    <link rel="stylesheet" type="text/css" href="style/smoothness/jquery-ui.css">
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

    <form action="confirm.jsp" method="POST">

      <label for=givenname>Given Name:</label><br>
      <input type="text" id=givenname name=givenname><br>

      <label for=sn>Last Name:</label><br>
      <input type="text" id=sn name=sn><br>

      <label for=adults>Adults:</label><br>
      <input type="number" id=adults name=adults value=2 min=1 max=4><br>

      <label for=children>Children:</label><br>
      <input type="number" id=children name=children value=0 min=0 max=4><br>

      <label for=address>Residential Address:</label><br>
      <input type="text" id=address name=address><br>

      <label for=suburb>Suburb or Town:</label><br>
      <input type="text" id=suburb name=suburb><br>

      <label for=state>State:</label><br>
      <select name=state id=state>
        <option value=act>ACT</option>
        <option value=nsw>NSW</option>
        <option value=nt>NT</option>
        <option value=qld>QLD</option>
        <option value=sa>SA</option>
        <option value=tas>TAS</option>
        <option value=vic>VIC</option>
        <option value=wa>WA</option>
      </select><br>

      <label for=postcode>Postcode:</label><br>
      <input type="text" id=postcode name=postcode><br>

      <label for=tel>Telephone:</label><br>
      <input type="text" id=tel name=tel><br>

      <label for=arrive>Arrive:</label><br>
      <input type="date" id=arrive name=arrive class=datepicker><br>

      <label for=depart>Depart:</label><br>
      <input type="date" id=depart name=depart class=datepicker><br>

      <input type=submit value="Submit">
    </form>
  </body>
</html>
