<html>
  <head>
    <meta charset="utf-8">
    <title>Fawlty Towers Guest Registration</title>
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
  Welcome, please complete the form below to register your interest in staying at Fawlty Towers.

  <form action="confirm.jsp" method="POST">
    <label for=name>Name:</label><input type="text" id=name name=name><br>
    <label for=adults>Adults:</label><input type="number" id=adults name=adults value=2 min=1 max=4><br>
    <label for=children>Children:</label><input type="number" id=children name=children value=0 min=0 max=4><br>
    <label for=address>Address:</label><input type="text" id=address name=address><br>
    <label for=suburb>Suburb or Town:</label><input type="text" id=suburb name=suburb><br>
    <label for=postcode>Postcode:</label><input type="text" id=postcode name=postcode><br>
    <label for=tel>Telephone:</label><input type="text" id=tel name=tel><br>
    <label for=in>Arrive:</label><input type="date" id=in name=in class=datepicker><br>
    <label for=out>Depart:</label><input type="date" id=out name=out class=datepicker><br>
    <input type=submit value="Submit">
  </form>
</body>
</html>
