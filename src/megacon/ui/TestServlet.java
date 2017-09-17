package megacon.ui;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class TesteServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final NumberFormat bedr = NumberFormat.getInstance(new Locale("nl", "NL"));
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	 	response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
        
        String standaardond = request.getParameter("standaardond");
        int aantal = 0;
        try{aantal = Integer.parseInt(request.getParameter("aantal"));}
        catch(NumberFormatException numberformatexception) { }
        
        int dikte = 0;
        try{dikte = Integer.parseInt(request.getParameter("dikte"));}
        catch(NumberFormatException numberformatexception) { }
        
        int breedte = 0;
        try{breedte = Integer.parseInt(request.getParameter("breedte"));}
        catch(NumberFormatException numberformatexception) { }
        
        int lengte = 0;
        try{lengte = Integer.parseInt(request.getParameter("lengte"));}
        catch(NumberFormatException numberformatexception) { }
        
        String materiaal = request.getParameter("materiaal");
        String unit = request.getParameter("unit");
        
        String STRsoortelikgewicht = request.getParameter("soortelijkgewicht");
        BigDecimal soortgewicht = StringToBigDecimal(STRsoortelikgewicht);
        
        BigDecimal  bruto= calculateBrutoGewicht(aantal,dikte, breedte, lengte, soortgewicht);
        BigDecimal net= new BigDecimal("0.98125");
        BigDecimal nettoGewciht = bruto.multiply(net).setScale(2, RoundingMode.CEILING);
        
		System.out.println("standaardonderdeel id: " + standaardond);
		System.out.println("Aantal : " + aantal);
		System.out.println("dikte : " + dikte);
		System.out.println("breedte : " + breedte);
		System.out.println("lengte : " + lengte);
		System.out.println("soortelikgewicht : " + soortgewicht);
		System.out.println("bruto : " + bruto);
		System.out.println("nettoGewciht : " + nettoGewciht);
	}
	//convert input String to BigDecimal 
	private BigDecimal StringToBigDecimal(String input ){
		Number tempAmount = null;
		input = input.replace('.', ',');
		BigDecimal bg = new BigDecimal(0);
		
		if(input == null || input.equals("")) return bg;
			
		try{
			tempAmount = bedr.parse(input);
		}catch(ParseException e){System.out.println("Parse Exception BigDecimal input:" + input);}
		try{
			bg = BigDecimal.valueOf(tempAmount.doubleValue());
		}catch(NullPointerException npe) {System.out.println("Null Exception BigDecimal input:" + input);}
		
		return bg;
	}
	
	//calculate brutto gewicht 
    public BigDecimal calculateBrutoGewicht(int aantal, int dikte, int breedte, int lengte, BigDecimal brutoSG)
    {
    	BigDecimal totalCost= BigDecimal.ZERO;;
    	BigDecimal decimal= new BigDecimal("0.000001");
    	BigDecimal itemCost  = brutoSG.multiply(new BigDecimal(aantal)).multiply(new BigDecimal(dikte)).multiply(new BigDecimal(breedte)).multiply(new BigDecimal(lengte)).multiply(decimal);
    	totalCost = totalCost.add(itemCost).setScale(2, RoundingMode.CEILING);
        return totalCost;
    }

}
