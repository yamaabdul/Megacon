<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="megacon.dal.Medewerker"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
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

String timeStamp = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(Calendar.getInstance().getTime());	
out.print(megacon.ui.ShowMenu.show(user.getAccess_level()));
%>
<html>
<head>
<style>

</style>
</head>
<body>
<form method=post action=RapportageServlet>
<table>
	    <tr><td>Project:</td><td><input name=projectNaam type=text  readonly maxlength=30 size=30 value='Tata S-BOCH OXYii'style="background-color:Lavender; color:black;"></td></tr>
		<tr><td>Status:</td> 
			<td>
			<select style="width:242px";>
		  	  <option value="0">Gecalculeerd</option>
			  <option value="1">Geaccepteerd</option>
			  <option value="2">Geweigerd</option>
			  <option value="3">Geannuleerd</option>
			</select>
		</td></tr>
	    <!-- <tr><td>Component:</td><td><input name=componentNaam type=text  readonly maxlength=30 size=30 value='S-BOCHT' style="background-color:Lavender; color:black;"></td></tr> -->
	    <tr><td>Klant:</td><td><input name=bedrijfsNaam type=text  readonly maxlength=30 size=30 value='TATA STEEL' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Medewerker:</td><td><input name=medewekerNaam type=text  readonly maxlength=30 size=30 value='<%=user.getMedewerkerNaam()%>' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Datum:</td><td><input name=datum type=text  readonly maxlength=30 size=30 value='<%=timeStamp%>' style="background-color:Lavender; color:black;"><br></td></tr>
</table>
<br>
<table border="1" >
  <tr>
  	<th>ID</th>
  	<th>EIGEN WERKZAAMHEDEN</th>
    <th>UREN</th>
    <th>TARIEF</th>
    <th>EURO</th>
  </tr>
  <tr>
    <td>100</td>
    <td>Constructie bankwerk</td>
    <td><input name=conuren type=text  maxlength=10 size=10 value=''></td>
    <td><input name=contarief type=text  maxlength=10 size=10 value='55'></td>
    <td><input name=contineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
  <tr>
    <td>110</td>
    <td>Branden</td>
    <td><input name=branduren type=text  maxlength=10 size=10 value='1,70'></td>
    <td><input name=brandtarief type=text  maxlength=10 size=10 value='55'></td>
    <td><input name=brandineuro type=text  maxlength=10 size=10 value='93,27'></td>
  </tr>
  <tr>
    <td>120</td>
    <td>Walsen</td>
    <td><input name=walsuren type=text  maxlength=10 size=10 value='3,18'></td>
    <td><input name=walstarief type=text  maxlength=10 size=10 value='55'></td>
    <td><input name=walsineuro type=text  maxlength=10 size=10 value='175,09'></td>
  </tr>
  <tr>
    <td>100</td>
    <td>Assemblage fabriek</td>
    <td><input name=assemuren type=text  maxlength=10 size=10 value='21,41'></td>
    <td><input name=assemtarief type=text  maxlength=10 size=10 value='55'></td>
    <td><input name=assemineuro type=text  maxlength=10 size=10 value='1177,79'></td>
  </tr>
  <tr>
    <td>200</td>
    <td>Lassen</td>
    <td><input name=lassuren type=text  maxlength=10 size=10 value=''></td>
    <td><input name=lasstarief type=text  maxlength=10 size=10 value='55'></td>
    <td><input name=lassineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
  <tr>
    <td>210</td>
    <td>Lassen U.M.</td>
    <td><input name=umluren type=text  maxlength=10 size=10 value=''></td>
    <td><input name=umltarief type=text  maxlength=10 size=10 value='55'></td>
    <td><input name=umlineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
    <tr>
    <td>300</td>
    <td>Kotteren</td>
    <td><input name=kotterenuren type=text  maxlength=10 size=10 value=''></td>
    <td><input name=kotterentarief type=text  maxlength=10 size=10 value='55'></td>
    <td><input name=kotterenineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
    <tr>
    <td>310</td>
    <td>Draaien/Frezen</td>
    <td><input name=draaienuren type=text  maxlength=10 size=10 value=''></td>
    <td><input name=draaientarief type=text  maxlength=10 size=10 value='55'></td>
    <td><input name=draaienineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
    <tr>
    <td>420</td>
    <td>Werkvoorbereiding QA/QC</td>
    <td><input name=werkvooruren type=text  maxlength=10 size=10 value='1,37'></td>
    <td><input name=werkvoortarief type=text  maxlength=10 size=10 value='55'></td>
    <td><input name=werkvoorineuro type=text  maxlength=10 size=10 value='75,58'></td>
  </tr>
    <tr>
    <td>430</td>
    <td>Project Management</td>
   	<td><input name=projecturen type=text  maxlength=10 size=10 value=''></td>
    <td><input name=projecttarief type=text  maxlength=10 size=10 value='48,50'></td>
    <td><input name=projectineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
     <tr>
    <td></td>
    <td>Ploegen Toeslag</td>
    <td><input name=ploegenuren type=text  maxlength=10 size=10 value=''></td>
    <td><input name=ploegentarief type=text  maxlength=10 size=10  value='19,25'></td>
    <td><input name=ploegenineuro type=text  maxlength=10 size=10  value=''></td>
  </tr>
    <tr>
    <td></td>
    <td>Overwerk Toeslag</td>
    <td><input name=overwerkuren type=text  maxlength=10 size=10  value=''></td>
    <td><input name=overwerktarief type=text  maxlength=10 size=10  value='27,50'></td>
    <td><input name=overwerkineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
  <tr>
    <td></td>
    <td>Bewerkingskosten totaal uren</td>
    <td><input name=bewerkingkosten type=text maxlength=10 size=10 value='27,67'></td>
    <td><input name=overwerktarief type=text  maxlength=10 size=10  value=''></td>
    <td><input name=overwerkineuro type=text  maxlength=10 size=10 value='1521,73'></td>
  </tr>
  <tr>
  	<td><b>06</b></td>
  	<td><b>UITBESTEDINGEN</b></td>
    <td><b>AANTAL</b></td>
    <td><b>TARIEF</b></td>
    <td><b>EURO</b></td>
  </tr>
  <tr>
    <td>599</td>
    <td>Lastoevoegmateriaal</td>
    <td><input name=lasmateriaaluren type=text  maxlength=10 size=10 value=''></td>
    <td><input name=lasmateriaaltarief type=text  maxlength=10 size=10 value=''></td>
    <td><input name=lasmateriaalineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
  <tr>
    <td>600</td>
    <td>Materiaalkosten</td>
    <td><input name=materiaalkostenuren type=text  maxlength=10 size=10 value=''></td>
    <td><input name=materiaalkostentarief type=text  maxlength=10 size=10 value='1'></td>
    <td><input name=materiaalkostenineuro type=text  maxlength=10 size=10 value='1914,31'></td>
  </tr>
  <tr>
    <td>600</td>
    <td>Uitbesteding </td>
    <td><input name=uitbestedinguren type=text  maxlength=10 size=10 value=''></td>
    <td><input name=uitbestedingtarief type=text  maxlength=10 size=10 value='1'></td>
    <td><input name=uitbestedingineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
  <tr>
    <td>630</td>
    <td>Isolatie</td>
    <td><input name=isolatieuren type=text  maxlength=10 size=10 value=''></td>
    <td><input name=isolatietarief type=text  maxlength=10 size=10 value=''></td>
    <td><input name=isolatieineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
  <tr>
    <td>640</td>
    <td>Transport Uitbesteding</td>
    <td><input name=transporturen type=text  maxlength=10 size=10 value=''></td>
    <td><input name=transportarief type=text  maxlength=10 size=10 value=''></td>
    <td><input name=transporineuro type=text  maxlength=10 size=10 value='2089,31'></td>
  </tr>
  <tr>
    <td>645</td>
    <td>Kraankosten/Franco Levering</td>
    <td><input name=krankostenuren type=text  maxlength=10 size=10 value=''></td>
    <td><input name=krankostentarief type=text  maxlength=10 size=10 value='100'></td>
    <td><input name=krankostenineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
    <tr>
    <td>650</td>
    <td>Gloeien</td>
    <td><input name=gloeinuren type=text  maxlength=10 size=10 value=''></td>
    <td><input name=gloeintarief type=text  maxlength=10 size=10 value='0,14'></td>
    <td><input name=kotterenineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
    <tr>
    <td>660</td>
    <td>Stralen/Schilderen [m2]</td>
    <td><input name=stralenuren type=text  maxlength=10 size=10 value='21,9'></td>
    <td><input name=stralentarief type=text  maxlength=10 size=10 value='100'></td>
    <td><input name=draaienineuro type=text  maxlength=10 size=10 value='2185,04'></td>
  </tr>
    <tr>
    <td>661</td>
    <td>Beitsen/Passiveren</td>
    <td><input name=beitsenuren type=text  maxlength=10 size=10 value=''></td>
    <td><input name=beitsentarief type=text  maxlength=10 size=10 value='0,15'></td>
    <td><input name=beitsenineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
    <tr>
    <td>662</td>
    <td>Verzinken [kg]</td>
   	<td><input name=verzinkenuren type=text  maxlength=10 size=10 value=''></td>
    <td><input name=verzinkentarief type=text  maxlength=10 size=10 value='0,55'></td>
    <td><input name=verzinkenineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
     <tr>
    <td>645</td>
    <td>Transport zadels</td>
    <td><input name=transporturen type=text  maxlength=10 size=10 value=''></td>
    <td><input name=transporttarief type=text  maxlength=10 size=10  value='250,00'></td>
    <td><input name=transportineuro type=text  maxlength=10 size=10  value=''></td>
  </tr>
    <tr>
    <td>690</td>
    <td>Engineering</td>
    <td><input name=engineeringuren type=text  maxlength=10 size=10  value=''></td>
    <td><input name=engineeringtarief type=text  maxlength=10 size=10  value='48,50'></td>
    <td><input name=engineeringineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
  <tr>
    <td>690</td>
    <td>Tekenwerk</td>
    <td><input name=tekenwerkuren type=text maxlength=10 size=10 value=''></td>
    <td><input name=tekenwerkktarief type=text  maxlength=10 size=10  value=''></td>
    <td><input name=tekenwerkineuro type=text  maxlength=10 size=10 value='104,47'></td>
  </tr>
 <tr>
    <td></td>
    <td>Totaal</td>
    <td><input name=totaluren type=text maxlength=10 size=10 value=''></td>
    <td><input name=totaltarief type=text  maxlength=10 size=10  value=''></td>
    <td><input name=totalineuro type=text  maxlength=10 size=10 value='6293,13'></td>
  </tr>
    <tr>
  	<td><b>07</b></td>
  	<td><b>OVERIGE ORDERKOSTEN</b></td>
    <td><b></b></td>
    <td><b></b></td>
    <td><b></b></td>
  </tr>
  <tr>
    <td>720</td>
    <td>Documenten afdrukken</td>
    <td><input name=documentenuren type=text maxlength=10 size=10 value=''></td>
    <td><input name=documententarief type=text  maxlength=10 size=10  value='125'></td>
    <td><input name=documentenineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
  <tr>
    <td>730</td>
    <td>Afblinden / Persvoorzieningen</td>
    <td><input name=afblindenuren type=text maxlength=10 size=10 value=''></td>
    <td><input name=afblindentarief type=text  maxlength=10 size=10  value='125'></td>
    <td><input name=afblindenineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
   <tr>
    <td>750</td>
    <td>Financiering / Bankgaranties</td>
    <td><input name=financieringuren type=text maxlength=10 size=10 value=''></td>
    <td><input name=financieringtarief type=text  maxlength=10 size=10  value='125'></td>
    <td><input name=financieringineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
   <tr>
    <td>760</td>
    <td>Onvoorzien</td>
    <td><input name=onvoorzienuren type=text maxlength=10 size=10 value=''></td>
    <td><input name=onvoorzientarief type=text  maxlength=10 size=10  value='500'></td>
    <td><input name=onvoorzienineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
   <tr>
    <td></td>
    <td>Totaal</td>
    <td><input name=totaluren7 type=text maxlength=10 size=10 value=''></td>
    <td><input name=totaltarief7 type=text  maxlength=10 size=10  value=''></td>
    <td><input name=totalineuro7 type=text  maxlength=10 size=10 value=''></td>
  </tr>
  <tr>
  	<td><b>08</b></td>
  	<td><b>CONTROLE KOSTEN</b></td>
    <td><b></b></td>
    <td><b></b></td>
    <td><b></b></td>
  </tr>
     <tr>
    <td>800</td>
    <td>Keuringskosten</td>
    <td><input name=keuringskostenuren type=text maxlength=10 size=10 value=''></td>
    <td><input name=keuringskostentarief type=text  maxlength=10 size=10  value='50'></td>
    <td><input name=keuringskostenineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
   <tr>
    <td>800</td>
    <td>Röntgenen</td>
    <td><input name=rontgenenuren type=text maxlength=10 size=10 value=''></td>
    <td><input name=rontgenentarief type=text  maxlength=10 size=10  value='55'></td>
    <td><input name=rontgenenineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
  <tr>
    <td>800</td>
    <td>Magnetisch Onderzoek</td>
    <td><input name=magnetischuren type=text maxlength=10 size=10 value=''></td>
    <td><input name=magnetischtarief type=text  maxlength=10 size=10  value='55'></td>
    <td><input name=magnetischineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
   <tr>
    <td>800</td>
    <td>U.S. onderzoek</td>
    <td><input name=onderzoekuren type=text maxlength=10 size=10 value=''></td>
    <td><input name=onderzoektarief type=text  maxlength=10 size=10  value='55'></td>
    <td><input name=onderzoekineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
  <tr>
    <td>800</td>
    <td>Proefplaten</td>
    <td><input name=proefplatenuren type=text maxlength=10 size=10 value=''></td>
    <td><input name=proefplatentarief type=text  maxlength=10 size=10  value='750'></td>
    <td><input name=proefplatenineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
  <tr>
    <td>800</td>
    <td>LK, LMK, CE NORMERING</td>
    <td><input name=normeringuren type=text maxlength=10 size=10 value=''></td>
    <td><input name=normeringtarief type=text  maxlength=10 size=10  value='750'></td>
    <td><input name=normeringineuro type=text  maxlength=10 size=10 value=''></td>
  </tr>
     <tr>
    <td></td>
    <td>Totaal</td>
    <td><input name=totaluren8 type=text maxlength=10 size=10 value=''></td>
    <td><input name=totaltarief8 type=text  maxlength=10 size=10  value=''></td>
    <td><input name=totalineuro8 type=text  maxlength=10 size=10 value=''></td>
  </tr>
    <tr>
  	<td><b>I</b></td>
  	<td><b>INKOOPKOSTEN TOTAAL</b></td>
    <td><b></b></td>
    <td><b></b></td>
   <td><input name=inkoopkostenineuro type=text maxlength=10 size=10 value='6293,13'></td>
  </tr>
   <tr>
  	<td><b>II</b></td>
  	<td><b>KOSTPRIJS</b></td>
    <td><b></b></td>
    <td><b></b></td>
   <td><input name=inkoopkostenineuro type=text maxlength=10 size=10 value='7814,87'></td>
  </tr>
  <tr>
  	<td><b>III</b></td>
  	<td><b>SGA DEKKING INKOOP + UITBESTEDINGEN</b></td>
   <td><input name=sga type=text maxlength=10 size=10 value='5%'></td>
    <td><b></b></td>
   <td><input name=inkoopkostenineuro type=text maxlength=10 size=10 value='7814,87'></td>
  </tr>
    <tr>
  	<td><b>IV</b></td>
  	<td><b>WINST + RISICO OVER KOSTPRIJS</b></td>
    <td><input name=winst type=text maxlength=10 size=10 value='10%'></td>
    <td><b></b></td>
   <td><input name=inkoopkostenineuro type=text maxlength=10 size=10 value='7814,87'></td>
  </tr>
  <tr>
  	<td><b>V</b></td>
  	<td><b>MONTAGE</b></td>
    <td></td>
    <td><b></b></td>
   <td><input name=montage type=text maxlength=10 size=10 value=''></td>
  </tr>
    <tr>
  	<td><b>VI</b></td>
  	<td><b>EINDTOTAAL</b></td>
    <td></td>
    <td><b></b></td>
   <td><input name=eindtataal type=text maxlength=10 size=10 value='8911,01'></td>
  </tr>
 
  
</table>
 <tr><td><br><br><br><br><input type=submit value=Opslaan class=button> <input type=reset class=button></td></tr>
</form>
</body>
</html>
	
<%}%>
<jsp:include page="footer.jsp" />