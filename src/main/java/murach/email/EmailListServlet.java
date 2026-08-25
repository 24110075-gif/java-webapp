package murach.email;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import murach.business.User;

public class EmailListServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/index.jsp";

        // get current action
        String action = request.getParameter("action");
        String firstName = request.getParameter("firstName");

        if (action == null && firstName == null) {
            action = "join"; // default action
        }

        // perform action and set URL to appropriate page
        if ("join".equalsIgnoreCase(action) && firstName == null) {
            url = "/index.jsp"; // the "join" page
        } else {
            // process survey / form submission
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String dob = request.getParameter("dob");
            String hearAbout = request.getParameter("hearAbout");
            String[] announcements = request.getParameterValues("announcements");
            String contactBy = request.getParameter("contactBy");

            // store data in User object
            User user = new User(firstName, lastName, email, dob, hearAbout, announcements, contactBy);

            // set User object in request object and set URL
            request.setAttribute("user", user);
            url = "/thanks.jsp"; // the "thanks" page
        }

        // forward request and response objects to specified URL
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
