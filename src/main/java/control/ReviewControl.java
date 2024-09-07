package control;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO_User;
import dao.getDate;
import entity.Product;
import entity.Review;
import entity.User;

@WebServlet("/Review")
public class ReviewControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ReviewControl() {
        super();
       
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAO_User dao = new DAO_User();
        String review = request.getParameter("review-text");
        String ratingStr = request.getParameter("rating");
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        if (ratingStr == null || ratingStr.isEmpty()) {
            HttpSession session = request.getSession();
            session.setAttribute("alertMessage", "Vui lòng nhập đánh giá (rating)!");
            session.setAttribute("alertType", "danger");
            response.sendRedirect("Product?pid=" + product_id);
            return;
        }
        
        int rating = Integer.parseInt(ratingStr);
        Date toDay = new Date();
        String day = getDate.toDateTime(toDay);
        HttpSession session = request.getSession();
        try {
            int acc_id = Integer.parseInt(request.getParameter("account_id"));
            
            User u = dao.getUser(acc_id);
            Product p = new Product(product_id);
            User u1 = new User(u.getUser_id());
            Review newReview = new Review(0, p, u1, rating, review, day);
            dao.addReview(newReview);

            session.setAttribute("alertMessage", "Đã Thêm Review!");
            session.setAttribute("alertType", "success");
            response.sendRedirect("Product?pid=" + product_id);
        } catch (Exception e) {

            session.setAttribute("alertMessage", "Vui lòng đăng nhập để Review!");
            session.setAttribute("alertType", "danger");
            response.sendRedirect("Product?pid=" + product_id);
        }
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
