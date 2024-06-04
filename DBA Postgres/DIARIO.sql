PGDMP  !    %                |            DIARIO    16.3    16.3 $    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16479    DIARIO    DATABASE        CREATE DATABASE "DIARIO" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "DIARIO";
                postgres    false            �            1259    16510 	   ACADEMICO    TABLE     a   CREATE TABLE public."ACADEMICO" (
    "RA" integer NOT NULL,
    "ID_PESSOA" integer NOT NULL
);
    DROP TABLE public."ACADEMICO";
       public         heap    postgres    false            �            1259    16480    CIDADE    TABLE     �   CREATE TABLE public."CIDADE" (
    "ID_CIDADE" integer NOT NULL,
    "NOME" character varying(100) NOT NULL,
    "UF" character varying(2) NOT NULL
);
    DROP TABLE public."CIDADE";
       public         heap    postgres    false            �            1259    16495    CURSO    TABLE     �   CREATE TABLE public."CURSO" (
    "ID_CURSO" integer NOT NULL,
    "NOME" character varying(100) NOT NULL,
    "DURACAO" character varying(100) NOT NULL
);
    DROP TABLE public."CURSO";
       public         heap    postgres    false            �            1259    16530 
   DISCIPLINA    TABLE       CREATE TABLE public."DISCIPLINA" (
    "ID_DISCIPLINA" integer NOT NULL,
    "NOME" character varying(100) NOT NULL,
    "CARGAHORARIA" integer NOT NULL,
    "EMENTA" character varying(200) NOT NULL,
    "TEMPREREQUISITO" character(1),
    "MATRICULA" integer NOT NULL
);
     DROP TABLE public."DISCIPLINA";
       public         heap    postgres    false            �            1259    16540 
   FREQUENCIA    TABLE     �  CREATE TABLE public."FREQUENCIA" (
    "ID_SEQUENCIA" integer NOT NULL,
    "DATA" time with time zone NOT NULL,
    "QTDAULAS" integer NOT NULL,
    "PRESENCA" character(1),
    "FALTA" character(1),
    "CONTEUDOMINISTRADO" character varying(200) NOT NULL,
    "NOTA1" double precision,
    "NOTA2" double precision,
    "ID_TURMA" integer NOT NULL,
    "ID_DISCIPLINA" integer NOT NULL,
    "RA" integer NOT NULL
);
     DROP TABLE public."FREQUENCIA";
       public         heap    postgres    false            �            1259    16485    PESSOA    TABLE     �  CREATE TABLE public."PESSOA" (
    "ID_PESSOA" integer NOT NULL,
    "NOME" character varying(100) NOT NULL,
    "CPF" character varying(14) NOT NULL,
    "RG" character varying(50) NOT NULL,
    "DATANASC" timestamp with time zone NOT NULL,
    "ENDERECO" character varying(120) NOT NULL,
    "SEXO" character varying(1) NOT NULL,
    "FONECELULAR" character varying(13),
    "FONERESIDENCIAL" character varying(12),
    "ID_CIDADE" integer NOT NULL,
    "REDESOCIALINSTA" character varying(150)
);
    DROP TABLE public."PESSOA";
       public         heap    postgres    false            �            1259    16500 	   PROFESSOR    TABLE     �   CREATE TABLE public."PROFESSOR" (
    "MATRICULA" integer NOT NULL,
    "TITULACAO" character(10) NOT NULL,
    "ID_PESSOA" integer NOT NULL
);
    DROP TABLE public."PROFESSOR";
       public         heap    postgres    false            �            1259    16520    TURMA    TABLE     �   CREATE TABLE public."TURMA" (
    "ID_TURMA" integer NOT NULL,
    "DESCRICAO" character varying(100) NOT NULL,
    "ID_CURSO" integer NOT NULL
);
    DROP TABLE public."TURMA";
       public         heap    postgres    false            �          0    16510 	   ACADEMICO 
   TABLE DATA           8   COPY public."ACADEMICO" ("RA", "ID_PESSOA") FROM stdin;
    public          postgres    false    219   7-       �          0    16480    CIDADE 
   TABLE DATA           =   COPY public."CIDADE" ("ID_CIDADE", "NOME", "UF") FROM stdin;
    public          postgres    false    215   T-       �          0    16495    CURSO 
   TABLE DATA           @   COPY public."CURSO" ("ID_CURSO", "NOME", "DURACAO") FROM stdin;
    public          postgres    false    217   q-       �          0    16530 
   DISCIPLINA 
   TABLE DATA           y   COPY public."DISCIPLINA" ("ID_DISCIPLINA", "NOME", "CARGAHORARIA", "EMENTA", "TEMPREREQUISITO", "MATRICULA") FROM stdin;
    public          postgres    false    221   �-       �          0    16540 
   FREQUENCIA 
   TABLE DATA           �   COPY public."FREQUENCIA" ("ID_SEQUENCIA", "DATA", "QTDAULAS", "PRESENCA", "FALTA", "CONTEUDOMINISTRADO", "NOTA1", "NOTA2", "ID_TURMA", "ID_DISCIPLINA", "RA") FROM stdin;
    public          postgres    false    222   �-       �          0    16485    PESSOA 
   TABLE DATA           �   COPY public."PESSOA" ("ID_PESSOA", "NOME", "CPF", "RG", "DATANASC", "ENDERECO", "SEXO", "FONECELULAR", "FONERESIDENCIAL", "ID_CIDADE", "REDESOCIALINSTA") FROM stdin;
    public          postgres    false    216   �-       �          0    16500 	   PROFESSOR 
   TABLE DATA           L   COPY public."PROFESSOR" ("MATRICULA", "TITULACAO", "ID_PESSOA") FROM stdin;
    public          postgres    false    218   �-       �          0    16520    TURMA 
   TABLE DATA           F   COPY public."TURMA" ("ID_TURMA", "DESCRICAO", "ID_CURSO") FROM stdin;
    public          postgres    false    220   .       >           2606    16514    ACADEMICO ACADEMICO_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."ACADEMICO"
    ADD CONSTRAINT "ACADEMICO_pkey" PRIMARY KEY ("RA");
 F   ALTER TABLE ONLY public."ACADEMICO" DROP CONSTRAINT "ACADEMICO_pkey";
       public            postgres    false    219            6           2606    16484    CIDADE CIDADE_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."CIDADE"
    ADD CONSTRAINT "CIDADE_pkey" PRIMARY KEY ("ID_CIDADE");
 @   ALTER TABLE ONLY public."CIDADE" DROP CONSTRAINT "CIDADE_pkey";
       public            postgres    false    215            :           2606    16499    CURSO CURSO_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."CURSO"
    ADD CONSTRAINT "CURSO_pkey" PRIMARY KEY ("ID_CURSO");
 >   ALTER TABLE ONLY public."CURSO" DROP CONSTRAINT "CURSO_pkey";
       public            postgres    false    217            B           2606    16534    DISCIPLINA DISCIPLINA_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."DISCIPLINA"
    ADD CONSTRAINT "DISCIPLINA_pkey" PRIMARY KEY ("ID_DISCIPLINA");
 H   ALTER TABLE ONLY public."DISCIPLINA" DROP CONSTRAINT "DISCIPLINA_pkey";
       public            postgres    false    221            D           2606    16544    FREQUENCIA FREQUENCIA_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."FREQUENCIA"
    ADD CONSTRAINT "FREQUENCIA_pkey" PRIMARY KEY ("ID_SEQUENCIA");
 H   ALTER TABLE ONLY public."FREQUENCIA" DROP CONSTRAINT "FREQUENCIA_pkey";
       public            postgres    false    222            8           2606    16489    PESSOA PESSOA_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."PESSOA"
    ADD CONSTRAINT "PESSOA_pkey" PRIMARY KEY ("ID_PESSOA");
 @   ALTER TABLE ONLY public."PESSOA" DROP CONSTRAINT "PESSOA_pkey";
       public            postgres    false    216            <           2606    16504    PROFESSOR PROFESSOR_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."PROFESSOR"
    ADD CONSTRAINT "PROFESSOR_pkey" PRIMARY KEY ("MATRICULA");
 F   ALTER TABLE ONLY public."PROFESSOR" DROP CONSTRAINT "PROFESSOR_pkey";
       public            postgres    false    218            @           2606    16524    TURMA TURMA_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."TURMA"
    ADD CONSTRAINT "TURMA_pkey" PRIMARY KEY ("ID_TURMA");
 >   ALTER TABLE ONLY public."TURMA" DROP CONSTRAINT "TURMA_pkey";
       public            postgres    false    220            G           2606    16515 "   ACADEMICO ACADEMICO_ID_PESSOA_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ACADEMICO"
    ADD CONSTRAINT "ACADEMICO_ID_PESSOA_fkey" FOREIGN KEY ("ID_PESSOA") REFERENCES public."PESSOA"("ID_PESSOA");
 P   ALTER TABLE ONLY public."ACADEMICO" DROP CONSTRAINT "ACADEMICO_ID_PESSOA_fkey";
       public          postgres    false    4664    219    216            I           2606    16535    DISCIPLINA FK_DISCIPLINA_1    FK CONSTRAINT     �   ALTER TABLE ONLY public."DISCIPLINA"
    ADD CONSTRAINT "FK_DISCIPLINA_1" FOREIGN KEY ("MATRICULA") REFERENCES public."PROFESSOR"("MATRICULA");
 H   ALTER TABLE ONLY public."DISCIPLINA" DROP CONSTRAINT "FK_DISCIPLINA_1";
       public          postgres    false    221    218    4668            J           2606    16545    FREQUENCIA FK_FREQUENCIA_1    FK CONSTRAINT     �   ALTER TABLE ONLY public."FREQUENCIA"
    ADD CONSTRAINT "FK_FREQUENCIA_1" FOREIGN KEY ("ID_TURMA") REFERENCES public."TURMA"("ID_TURMA");
 H   ALTER TABLE ONLY public."FREQUENCIA" DROP CONSTRAINT "FK_FREQUENCIA_1";
       public          postgres    false    220    4672    222            K           2606    16550    FREQUENCIA FK_FREQUENCIA_2    FK CONSTRAINT     �   ALTER TABLE ONLY public."FREQUENCIA"
    ADD CONSTRAINT "FK_FREQUENCIA_2" FOREIGN KEY ("ID_DISCIPLINA") REFERENCES public."DISCIPLINA"("ID_DISCIPLINA");
 H   ALTER TABLE ONLY public."FREQUENCIA" DROP CONSTRAINT "FK_FREQUENCIA_2";
       public          postgres    false    221    4674    222            L           2606    16555    FREQUENCIA FK_FREQUENCIA_3    FK CONSTRAINT     �   ALTER TABLE ONLY public."FREQUENCIA"
    ADD CONSTRAINT "FK_FREQUENCIA_3" FOREIGN KEY ("RA") REFERENCES public."ACADEMICO"("RA");
 H   ALTER TABLE ONLY public."FREQUENCIA" DROP CONSTRAINT "FK_FREQUENCIA_3";
       public          postgres    false    4670    222    219            E           2606    16490    PESSOA FK_PESSOA_1    FK CONSTRAINT     �   ALTER TABLE ONLY public."PESSOA"
    ADD CONSTRAINT "FK_PESSOA_1" FOREIGN KEY ("ID_CIDADE") REFERENCES public."CIDADE"("ID_CIDADE");
 @   ALTER TABLE ONLY public."PESSOA" DROP CONSTRAINT "FK_PESSOA_1";
       public          postgres    false    215    4662    216            F           2606    16505    PROFESSOR FK_PROFESSOR    FK CONSTRAINT     �   ALTER TABLE ONLY public."PROFESSOR"
    ADD CONSTRAINT "FK_PROFESSOR" FOREIGN KEY ("ID_PESSOA") REFERENCES public."PESSOA"("ID_PESSOA");
 D   ALTER TABLE ONLY public."PROFESSOR" DROP CONSTRAINT "FK_PROFESSOR";
       public          postgres    false    216    218    4664            H           2606    16525    TURMA FK_TURMA_1    FK CONSTRAINT     �   ALTER TABLE ONLY public."TURMA"
    ADD CONSTRAINT "FK_TURMA_1" FOREIGN KEY ("ID_CURSO") REFERENCES public."CURSO"("ID_CURSO");
 >   ALTER TABLE ONLY public."TURMA" DROP CONSTRAINT "FK_TURMA_1";
       public          postgres    false    4666    220    217            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     