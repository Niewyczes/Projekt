package io.ds.pierwszy;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

@WebListener
public class AppStartupListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        List<Product> products = new ArrayList<>();
        products.add(new Product("ubrania","kalosze", 29.99,"Super nie przecieka"));
        products.add(new Product("sprzęt","wędka", 69.98, "Twarda i gitówa" ));

        sce.getServletContext().setAttribute("globalProducts", products);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}