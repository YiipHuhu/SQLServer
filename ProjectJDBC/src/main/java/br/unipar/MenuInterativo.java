package br.unipar;

import java.util.Scanner;

import static br.unipar.Main.*;

public class MenuInterativo {
    private static final String menu = """
            /******************************************************************************/
            /*          1 - Criar uma Tabela                                              */
            /*          2 - Inserir Usuario                                               */
            /*          3 - Listar Usuarios da tabela                                     */
            /*          4 - Deletar tabela                                                */
            /*          5 - Sair                                                          */
            /******************************************************************************/
            Selecione uma das opções acima:
            """;
    private static final String apresentacao = """
            /******************************************************************************/
            /*          Projeto: Integração de Banco de dados com Java e Postgres         */
            /*                     ADS - Alan G. G. Przyvara                              */
            """;

    public static void main(String[] args) {
        int opcoes = 0;
        Scanner sc = new Scanner(System.in);
        System.out.print(MenuInterativo.apresentacao);
        do {
            System.out.println(MenuInterativo.menu);
            opcoes = sc.nextInt();
            switch (opcoes){
                case 1 : createTable();
                break;
                case 2 : cadastrarUsuario();
                break;
                case 3 : listarTodosUsuarios();
                break;
                case 4 : dropTable();
                break;
                //case 3 : editarTabela();
                //    break;
            }
        }while (opcoes != 6);
    }
}

