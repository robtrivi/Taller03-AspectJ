import java.io.File;
import java.util.Calendar;

import java.io.FileWriter;
import java.io.IOException;

public aspect Logger {
	File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    pointcut success() : call(* effectiveLogOut*(..) );
    after() : success() {
    	String username = "user";
    	sessionClosed(username);
    	
    }
    
    
    pointcut successReg() : call(* successfulSignUp*(..) );
    after() : successReg() {
    //Aspecto ejemplo: solo muestra este mensaje despu�s de haber creado un usuario 
    	String nickname ="sdfdsf";
    	String password = "sdadsa";
    	registerAction(nickname, password);
    }
    
    public static void sessionClosed(String username) {
    	
    	//todo
    }
public static void registerAction(String username, String password) {
    	
		try {
			FileWriter fileWritter = new FileWriter("Register.txt");
			
			fileWritter.write("");
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}
}
		/*
		
    	//imprimir info del usuario
		// escribir en archivo register.txt
import com.bettinghouse.User;



public aspect Logger {
	
	
	
	//File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    pointcut success(User user) : call(* effectiveLog*(User)) && args(user);
    
    after(User user) : success(user) {
    	
    	String hecho = "";
    	
    	if (thisJoinPointStaticPart.getSignature().getName().equals("effectiveLogOut")) {
    		hecho = "inicada";
    	}
    	
    	String mensaje = String.format("Sesión %s por usuario: [%s]\t Fecha: [%s]",hecho,user.getNickname(),cal.toString());
    	System.out.print(mensaje);
    }
}

*/
