package dao;
import javax.persistence.Entity;
import java.util.List;

public interface DAO {
    Entity and();
    Entity or();
    Entity equal(String columnName, String name);
    List<Entity> read();
    Entity readObjectByKey(Integer id);
    void createObject(Entity entity);
    void updateObject(Entity entity);
    void deleteObject(Entity entity);
}
