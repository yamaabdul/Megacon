
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
animatedcollapse.addDiv('dimensie', 'fade=1,speed=200,hide=1') 
animatedcollapse.addDiv('standard_dimensie', 'fade=1,speed=200,hide=1') 
animatedcollapse.addDiv('romp', 'fade=1,speed=200,hide=1') 
animatedcollapse.addDiv('materiaalsoort', 'fade=1,speed=200,hide=1') 

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
  <h3>Onderdeel toevoeging</h3><p><br><br>
	    <form method=post action=editOnderdeel.jsp name=div0>
	    <table>
	    <tr>
				<td valign=top>Standaard onderdeel configureren</td>
				<td>
					 <a class="two" href="#" rel="toggle[div0]"><span id=wgntxt></span></a>
					<div id=div0>
						<div class="centerwindow2">
							<select name=standaardond onchange="Aan();">
								<option value=0>--maak keuze--</option>
								<%
								
								for(Iterator<Standaard_onderdeel> it = stnOnderdelen.iterator();it.hasNext();){
									stnd = (Standaard_onderdeel)it.next();
									
											
									out.println("<option value=" + stnd.getStandaardOnderdeel_id() + ">" + stnd.getStandaardO_naam() + "</option>");
								}
								%>
							</select> <br><br>
					
							
						<div id="standard_dimensie" style="width: 700px;">
						Aantal<input name=AH type=number min="1" style="width:30px;" maxlength=10 value='1'>
						Hoog/dia<input name=SH type=number min="0" style="width:70px;" maxlength=20 value=''>
						Dikte<input name=SD type=number min="0" style="width:70px;" maxlength=20 value=''>
						
						Lengte<input name=SL type=number min="0" style="width:70px;" maxlength=20 value=''>
						</div> 
							<br> 
						<div id=romp>
								<br>
								<input type=checkbox name=romp>
								Romp
						</div> 
						<div id="dimensie" style="width: 700px;">
						Aantal<input name=A type=number min="1" style="width:30px;" maxlength=3 value='1'>
						Dikte<input name=D type=number min="0" style="width:70px;" maxlength=20 value=''>
						Breedte<input name=B type=number min="0" style="width:70px;" maxlength=20 value=''>
						Lengte<input name=L type=number min="0" style="width:70px;" maxlength=20 value=''>
						</div>
						<br> 
			
						<div id="materiaalsoort" style="width: 800px;">
						Materiaalcode<input name=mc type=text style="width:70px;" maxlength=10 value='S355J2G3'>
						Unit<input name=mu type=text min="0" style="width:70px;" maxlength=10 value='Euro/Kg'>
						Soortelijk gewicht<input name=ms type=text style="width:70px;" maxlength=10 value='8,00'>
						Prijs per unit<input name=mp type=text style="width:70px;" maxlength=10 value='0,90'>
						Certificering<input name=mce type=text style="width:70px;" maxlength=10 value='3.1 B'>
						</div>
						</div>
						</div>
						</td>
 							</tr>
 						
 						<!-- <table>
 						<br>
 						<br>
 						<br>
 						<br>
 							<tr>
 							<td>Bruto gewicht:</td><td><input type=number name=brutogewicht maxlength=6  min="0" value=''></td>
 							</tr>
 							<tr>
 							<td>Netto gewicht:</td><td><input type=number name=nettogewicht maxlength=6 min="0" size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>Verf opplervlakte:</td><td><input type=number name=verfopp maxlength=6 min="0" size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>bw (100):</td><td><input type=number name=bw maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>br (110):</td><td><input type=number name=br maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>wals (120):</td><td><input type=number name=wals maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>lassen (200):</td><td><input type=number name=lassen maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>UM-las (210):</td><td><input type=number name=umlas maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>kotteren (300):</td><td><input type=number name=kotteren maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>dr/frezen (310):</td><td><input type=number name=drfrezen maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>proj./wvb (420):</td><td><input type=number name=projectwvb maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>br. M1 recht:</td><td><input type=number name=brrecht maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>br. M1 schuin:</td><td><input type=number name=brschuin maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>zaaguur:</td><td><input type=number name=zaaguur maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>boor marger:</td><td><input type=number name=boorm maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>boor uur:</td><td><input type=number name=booruur maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							 <tr>
 							<td>las cat:</td><td><input type=number name=lascat maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>las cat:</td><td><input type=number name=lascat maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>las 1 type:</td><td><input type=number name=las1 maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>las mtr:</td><td><input type=number name=lasmtr1 maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>inh. cm3:</td><td><input type=number name=inh1 maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>las hrs:</td><td><input type=number name=hrs1 maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							<tr>
 							<td>las 2 type:</td><td><input type=number name=hrs2 maxlength=6 min="0" step=0.01 size=4 value=''></td>
 							</tr>
 							
 							
 							
 						</table> -->
 						<table></table>
 					
 <br><br><br>
<input type=submit value=Toevoeging class=button> <input type=reset class=button>
</table>
</form>
</body>
</html>
   
	
<%}%>
<jsp:include page="footer.jsp" />
