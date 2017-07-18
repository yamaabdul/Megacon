package megacon.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;


public class Standaard_onderdeelDAO {

	
	public static final String TABLENAME = "Standaard_onderdeel";

	public Standaard_onderdeel getStandaard_onderdeel(int standaardOnderdeel_id) {
		StringBuffer sqlStatement = new StringBuffer("");
		sqlStatement.append("select * from ");
		sqlStatement.append(TABLENAME);
		sqlStatement.append(" where standaardOnderdeel_id = ? ");
		sqlStatement.append(" and isActief= 1 ");
		try {
			Connection conn = DAOFactory.getDAOFactory().getConnection();
			PreparedStatement stmt = conn.prepareStatement(sqlStatement.toString());
			stmt.setInt(1, standaardOnderdeel_id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
	            conn.close();
	            return createStandaardOnderdeelFromDBRow(rs);
			} else {
	            conn.close();
				return new Standaard_onderdeel();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return new Standaard_onderdeel();
	}
	
	public Collection<Standaard_onderdeel> getStandaard_onderdelen() {
		StringBuffer sqlStatement = new StringBuffer("");
		sqlStatement.append("select * from ");
		sqlStatement.append(TABLENAME);
		sqlStatement.append(" where isActief= 1 ");
		sqlStatement.append(" order by standaardOnderdeel_id asc");
		Collection<Standaard_onderdeel> tempColl = new LinkedList<Standaard_onderdeel>();
		try {
			Connection conn = DAOFactory.getDAOFactory().getConnection();
			PreparedStatement stmt = conn.prepareStatement(sqlStatement.toString());
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				tempColl.add(createStandaardOnderdeelFromDBRow(rs));
			}
			conn.close();
			return tempColl;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	private Standaard_onderdeel createStandaardOnderdeelFromDBRow(ResultSet rs) {
		Standaard_onderdeel st_ond = new Standaard_onderdeel();
    try {
    	st_ond.setStandaardOnderdeel_id(rs.getInt("standaardOnderdeel_id"));
    	st_ond.setStandaardO_naam(rs.getString("standaardO_naam"));
    	st_ond.setActief(rs.getBoolean("isActief"));

    } catch (SQLException e) {
		//e.printStackTrace();
	}
    return st_ond;
}
	
	
	
	
	
}
