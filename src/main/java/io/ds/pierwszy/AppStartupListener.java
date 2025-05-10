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
        products.add(new Product(1,"ubrania", "kalosze", 29.99, "Super nie przecieka", "kalosze.jpg"));
        products.add(new Product(2,"sprzęt", "wędka", 69.98, "Twarda i gitówa", "wedka.jpg"));


        sce.getServletContext().setAttribute("globalProducts", products);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}