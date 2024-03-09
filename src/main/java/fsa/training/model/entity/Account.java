package fsa.training.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "account")
public class Account {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "account_id", columnDefinition = "int")
    private Integer id;

    @Column(name = "account", columnDefinition = "varchar(255)", unique = true)
    private String account;

    @Column(name = "email", columnDefinition = "varchar(255)", unique = true)
    private String email;

    @Column(name = "password", columnDefinition = "varchar(255)")
    private String password;

    @Column(name = "status", columnDefinition = "int", nullable = false)
    private Integer status;

    @OneToOne
    @JoinColumn(name = "Employeeemployee_id", referencedColumnName = "employee_id")
    private Employee employee;

}
