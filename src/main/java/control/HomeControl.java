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

@WebServlet("/Home")
public class HomeControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HomeControl() {
        super();
  
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAO_Product dao = new DAO_Product();
        List<Product> list = dao.get10NewProduct();
        Map<Integer, String> productImagesMap = new HashMap<>();
        for (Product prod : list) {
            int proid = prod.getId();
            ProductImage top1proImage = dao.get1ImageByProductID(proid);
            if (top1proImage != null) {
                String linkImage = "Imgs/" + top1proImage.getImage();
                productImagesMap.put(proid, linkImage);
            }
        }
        
        
        Product bestSellerProduct = dao.getBestSellerProduct();
        ProductImage top1proImageBest = dao.get1ImageByProductID(5);
        String linkImage = "Imgs/" + top1proImageBest.getImage();
        productImagesMap.put(bestSellerProduct.getId(), linkImage);
        
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
                    Product p = dao.getProductByID(productId);
                    ProductVariant pv = dao.getProducVarianttByIDandSize(productId, size);
                    
                    pv.setProduct(p);
                    pv.setAmount(amout);
                    lstProductVariant.add(pv);
                    
                    ProductImage top1proImage = dao.get1ImageByProductID(p.getId());
                    if (top1proImage != null) {
                        String linkImageCart = "Imgs/" + top1proImage.getImage();
                        productImagesCart.put(p.getId(), linkImageCart);
                    }
                }
            }
        }
        
        
        request.setAttribute("listVariant", lstProductVariant);
        request.setAttribute("listP", list);
        request.setAttribute("productImagesMap", productImagesMap);
        request.setAttribute("productImagesCart", productImagesCart);
        request.setAttribute("P", bestSellerProduct);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
        
        
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
