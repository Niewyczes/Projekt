package io.ds.pierwszy;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@WebServlet(
        name = "Cart_Servlet",
        value = {"/cart-servlet"}
)
public class Cart_Servlet extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session=request.getSession();
    int productId=Integer.parseInt(request.getParameter("productId"));
    int quantity=Integer.parseInt(request.getParameter("quantity"));
    List<Product> globalProducts=(List<Product>) getServletContext().getAttribute("globalProducts");
    Product this_product=null;
    for (Product p:globalProducts){
        if (p.getId()==productId){

            this_product=p;
            break;
        }
    }
    Map <Integer,Integer> cart=(Map<Integer,Integer>)session.getAttribute("cart");
    if (cart==null){
        cart=new HashMap<>();
    }
    int currentQuantity=cart.getOrDefault(productId,0);
    cart.put(productId,currentQuantity+quantity);

    session.setAttribute("cart",cart);
    session.setAttribute("LastAddedProductName",this_product.getName());
    session.setAttribute("LastAddedQuantity",quantity);

    response.sendRedirect("index.jsp?success=1");

}
    }
