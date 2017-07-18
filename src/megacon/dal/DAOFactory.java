package megacon.dal;

import java.sql.Connection;
import java.sql.SQLException;

import megacon.dal.MedewerkerDAO;

 

public abstract class DAOFactory {
	
	public static final int SQLServer = 1;

	public MedewerkerDAO getMedewerkerDAO() {
		return new MedewerkerDAO();
	}
	
	public Standaard_onderdeelDAO getStandaard_onderdeelDAO() {
		return new Standaard_onderdeelDAO();
	}
	
	public abstract Connection getConnection() throws SQLException;
   
	public static DAOFactory getDAOFactory() {  // default method
		return getDAOFactory(SQLServer);
	}

    private static DAOFactory getDAOFactory(int whichFactory) {
		switch (whichFactory) {
			case SQLServer:
				return new SQLServerDAOFactory();
			default:
				return null;
		}
	}
}
