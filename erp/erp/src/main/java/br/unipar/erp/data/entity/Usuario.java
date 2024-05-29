package br.unipar.erp.data.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
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
    private Integer codigo;
    @Column(name = "username")
    private String usuario;
    @Column(name = "password")
    private String senha;
    @Column(name = "nascimento")
    private String nome;
    private LocalDate dataNascimento;
}
