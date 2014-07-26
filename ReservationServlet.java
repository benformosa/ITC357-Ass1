package hotel;

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ReservationServlet extends HttpServlet {
  private final int MAX_ADULTS = 4;
  private final int MAX_CHILDREN = 4;
  private final String DATE_FORMAT = "dd/MM/yyyy";

  /*
   * If the input from hotel.jsp is valid, display a confirmation.
   * If it is invalid, forward the response from validate(HttpServlet request) to hotel.jsp.
   */
  protected void doPost(
      HttpServletRequest request,
      HttpServletResponse response) throws Servlet Exception {

      }

  /*
   * Given an request, this method tests each parameter against business rules to determine if the request is valid input.
   * In the case of an invalid request, a HttpServletResponse is returned. This can be forwarded to hotel.jsp to pre-fill valid fields and mark invalid fields.
   * A valid request will return null.
   */
  public static HttpServletResponse validate(HttpServlet request) throws ParseException {
    boolean givenname, sn, address, tel, adults, children, date;

    // simply test that these are not empty
    givenname = isNotEmpty(request.getParameter("givenname"));
    sn = isNotEmpty(request.getParameter("sn"));
    address = isNotEmpty(request.getParameter("address"));
    tel = isNotEmpty(request.getParameter("tel"));

    // must have at least one adult to book, up to a max number
    try {
      int a = Integer.parseInt(request.getParameter("adults"));
      adults = a >= 1 && a <= MAX_ADULTS;
    catch(NumberFormatException) {
      adults = false;
    }

    // there is a maximum number of children per room
    // if input is blank or not able to be parsed, assume it is 0
    try {
      int c = Integer.parseInt(request.getParameter("children"));
      children = c <= MAX_CHILDREN;
    catch(NumberFormatException) {
      children = true;
    }
    
    // attempt to parse dates into Date
    SimpleDateFormat ft = new SimpleDateFormat(DATE_FORMAT);
    Date arrive, depart;
    Date now = new Date();
    arrive = ft.parse(request.getParameter("arrive"));
    depart = ft.parse(request.getParameter("depart"));

    boolean date = arrive.after(now) && depart.after(arrive);

    return(givenname && sn && adults && children && address && tel && date);
  }

  public static boolean isNotEmpty(String s) {
    return(s != null && !s.isEmpty());
  }
}
