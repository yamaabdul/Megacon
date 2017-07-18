package megacon.ui;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import megacon.dal.Medewerker;

/**
 * Servlet implementation class OnderdeelServlet
 */
@WebServlet("/OnderdeelServlet")
public class OnderdeelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OnderdeelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
   	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//doGet(request, response);
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
        
        Medewerker user = (Medewerker)session.getAttribute("Medewerker");
        if(session.getAttribute("Medewerker") == null)
        {
        	RequestDispatcher rd;
        	rd = getServletContext().getRequestDispatcher("/login.jsp?error=Niet aangemeld of geen authorisatie");
        	rd.forward(request, response);
        }
        out.print(megacon.util.LyritSettings.showHeader());
        out.print(megacon.ui.ShowMenu.show(user.getAccess_level()));
        int onderdeel_id = 0;
        try{onderdeel_id = Integer.parseInt(request.getParameter ("onderdeel_id"));}
    	catch(NumberFormatException e) {}
       
       
		try{

			if(onderdeel_id ==1){
				out.print(megacon.util.LyritSettings.showHeader());
				out.append("<h3>Een onderdeel is toegevoegd</h3>");
	     	}
	         else 
	     	{	
	        	 out.append("<h3>Error bij toegevoeging</h3>");
	     	}
			RequestDispatcher rd;
			rd = getServletContext().getRequestDispatcher("/showOnderdelen.jsp");
			rd.forward(request, response);
	     }
		catch(Exception e)		    {
			System.err.println(e.toString());
	        out.print("<font color=red>Er is een fout opgetreden bij de invoer van de gegevens.<br><br>Melding: <b>");
	        out.print(e.getMessage());
	        out.print("</b><br><br>Corrigeer de fout en probeer het opnieuw</font>");
	        out.print("<hr>");
	    }
	}

}
