package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO_Account;
import dao.sha_256;
import entity.Account;
import entity.User;

@WebServlet("/Login")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginControl() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		
		DAO_Account dao = new DAO_Account();
		String newpass = sha_256.hashPassword(pass);
		Account a = dao.getAccount(user, newpass);
		
		if(a==null) {
			request.setAttribute("mess", "Sai tài khoản hoặc mật khẩu!");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}else {
			HttpSession sess = request.getSession();		
			User u = dao.getUserbyuID(a.getuID());
			sess.setAttribute("a", a);
			sess.setAttribute("u", u);
			response.sendRedirect("home");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
