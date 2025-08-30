--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-08-30 01:35:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 232 (class 1259 OID 33073)
-- Name: cat_mat_primas_de_productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_mat_primas_de_productos (
    cmpp_id integer NOT NULL,
    categoria_prod_id integer,
    categoria_mp_id integer,
    cantidad numeric NOT NULL
);


ALTER TABLE public.cat_mat_primas_de_productos OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 33072)
-- Name: cat_mat_primas_de_productos_cmpp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_mat_primas_de_productos_cmpp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_mat_primas_de_productos_cmpp_id_seq OWNER TO postgres;

--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 231
-- Name: cat_mat_primas_de_productos_cmpp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_mat_primas_de_productos_cmpp_id_seq OWNED BY public.cat_mat_primas_de_productos.cmpp_id;


--
-- TOC entry 224 (class 1259 OID 24905)
-- Name: cat_materia_prima; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_materia_prima (
    cmp_id integer NOT NULL,
    cmp_nombre character varying(50)
);


ALTER TABLE public.cat_materia_prima OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24904)
-- Name: cat_materia_prima_cmp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_materia_prima_cmp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_materia_prima_cmp_id_seq OWNER TO postgres;

--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 223
-- Name: cat_materia_prima_cmp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_materia_prima_cmp_id_seq OWNED BY public.cat_materia_prima.cmp_id;


--
-- TOC entry 222 (class 1259 OID 24898)
-- Name: categorias_productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias_productos (
    categoria_id integer NOT NULL,
    nombre_categoria character varying(50),
    seccion character varying(10)
);


ALTER TABLE public.categorias_productos OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24897)
-- Name: categorias_productos_categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_productos_categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorias_productos_categoria_id_seq OWNER TO postgres;

--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 221
-- Name: categorias_productos_categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_productos_categoria_id_seq OWNED BY public.categorias_productos.categoria_id;


--
-- TOC entry 228 (class 1259 OID 24930)
-- Name: especialidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especialidades (
    especialidad_id integer NOT NULL,
    nombre_especialidad character varying(50)
);


ALTER TABLE public.especialidades OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24929)
-- Name: especialidades_especialidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.especialidades_especialidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.especialidades_especialidad_id_seq OWNER TO postgres;

--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 227
-- Name: especialidades_especialidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.especialidades_especialidad_id_seq OWNED BY public.especialidades.especialidad_id;


--
-- TOC entry 218 (class 1259 OID 24882)
-- Name: indec_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.indec_info (
    info_id integer NOT NULL,
    codigo numeric NOT NULL,
    descripcion_aperturas character varying(100),
    periodo date NOT NULL,
    indice_ipc numeric NOT NULL,
    v_m_ipc numeric,
    v_i_a_ipc numeric,
    region character varying(100)
);


ALTER TABLE public.indec_info OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24881)
-- Name: indec_info_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.indec_info_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.indec_info_info_id_seq OWNER TO postgres;

--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 217
-- Name: indec_info_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.indec_info_info_id_seq OWNED BY public.indec_info.info_id;


--
-- TOC entry 234 (class 1259 OID 33092)
-- Name: mat_primas_de_categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mat_primas_de_categorias (
    mpdc_id integer NOT NULL,
    id_cat_materia_prima integer,
    id_materia_prima integer,
    mp_cantidad numeric NOT NULL
);


ALTER TABLE public.mat_primas_de_categorias OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 33091)
-- Name: mat_primas_de_categorias_mpdc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mat_primas_de_categorias_mpdc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mat_primas_de_categorias_mpdc_id_seq OWNER TO postgres;

--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 233
-- Name: mat_primas_de_categorias_mpdc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mat_primas_de_categorias_mpdc_id_seq OWNED BY public.mat_primas_de_categorias.mpdc_id;


--
-- TOC entry 226 (class 1259 OID 24912)
-- Name: materia_prima; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materia_prima (
    mp_id integer NOT NULL,
    mp_nombre character varying(100),
    cmp_id integer,
    unidad_de_medida character varying(10) NOT NULL
);


ALTER TABLE public.materia_prima OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24911)
-- Name: materia_prima_mp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materia_prima_mp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.materia_prima_mp_id_seq OWNER TO postgres;

--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 225
-- Name: materia_prima_mp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materia_prima_mp_id_seq OWNED BY public.materia_prima.mp_id;


--
-- TOC entry 230 (class 1259 OID 24947)
-- Name: productos_de_especialidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos_de_especialidades (
    relacion_id integer NOT NULL,
    categoria_id integer,
    cantidad numeric NOT NULL,
    especialidad_id integer
);


ALTER TABLE public.productos_de_especialidades OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24946)
-- Name: productos_de_especialidades_relacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_de_especialidades_relacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos_de_especialidades_relacion_id_seq OWNER TO postgres;

--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 229
-- Name: productos_de_especialidades_relacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_de_especialidades_relacion_id_seq OWNED BY public.productos_de_especialidades.relacion_id;


--
-- TOC entry 220 (class 1259 OID 24891)
-- Name: restaurantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurantes (
    r_id integer NOT NULL,
    nombre_restaurante character varying(100) NOT NULL,
    ubicacion character varying(50),
    especialidad_id integer
);


ALTER TABLE public.restaurantes OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24890)
-- Name: restaurantes_r_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurantes_r_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.restaurantes_r_id_seq OWNER TO postgres;

--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 219
-- Name: restaurantes_r_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurantes_r_id_seq OWNED BY public.restaurantes.r_id;


--
-- TOC entry 236 (class 1259 OID 33126)
-- Name: ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas (
    venta_id integer NOT NULL,
    r_id integer,
    mp_id integer,
    cantidad_kg numeric DEFAULT 0,
    fecha date
);


ALTER TABLE public.ventas OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 33125)
-- Name: ventas_venta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ventas_venta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ventas_venta_id_seq OWNER TO postgres;

--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 235
-- Name: ventas_venta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ventas_venta_id_seq OWNED BY public.ventas.venta_id;


--
-- TOC entry 4794 (class 2604 OID 33076)
-- Name: cat_mat_primas_de_productos cmpp_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_mat_primas_de_productos ALTER COLUMN cmpp_id SET DEFAULT nextval('public.cat_mat_primas_de_productos_cmpp_id_seq'::regclass);


--
-- TOC entry 4790 (class 2604 OID 24908)
-- Name: cat_materia_prima cmp_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_materia_prima ALTER COLUMN cmp_id SET DEFAULT nextval('public.cat_materia_prima_cmp_id_seq'::regclass);


--
-- TOC entry 4789 (class 2604 OID 24901)
-- Name: categorias_productos categoria_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias_productos ALTER COLUMN categoria_id SET DEFAULT nextval('public.categorias_productos_categoria_id_seq'::regclass);


--
-- TOC entry 4792 (class 2604 OID 24933)
-- Name: especialidades especialidad_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidades ALTER COLUMN especialidad_id SET DEFAULT nextval('public.especialidades_especialidad_id_seq'::regclass);


--
-- TOC entry 4787 (class 2604 OID 24885)
-- Name: indec_info info_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indec_info ALTER COLUMN info_id SET DEFAULT nextval('public.indec_info_info_id_seq'::regclass);


--
-- TOC entry 4795 (class 2604 OID 33095)
-- Name: mat_primas_de_categorias mpdc_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mat_primas_de_categorias ALTER COLUMN mpdc_id SET DEFAULT nextval('public.mat_primas_de_categorias_mpdc_id_seq'::regclass);


--
-- TOC entry 4791 (class 2604 OID 24915)
-- Name: materia_prima mp_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materia_prima ALTER COLUMN mp_id SET DEFAULT nextval('public.materia_prima_mp_id_seq'::regclass);


--
-- TOC entry 4793 (class 2604 OID 24950)
-- Name: productos_de_especialidades relacion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_de_especialidades ALTER COLUMN relacion_id SET DEFAULT nextval('public.productos_de_especialidades_relacion_id_seq'::regclass);


--
-- TOC entry 4788 (class 2604 OID 24894)
-- Name: restaurantes r_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurantes ALTER COLUMN r_id SET DEFAULT nextval('public.restaurantes_r_id_seq'::regclass);


--
-- TOC entry 4796 (class 2604 OID 33129)
-- Name: ventas venta_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas ALTER COLUMN venta_id SET DEFAULT nextval('public.ventas_venta_id_seq'::regclass);


--
-- TOC entry 4988 (class 0 OID 33073)
-- Dependencies: 232
-- Data for Name: cat_mat_primas_de_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_mat_primas_de_productos (cmpp_id, categoria_prod_id, categoria_mp_id, cantidad) FROM stdin;
1	1	1	10
2	1	2	5
3	1	5	4
4	1	6	3
5	1	7	2
6	2	2	15
7	2	1	8
8	2	3	6
9	2	4	5
10	2	6	5
11	2	7	3
12	3	9	12
13	3	3	8
14	3	4	6
15	3	8	5
16	3	16	3
17	4	1	12
18	4	16	8
19	4	5	5
20	4	6	3
21	4	7	3
22	6	1	8
23	6	2	5
24	6	5	5
25	6	6	4
26	6	7	2
27	7	1	10
28	7	2	6
29	7	5	5
30	7	6	4
31	7	7	3
32	8	4	10
33	8	3	8
34	8	8	6
35	8	17	4
36	8	9	3
37	9	13	10
38	9	14	8
39	9	16	5
40	12	13	12
41	12	16	8
42	13	10	8
43	13	15	6
44	13	18	5
45	13	16	4
46	14	12	12
47	15	11	12
48	16	10	12
49	17	2	20
50	17	6	6
51	17	7	5
52	5	4	10
53	5	2	8
54	5	1	6
55	5	6	4
56	5	3	3
57	10	10	8
58	10	11	6
59	10	12	6
60	11	17	12
61	11	3	5
62	11	9	4
\.


--
-- TOC entry 4980 (class 0 OID 24905)
-- Dependencies: 224
-- Data for Name: cat_materia_prima; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_materia_prima (cmp_id, cmp_nombre) FROM stdin;
1	vegetales
2	carne
5	granos_y_legumbres
6	condimentos_y_salsas
7	especias_y_hierbas
8	huevos
9	dulces
10	licores
11	vino
12	cerveza
13	jugos
14	gaseosas
15	mezcladores
16	hierbas_y_frutas
18	jarabes
17	cafe_y_te
3	lacteos
4	panaderia
\.


--
-- TOC entry 4978 (class 0 OID 24898)
-- Dependencies: 222
-- Data for Name: categorias_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias_productos (categoria_id, nombre_categoria, seccion) FROM stdin;
1	entradas	comida
2	platos_principales	comida
3	postres	comida
4	ensaladas	comida
6	guarniciones	comida
7	sopas	comida
8	desayuno	comida
9	bebidas_sin_alcohol	bebida
12	jugos	bebida
13	cocteles	bebida
14	cervezas	bebida
15	vinos	bebida
16	licores	bebida
17	carnes	cocina
5	sandwiches	comida
10	bebidas_alcoholicas	bebida
11	cafe_te	bebida
\.


--
-- TOC entry 4984 (class 0 OID 24930)
-- Dependencies: 228
-- Data for Name: especialidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.especialidades (especialidad_id, nombre_especialidad) FROM stdin;
15	internacional_gourmet
16	local_regional_argentina
17	parrilla
18	casera_cafeteria
19	pescados_y_mariscos
\.


--
-- TOC entry 4974 (class 0 OID 24882)
-- Dependencies: 218
-- Data for Name: indec_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.indec_info (info_id, codigo, descripcion_aperturas, periodo, indice_ipc, v_m_ipc, v_i_a_ipc, region) FROM stdin;
\.


--
-- TOC entry 4990 (class 0 OID 33092)
-- Dependencies: 234
-- Data for Name: mat_primas_de_categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mat_primas_de_categorias (mpdc_id, id_cat_materia_prima, id_materia_prima, mp_cantidad) FROM stdin;
1	1	125	2500
2	1	128	500
3	1	138	500
4	1	155	1000
5	1	114	300
6	1	113	50
7	2	117	2000
8	2	118	1500
9	2	131	1000
10	2	139	300
11	5	137	500
12	5	141	300
13	5	142	400
14	5	119	1000
15	5	123	1000
16	6	127	200
17	6	134	500
18	7	115	50
19	7	156	50
21	9	121	300
22	9	122	50
23	9	124	1000
24	9	140	500
25	3	116	1000
26	3	120	200
27	3	132	200
28	4	112	1000
29	17	149	500
30	17	150	100
31	17	151	100
32	13	152	1000
33	13	153	1000
34	13	154	1000
35	10	158	500
36	10	159	500
37	10	160	500
38	10	161	500
39	10	162	500
40	11	145	1000
41	11	146	1000
42	12	147	1000
43	12	148	1000
44	14	143	1000
45	14	144	1000
46	15	163	1000
47	15	164	500
20	8	165	120
\.


--
-- TOC entry 4982 (class 0 OID 24912)
-- Dependencies: 226
-- Data for Name: materia_prima; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materia_prima (mp_id, mp_nombre, cmp_id, unidad_de_medida) FROM stdin;
112	pan	4	gramos
113	ajo	6	gramos
114	tomate	1	gramos
115	albahaca	7	gramos
116	mozzarella	3	gramos
117	pechuga_de_pollo	2	gramos
118	carne_picada	2	gramos
119	pasta_para_lasana	4	gramos
120	queso_parmesano	3	gramos
121	chocolate	9	gramos
122	vainilla	9	gramos
123	harina	4	gramos
124	azucar	9	gramos
125	lechuga	1	gramos
126	crutones	4	gramos
127	aderezo_cesar	6	gramos
128	pepino	1	gramos
129	queso_feta	3	gramos
130	atun	2	gramos
131	jamon	2	gramos
132	queso_cheddar	3	gramos
133	papas	1	gramos
134	manteca	3	gramos
135	cebolla	1	gramos
136	batata	1	gramos
137	lentejas	5	gramos
138	calabaza	1	gramos
139	tocino	2	gramos
140	mezcla_para_panqueques	4	gramos
141	quinoa	5	gramos
142	garbanzos	5	gramos
143	agua_con_gas	14	gramos
144	jarabe_de_cola	15	gramos
145	vino_tinto	11	gramos
146	vino_blanco	11	gramos
147	cerveza_lager	12	gramos
148	cerveza_ipa	12	gramos
149	granos_de_cafe	18	gramos
150	te_negro	18	gramos
151	te_verde	18	gramos
152	naranja	17	gramos
153	manzana	17	gramos
154	pina	17	gramos
155	zanahoria	1	gramos
156	menta	17	gramos
157	lima	17	gramos
158	ron_blanco	10	gramos
159	tequila	10	gramos
160	vodka	10	gramos
161	whisky	10	gramos
162	ginebra	10	gramos
163	agua_tonica	15	gramos
164	campari	10	gramos
165	huevos	8	gramos
\.


--
-- TOC entry 4986 (class 0 OID 24947)
-- Dependencies: 230
-- Data for Name: productos_de_especialidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos_de_especialidades (relacion_id, categoria_id, cantidad, especialidad_id) FROM stdin;
1	1	5	15
2	2	8	15
3	3	6	15
4	4	4	15
5	5	3	15
6	6	5	15
7	7	4	15
8	8	2	15
9	9	4	15
10	10	3	15
11	11	3	15
12	12	2	15
13	13	5	15
14	14	3	15
15	15	6	15
16	16	2	15
17	1	6	16
18	2	9	16
19	3	5	16
20	4	4	16
21	5	4	16
22	6	5	16
23	7	3	16
24	8	2	16
25	9	3	16
26	10	3	16
27	11	2	16
28	12	2	16
29	13	2	16
30	14	3	16
31	15	4	16
32	16	2	16
33	1	4	17
34	2	10	17
35	3	3	17
36	4	3	17
37	5	6	17
38	6	7	17
39	7	2	17
40	8	2	17
41	9	3	17
42	10	5	17
43	11	2	17
44	12	2	17
45	13	2	17
46	14	4	17
47	15	5	17
48	16	2	17
49	1	5	18
50	2	6	18
51	3	7	18
52	4	5	18
53	5	4	18
54	6	4	18
55	7	3	18
56	8	5	18
57	9	4	18
58	10	2	18
59	11	4	18
60	12	3	18
61	13	2	18
62	14	2	18
63	15	3	18
64	16	2	18
65	1	4	19
66	2	7	19
67	3	5	19
68	4	4	19
69	5	3	19
70	6	4	19
71	7	3	19
72	8	2	19
73	9	3	19
74	10	3	19
75	11	2	19
76	12	2	19
77	13	3	19
78	14	2	19
79	15	3	19
80	16	2	19
81	17	20	17
82	17	10	15
83	17	3	18
84	17	5	19
85	17	12	16
\.


--
-- TOC entry 4976 (class 0 OID 24891)
-- Dependencies: 220
-- Data for Name: restaurantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurantes (r_id, nombre_restaurante, ubicacion, especialidad_id) FROM stdin;
1	el_preferido_de_palermo	buenos_aires	16
2	la_cabrera	buenos_aires	17
3	don_julio	buenos_aires	17
4	el_buen_sabor	cordoba	18
6	pulperia_quilapan	mendoza	17
7	azafran	mendoza	15
8	el_mercado	santa_fe	15
9	la_marina	santa_fe	19
10	cafe_martinez	tucuman	18
11	el_gaucho	salta	17
12	la_casona	misiones	16
13	yerba_mate	misiones	17
14	el_bambu	misiones	15
15	mar_de_los_valles	rio_negro	15
16	bodega_rio_negro	rio_negro	15
17	el_gauchito	rio_negro	17
18	san_juan_bistro	san_juan	16
19	viña_del_sol	san_juan	15
20	el_toro	san_juan	17
21	la_candelaria	santiago_del_estero	16
22	el_asadito	santiago_del_estero	17
23	sabor_de_estero	santiago_del_estero	15
24	la_cueva	jujuy	16
25	puna_grill	jujuy	17
26	el_porton	catamarca	16
27	casa_de_la_luna	catamarca	17
28	buen_sabor	catamarca	15
29	la_estancia	chaco	17
30	el_pampeano	chaco	16
31	sabor_del_chaco	chaco	15
32	rio_verde	chubut	15
33	el_marino	chubut	17
34	cocina_del_sur	chubut	16
35	la_roca	entre_rios	16
36	el_almirez	entre_rios	15
37	sabores_rios	entre_rios	17
38	villa_del_sol	formosa	16
39	el_piquillin	formosa	17
40	sabor_formoseño	formosa	15
41	la_catedral	neuquen	16
42	el_valle	neuquen	17
43	sabores_del_valle	neuquen	15
44	alto_lago	rio_negro	16
45	el_refugio	rio_negro	17
46	la_puerta	tierra_del_fuego	16
47	fuego_grill	tierra_del_fuego	17
53	el_patio	corrientes	17
48	sabores_australes	tierra_del_fuego	15
49	el_aromo	santa_cruz	16
50	patagonia_grill	santa_cruz	17
51	sabores_patagonicos	santa_cruz	15
52	costa_del_parana	corrientes	16
54	sabores_correntinos	corrientes	15
55	alto_paraiso	la_pampa	16
56	el_chapeton	la_pampa	17
57	sabores_pampeanos	la_pampa	15
58	mar_azul	misiones	16
59	la_ribera	san_luis	16
60	el_gaucho_sanluis	san_luis	17
61	sabores_sanluis	san_luis	15
62	villa_rosa	neuquen	16
63	el_campanario	tucuman	16
\.


--
-- TOC entry 4992 (class 0 OID 33126)
-- Dependencies: 236
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas (venta_id, r_id, mp_id, cantidad_kg, fecha) FROM stdin;
\.


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 231
-- Name: cat_mat_primas_de_productos_cmpp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_mat_primas_de_productos_cmpp_id_seq', 62, true);


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 223
-- Name: cat_materia_prima_cmp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_materia_prima_cmp_id_seq', 18, true);


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 221
-- Name: categorias_productos_categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_productos_categoria_id_seq', 17, true);


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 227
-- Name: especialidades_especialidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.especialidades_especialidad_id_seq', 19, true);


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 217
-- Name: indec_info_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.indec_info_info_id_seq', 1, false);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 233
-- Name: mat_primas_de_categorias_mpdc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mat_primas_de_categorias_mpdc_id_seq', 47, true);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 225
-- Name: materia_prima_mp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materia_prima_mp_id_seq', 165, true);


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 229
-- Name: productos_de_especialidades_relacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_de_especialidades_relacion_id_seq', 85, true);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 219
-- Name: restaurantes_r_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurantes_r_id_seq', 63, true);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 235
-- Name: ventas_venta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_venta_id_seq', 1, false);


--
-- TOC entry 4813 (class 2606 OID 33080)
-- Name: cat_mat_primas_de_productos cat_mat_primas_de_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_mat_primas_de_productos
    ADD CONSTRAINT cat_mat_primas_de_productos_pkey PRIMARY KEY (cmpp_id);


--
-- TOC entry 4805 (class 2606 OID 24910)
-- Name: cat_materia_prima cat_materia_prima_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_materia_prima
    ADD CONSTRAINT cat_materia_prima_pkey PRIMARY KEY (cmp_id);


--
-- TOC entry 4803 (class 2606 OID 24903)
-- Name: categorias_productos categorias_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias_productos
    ADD CONSTRAINT categorias_productos_pkey PRIMARY KEY (categoria_id);


--
-- TOC entry 4809 (class 2606 OID 24935)
-- Name: especialidades especialidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidades
    ADD CONSTRAINT especialidades_pkey PRIMARY KEY (especialidad_id);


--
-- TOC entry 4799 (class 2606 OID 24889)
-- Name: indec_info indec_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indec_info
    ADD CONSTRAINT indec_info_pkey PRIMARY KEY (info_id);


--
-- TOC entry 4815 (class 2606 OID 33099)
-- Name: mat_primas_de_categorias mat_primas_de_categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mat_primas_de_categorias
    ADD CONSTRAINT mat_primas_de_categorias_pkey PRIMARY KEY (mpdc_id);


--
-- TOC entry 4807 (class 2606 OID 24917)
-- Name: materia_prima materia_prima_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materia_prima
    ADD CONSTRAINT materia_prima_pkey PRIMARY KEY (mp_id);


--
-- TOC entry 4811 (class 2606 OID 24954)
-- Name: productos_de_especialidades productos_de_especialidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_de_especialidades
    ADD CONSTRAINT productos_de_especialidades_pkey PRIMARY KEY (relacion_id);


--
-- TOC entry 4801 (class 2606 OID 24896)
-- Name: restaurantes restaurantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurantes
    ADD CONSTRAINT restaurantes_pkey PRIMARY KEY (r_id);


--
-- TOC entry 4817 (class 2606 OID 33134)
-- Name: ventas ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (venta_id);


--
-- TOC entry 4822 (class 2606 OID 33086)
-- Name: cat_mat_primas_de_productos cat_mat_primas_de_productos_categoria_mp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_mat_primas_de_productos
    ADD CONSTRAINT cat_mat_primas_de_productos_categoria_mp_id_fkey FOREIGN KEY (categoria_mp_id) REFERENCES public.cat_materia_prima(cmp_id);


--
-- TOC entry 4823 (class 2606 OID 33081)
-- Name: cat_mat_primas_de_productos cat_mat_primas_de_productos_categoria_prod_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_mat_primas_de_productos
    ADD CONSTRAINT cat_mat_primas_de_productos_categoria_prod_id_fkey FOREIGN KEY (categoria_prod_id) REFERENCES public.categorias_productos(categoria_id);


--
-- TOC entry 4824 (class 2606 OID 33100)
-- Name: mat_primas_de_categorias mat_primas_de_categorias_id_cat_materia_prima_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mat_primas_de_categorias
    ADD CONSTRAINT mat_primas_de_categorias_id_cat_materia_prima_fkey FOREIGN KEY (id_cat_materia_prima) REFERENCES public.cat_materia_prima(cmp_id);


--
-- TOC entry 4825 (class 2606 OID 33105)
-- Name: mat_primas_de_categorias mat_primas_de_categorias_id_materia_prima_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mat_primas_de_categorias
    ADD CONSTRAINT mat_primas_de_categorias_id_materia_prima_fkey FOREIGN KEY (id_materia_prima) REFERENCES public.materia_prima(mp_id);


--
-- TOC entry 4819 (class 2606 OID 24918)
-- Name: materia_prima materia_prima_cmp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materia_prima
    ADD CONSTRAINT materia_prima_cmp_id_fkey FOREIGN KEY (cmp_id) REFERENCES public.cat_materia_prima(cmp_id);


--
-- TOC entry 4820 (class 2606 OID 24955)
-- Name: productos_de_especialidades productos_de_especialidades_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_de_especialidades
    ADD CONSTRAINT productos_de_especialidades_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias_productos(categoria_id);


--
-- TOC entry 4821 (class 2606 OID 24965)
-- Name: productos_de_especialidades productos_de_especialidades_especialidad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_de_especialidades
    ADD CONSTRAINT productos_de_especialidades_especialidad_id_fkey FOREIGN KEY (especialidad_id) REFERENCES public.especialidades(especialidad_id);


--
-- TOC entry 4818 (class 2606 OID 24941)
-- Name: restaurantes restaurantes_especialidad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurantes
    ADD CONSTRAINT restaurantes_especialidad_id_fkey FOREIGN KEY (especialidad_id) REFERENCES public.especialidades(especialidad_id);


--
-- TOC entry 4826 (class 2606 OID 33140)
-- Name: ventas ventas_mp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_mp_id_fkey FOREIGN KEY (mp_id) REFERENCES public.materia_prima(mp_id);


--
-- TOC entry 4827 (class 2606 OID 33135)
-- Name: ventas ventas_r_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_r_id_fkey FOREIGN KEY (r_id) REFERENCES public.restaurantes(r_id);


-- Completed on 2025-08-30 01:35:37

--
-- PostgreSQL database dump complete
--

