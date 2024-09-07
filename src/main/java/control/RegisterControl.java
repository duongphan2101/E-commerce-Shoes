package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO_Account;
import dao.sha_256;
import entity.Account;
import entity.User;

@WebServlet("/Register")
public class RegisterControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegisterControl() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO_Account dao = new DAO_Account();
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String cccd = request.getParameter("cccd");
		String address = request.getParameter("address");

		Account p = dao.checkAccount(user);
		
		if(p==null) {
			String newpass = sha_256.hashPassword(pass);
			Account a = new Account(0, user, newpass, 0, 0);
			dao.addAccount(a);
			
			int uId = dao.getLastUid();
			User u = new User(0, new Account(uId), name, phone, cccd, address);
			dao.addUser(u);
			response.sendRedirect("Login.jsp");
		}
		else {
			request.setAttribute("mess", "Tài Khoản Đã Tồn Tài!");
			request.getRequestDispatcher("Register.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
