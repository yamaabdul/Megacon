package megacon.dal;

public class Klant {
	private int klant_id;
	private String bedrijfsNaam;
	private String email;
	private String contactpersoon;
	private String telefoonnummer;
	private boolean isActief = false;
	
	

	public Klant(int klant_id, String bedrijfsNaam, String email, String contactpersoon, String telefoonnummer,
			boolean isActief) {
		super();
		this.klant_id = klant_id;
		this.bedrijfsNaam = bedrijfsNaam;
		this.email = email;
		this.contactpersoon = contactpersoon;
		this.telefoonnummer = telefoonnummer;
		this.isActief = isActief;
	}
	public Klant(){
		
	}
	public int getKlant_id() {
		return klant_id;
	}
	public void setKlant_id(int klant_id) {
		this.klant_id = klant_id;
	}
	public String getBedrijfsNaam() {
		return bedrijfsNaam;
	}
	public void setBedrijfsNaam(String bedrijfsNaam) {
		this.bedrijfsNaam = bedrijfsNaam;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContactpersoon() {
		return contactpersoon;
	}
	public void setContactpersoon(String contactpersoon) {
		this.contactpersoon = contactpersoon;
	}
	public String getTelefoonnummer() {
		return telefoonnummer;
	}
	public void setTelefoonnummer(String telefoonnummer) {
		this.telefoonnummer = telefoonnummer;
	}
	public boolean isActief() {
		return isActief;
	}
	public void setActief(boolean isActief) {
		this.isActief = isActief;
	}
	
	

}
