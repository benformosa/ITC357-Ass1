package hotel;

import java.io.*;
import java.text.*;
import java.util.Date;
import java.util.Enumeration;
import javax.servlet.*;
import javax.servlet.http.*;

public class ReservationServlet extends HttpServlet {
  private static final int MAX_ADULTS = 4;
  private static final int MAX_CHILDREN = 4;
  private static final String DATE_FORMAT = "dd/MM/yyyy";

  /*
   * If the input from hotel.jsp is valid, display a confirmation.
   * If it is invalid, forward the response from validate(HttpServlet request) to hotel.jsp.
   */
  protected void doPost(
      HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {

    HttpServletRequest invalid = validate(request);

    if(invalid == null) {
      getServletContext().getRequestDispatcher("/confirm").forward(request, response);
    } else {
      getServletContext().getRequestDispatcher("/").forward(invalid, response);
    }
      }

  /*
   * Given an request, this method tests each parameter against business rules to determine if the request is valid input.
   * In the case of an invalid request, a HttpServletRequest is returned. This can be forwarded to hotel.jsp to pre-fill valid fields and mark invalid fields.
   * A valid request will return null.
   */
  public static HttpServletRequest validate(HttpServletRequest request) {
    HttpServletRequest invalid = request;
    boolean givenname, sn, address, tel, adults, children, date, notPast, departFollowsArrive;

    // simply test that these are not empty
    givenname = isNotEmpty(request.getParameter("givenname"));
    if(!givenname) {
      invalid.setAttribute("givennameempty", "true"); 
    }

    sn = isNotEmpty(request.getParameter("sn"));
    if(!sn) {
      invalid.setAttribute("snempty", "true"); 
    }

    address = isNotEmpty(request.getParameter("address"));
    if(!address) {
      invalid.setAttribute("addressempty", "true"); 
    }

    tel = isNotEmpty(request.getParameter("tel"));
    if(!tel) {
      invalid.setAttribute("telempty", "true"); 
    }

    // must have at least one adult to book, up to a max number
    try {
      int a = Integer.parseInt(request.getParameter("adults"));
      adults = a >= 1 && a <= MAX_ADULTS;
    } catch(NumberFormatException ex) {
      adults = false;
    }

    if(!adults) {
      invalid.setAttribute("adultsoutofrange", "true"); 
    }

    // there is a maximum number of children per room
    // if input is blank or not able to be parsed, assume it is 0
    try {
      int c = Integer.parseInt(request.getParameter("children"));
      children = c <= MAX_CHILDREN;
    } catch(NumberFormatException ex) {
      children = true;
    }

    if(!children) {
      invalid.setAttribute("childrenoutofrange", "true"); 
    }

    // attempt to parse dates into Date
    SimpleDateFormat ft = new SimpleDateFormat(DATE_FORMAT);
    Date arrive = null;
    Date depart = null;
    Date now = new Date();
    date = true;
    notPast = false;
    departFollowsArrive = false;

    // check date format OK
    try {
      arrive = ft.parse(request.getParameter("arrive"));
    } catch(ParseException ex) {
      date = false;
      invalid.setAttribute("arriveinvalid", "true"); 
    }

    // check date format OK
    try {
      depart = ft.parse(request.getParameter("depart"));
    } catch(ParseException ex) {
      date = false;
      invalid.setAttribute("departinvalid", "true"); 
    }

    // if arrive format is OK, we can test if it is in the future
    if(arrive != null) {
      // test that the arrival date is in the future
      notPast = arrive.after(now);
      if(!notPast) {
        invalid.setAttribute("arrivepast", "true"); 
      }

      // if both arrive and depart format OK, we can test if depart follows arrive
      if(depart != null) {
        // test that the departure date is after the arrival date
        departFollowsArrive = depart.after(arrive);
        if(!departFollowsArrive) {
          invalid.setAttribute("arriveafterdepart", "true"); 
        }
      }
    }

    // if all the tests pass, return null. otherwise return the request with all the attibutes set
    if(givenname && sn && adults && children && address && tel && notPast && departFollowsArrive) {
      return null;
    } else {
      return invalid;
    }
  }

  public static boolean isNotEmpty(String s) {
    return(s != null && !s.isEmpty());
  }
}
