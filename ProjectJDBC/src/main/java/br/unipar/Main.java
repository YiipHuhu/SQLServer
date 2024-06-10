package br.unipar;

import java.sql.*;
import java.util.Scanner;

public class Main {
    private static final String url = "jdbc:postgresql://localhost:5432/Exemplo1";
    private static final String user = "postgres";
    private static final String password = "admin123";

    public static Connection connection() throws SQLException {
        //localhost : Banco hospedado localmente
        //porta 5432 (porta padrão)

        return DriverManager.getConnection(url, user, password);
    }

    public static void createTable() {
        try {
            Connection connect = connection();// tenta estabelecer conexao com o banco de dados

            Statement statement = connect.createStatement(); // Cria conexão necessaria para acessar o banco
            String sql = " CREATE TABLE IF NOT EXISTS usuarios ( "
                    + " codigo SERIAL PRIMARY KEY, "
                    + " username VARCHAR(10) UNIQUE NOT NULL, "
                    + " password VARCHAR(300) NOT NULL, "
                    + " nome VARCHAR(50) NOT NULL,"
                    + " nascimento DATE)";
            statement.executeUpdate(sql);

            System.out.println("Sua tabela foi criada");
        } catch (SQLException exception) { // caso nao seja possivel realizar a conexao com o banco de dados
            exception.printStackTrace();
        }
    }

    public static void dropTable() {
        try {
            Connection connect = connection();// tenta estabelecer conexao com o banco de dados

            Statement statement = connect.createStatement(); // Cria conexão necessaria para acessar o banco
            String sql = " DROP TABLE usuarios";
            statement.executeUpdate(sql);

            System.out.println("Sua tabela foi deletada");
        } catch (SQLException exception) { // caso nao seja possivel realizar a conexao com o banco de dados
            exception.printStackTrace();
        }
    }
    public static void cadastrarUsuario() {
        Scanner sc = new Scanner(System.in);

        System.out.print("Digite o username: ");
        String username = sc.nextLine();

        System.out.print("Digite a senha: ");
        String password = sc.nextLine();

        System.out.print("Digite o nome completo: ");
        String nome = sc.nextLine();

        System.out.print("Digite a data de nascimento (formato yyyy-mm-dd): ");
        String dataNascimento = sc.nextLine();

        try {
            inserirUsuario(username, password, nome, dataNascimento);
        } catch (RuntimeException e) {
            System.err.println("Erro ao inserir usuário: " + e.getMessage());
        }
    }

    public static void inserirUsuario(String username, String password, String nome, String dataNascimento) {
        try {
            Connection connect = connection();

            PreparedStatement prepared = connect.prepareStatement("INSERT INTO usuarios(username, password, nome, nascimento)"
                    + "VALUES (?,?,?,?)"
            );
            prepared.setString(1, username);
            prepared.setString(2, password);
            prepared.setString(3, nome);
            prepared.setDate(4, java.sql.Date.valueOf(dataNascimento));//padrao americano de data Ano-Mes-Dia
            //prepared.setDate();
            //prepared.setInt();

            prepared.executeUpdate();

            System.out.println("Valor inserido na tabela: ");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public static void listarTodosUsuarios(){
        try{
            Connection connect = connection();// inicia conexão com o banco de dados

            Statement statement = connect.createStatement();

            ResultSet result = statement.executeQuery("SELECT * FROM usuarios"); //armazena valor recebido pela requisição informada no campo

            while(result.next()){//enquanto tiver resultados, executa print result.getInt("codigo")
                System.out.print(result.getInt("codigo"));
                System.out.printf(" - ");
                System.out.print(result.getString("username"));
                System.out.println();
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);//tratamento de erro para falha de conexão de banco dados.
        }
    }
public static void editarTabela(String tabela, String coluna, String novoValor, String codigo, int id) {


        try {
            Connection connect = connection();// inicia conexão com o banco de dados

            PreparedStatement prepared = connect.prepareStatement("UPDATE  " + tabela +
                    "    SET " +  coluna + " = ? " +
                    "    WHERE " + codigo + " = ?"
            );

            prepared.setString(1, novoValor);
            prepared.setInt(2, id);
            prepared.executeUpdate();

            System.out.println("Alterado!");

        } catch (SQLException e) {
            throw new RuntimeException(e);//tratamento de erro para falha de conexão de banco dados.
        }
    }
}
