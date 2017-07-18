package megacon.dal;

public class Standaard_onderdeel {

	private int standaardOnderdeel_id;
	private String standaardO_naam;
	private boolean isActief= false;
	
	
		
	public Standaard_onderdeel(int standaardOnderdeel_id, String standaardO_naam, boolean isActief) {
		super();
		this.standaardOnderdeel_id = standaardOnderdeel_id;
		this.standaardO_naam = standaardO_naam;
		this.isActief = isActief;
	}
	
	public Standaard_onderdeel(){
		
	}
	
	public int getStandaardOnderdeel_id() {
		return standaardOnderdeel_id;
	}
	public void setStandaardOnderdeel_id(int standaardOnderdeel_id) {
		this.standaardOnderdeel_id = standaardOnderdeel_id;
	}
	public String getStandaardO_naam() {
		return standaardO_naam;
	}
	public void setStandaardO_naam(String standaardO_naam) {
		this.standaardO_naam = standaardO_naam;
	}
	public boolean isActief() {
		return isActief;
	}
	public void setActief(boolean isActief) {
		this.isActief = isActief;
	}
	
	
	
	
	
	
	
	
	
}
