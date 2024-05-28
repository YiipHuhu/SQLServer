package br.unipar.erp.data.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

import java.time.LocalDate;
@Entity
public class Usuario {
    @Id
    private Integer codigo;

    private Integer usuario;

    private Integer senha;

    private LocalDate dataNascimento;
}
