package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO_Product;
import dao.DAO_User;
import entity.Product;
import entity.ProductImage;
import entity.ProductVariant;
import entity.Review;
import entity.User;

@WebServlet("/Product")
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductControl() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO_Product dao = new DAO_Product();
		DAO_User udao = new DAO_User();
		String id = request.getParameter("pid");
		Product p = dao.getProductByID(id);
		int proid = Integer.parseInt(id);
		int cateid = Integer.parseInt(p.getCateID());
		int num = dao.getNumReview(proid);
		List<String> listImagebyProid = dao.getAllImagebyProductID(proid);	
		List<Product> lstSPTT = dao.gettop4pProduct(proid, cateid);
		Map<Integer, String> productImagesMap = new HashMap<>();
		for (Product prod : lstSPTT) {
            int productid = prod.getId();
            ProductImage top1proImage = dao.get1ImageByProductID(productid);
            if (top1proImage != null) {
                String linkImage = "Imgs/" + top1proImage.getImage();
                
                productImagesMap.put(productid, linkImage);
            }
        }	
		Map<Integer, String> Uname = new HashMap<>();
		List<Review> listReview = dao.getAllReviewbyProductId(proid);
		for (Review r : listReview) {
		    User user = r.getUser();
		    if (user != null) {
		        int uid = user.getUser_id();
		        User u = udao.getUserbyUid(uid);
		        String name = u.getName();
		        Uname.put(uid, name);
		    }
		}
		
		Cookie[] cookies = request.getCookies();
        String cartData = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("data")) {
                    cartData = cookie.getValue();
                    break;
                }
            }
        }

        if (cartData == null || cartData.isEmpty()) {
            cartData = "";
        }
        
        String[] productEntries = cartData.split("\\|");
        Map<Integer, String> productImagesCart = new HashMap<>();
        List<ProductVariant> lstProductVariant = new ArrayList<ProductVariant>();
        for (String entry : productEntries) {
            if (!entry.isEmpty()) {
                String[] attributes = entry.split("-");
                if (attributes.length == 3) {
                    String productId = attributes[0];
                    String size = attributes[1];
                    String quantity = attributes[2];
                    
                    int amout = Integer.parseInt(quantity);
                    Product pro = dao.getProductByID(productId);
                    ProductVariant pv = dao.getProducVarianttByIDandSize(productId, size);
                    
                    pv.setProduct(pro);
                    pv.setAmount(amout);
                    lstProductVariant.add(pv);
                    
                    ProductImage top1proImage = dao.get1ImageByProductID(pro.getId());
                    if (top1proImage != null) {
                        String linkImageCart = "Imgs/" + top1proImage.getImage();
                        productImagesCart.put(pro.getId(), linkImageCart);
                    }
                }
            }
        }
        request.setAttribute("productImagesCart", productImagesCart);
        
        request.setAttribute("listVariant", lstProductVariant);
		
		List<Integer> listSize = dao.getAllSizefromProduct(proid);
		request.setAttribute("listSize", listSize);
		request.setAttribute("num", num);
		request.setAttribute("Uname", Uname);
		request.setAttribute("listReview", listReview);
		request.setAttribute("productImagesMap", productImagesMap);
		request.setAttribute("ListImage", listImagebyProid);
		request.setAttribute("Product", p);
		request.setAttribute("lst", lstSPTT);
		request.getRequestDispatcher("Product.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
