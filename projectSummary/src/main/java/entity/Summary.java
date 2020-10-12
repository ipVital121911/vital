package entity;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Getter
@Setter

@NoArgsConstructor
@AllArgsConstructor
@Table(name = "summary")
public class Summary implements Serializable {
    @Id
    @Column(name = "summary_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    //@PrimaryKeyJoinColumn
    private User user;

    @ManyToMany(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinTable(name = "summary_technology", joinColumns = @JoinColumn(name = "summary_id"),
    inverseJoinColumns = @JoinColumn(name = "technology_id"))
    //@PrimaryKeyJoinColumn
    private List<Technology> technologyList;

    @Override
    public String toString() {
        return "Summary{" +
                "user=" + user +
                ", technologyList=" + technologyList +
                '}';
    }
}
