package megacon.ui;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import megacon.dal.DAOFactory;
import megacon.dal.Medewerker;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

/**
 * 
 */
private static final long serialVersionUID = 1L;
private static final String CONTENT_TYPE = "text/html";

public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
    response.setContentType(CONTENT_TYPE);
    HttpSession session = request.getSession();
    Medewerker usr = (Medewerker)session.getAttribute("User");
    if(usr == null) {
    	String link = "start";
	    if(request.getParameter("link") != null) link = request.getParameter("link");
	    RequestDispatcher rd;
		rd = getServletContext().getRequestDispatcher("/"+link);
		rd.forward(request, response);
    }
    else
	{
		RequestDispatcher rd;
		rd = getServletContext().getRequestDispatcher("/login.jsp");
		rd.forward(request, response);
	}
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
    String id      = request.getParameter("id");
    String pw      = request.getParameter("pw");
    response.setContentType(CONTENT_TYPE);
    HttpSession session = request.getSession();
    String wereToGo = "/home.jsp";
    String link = request.getParameter("link");
    
    if(link != null) wereToGo = "/" + link;
    Medewerker usr = new Medewerker();
    int id_klant = 0;

    try
    {
		if(id.indexOf("@") == 0) id_klant = Integer.parseInt(id);
		else usr.setEmail(id);

		usr.setMedewerker_id(id_klant);
		usr.setPassword(pw);

		usr = DAOFactory.getDAOFactory().getMedewerkerDAO().validate(usr);
		if(!usr.isValid()) throw new Exception();
		session.setAttribute("Medewerker", usr);

		RequestDispatcher rd;
		
		rd = getServletContext().getRequestDispatcher(wereToGo);
		rd.forward(request, response);
    }
    catch(Exception e)
    {
    	RequestDispatcher rd;
		rd = getServletContext().getRequestDispatcher("/login.jsp?error=Aanmelden niet gelukt");
		rd.forward(request, response);
    }
  }

}
