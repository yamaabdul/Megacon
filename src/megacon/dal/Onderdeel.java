package megacon.dal;

public class Onderdeel {
	
	private int onderdeel_id;
	private int component_id;
	private int standardOnderdeel_id;
	private String onderdeelnaam;
	private String positie;
	private int aantal;
	private boolean isActief   = false;
	private String notitie;
	
	
		
	public Onderdeel(int onderdeel_id, int component_id, int standardOnderdeel_id, String onderdeelnaam,
			String positie, int aantal, boolean isActief, String notitie) {
		super();
		this.onderdeel_id = onderdeel_id;
		this.component_id = component_id;
		this.standardOnderdeel_id = standardOnderdeel_id;
		this.onderdeelnaam = onderdeelnaam;
		this.positie = positie;
		this.aantal = aantal;
		this.isActief = isActief;
		this.notitie = notitie;
	}
	
	public Onderdeel(){
		
	};
	
	public int getOnderdeel_id() {
		return onderdeel_id;
	}
	public void setOnderdeel_id(int onderdeel_id) {
		this.onderdeel_id = onderdeel_id;
	}
	public int getComponent_id() {
		return component_id;
	}
	public void setComponent_id(int component_id) {
		this.component_id = component_id;
	}
	public int getStandardOnderdeel_id() {
		return standardOnderdeel_id;
	}
	public void setStandardOnderdeel_id(int standardOnderdeel_id) {
		this.standardOnderdeel_id = standardOnderdeel_id;
	}
	public String getOnderdeelnaam() {
		return onderdeelnaam;
	}
	public void setOnderdeelnaam(String onderdeelnaam) {
		this.onderdeelnaam = onderdeelnaam;
	}
	public String getPositie() {
		return positie;
	}
	public void setPositie(String positie) {
		this.positie = positie;
	}
	public int getAantal() {
		return aantal;
	}
	public void setAantal(int aantal) {
		this.aantal = aantal;
	}
	public boolean isActief() {
		return isActief;
	}
	public void setActief(boolean isActief) {
		this.isActief = isActief;
	}
	public String getNotitie() {
		return notitie;
	}
	public void setNotitie(String notitie) {
		this.notitie = notitie;
	}
	
	
	
	
}


