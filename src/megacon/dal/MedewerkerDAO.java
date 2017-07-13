package megacon.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import megacon.dal.DAOFactory;
import megacon.dal.Medewerker;

public class MedewerkerDAO {

	 
	public static final String TABLENAME = "Medewerker";
	public static final int blockKlantAfterDays = 75; 

	public Medewerker getMedewerker(int id_medewerker) {
		StringBuffer sqlStatement = new StringBuffer("");
		sqlStatement.append("select * from ");
		sqlStatement.append(TABLENAME);
		sqlStatement.append(" where id = ? ");
		try {
			Connection conn = DAOFactory.getDAOFactory().getConnection();
			PreparedStatement stmt = conn.prepareStatement(sqlStatement.toString());
			stmt.setInt(1, id_medewerker);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
	            conn.close();
	            return createMedewerkerFromDBRow(rs);
			} else {
	            conn.close();
				return new Medewerker();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return new Medewerker();
	}
	
	/*
	 * Klopt email+ww wat opgegeven wordt voor inloggen
	 */
	public Medewerker validate(Medewerker medew)
	{
	    String query = "select * from Medewerker  where password=? and email=? ";
	    try
	    {
	    	Connection conn = DAOFactory.getDAOFactory().getConnection();
	        PreparedStatement stmt = conn.prepareStatement(query);
	        stmt.setString(1, medew.getPassword());
	        stmt.setString(2, medew.getEmail());
	        for(ResultSet rs = stmt.executeQuery(); rs.next();) {
	        	medew = createMedewerkerFromDBRow(rs);
	        	medew.setValid();
			}
	        conn.close();
	    }
	    catch(SQLException sqle)
	    {
	        System.err.println(query);
	        System.err.println(sqle.getLocalizedMessage());
	    }
	    catch(Exception e)
	    {
	        System.err.println("Exception");
	        System.err.println(e.getLocalizedMessage());
	    }
	    return medew;
	}
	private Medewerker createMedewerkerFromDBRow(ResultSet rs) {
		Medewerker medew = new Medewerker();
    try {
    	medew.setMedewerker_id(rs.getInt("medewerker_id"));
		medew.setGeslacht(rs.getBoolean("geslacht"));
		medew.setMedewerkerNaam(rs.getString("medewerkerNaam"));
		medew.setEmail(rs.getString("email"));
		medew.setPassword(rs.getString("password"));
		medew.setAccess_level(rs.getInt("access_level"));
		medew.setIsactief(rs.getBoolean("isActief"));
	} catch (SQLException e) {
		//e.printStackTrace();
	}
    return medew;
}
}
