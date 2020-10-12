package entity;
import lombok.*;
import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

@Table(name = "technology")
public class Technology implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "technology_id")
    private long id;
    @Column(name = "name")
    private String name;
    @ManyToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinTable(name = "summary_technology", joinColumns = @JoinColumn(name = "technology_id"),
            inverseJoinColumns = @JoinColumn(name = "summary_id"))
    private List<Summary> summaryList = new ArrayList<>();

    @Override
    public String toString() {
        return "Technology{" +
                "name='" + name + '\'' +
                '}';
    }
}
