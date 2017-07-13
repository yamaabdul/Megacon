package megacon.dal;

public class Medewerker {
	private int medewerker_id;
	private boolean geslacht;
	private String medewerkerNaam;
	private String email;
	private String password;
	private int access_level;
	private boolean isActief   = false;
	private boolean a_validated   = false;
	/**
	 * User access levels
	*/
	public String[] adminRole = new String[3];
	public static final int userView    = 0; 
	public static final int userEdit    = 1; 
	public static final int adminSystem = 2;
	
	
	public Medewerker(int medewerker_id, boolean geslacht, String medewerkerNaam, String email, String password,
			int access_level, boolean isActief) {
		super();
		this.medewerker_id = medewerker_id;
		this.geslacht = geslacht;
		this.medewerkerNaam = medewerkerNaam;
		this.email = email;
		this.password = password;
		this.access_level = access_level;
		this.isActief = isActief;
	}
	
	
	public Medewerker (){
		adminRole[userView]    = "Manager -mag rapportages bekijken";
		adminRole[userEdit]    = "Gebruiker van het systeem";
		adminRole[adminSystem] = "Beheerder - mag alles";
		
	}
	
	public void setValid()                                  {a_validated = true;}
	public boolean isValid()                             	{return a_validated;}
	
	public int getMedewerker_id() {
		return medewerker_id;
	}
	public void setMedewerker_id(int medewerker_id) {
		this.medewerker_id = medewerker_id;
	}
	public boolean isGeslacht() {
		return geslacht;
	}
	public void setGeslacht(boolean geslacht) {
		this.geslacht = geslacht;
	}
	public String getMedewerkerNaam() {
		return medewerkerNaam;
	}
	public void setMedewerkerNaam(String medewerkerNaam) {
		this.medewerkerNaam = medewerkerNaam;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getAccess_level() {
		return access_level;
	}
	public void setAccess_level(int access_level) {
		this.access_level = access_level;
	}
	public boolean isActief() {
		return isActief;
	}
	public void setIsactief(boolean isActief) {
		this.isActief = isActief;
	}

	
	
}
