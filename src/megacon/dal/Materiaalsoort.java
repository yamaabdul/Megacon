package megacon.dal;

import java.math.BigDecimal;

public class Materiaalsoort {
	private int materiaalsoort_id;
	private String materiaalcode;
	private String omschrijving;
	private String unit;
	private BigDecimal soortelijkGewicht;
	private BigDecimal materiaalPrijs;
	private String certificering;
	
	
	public Materiaalsoort(int materiaalsoort_id, String materiaalcode, String omschrijving, String unit,
			BigDecimal soortelijkGewicht, BigDecimal materiaalPrijs, String certificering) {
		super();
		this.materiaalsoort_id = materiaalsoort_id;
		this.materiaalcode = materiaalcode;
		this.omschrijving = omschrijving;
		this.unit = unit;
		this.soortelijkGewicht = soortelijkGewicht;
		this.materiaalPrijs = materiaalPrijs;
		this.certificering = certificering;
	}
	public Materiaalsoort(){
		
	}
	
	public int getMateriaalsoort_id() {
		return materiaalsoort_id;
	}
	public void setMateriaalsoort_id(int materiaalsoort_id) {
		this.materiaalsoort_id = materiaalsoort_id;
	}
	public String getMateriaalcode() {
		return materiaalcode;
	}
	public void setMateriaalcode(String materiaalcode) {
		this.materiaalcode = materiaalcode;
	}
	public String getOmschrijving() {
		return omschrijving;
	}
	public void setOmschrijving(String omschrijving) {
		this.omschrijving = omschrijving;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public BigDecimal getSoortelijkGewicht() {
		return soortelijkGewicht;
	}
	public void setSoortelijkGewicht(BigDecimal soortelijkGewicht) {
		this.soortelijkGewicht = soortelijkGewicht;
	}
	public BigDecimal getMateriaalPrijs() {
		return materiaalPrijs;
	}
	public void setMateriaalPrijs(BigDecimal materiaalPrijs) {
		this.materiaalPrijs = materiaalPrijs;
	}
	public String getCertificering() {
		return certificering;
	}
	public void setCertificering(String certificering) {
		this.certificering = certificering;
	}
	
	
}
