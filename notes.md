hotel.jsp - jsp form with provision to accept each field as a value in POST request to be pre-filled. form is POSTd to ReservationServlet
ReservationServlet.java - class to validate input from hotel.jsp. has method valid, returns boolean. If input is valid, displays confirmation, else directs input from request to hotel.jsp
