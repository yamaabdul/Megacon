package megacon.dal;

import java.sql.Timestamp;

public class Project {
	private int project_id;
	private String projectNaam;
	private int klant_id;
	private String referentienummer;
	private int medewerker_id;
	private int bewerking_id;
	private int status_id;
	private Timestamp datum;
	private String notitie;
	
	
	public Project(int project_id, String projectNaam, int klant_id, String referentienummer,
			int medewerker_id, int bewerking_id, int status_id, Timestamp datum, String notitie) {
		super();
		this.project_id = project_id;
		this.projectNaam = projectNaam;
		this.klant_id = klant_id;
		this.referentienummer = referentienummer;
		this.medewerker_id = medewerker_id;
		this.bewerking_id = bewerking_id;
		this.status_id = status_id;
		this.datum = datum;
		this.notitie = notitie;
	}
	public Project(){
		
	}
	
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public String getProjectNaam() {
		return projectNaam;
	}
	public void setProjectNaam(String projectNaam) {
		this.projectNaam = projectNaam;
	}
	public int getKlant_id() {
		return klant_id;
	}
	public void setKlant_id(int klant_id) {
		this.klant_id = klant_id;
	}
 
	public String getReferentienummer() {
		return referentienummer;
	}
	public void setReferentienummer(String referentienummer) {
		this.referentienummer = referentienummer;
	}
	public int getMedewerker_id() {
		return medewerker_id;
	}
	public void setMedewerker_id(int medewerker_id) {
		this.medewerker_id = medewerker_id;
	}
	public int getBewerking_id() {
		return bewerking_id;
	}
	public void setBewerking_id(int bewerking_id) {
		this.bewerking_id = bewerking_id;
	}
	public int getStatus_id() {
		return status_id;
	}
	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}
	public Timestamp getDatum() {
		return datum;
	}
	public void setDatum(Timestamp datum) {
		this.datum = datum;
	}
	public String getNotitie() {
		return notitie;
	}
	public void setNotitie(String notitie) {
		this.notitie = notitie;
	}
	
	
	
	
}
