package br.unipar.erp;

import br.unipar.erp.data.entity.Usuario;
import br.unipar.erp.data.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.time.LocalDate;
import java.util.List;

@SpringBootApplication
public class ErpApplication implements CommandLineRunner {
    @Autowired
    private UsuarioRepository usuarioRepository;

    public static void main(String[] args) {
        SpringApplication.run(ErpApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        Usuario usuario = new Usuario();
        usuario.setNome("alan");
        usuario.setSenha("slapnaplac");
        usuario.setUsuario("alanzoka");
        usuario.setDataNascimento(LocalDate.of(1993, 6, 20));

        //Usuario usuarioSalvo = usuarioRepository.save(usuario);
        //System.out.println("Codigo Usuario: " + usuarioSalvo.getCodigo());

        Long totalRegistros = usuarioRepository.count();
        System.out.println("Registros: " + totalRegistros);

        List<Usuario> lista = usuarioRepository.findAll();

        lista.forEach(usuario1 -> {
            System.out.println("Usuario: " + usuario1.getNome());
        });

        System.out.println(usuarioRepository.findByUsuarioAndSenha("alanzoka", "slapnaplac"));
    }
}
