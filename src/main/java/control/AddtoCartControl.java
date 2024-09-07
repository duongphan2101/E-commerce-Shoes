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
import entity.Product;
import entity.ProductImage;
import entity.ProductVariant;


@WebServlet("/addtocart")
public class AddtoCartControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddtoCartControl() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
        	String Stringproduct_id = request.getParameter("product_id");
            String Stringquantity = request.getParameter("quantity");
            String size = request.getParameter("size");
            int product_id = Integer.parseInt(Stringproduct_id);
            int quantity = Integer.parseInt(Stringquantity);
        	StringBuilder productIds = new StringBuilder();

            boolean productExists = false;

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("data")) {
                        String[] productEntries = cookie.getValue().split("\\|");
                        for (int i = 0; i < productEntries.length; i++) {
                        }
                        for (String entry : productEntries) {
                            if (!entry.isEmpty()) {
                                String[] attributes = entry.split("-");
                                int existingProductId = Integer.parseInt(attributes[0]);
                                String existingSize = attributes[1];
                                int existingQuantity = Integer.parseInt(attributes[2]);

                                if (existingProductId == product_id && existingSize.equals(size)) {
            
                                    existingQuantity += quantity;
                                    productExists = true;
                                }

                                productIds.append(existingProductId).append("-")
                                          .append(existingSize).append("-")
                                          .append(existingQuantity).append("|");
                            }
                        }
                    }
                }
            }

            if (!productExists) {
                productIds.append(Stringproduct_id).append("-").append(size).append("-").append(quantity).append("|");
            }

            Cookie productCookie = new Cookie("data", productIds.toString());
            productCookie.setMaxAge(60 * 60 * 24 * 7); // 1 tuan
            response.addCookie(productCookie);
            
            response.sendRedirect("home");
        } else if ("order".equals(action)) {
            placeOrder(request, response);
        }

        
    }

    private void placeOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	DAO_Product dao = new DAO_Product();
    	String Stringproduct_id = request.getParameter("product_id");
        String Stringquantity = request.getParameter("quantity");
        String size = request.getParameter("size");
        int quantity = Integer.parseInt(Stringquantity);
        Product p = dao.getProductByID(Stringproduct_id);
        ProductVariant pv = dao.getProducVarianttByID(Stringproduct_id);
        pv.setSize(size);
        pv.setAmount(quantity);
        
        double total = p.getPrice() * pv.getAmount();
        
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
                    String nsize = attributes[1];
                    String nquantity = attributes[2];
                    
                    int amout = Integer.parseInt(nquantity);
                    Product pro = dao.getProductByID(productId);
                    ProductVariant pvm = dao.getProducVarianttByIDandSize(productId, nsize);
                    
                    pvm.setProduct(pro);
                    pvm.setAmount(amout);
                    lstProductVariant.add(pvm);
                    
                    ProductImage top1proImage = dao.get1ImageByProductID(pro.getId());
                    if (top1proImage != null) {
                        String linkImageCart = "Imgs/" + top1proImage.getImage();
                        productImagesCart.put(pro.getId(), linkImageCart);
                    }
                }
            }
        }
        Map<Integer, String> productImages = new HashMap<>();
        ProductImage top1proImageBest = dao.get1ImageByProductID(p.getId());
        String linkImage = "Imgs/" + top1proImageBest.getImage();
        productImages.put(p.getId(), linkImage);
        
        
        request.setAttribute("productImagesCart", productImagesCart);
        request.setAttribute("productImages", productImages);
        request.setAttribute("listVariant", lstProductVariant);
        
        request.setAttribute("total", total);
        request.setAttribute("p", p);
        request.setAttribute("pv", pv);
        request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
