package ch.unige.idsi2015;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/afficherAbout")
public class afficherAbout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public afficherAbout() {
        super();
    }
    //On renvoie la requête et la réponse http vers l'emplacement de notre JSP
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher("/WEB-INF/helpark_about.jsp").forward(request, response);
	}

	

}
