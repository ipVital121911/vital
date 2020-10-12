import dao.*;
import entity.Summary;
import entity.User;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class ApplicationDEMO {
    public static void main(String[] args) {
        SessionFactory factory = null;
        try {
            factory = new Configuration().configure().buildSessionFactory();

            // получение листа резюме.
            SummaryDAO summaryDAO = new SummaryDAO(factory).equal("surname","Иванов")
                    .or().equal("sex","женщина");
            List<Summary> listSummary = summaryDAO.read();

            // получение листа пользователей.
            UserDAO userDao = new UserDAO(factory).equal("name","Иван").and()
                    .equal("data","4.4.1997");
            List<User> userList = userDao.read();


        } finally {
            if (factory != null) {
                factory.close();
            }
        }
    }
}