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
       // products.add(new Product(1,"ubrania", "kalosze", 29.99, "Super nie przecieka", "kalosze.jpg"));
       // products.add(new Product(2,"sprzęt", "wędka", 69.98, "Twarda i gitówa", "wedka.jpg"));
        products.add(new Product(1, "Wędziska", "Spiningowe", 99.99, "Wędziska spinningowe służą głównie do połowu ryb drapieżnych.", "Spiningowe.jpg"));
        products.add(new Product(2,"Wędziska", "Gruntowe", 99.99, "Wędki gruntowe służą do połowu ryb zamieszkujących dno zbiorników wodnych.", "Gruntowe.jpg"));
        products.add(new Product(3, "Wędziska", "Spławikowe", 99.99, "Pozwalają na precyzyjne prezentowanie przynęty i złowienie różnych gatunków ryb", "Spławikowe.jpg"));
        products.add(new Product(4, "Wędziska", "Castingowe", 99.99, "Zarówno metoda castingowa, jak i wędki castingowe powstały z myślą o łowieniu największych okazów, dlatego bardzo dobrze sprawdzają się w łowieniu ryb na morzu.", "Castingowe.jpg"));
        products.add(new Product(5, "Akcesoria", "Spławiki", 9.99, "Służy do sygnalizowania brań ryby w wędkarstwie spławikowym.", "Spławiki.jpg"));
        products.add(new Product(6, "Akcesoria", "Ciężarki", 9.99, "Są one używane do zarzucania wędki na odległości, aby dosięgnąć celu.", "Ciężarki.jpg"));
        products.add(new Product(7, "Akcesoria", "Krzesła Wędkarskie", 59.99, "Krzesła wędkarskie służą do wygodnego siedzenia podczas wędkowania, zapewniając komfort i umożliwiając długotrwałe siedzenie na łowisku.", "Krzesła.jpg"));
        products.add(new Product(8, "Akcesoria", "Żyłki", 9.99, "Linka ta pokryta jest warstwą odporną na ścieranie.", "Żyłki.jpg"));
        products.add(new Product(9, "Przynęty", "Zanęty", 9.99, "Służy do przyciągania ryb do wybranego miejsca i utrzymania ich tam na dłużej, zwiększając szansę na złowienie.", "Zanęty.jpg"));
        products.add(new Product(10, "Przynęty", "Woblery", 9.99, "Woblery to sztuczne przynęty wędkarskie, które wykorzystuje się do łowienia ryb drapieżnych.", "Woblery.jpg"));
        products.add(new Product(11, "Przynęty", "Pellet", 9.99, "Pellet wędkarski jest wytwarzany z wielu rodzajów mączek zapachowych, a przy tym wzbogacany o witaminy i substancje odżywcze.", "Pellet.jpg"));
        products.add(new Product(12, "Przynęty", "Kulki Proteinowe", 9.99, "Kulki proteinowe to gotowe przynęty, które służą do wabienia swoim zapachem oraz kolorem ryb.", "Kulki.jpg"));
        products.add(new Product(13, "Podbieraki", "Siatki na ryby", 29.99, "Służy do transportowania złowionych okazów oraz zabezpieczenia przed wypadnięciem z wody lub zabrudzeniem.", "Siatki.jpg"));
        products.add(new Product(14, "Podbieraki", "Chwytaki", 29.99, "To dobra alternatywa dla podbieraka.", "Chwytaki.jpg"));
        products.add(new Product(15, "Podbieraki", "Podrywki", 29.99, "Podrywka wędkarska służy do łapania żywej przynęty (żywców), którą następnie można użyć na wędkę.", "Podrywki.jpg"));
        products.add(new Product(16, "Podbieraki", "Magnety", 29.99, "Magnety do wędkarstwa, czyli magnesy wędkarskie, służą do wyławiania metalowych przedmiotów z akwenów wodnych.", "Magnety.jpg"));

        sce.getServletContext().setAttribute("globalProducts", products);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}