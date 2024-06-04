package br.unipar.erp.data.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Entity
@Getter
@Setter
//@Data faz a mesma coisa do Getter e Setter, deixa mais clean
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "usuarios")
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)//necessario para chamar na main o "criar"
    private Integer codigo;

    @Column(name = "username")
    private String usuario;

    @Column(name = "password")
    private String senha;

    private String nome;

    @Column(name = "nascimento")
    private LocalDate dataNascimento;
}
