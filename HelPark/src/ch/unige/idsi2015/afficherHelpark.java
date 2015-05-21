package ch.unige.idsi2015;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/afficherHelpark")
public class afficherHelpark extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public afficherHelpark() {
        super();
    }
    //On renvoie la requ�te et la r�ponse http vers l'emplacement de notre JSP
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher("/WEB-INF/helpark.jsp").forward(request, response);
        
	}

}


