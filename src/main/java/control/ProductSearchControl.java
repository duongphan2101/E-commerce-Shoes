package control;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO_Product;
import entity.Category;
import entity.Product;
import entity.ProductImage;

@WebServlet("/Search")
public class ProductSearchControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductSearchControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO_Product dao = new DAO_Product();
		String search = request.getParameter("txtSearch");	
		List<Product> lst = dao.searchProduct(search);
		
		Map<Integer, String> productImagesMap = new HashMap<>();

        for (Product prod : lst) {
            int proid = prod.getId();
            ProductImage top1proImage = dao.get1ImageByProductID(proid);
            if (top1proImage != null) {
                String linkImage = "Imgs/" + top1proImage.getImage();
                productImagesMap.put(proid, linkImage);
            }
        }
		List<Category> listC = dao.getAllCategory();
		request.setAttribute("listP", lst);
		request.setAttribute("listC", listC);
		request.setAttribute("search", search);
        request.setAttribute("productImagesMap", productImagesMap);
		request.getRequestDispatcher("Category.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
