package megacon.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProjectDAO {
	
	 
	public static final String TABLENAME = "Project";
	
	public Medewerker getMedewerker(int project_id) {
		StringBuffer sqlStatement = new StringBuffer("");
		sqlStatement.append("select * from ");
		sqlStatement.append(TABLENAME);
		sqlStatement.append(" where id = ? ");
		try {
			Connection conn = DAOFactory.getDAOFactory().getConnection();
			PreparedStatement stmt = conn.prepareStatement(sqlStatement.toString());
			stmt.setInt(1, project_id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
	            conn.close();
	          
			} else {
	            conn.close();
				return new Medewerker();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return new Medewerker();
	}

}
