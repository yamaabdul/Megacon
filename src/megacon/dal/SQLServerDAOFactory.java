package megacon.dal;


import java.sql.Connection;
import java.sql.SQLException;
import megacon.util.LyritSettings;
import com.microsoft.sqlserver.jdbc.SQLServerConnectionPoolDataSource;

public class SQLServerDAOFactory extends DAOFactory {

	public static SQLServerConnectionPoolDataSource ds;

	static {
		ds = new SQLServerConnectionPoolDataSource();
		ds.setDatabaseName(LyritSettings.DBNAME);
		ds.setUser(LyritSettings.DBUSER);
		ds.setPassword(LyritSettings.DBPASSWORD);
		ds.setHostNameInCertificate(LyritSettings.DBHOSTNAME);
		ds.setServerName(LyritSettings.DBHOSTNAME);
		ds.setPortNumber(LyritSettings.DBPORTNUMBER);
	}

	public Connection getConnection() throws SQLException {
		return ds.getPooledConnection().getConnection();
	}
}
