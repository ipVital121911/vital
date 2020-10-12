package dao;
import com.sun.istack.internal.NotNull;
import entity.Summary;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import java.util.Iterator;
import java.util.List;

public class SummaryDAO {
    /** Подключения к базе данных. */
    private final SessionFactory factory; // потоко безопасная

    private Summary summary = new Summary();

    private StringBuilder stringBuilder = new StringBuilder
            ("SELECT * FROM summary as s JOIN users as u ON s.user_id = u.user_id ");

    public SummaryDAO(SessionFactory factory) {
        this.factory = factory;
    }

    /** Метов для read. */
    public SummaryDAO equal(String columnName, String name) {
        if (columnName.equals("name") || columnName.equals("surname") || columnName.equals("lastname") ||
                columnName.equals("data") || columnName.equals("sex")) {
            if (stringBuilder.toString().equals("SELECT * FROM summary as s JOIN users as u ON s.user_id = u.user_id ")){
                stringBuilder.append(" WHERE ");
            }
            stringBuilder.append(" u.").append(columnName).append(" = '").append(name).append("' ");

            System.out.println(stringBuilder.toString());
        }
        return this;
    }

    /** Метод для read. */
    public SummaryDAO and() {
        stringBuilder.append(" AND ");
        return this;
    }

    /** Метод для read. */
    public SummaryDAO or() {
        stringBuilder.append(" OR ");
        return this;
    }

    /** Метод чтения обьектов. */
    public List<Summary> read() {
        try (final Session session = factory.openSession()) {
            Query query = session.createNativeQuery(stringBuilder.toString())
                    .addEntity(Summary.class);
            List<Summary> summaries =  query.list();
            // обновляем stringBuilder
            stringBuilder = new StringBuilder
                    ("SELECT * FROM summary as s JOIN users as u ON s.user_id = u.user_id ");
            // ниже вывод в консоль
            for (Iterator<Summary> iterator = summaries.iterator(); iterator.hasNext();) {
                Summary summary = iterator.next();
                System.out.println(summary);
            }
            System.out.println("COUNT: " + summaries.size());
            return summaries;
        }
    }

    /** Получить резюме по id. */
    public Summary readObjectByKey(@NotNull final Integer id) {
        try (final Session session = factory.openSession()) {

            final Summary result = session.get(Summary.class,(long) id);

            if (result != null) {
                Hibernate.initialize(result.getUser().getContacts());
                Hibernate.initialize(result.getUser());
                Hibernate.initialize(result.getTechnologyList());
            }

            return result;
        }
    }

    /** Сохранение в базу данных резюме. */
    public void createObject(@NotNull final Summary summary) {
        try (final Session session = factory.openSession()) {

            session.beginTransaction();

            session.save(summary);

            session.getTransaction().commit();
        }
    }

    /** Обновить резюме. */
    public void updateObject(@NotNull final Summary summary) {
        try (Session session = factory.openSession()) {

            session.beginTransaction();

            session.update(summary);

            session.getTransaction().commit();
        }
    }

    /** Удалить резюме. */
    public void deleteObject(@NotNull final Summary summary) {
        try (Session session = factory.openSession()) {

            session.beginTransaction();

            session.delete(summary);

            session.getTransaction().commit();
        }
    }
}
