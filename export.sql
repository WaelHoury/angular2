PGDMP         2                x           products    12.1    12.1 4    A           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            B           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            C           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            D           1262    16393    products    DATABASE     �   CREATE DATABASE products WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE products;
                postgres    false            �            1255    16494    trigger_set_timestamp()    FUNCTION     �   CREATE FUNCTION public.trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;
 .   DROP FUNCTION public.trigger_set_timestamp();
       public          postgres    false            �            1259    16489    __EFMigrationsHistory    TABLE     �   CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);
 +   DROP TABLE public."__EFMigrationsHistory";
       public         heap    postgres    false            �            1259    16419    dog    TABLE     �   CREATE TABLE public.dog (
    id integer NOT NULL,
    name character varying(255),
    breed character varying(255),
    is_vaccinated boolean,
    count integer NOT NULL
);
    DROP TABLE public.dog;
       public         heap    postgres    false            �            1259    16439    dog1    TABLE     �   CREATE TABLE public.dog1 (
    id integer NOT NULL,
    name1 character varying(255),
    breed character varying(255),
    is_vaccinated boolean,
    count integer NOT NULL,
    index integer NOT NULL
);
    DROP TABLE public.dog1;
       public         heap    postgres    false            �            1259    16437    dog1_count_seq    SEQUENCE     �   CREATE SEQUENCE public.dog1_count_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.dog1_count_seq;
       public          postgres    false    210            E           0    0    dog1_count_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.dog1_count_seq OWNED BY public.dog1.count;
          public          postgres    false    209            �            1259    16435    dog1_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dog1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.dog1_id_seq;
       public          postgres    false    210            F           0    0    dog1_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.dog1_id_seq OWNED BY public.dog1.id;
          public          postgres    false    208            �            1259    16463    dog1_index_seq    SEQUENCE     �   CREATE SEQUENCE public.dog1_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.dog1_index_seq;
       public          postgres    false    210            G           0    0    dog1_index_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.dog1_index_seq OWNED BY public.dog1.index;
          public          postgres    false    211            �            1259    16417    dog_count_seq    SEQUENCE     �   CREATE SEQUENCE public.dog_count_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.dog_count_seq;
       public          postgres    false    207            H           0    0    dog_count_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.dog_count_seq OWNED BY public.dog.count;
          public          postgres    false    206            �            1259    16415 
   dog_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.dog_id_seq;
       public          postgres    false    207            I           0    0 
   dog_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.dog_id_seq OWNED BY public.dog.id;
          public          postgres    false    205            �            1259    16398    product    TABLE     �   CREATE TABLE public.product (
    p_id integer NOT NULL,
    p_name character varying(25) NOT NULL,
    p_desc character varying(500) NOT NULL,
    count integer NOT NULL
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16396    product_count_seq    SEQUENCE     �   CREATE SEQUENCE public.product_count_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.product_count_seq;
       public          postgres    false    204            J           0    0    product_count_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.product_count_seq OWNED BY public.product.count;
          public          postgres    false    203            �            1259    16394    product_p_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_p_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.product_p_id_seq;
       public          postgres    false    204            K           0    0    product_p_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.product_p_id_seq OWNED BY public.product.p_id;
          public          postgres    false    202            �            1259    16499 	   purchases    TABLE     �   CREATE TABLE public.purchases (
    id integer NOT NULL,
    idprod integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.purchases;
       public         heap    postgres    false            �            1259    16495    purchases_id_seq    SEQUENCE     y   CREATE SEQUENCE public.purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.purchases_id_seq;
       public          postgres    false    214            L           0    0    purchases_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.purchases_id_seq OWNED BY public.purchases.id;
          public          postgres    false    213            �
           2604    16422    dog id    DEFAULT     `   ALTER TABLE ONLY public.dog ALTER COLUMN id SET DEFAULT nextval('public.dog_id_seq'::regclass);
 5   ALTER TABLE public.dog ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    207    207            �
           2604    16423 	   dog count    DEFAULT     f   ALTER TABLE ONLY public.dog ALTER COLUMN count SET DEFAULT nextval('public.dog_count_seq'::regclass);
 8   ALTER TABLE public.dog ALTER COLUMN count DROP DEFAULT;
       public          postgres    false    206    207    207            �
           2604    16442    dog1 id    DEFAULT     b   ALTER TABLE ONLY public.dog1 ALTER COLUMN id SET DEFAULT nextval('public.dog1_id_seq'::regclass);
 6   ALTER TABLE public.dog1 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    210    210            �
           2604    16443 
   dog1 count    DEFAULT     h   ALTER TABLE ONLY public.dog1 ALTER COLUMN count SET DEFAULT nextval('public.dog1_count_seq'::regclass);
 9   ALTER TABLE public.dog1 ALTER COLUMN count DROP DEFAULT;
       public          postgres    false    209    210    210            �
           2604    16465 
   dog1 index    DEFAULT     h   ALTER TABLE ONLY public.dog1 ALTER COLUMN index SET DEFAULT nextval('public.dog1_index_seq'::regclass);
 9   ALTER TABLE public.dog1 ALTER COLUMN index DROP DEFAULT;
       public          postgres    false    211    210            �
           2604    16401    product p_id    DEFAULT     l   ALTER TABLE ONLY public.product ALTER COLUMN p_id SET DEFAULT nextval('public.product_p_id_seq'::regclass);
 ;   ALTER TABLE public.product ALTER COLUMN p_id DROP DEFAULT;
       public          postgres    false    204    202    204            �
           2604    16402    product count    DEFAULT     n   ALTER TABLE ONLY public.product ALTER COLUMN count SET DEFAULT nextval('public.product_count_seq'::regclass);
 <   ALTER TABLE public.product ALTER COLUMN count DROP DEFAULT;
       public          postgres    false    204    203    204            �
           2604    16502    purchases id    DEFAULT     l   ALTER TABLE ONLY public.purchases ALTER COLUMN id SET DEFAULT nextval('public.purchases_id_seq'::regclass);
 ;   ALTER TABLE public.purchases ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            <          0    16489    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    212   �6       7          0    16419    dog 
   TABLE DATA           D   COPY public.dog (id, name, breed, is_vaccinated, count) FROM stdin;
    public          postgres    false    207   �6       :          0    16439    dog1 
   TABLE DATA           M   COPY public.dog1 (id, name1, breed, is_vaccinated, count, index) FROM stdin;
    public          postgres    false    210   �6       4          0    16398    product 
   TABLE DATA           >   COPY public.product (p_id, p_name, p_desc, count) FROM stdin;
    public          postgres    false    204   57       >          0    16499 	   purchases 
   TABLE DATA           ;   COPY public.purchases (id, idprod, created_at) FROM stdin;
    public          postgres    false    214   �7       M           0    0    dog1_count_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.dog1_count_seq', 1, false);
          public          postgres    false    209            N           0    0    dog1_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.dog1_id_seq', 1, false);
          public          postgres    false    208            O           0    0    dog1_index_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.dog1_index_seq', 4, true);
          public          postgres    false    211            P           0    0    dog_count_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.dog_count_seq', 1, false);
          public          postgres    false    206            Q           0    0 
   dog_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.dog_id_seq', 1, false);
          public          postgres    false    205            R           0    0    product_count_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.product_count_seq', 1, false);
          public          postgres    false    203            S           0    0    product_p_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.product_p_id_seq', 1, false);
          public          postgres    false    202            T           0    0    purchases_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.purchases_id_seq', 42, true);
          public          postgres    false    213            �
           2606    16493 .   __EFMigrationsHistory PK___EFMigrationsHistory 
   CONSTRAINT     {   ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");
 \   ALTER TABLE ONLY public."__EFMigrationsHistory" DROP CONSTRAINT "PK___EFMigrationsHistory";
       public            postgres    false    212            �
           2606    16467    dog1 dog1_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.dog1
    ADD CONSTRAINT dog1_pkey PRIMARY KEY (index);
 8   ALTER TABLE ONLY public.dog1 DROP CONSTRAINT dog1_pkey;
       public            postgres    false    210            �
           2606    16409    product product_p_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_p_name_key UNIQUE (p_name);
 D   ALTER TABLE ONLY public.product DROP CONSTRAINT product_p_name_key;
       public            postgres    false    204            �
           2606    16407    product product_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (p_id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    204            �
           2606    16506    purchases purchases_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.purchases DROP CONSTRAINT purchases_pkey;
       public            postgres    false    214            <      x������ � �      7      x������ � �      :   j   x��;�0���)8A$�	�EH4���f�aa0�� n2��w�,�]L�`(�+~%�㰲��A�DN�C�}֬��T��r�MO�ᮊ%"�71�      4   o   x�5̱�0���� 9qH����戾�%���0=4n_��^=5� �:Ӟ���G鵥7�����SO~��
�i�b9�U60~�[�b�2#��b�̩T���c���s�(�      >   #  x�e��m$1г*
�Mp�bq�q��6�e���K�'��/��Y����C�x��-�J����|��*7�%tȧ�!BK��S��0�$_�"��r�#NQM�R�@�����l���զ���[x3�3J��#O�k��Mh�I�š(s3�1l fe[���f�Fm�#o�[΃��j���ܻ����S���\��M���"�D���B,�HB��Ϊ��9�)u]D*)j��C���b��׫��q�LԤ`l��	��� ��y�e��7\���ɋ5     