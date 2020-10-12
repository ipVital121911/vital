import dao.SummaryDAO;
import entity.Summary;
import entity.Technology;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

public class SummaryDAOTest {
    @Test
    public void resumeSearchWhereNameMariaSurnameMorskaiaLastnameVasilevnaWeWillGet1ObjectOfResumeWithId3(){
        SessionFactory factory = null;
        factory = new Configuration().configure().buildSessionFactory();
        SummaryDAO summaryDAO = new SummaryDAO(factory).equal("surname","Морская").and()
                .equal("name","Мария").and().equal("lastname","Васильевна");
        List<Summary> list = summaryDAO.read();
        assertThat ((int) list.get(0).getId(), is(3));
        assertThat (list.size(), is(1));
    }
}
