import java.io.File;
import java.util.Calendar;

public aspect Logger {
	File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    pointcut success() : call(* effectiveLogOut*(..) );
    after() : success() {
    	String username = "user";
    	sessionClosed(username);
    	
    }
    
    public static void sessionClosed(String username) {
    	
    	//todo
    }
}

