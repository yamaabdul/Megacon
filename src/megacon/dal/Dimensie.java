package megacon.dal;

public class Dimensie {
	
	private int afmeting_id;
	private String hoogte;
	private String dikte;
	private String breedte;
	private String lengte;
	
	
	
	public Dimensie(int afmeting_id, String hoogte, String dikte, String breedte, String lengte) {
		super();
		this.afmeting_id = afmeting_id;
		this.hoogte = hoogte;
		this.dikte = dikte;
		this.breedte = breedte;
		this.lengte = lengte;
	}
	
	public Dimensie(){
		
	}
	
	public int getAfmeting_id() {
		return afmeting_id;
	}
	public void setAfmeting_id(int afmeting_id) {
		this.afmeting_id = afmeting_id;
	}
	public String getHoogte() {
		return hoogte;
	}
	public void setHoogte(String hoogte) {
		this.hoogte = hoogte;
	}
	public String getDikte() {
		return dikte;
	}
	public void setDikte(String dikte) {
		this.dikte = dikte;
	}
	public String getBreedte() {
		return breedte;
	}
	public void setBreedte(String breedte) {
		this.breedte = breedte;
	}
	public String getLengte() {
		return lengte;
	}
	public void setLengte(String lengte) {
		this.lengte = lengte;
	}
	
	
}
