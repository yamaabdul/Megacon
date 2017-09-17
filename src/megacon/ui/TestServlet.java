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
        //bruto gewicht
        BigDecimal brutoGW= calculateBrutoGewicht(aantal,dikte, breedte, lengte, soortgewicht);
        //netto gewicht
        BigDecimal nettoGW= new BigDecimal("0.98125");
        BigDecimal nettoGewicht = brutoGW.multiply(nettoGW).setScale(2, RoundingMode.CEILING);
        
        BigDecimal verfOpp = calculateVerfoppervlak(aantal, dikte, breedte, lengte, brutoGW, nettoGewicht);
		
        System.out.println("standaardonderdeel id: " + standaardond);
		System.out.println("Aantal : " + aantal);
		System.out.println("dikte : " + dikte);
		System.out.println("breedte : " + breedte);
		System.out.println("lengte : " + lengte);
		System.out.println("soortelikgewicht : " + soortgewicht);
		System.out.println("bruto : " + brutoGW);
		System.out.println("nettoGewciht : " + nettoGewicht);
		System.out.println("verfOpp : " + verfOpp);
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
	private BigDecimal calculateBrutoGewicht(int aantal, int dikte, int breedte, int lengte, BigDecimal brutoSG)
    {
    	BigDecimal totalCost= BigDecimal.ZERO;;
    	BigDecimal decimal= new BigDecimal("0.000001");
    	BigDecimal itemCost  = brutoSG.multiply(new BigDecimal(aantal)).multiply(new BigDecimal(dikte)).multiply(new BigDecimal(breedte)).multiply(new BigDecimal(lengte)).multiply(decimal);
    	totalCost = totalCost.add(itemCost).setScale(2, RoundingMode.HALF_UP );
        return totalCost;
    }
	
    //calculate verfoppervlak 
    //((aantal*(2*dikte*(breedte+lengte)+2*breedte*lengte)*0,000001)/(brutogewicht/nettogewicht))   (.divide((brutoGW), 2, RoundingMode.HALF_UP)
	private BigDecimal calculateVerfoppervlak(int aantal, int dikte, int breedte, int lengte, BigDecimal brutoGW, BigDecimal nettoGW)
    {
    	BigDecimal totalCost= BigDecimal.ZERO;;
    	BigDecimal decimal= new BigDecimal("0.000001");
    	BigDecimal decimal2= new BigDecimal("2");
    	BigDecimal brutoNetto = (brutoGW).divide(nettoGW , 4, RoundingMode.CEILING);
    	//					   (	aantal					x	 (	2			x				dikte			x    (				breedte 	+					lengte )+   2				x                    breedte   x   					lengte        x     0.000001
    	BigDecimal itemCost  = ((new BigDecimal(aantal)).multiply((decimal2).multiply(new BigDecimal(dikte)).multiply((new BigDecimal(breedte)).add(new BigDecimal(lengte))).add((decimal2).multiply(new BigDecimal(breedte)).multiply(new BigDecimal(lengte))).multiply(decimal))).divide(brutoNetto, 4, RoundingMode.CEILING);
    	totalCost = totalCost.add(itemCost);
    	
        return totalCost;
    }
}
