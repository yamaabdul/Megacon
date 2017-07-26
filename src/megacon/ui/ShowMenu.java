package megacon.ui;

import megacon.dal.Medewerker;

public class ShowMenu {

	
	public static StringBuffer show(int access_level)	{
		if(access_level >= Medewerker.adminSystem) return showMngtMenu();
		//if(access_level >= Medewerker.userEdit) return showCustomerMenu();
		//if(access_level < Medewerker.adminSystem) return showMedewerkerMenu();
		return new StringBuffer("Geen toegang");
	}
	
	public static StringBuffer showMngtMenu()	{
	StringBuffer out = new StringBuffer();
	
	out.append("<div id='cssmenu'>");
	out.append("<ul>");
	out.append("	<li class='last'><a href='home.jsp'><span>Home</span></a>");
	out.append("		<ul>");
	out.append("			<li class='last'><a href='logout.jsp'><span>Afmelden</span></a></li>");
	out.append("		</ul>");
	out.append("	</li>");
	out.append("	<li class='has-sub'><a href='#'><span>Projecten</span></a>");
	out.append("		<ul>");
	out.append("			<li class='last'><a href='showProject.jsp'><span>Overzicht</span></a></li>");
	out.append("    			<li class='has-sub'><a href='#'><span>Project</span></a>");
	out.append("		    		<ul>");
	out.append("					<li class='last'><a href='newProject.jsp'><span>Nieuw</span></a></li>");
	out.append("					<li class='last'><a href='showComponenten.jsp'><span>Componenten</span></a></li>");
	out.append("					<li class='last'><a href='showOnderdelen.jsp'><span>Onderdelen</span></a></li>");
	out.append("		   			</ul>");
	out.append("		   	   </li>");
	out.append("		</ul>");
	out.append("	</li>");
	out.append("	<li class='has-sub'><a href='#'><span>Rapportages</span></a>");
	out.append("		<ul>");
	out.append("			   	<li class='last'><a href='showRapportage.jsp?id_status=0'><span>Overzicht</span></a></li>");
	out.append("    			<li class='has-sub'><a href='#'><span>Status</span></a>");
	out.append("		    		<ul>");
	out.append("			   		<li class='last'><a href='showRapportage.jsp?id_status=0'><span>Gecalculeerd</span></a></li>");
	out.append("			   		<li class='last'><a href='showWerkbonnen.jsp?id_status=1'><span>Geaccepteerd</span></a></li>");
	out.append("			   		<li class='last'><a href='showWerkbonnen.jsp?id_status=2'><span>Geweigerd</span></a></li>");
	out.append("			   		<li class='last'><a href='showWerkbonnen.jsp?id_status=3'><span>Geannuleerd</span></a></li>");
	out.append("		   			</ul>");
	out.append("		   	   </li>");
	out.append("		</ul>");
	out.append("	</li>");
	out.append("	<li class='has-sub'><a href='#'><span>Beheer</span></a>");
	out.append("		<ul>");
	out.append("			<li class='has-sub'><a href='#'><span>Medewerker</span></a>");
	out.append("				<ul>");
	out.append("					<li class='last'><a href='showMedewerkers.jsp'><span>Overzicht</span></a></li>");
	out.append("					<li class='last'><a href='newMedewerker.jsp'><span>Nieuw</span></a></li>");
	out.append("				</ul>");
	out.append("			</li>");
	out.append("			<li class='has-sub'><a href='#'><span>Klant</span></a>");
	out.append("				<ul>");
	out.append("					<li class='last'><a href='showCustomers.jsp'><span>Overzicht</span></a></li>");
	out.append("					<li class='last'><a href='newCustomer.jsp'><span>Nieuw</span></a></li>");
	out.append("				</ul>");
	out.append("			</li>");
	out.append("			<li class='has-sub'><a href='#'><span>Standaard onderdeel</span></a>");
	out.append("				<ul>");
	out.append("					<li class='last'><a href='showOnderdeel.jsp'><span>Overzicht standaardonderdeel</span></a></li>");
	out.append("					<li class='last'><a href='newOnderdeel.jsp'><span>Nieuw standaardonderdeel</span></a></li>");
	out.append("					<li class='last'><a href='showSubonderdeel.jsp'><span>Overzicht sub standaardonderdeel</span></a></li>");
	out.append("					<li class='last'><a href='newOnderdeel.jsp'><span>Nieuw sub standaardonderdeel</span></a></li>");
	out.append("	   			</ul>");
	out.append("			</li>");
	out.append("			<li class='has-sub'><a href='#'><span>Materiaal</span></a>");
	out.append("				<ul>");
	out.append("					<li class='last'><a href='showMateriaalsoort'><span>Materiaalsorten</span></a></li>");
	out.append("					<li class='last'><a href='newMateriaalsoort'><span>Nieuw Materiaalsoort</span></a></li>");
	out.append("	   			</ul>");
	out.append("			</li>");
	out.append("			<li class='has-sub'><a href='#'><span>Bewerking</span></a>");
	out.append("				<ul>");
	out.append("			<li class='last'><a href='showBewerking'><span>Bewerkingen</span></a></li>");
	out.append("			<li class='last'><a href='newBewerking'><span>Nieuw Bewerking</span></a></li>");
	out.append("		 </ul>");
	out.append("		</ul>");
	out.append("	</li>");
/*	out.append("	<li class='has-sub'><a href='#'><span>Zoeken</span></a>");
	out.append("		<ul>");
	out.append("	        <li class='last'><a href='zoekKlant.jsp'><span>Zoek klant</span></a></li>");
	out.append("	        <li class='last'><a href='zoekMedewerker.jsp'><span>Zoek medewerker</span></a></li>");
	out.append("			<li class='last'><a href='zoekWagen.jsp'><span>Zoek wagen</span></a></li>");
	out.append("			<li class='last'><a href='zoekWerkbon.jsp'><span>Zoek werkbon</span></a></li>");
	out.append("		 </ul>");
	out.append("	</li>");*/
	out.append("</div><br><br><br><br><br><br>");
	return out;
	}
}
