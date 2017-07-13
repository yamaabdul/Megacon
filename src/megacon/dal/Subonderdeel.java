package megacon.dal;

public class Subonderdeel {
	private int subonderdeel_id;
	private String subonderdeelNaam;
	private int afmeting_id;
	
	
	public Subonderdeel(int subonderdeel_id, String subonderdeelNaam, int afmeting_id) {
		super();
		this.subonderdeel_id = subonderdeel_id;
		this.subonderdeelNaam = subonderdeelNaam;
		this.afmeting_id = afmeting_id;
	}
	
	public Subonderdeel(){
		
	}
	public int getSubonderdeel_id() {
		return subonderdeel_id;
	}
	public void setSubonderdeel_id(int subonderdeel_id) {
		this.subonderdeel_id = subonderdeel_id;
	}
	public String getSubonderdeelNaam() {
		return subonderdeelNaam;
	}
	public void setSubonderdeelNaam(String subonderdeelNaam) {
		this.subonderdeelNaam = subonderdeelNaam;
	}
	public int getAfmeting_id() {
		return afmeting_id;
	}
	public void setAfmeting_id(int afmeting_id) {
		this.afmeting_id = afmeting_id;
	}
	
	
	
	
}
