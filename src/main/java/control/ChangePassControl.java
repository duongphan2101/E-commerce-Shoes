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

@WebServlet("/ChangePass")
public class ChangePassControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ChangePassControl() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO_Account dao = new DAO_Account();
		String oldPass = request.getParameter("oldPass");
		String user = request.getParameter("user");
		String uID = request.getParameter("uid");
		String newPass = request.getParameter("newPass");
		String rePass = request.getParameter("rePass");
		int id = Integer.parseInt(uID);
		String oldpass_sha = sha_256.hashPassword(oldPass);
		Account acc = dao.getAccount(user, oldpass_sha);
		if(acc!=null) {
			if(newPass.trim().equals(rePass)) {
				String pass = sha_256.hashPassword(newPass);
				dao.updatePassword(pass, id);
				System.out.println("Sucsess");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}else {
				request.setAttribute("mess1", "Mật khẩu không khớp!");
				request.getRequestDispatcher("home").forward(request, response);
			}
		}else {
			request.setAttribute("mess", "Mật khẩu cũ không chính xác!");
			request.getRequestDispatcher("home").forward(request, response);
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
