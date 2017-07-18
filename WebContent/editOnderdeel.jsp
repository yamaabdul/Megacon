
<%@page import="megacon.util.LyritSettings"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="megacon.dal.*"%>
<%@page import="megacon.dal.Standaard_onderdeel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="megacon.dal.Medewerker"%>
<jsp:include page="headermenu.jsp" />
<%
Medewerker user = (Medewerker)session.getAttribute("Medewerker");
if(session.getAttribute("Medewerker") == null)
{
	RequestDispatcher rd;
	rd = getServletContext().getRequestDispatcher("/login.jsp?error=Niet aangemeld of geen authorisatie&link=editOnderdeel.jsp");
	rd.forward(request, response);
}
else{ 
	int standaardOnderdeel_id = 0;
	try{standaardOnderdeel_id = Integer.parseInt(request.getParameter("standaardOnderdeel_id"));}
	catch(NumberFormatException numberformatexception) { }
	
	Standaard_onderdeel stn_ond = DAOFactory.getDAOFactory().getStandaard_onderdeelDAO().getStandaard_onderdeel(standaardOnderdeel_id);
	Collection<Standaard_onderdeel> stnOnderdelen =  DAOFactory.getDAOFactory().getStandaard_onderdeelDAO().getStandaard_onderdelen();
	Standaard_onderdeel stnd;
	
	String eol            = "\r\n"; 
	
out.print(megacon.ui.ShowMenu.show(user.getAccess_level()));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Onderdeel</title>
<script type="text/javascript" src="script/animatedcollapse.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript">

animatedcollapse.addDiv('div0', 'fade=1,speed=200')
animatedcollapse.addDiv('standaardond', 'fade=1,speed=200')
animatedcollapse.addDiv('dimensie', 'fade=1,speed=200') 
animatedcollapse.addDiv('standard_dimensie', 'fade=1,speed=200') 
animatedcollapse.addDiv('romp', 'fade=1,speed=200') 
animatedcollapse.addDiv('materiaal', 'fade=1,speed=200') 
animatedcollapse.addDiv('materiaalsoort', 'fade=1,speed=200') 

animatedcollapse.ontoggle=function($, divobj, state){ //fires each time a DIV is expanded/contracted 
	//$: Access to jQuery 
	//divobj: DOM reference to DIV being expanded/ collapsed. Use "divobj.id" to get its ID 
	//state: "block" or "none", depending on state 
} 

animatedcollapse.init() 


function Aan(){
	//animatedcollapse.show('div0');
	animatedcollapse.show('romp');
	animatedcollapse.show('dimensie');
	animatedcollapse.show('standard_dimensie');
	animatedcollapse.show('materiaal');
	animatedcollapse.show('materiaalsoort');
	initStandardonderdeel();
}

function initStandardonderdeel(){
document.div0.romp.checked = true;
document.div0.materiaal.checked = true;
}
<%



/* 
String eol = LyritSettings.eol;
StringBuffer wagenAan = new StringBuffer();
wagenAan.append("function Aan(){"+ eol);
wagenAan.append("var wagvalue = (document.div0.standaardond.value);"+ eol);
wagenAan.append("var i = 0;"+ eol);
wagenAan.append("var j = 0;"+ eol);
wagenAan.append("switch(wagvalue){"+ eol);
wagenAan.append("switch(wagvalue){"+ eol);
wagenAan.append(" case '" + stn_ond.getStandaardOnderdeel_id() + "': "+ eol);
wagenAan.append("  animatedcollapse.show('kraan');"+ eol);
wagenAan.append("  break;"+ eol);
wagenAan.append("  i=j;"+ eol);
wagenAan.append(" }"+ eol); */



%>


</script>
</head>

<body>
  <h3>Onderdeel</h3><p><br><br>
	    <form method=post action=OnderdeelServlet name=div0>
	    <table>
	    <tr><td></td><td><input name=onderdeel_id maxlength=6 type=text hidden maxlength=30 size=30 value='1'></td></tr>
	  <!--   <tr><td>Component ID:</td><td><input name=component_id maxlength=6 type=text maxlength=30 size=30 value=''></td></tr>
	    <tr><td>Standaardonderdeel ID:</td><td><input name=staandardOnderdeel_id maxlength=6 type=text size=30 value=''></td></tr>
	     -->
	    <tr>
				<td valign=top>Standaard onderdeel configureren</td>
				<td>
					 <a class="two" href="#" rel="toggle[div0]"><span id=wgntxt></span></a>
					<div id=div0>
						<div class="centerwindow2">
							<select name=standaardond onchange="Aan();">
								<option value=0>ROMP</option>
								<%
								
								for(Iterator<Standaard_onderdeel> it = stnOnderdelen.iterator();it.hasNext();){
									stnd = (Standaard_onderdeel)it.next();
									
											
									out.println("<option value=" + stnd.getStandaardOnderdeel_id() + ">" + stnd.getStandaardO_naam() + "</option>");
								}
								%>
							</select> <br><br>
					
							
						<div id="standard_dimensie" style="width: 700px;">
						Aantal<input name=AH type=number min="1" style="width:30px;" maxlength=10 value='1'>
						Hoog/dia<input name=SH type=number min="0" style="width:70px;" maxlength=20 value='3024'>
						Dikte<input name=SD type=number min="0" style="width:70px;" maxlength=20 value='12'>
						
						Lengte<input name=SL type=number min="0" style="width:70px;" maxlength=20 value='2300'>
						</div> 
							<br> 
						<div id=romp>
								<br>
								<input type=checkbox name=romp>
								Romp
						</div> 
						<div id="dimensie" style="width: 700px;">
						Aantal<input name=A type=number min="1" style="width:30px;" maxlength=3 value='1'>
						Dikte<input name=D type=number min="0" style="width:70px;" maxlength=20 value='12'>
						Breedte<input name=B type=number min="0" style="width:70px;" maxlength=20 value='2320'>
						Lengte<input name=L type=number min="0" style="width:70px;" maxlength=20 value='9550'>
						</div>
						<br> 
						<div id=materiaal>
								<br>
								Materiaalsoort
						</div> 
						<div id="materiaalsoort" style="width: 800px;">
						Materiaalcode<input name=mc type=text style="width:80px;" maxlength=10 value='S235JR2G2'>
						Unit<input name=mu type=text min="0" style="width:70px;" maxlength=10 value='Euro/Kg'>
						Soortelijk gewicht<input name=ms type=text style="width:70px;" maxlength=10 value='8,00'>
						Prijs per unit<input name=mp type=text style="width:70px;" maxlength=10 value='1,02'>
						Certificering<input name=mce type=text style="width:70px;" maxlength=10 value='3.1 B'>
						</div>
						</div>
						</div>
						</td>
 							</tr>
 						
 						<table>
 						<br>
 						<br>
 						<br>
 						<br>
 							<tr>
 							<td>Bruto gewicht:</td><td><input type=text name=brutogewicht maxlength=10 value='2127'></td>
 							</tr>
 							<tr>
 							<td>Netto gewicht:</td><td><input type=text name=nettogewicht maxlength=10 value='2089,03'></td>
 							</tr>
 							<tr>
 							<td>Verf opplervlakte:</td><td><input type=text name=verfopp maxlength=10 value='43,7'></td>
 							</tr>
 							<tr>
 							<td>bw (100):</td><td><input type=text name=bw maxlength=10 value='1,7'></td>
 							</tr>
 							<tr>
 							<td>br (110):</td><td><input type=text name=br maxlength=10 value='1,7'></td>
 							</tr>
 							<tr>
 							<td>wals (120):</td><td><input type=text name=wals maxlength=10 value='13,1'></td>
 							</tr>
 							<tr>
 							<td>lassen (200):</td><td><input type=text name=lassen maxlength=10  value='8,3'></td>
 							</tr>
 							<tr>
 							<td>UM-las (210):</td><td><input type=text name=umlas maxlength=10  value=''></td>
 							</tr>
 							<tr>
 							<td>kotteren (300):</td><td><input type=text name=kotteren maxlength=10  value=''></td>
 							</tr>
 							<tr>
 							<td>dr/frezen (310):</td><td><input type=text name=drfrezen maxlength=10 value=''></td>
 							</tr>
 							<tr>
 							<td>proj./wvb (420):</td><td><input type=text name=projectwvb maxlength=10 value='1,4'></td>
 							</tr>
 							<td>tot. uren:</td><td><input type=text name=toturen maxlength=10 value='21,0'></td>
 							</tr>
 							<tr>
 							<td>br. M1 recht:</td><td><input type=text name=brrecht maxlength=10 value='23,7'></td>
 							</tr>
 							<tr>
 							<td>br. M1 schuin:</td><td><input type=text name=brschuin maxlength=10 value=''></td>
 							</tr>
 							<tr>
 							<td>zaaguur:</td><td><input type=text name=zaaguur maxlength=10 value=''></td>
 							</tr>
 							<tr>
 							<td>boor marger:</td><td><input type=text name=boorm maxlength=10 value=''></td>
 							</tr>
 							<tr>
 							<td>boor uur:</td><td><input type=text name=booruur maxlength=10 value=''></td>
 							</tr>
 							 <tr>
 							<td>las cat:</td><td><input type=text name=lascat maxlength=10 value='3'></td>
 							</tr>
 							<tr>
 							<td>las 1 type:</td><td><input type=text name=las1 maxlength=10 value=''></td>
 							</tr>
 							<tr>
 							<td>las mtr:</td><td><input type=text name=lasmtr1 maxlength=10 value='9,6'></td>
 							</tr>
 							<tr>
 							<td>inh. cm3:</td><td><input type=text name=inh1 maxlength=10 value=''></td>
 							</tr>
 							<tr>
 							<td>las hrs:</td><td><input type=text name=hrs1 maxlength=10 value=''></td>
 							</tr>
 							<tr>
 							<td>las 2 type:</td><td><input type=text name=hrs2 maxlength=10 value=''></td>
 							</tr>
 								<tr>
 							<td>las mtr:</td><td><input type=text name=las2 maxlength=10 value='2,3'></td>
 							</tr>
 							 							<tr>
 							<td>inh. cm3:</td><td><input type=text name=inh2 maxlength=10 value=''></td>
 							</tr>
 							 							<tr>
 							<td>las hrs:</td><td><input type=text name=hrs2 maxlength=10 value=''></td>
 							</tr>
 							
 						</table>
 					
 <br><br><br>
<input type=submit value=Opslaan class=button> <input type=reset class=button>
</table>
</form>
</body>
</html>
   
	
<%}%>
<jsp:include page="footer.jsp" />
