package hotel;

import java.io.*;
import java.text.*;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;

public class ReservationServlet extends HttpServlet {
  private static final int MAX_ADULTS = 4;
  private static final int MAX_CHILDREN = 4;
  private static final String DATE_FORMAT = "dd/MM/yyyy";

  protected void doGet(
      HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    out.println(
        "<!DOCTYPE html>\n"
        + "<html>\n"
        + "<head>\n"
        + "</head>\n"
        + "<body>\n"
        + "<h1>NOOOOPE</h1>\n"
        + "</body>\n"
        + "</html>"
        );
    out.close();
      }
  /*
   * If the input from hotel.jsp is valid, display a confirmation.
   * If it is invalid, forward the response from validate(HttpServlet request) to hotel.jsp.
   */
  protected void doPost(
      HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {

    HttpServletRequest invalid = validate(request);

    if(invalid == null) {
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = response.getWriter();
      out.println(confirm(request));
      out.close();
    } else {
      getServletContext().getRequestDispatcher("hotel.jsp").forward(invalid, response);
    }
      }

  /*
   * Given an request, this method tests each parameter against business rules to determine if the request is valid input.
   * In the case of an invalid request, a HttpServletRequest is returned. This can be forwarded to hotel.jsp to pre-fill valid fields and mark invalid fields.
   * A valid request will return null.
   */
  public static HttpServletRequest validate(HttpServletRequest request) {
    HttpServletRequest invalid = null;
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
    date = false;
    notPast = false;
    departFollowsArrive = false;

    try {
      arrive = ft.parse(request.getParameter("arrive"));
    } catch(ParseException ex) {
      date = false;
      invalid.setAttribute("arriveinvalid", "true"); 
    }

    try {
      depart = ft.parse(request.getParameter("depart"));
    } catch(ParseException ex) {
      date = false;
      invalid.setAttribute("departinvalid", "true"); 
    }

    if(date) {
      // test that the arrival date is in the future
      notPast = arrive.after(now);
      if(!notPast) {
        invalid.setAttribute("arrivepast", "true"); 
      }

      // test that the departure date is after the arrival date
      departFollowsArrive = depart.after(arrive);
      if(!departFollowsArrive) {
        invalid.setAttribute("arriveafterdepart", "true"); 
      }
    }

    if(givenname && sn && adults && children && address && tel && notPast && departFollowsArrive) {
      return null;
    } else {
      return invalid;
    }
  }

  public static boolean isNotEmpty(String s) {
    return(s != null && !s.isEmpty());
  }

  public String confirm(HttpServletRequest request) {
    return "<!DOCTYPE html>"
      + "<html>\n"
      + "  <head>\n"
      + "    <meta charset=\"utf-8\">\n"
      + "    <title>Fawlty Towers Guest Registration</title>\n"
      + "    <link rel=\"stylesheet\" type=\"text/css\" href=\"style/hotel.css\">\n"
      + "  </head>\n"
      + "  <body>\n"
      + "    <h1>Fawlty Towers Guest Registration</h1>\n"
      + "    Thank you for making a reservation, "
      + request.getParameter("givenname")
      + "<br><br>\n"
      + "\n"
      + "\n"
      + "    <table>\n"
      + "      <tr>\n"
      + "        <th colspan=2>Your details:</th>\n"
      + "      </tr>\n"
      + "      <tr>\n"
      + "        <td>Name</td>\n"
      + "        <td>"
      + request.getParameter("givenname") 
      + request.getParameter("sn")
      + "</td>\n"
      + "      </tr>\n"
      + "      <tr>\n"
      + "        <td>Adults</td>\n"
      + "        <td>"
      + request.getParameter("adults")
      + "</td>\n"
      + "      </tr>\n"
      + "      <tr>\n"
      + "        <td>Children</td>\n"
      + "        <td>"
      + request.getParameter("children")
      + "</td>\n"
      + "      </tr>\n"
      + "      <tr>\n"
      + "        <td>Address</td>\n"
      + "        <td>"
      + request.getParameter("address")
      + "</td>\n"
      + "      </tr>\n"
      + "      <tr>\n"
      + "        <td>Telephone</td>\n"
      + "        <td>"
      + request.getParameter("tel")
      + "</td>\n"
      + "      </tr>\n"
      + "      <tr>\n"
      + "        <td>Arrive</td>\n"
      + "        <td>"
      + request.getParameter("arrive")
      + "</td>\n"
      + "      </tr>\n"
      + "      <tr>\n"
      + "        <td>Depart</td>\n"
      + "        <td>"
      + request.getParameter("depart")
      + "</td>\n"
      + "      </tr>\n"
      + "    </table>\n"
      + "  </body>\n"
      + "</html>\n";
  }
}
