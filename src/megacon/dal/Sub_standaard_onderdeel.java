
package megacon.dal;

public class Sub_standaard_onderdeel {
	
	private int sub_standaardOnderdeel_id;
	private String sub_standaardO_naam;
	private boolean isActief;
	
		
	
	public Sub_standaard_onderdeel(int sub_standaardOnderdeel_id, String sub_standaardO_naam, boolean isActief) {
		super();
		this.sub_standaardOnderdeel_id = sub_standaardOnderdeel_id;
		this.sub_standaardO_naam = sub_standaardO_naam;
		this.isActief = isActief;
	}
	
	public Sub_standaard_onderdeel(){
		
	}
	
	public int getSub_standaardOnderdeel_id() {
		return sub_standaardOnderdeel_id;
	}
	public void setSub_standaardOnderdeel_id(int sub_standaardOnderdeel_id) {
		this.sub_standaardOnderdeel_id = sub_standaardOnderdeel_id;
	}
	public String getSub_standaardO_naam() {
		return sub_standaardO_naam;
	}
	public void setSub_standaardO_naam(String sub_standaardO_naam) {
		this.sub_standaardO_naam = sub_standaardO_naam;
	}
	public boolean isActief() {
		return isActief;
	}
	public void setActief(boolean isActief) {
		this.isActief = isActief;
	}
	
	
	
	

}
