package megacon.dal;

public class Component {
	private int component_id;
	private int aantal;
	private int onderdeel_id;
	private String tekeningNr;
	private String componentNaam;
	
	
	public Component(int component_id, int aantal, int onderdeel_id, String tekeningNr, String componentNaam) {
		super();
		this.component_id = component_id;
		this.aantal = aantal;
		this.onderdeel_id = onderdeel_id;
		this.tekeningNr = tekeningNr;
		this.componentNaam = componentNaam;
	}
	
	public Component(){
		
	}
	public int getComponent_id() {
		return component_id;
	}
	public void setComponent_id(int component_id) {
		this.component_id = component_id;
	}
	public int getAantal() {
		return aantal;
	}
	public void setAantal(int aantal) {
		this.aantal = aantal;
	}
	public int getOnderdeel_id() {
		return onderdeel_id;
	}
	public void setOnderdeel_id(int onderdeel_id) {
		this.onderdeel_id = onderdeel_id;
	}
	public String getTekeningNr() {
		return tekeningNr;
	}
	public void setTekeningNr(String tekeningNr) {
		this.tekeningNr = tekeningNr;
	}
	public String getComponentNaam() {
		return componentNaam;
	}
	public void setComponentNaam(String componentNaam) {
		this.componentNaam = componentNaam;
	}
	

}
