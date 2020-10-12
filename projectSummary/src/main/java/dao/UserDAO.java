package dao;

import com.sun.istack.internal.NotNull;
import entity.User;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import java.util.Iterator;
import java.util.List;

public class UserDAO {
    /** Подключения к базе данных. */
    private final SessionFactory factory; // потоко безопасная

    private User user = new User();

    private StringBuilder stringBuilder = new StringBuilder("SELECT * FROM users as u ");

    public UserDAO(@NotNull final SessionFactory factory) {
        this.factory = factory;
    }

    /** метов для read. */
    public UserDAO equal(String columnName, String name) {
        if (columnName.equals("name") || columnName.equals("surname") || columnName.equals("lastname") ||
                columnName.equals("data") || columnName.equals("sex")) {
            if (stringBuilder.toString().equals("SELECT * FROM users as u ")){
                stringBuilder.append(" WHERE ");
            }
            stringBuilder.append(" u.").append(columnName).append(" = '").append(name).append("' ");

            System.out.println(stringBuilder.toString());
        }
        return this;
    }

    /** Метод для read. */
    public UserDAO and() {
        stringBuilder.append(" AND ");
        return this;
    }

    /** Метод для read. */
    public UserDAO or() {
        stringBuilder.append(" OR ");
        return this;
    }

    /** Читать пользователей! */
    public List<User> read() {
        try (final Session session = factory.openSession()) {

            Query query = session.createNativeQuery(stringBuilder.toString())
                    .addEntity(User.class);
            List<User> users =  query.list();
            // обновляем stringBuilder
            stringBuilder = new StringBuilder("SELECT * FROM users as u ");
            // выводим пользователей в консоль
            for (Iterator<User> iterator = users.iterator(); iterator.hasNext();) {
                User user = iterator.next();
                System.out.println(user);
            }
            System.out.println("COUNT: " + users.size());
            return users;
        }
    }

    /** Прочитать пользователя по ключу */
    public User readObjectByKey(Integer id) {
        try (final Session session = factory.openSession()) {

            final User result = session.get(User.class,(long) id);

            if (result != null) {
                Hibernate.initialize(result.getContacts());
            }
            return result;
        }
    }

    /** Записать пользователя */
    public void createObject(@NotNull User user) {
        try (final Session session = factory.openSession()) {

            session.beginTransaction();

            session.save(user);

            session.getTransaction().commit();
        }
    }

    /** Обновить пользователя */
    public void updateObject(@NotNull User user) {
        try (Session session = factory.openSession()) {

            session.beginTransaction();

            session.update(user);

            session.getTransaction().commit();
        }
    }

    /** Удалить пользователя */
    public void deleteObject(@NotNull User user) {
        try (Session session = factory.openSession()) {

            session.beginTransaction();

            session.delete(user);

            session.getTransaction().commit();
        }
    }

}
