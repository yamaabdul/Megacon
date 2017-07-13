package megacon.dal;

public class Status {
	public static final int Nieuw       	= 0;
	public static final int Geaccepteerd   	= 1;
	public static final int Geweigerd   	= 2;
	public static final int Geannuleerd  	= 3;
	public static String[] text = new String[4];
	
	static {
	text[Nieuw]         	= "Nieuw";
	text[Geaccepteerd]   	= "Geaccepteerd";
	text[Geweigerd] 		= "Geweigerd";
	text[Geannuleerd]  		= "Geannuleerd";
 	}
	
	private int status_id;
	private String statusOmschrijving;
	
	public int getStatus_id() {
		return status_id;
	}
	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}
	public String getStatusOmschrijving() {
		return statusOmschrijving;
	}
	public void setStatusOmschrijving(String statusOmschrijving) {
		this.statusOmschrijving = statusOmschrijving;
	}
	
}
