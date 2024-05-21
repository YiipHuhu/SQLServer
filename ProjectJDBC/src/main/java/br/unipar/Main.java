package br.unipar;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {
    private static final String url = "jdbc:postgresql://localhost:5432/Exemplo1";
    private static final String user = "postgres";
    private static final String password = "admin123";

    public static void main(String[] args) {
        createTable();
    }

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
}