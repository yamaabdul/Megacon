package megacon.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import megacon.util.LyritSettings;

public class LyritSettings {
	
	/**
	 * database props
	 */
	public static String DBNAME;
	public static String DBUSER;
	public static String DBPASSWORD;
	public static String DBHOSTNAME;
	public static int DBPORTNUMBER;
	
	static {
		/**
		 * database connection
		 */
		try {
			Properties dbproperties = new Properties();
			InputStream MyInputStream = LyritSettings.class.getResourceAsStream("db.properties");
			dbproperties.load(MyInputStream);

			DBNAME       = dbproperties.getProperty("dbname");
			DBUSER       = dbproperties.getProperty("dbuser");
			DBPASSWORD   = dbproperties.getProperty("dbpassword");
			DBHOSTNAME   = dbproperties.getProperty("dbhostname");
			DBPORTNUMBER = Integer.parseInt(dbproperties.getProperty("dbportnumber"));

		} catch (IOException ioe) {
			System.out.println("File not found db.properties " + ioe.getMessage());
		}
	}
	
	public final static String eol            = "\r\n";  // window eol. Unix eol = \n ?
	
	public static StringBuffer showHeader(){
		StringBuffer header = new StringBuffer("");
		header.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\"> ");
		header.append("\n");
		header.append("<html> ");
		header.append("\n");
		header.append("<head> ");
		header.append("\n");
		header.append("<style type=\"text/css\"><!--/* Tooltip */a.tooltip,a.tooltip:link,a.tooltip:visited,a.tooltip:active {position: relative;text-decoration: none;font-style: bold;border-bottom:0px dotted #4dbcf3;}a.tooltip:hover {background: transparent;z-index: 100;}a.tooltip span {display: none;text-decoration: none;}a.tooltip:hover span {display: block;position: absolute;top: 30px;left: 0;width: 300px;z-index: 100;color: #000000;border: 1px solid;border-color: #FFFFFF #D5D7DB #D5D7DB #FFFFFF;border-left: 4px solid #4dbcf3;padding: 2px 10px 2px 10px;background: #EEEEEE;font-family: Verdana, Arial, Helvetica, Sans-serif;font-style: Normal;text-align: left;}--></style> ");
		header.append("\n");
		header.append("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\" media=\"screen\"/> ");
		header.append("\n");
		header.append("<script src=\"http://code.jquery.com/jquery-latest.min.js\" type=\"text/javascript\"></script> ");
		header.append("\n");
		header.append("<script src=\"script/menuscript.js\"></script> ");
		header.append("\n");
		header.append("<title>Megacon Voorcalculatie</title> ");
		header.append("\n");
		header.append("<link rel='shortcut icon' href='favicon.ico' /> ");
		header.append("\n");
		header.append("<script type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js\"></script> ");
		header.append("\n");
		header.append("<script type=\"text/javascript\" src=\"script/animatedcollapse.js\"> ");
		header.append("\n");
		header.append("</script> ");
		header.append("\n");
		header.append("<script type=\"text/javascript\"> ");
		header.append("\n");
		header.append("animatedcollapse.addDiv('cat', 'fade=0,speed=400,group=pets') ");
		header.append("\n");
		header.append("animatedcollapse.ontoggle=function($, divobj, state){ //fires each time a DIV is expanded/contracted ");
		header.append("\n");
		header.append("	//$: Access to jQuery ");
		header.append("\n");
		header.append("	//divobj: DOM reference to DIV being expanded/ collapsed. Use \"divobj.id\" to get its ID ");
		header.append("\n");
		header.append("	//state: \"block\" or \"none\", depending on state ");
		header.append("\n");
		header.append("} ");
		header.append("\n");
		header.append("\n");
		header.append("animatedcollapse.init() ");
		header.append("\n");
		header.append("</script> ");
		header.append("\n");
		header.append("</head> ");
		header.append("\n");
		header.append("<body class=\"login\"> ");
		header.append("\n");

		return header;
	}
}
