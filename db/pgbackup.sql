--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO nicolas;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: nicolas
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO nicolas;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicolas
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO nicolas;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: nicolas
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO nicolas;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicolas
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO nicolas;

--
-- Name: areas; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.areas (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.areas OWNER TO nicolas;

--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: nicolas
--

CREATE SEQUENCE public.areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areas_id_seq OWNER TO nicolas;

--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicolas
--

ALTER SEQUENCE public.areas_id_seq OWNED BY public.areas.id;


--
-- Name: boulders; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.boulders (
    id bigint NOT NULL,
    polygon public.geography(Polygon,4326),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    area_id bigint
);


ALTER TABLE public.boulders OWNER TO nicolas;

--
-- Name: boulders_id_seq; Type: SEQUENCE; Schema: public; Owner: nicolas
--

CREATE SEQUENCE public.boulders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boulders_id_seq OWNER TO nicolas;

--
-- Name: boulders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicolas
--

ALTER SEQUENCE public.boulders_id_seq OWNED BY public.boulders.id;


--
-- Name: circuits; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.circuits (
    id bigint NOT NULL,
    color character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    area_id bigint
);


ALTER TABLE public.circuits OWNER TO nicolas;

--
-- Name: circuits_id_seq; Type: SEQUENCE; Schema: public; Owner: nicolas
--

CREATE SEQUENCE public.circuits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_id_seq OWNER TO nicolas;

--
-- Name: circuits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicolas
--

ALTER SEQUENCE public.circuits_id_seq OWNED BY public.circuits.id;


--
-- Name: pois; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.pois (
    id bigint NOT NULL,
    title character varying,
    subtitle character varying,
    description character varying,
    location public.geography(Point,4326),
    route public.geography(LineString,4326),
    area_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.pois OWNER TO nicolas;

--
-- Name: pois_id_seq; Type: SEQUENCE; Schema: public; Owner: nicolas
--

CREATE SEQUENCE public.pois_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pois_id_seq OWNER TO nicolas;

--
-- Name: pois_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicolas
--

ALTER SEQUENCE public.pois_id_seq OWNED BY public.pois.id;


--
-- Name: problems; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.problems (
    id bigint NOT NULL,
    name character varying,
    grade character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    location public.geography(Point,4326),
    circuit_id bigint,
    circuit_number character varying,
    steepness character varying NOT NULL,
    height integer,
    area_id bigint,
    tags character varying[] DEFAULT '{}'::character varying[] NOT NULL
);


ALTER TABLE public.problems OWNER TO nicolas;

--
-- Name: problems_id_seq; Type: SEQUENCE; Schema: public; Owner: nicolas
--

CREATE SEQUENCE public.problems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.problems_id_seq OWNER TO nicolas;

--
-- Name: problems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicolas
--

ALTER SEQUENCE public.problems_id_seq OWNED BY public.problems.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO nicolas;

--
-- Name: topos; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.topos (
    id bigint NOT NULL,
    line json,
    problem_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.topos OWNER TO nicolas;

--
-- Name: topos_id_seq; Type: SEQUENCE; Schema: public; Owner: nicolas
--

CREATE SEQUENCE public.topos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topos_id_seq OWNER TO nicolas;

--
-- Name: topos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicolas
--

ALTER SEQUENCE public.topos_id_seq OWNED BY public.topos.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: areas id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.areas ALTER COLUMN id SET DEFAULT nextval('public.areas_id_seq'::regclass);


--
-- Name: boulders id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.boulders ALTER COLUMN id SET DEFAULT nextval('public.boulders_id_seq'::regclass);


--
-- Name: circuits id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.circuits ALTER COLUMN id SET DEFAULT nextval('public.circuits_id_seq'::regclass);


--
-- Name: pois id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.pois ALTER COLUMN id SET DEFAULT nextval('public.pois_id_seq'::regclass);


--
-- Name: problems id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.problems ALTER COLUMN id SET DEFAULT nextval('public.problems_id_seq'::regclass);


--
-- Name: topos id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.topos ALTER COLUMN id SET DEFAULT nextval('public.topos_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
2	photo	Topo	2	2	2020-04-18 20:36:55.290724
3	photo	Topo	3	3	2020-04-18 20:36:55.343504
4	photo	Topo	4	4	2020-04-18 20:36:55.390197
5	photo	Topo	5	5	2020-04-18 20:36:55.43851
6	photo	Topo	6	6	2020-04-18 20:36:55.514855
7	photo	Topo	7	7	2020-04-18 20:36:55.552475
8	photo	Topo	8	8	2020-04-18 20:36:55.583846
9	photo	Topo	9	9	2020-04-18 20:36:55.618317
10	photo	Topo	10	10	2020-04-18 20:36:55.645499
11	photo	Topo	11	11	2020-04-18 20:36:55.687699
12	photo	Topo	12	12	2020-04-18 20:36:55.722564
13	photo	Topo	13	13	2020-04-18 20:36:55.754756
14	photo	Topo	14	14	2020-04-18 20:36:55.789575
15	photo	Topo	15	15	2020-04-18 20:36:55.824586
16	photo	Topo	16	16	2020-04-18 20:36:55.851337
17	photo	Topo	17	17	2020-04-18 20:36:55.886811
18	photo	Topo	18	18	2020-04-18 20:36:55.921813
19	photo	Topo	19	19	2020-04-18 20:36:55.949921
20	photo	Topo	20	20	2020-04-18 20:36:55.986416
21	photo	Topo	21	21	2020-04-18 20:36:56.025959
22	photo	Topo	22	22	2020-04-18 20:36:56.058563
23	photo	Topo	23	23	2020-04-18 20:36:56.095706
24	photo	Topo	24	24	2020-04-18 20:36:56.130667
25	photo	Topo	25	25	2020-04-18 20:36:56.164839
26	photo	Topo	26	26	2020-04-18 20:36:56.20408
27	photo	Topo	27	27	2020-04-18 20:36:56.235177
28	photo	Topo	28	28	2020-04-18 20:36:56.27208
29	photo	Topo	29	29	2020-04-18 20:36:56.315547
30	photo	Topo	30	30	2020-04-18 20:36:56.347723
31	photo	Topo	31	31	2020-04-18 20:36:56.391437
32	photo	Topo	32	32	2020-04-18 20:36:56.427297
33	photo	Topo	33	33	2020-04-18 20:36:56.462271
34	photo	Topo	34	34	2020-04-18 20:36:56.498208
35	photo	Topo	35	35	2020-04-18 20:36:56.535179
36	photo	Topo	36	36	2020-04-18 20:36:56.575332
37	photo	Topo	37	37	2020-04-18 20:36:56.621844
38	photo	Topo	38	38	2020-04-18 20:36:56.65907
39	photo	Topo	39	39	2020-04-18 20:36:56.709278
40	photo	Topo	40	40	2020-04-18 20:36:56.74557
41	photo	Topo	41	41	2020-04-18 20:36:56.791413
42	photo	Topo	42	42	2020-04-18 20:36:56.829495
43	photo	Topo	43	43	2020-04-18 20:36:56.866024
44	photo	Topo	44	44	2020-04-18 20:36:56.914299
45	photo	Topo	45	45	2020-04-18 20:36:56.947318
46	photo	Topo	46	46	2020-04-18 20:36:56.98621
47	photo	Topo	47	47	2020-04-18 20:36:57.026099
48	photo	Topo	48	48	2020-04-18 20:36:57.070279
49	photo	Topo	49	49	2020-04-18 20:36:57.116182
50	photo	Topo	50	50	2020-04-18 20:36:57.148816
51	photo	Topo	51	51	2020-04-18 20:36:57.185801
52	photo	Topo	52	52	2020-04-18 20:36:57.227494
53	photo	Topo	53	53	2020-04-18 20:36:57.262768
54	photo	Topo	54	54	2020-04-18 20:36:57.30508
55	photo	Topo	55	55	2020-04-18 20:36:57.340289
56	photo	Topo	56	56	2020-04-18 20:36:57.384277
57	photo	Topo	57	57	2020-04-18 20:36:57.426028
58	photo	Topo	58	58	2020-04-18 20:36:57.460397
59	photo	Topo	59	59	2020-04-18 20:36:57.502845
60	photo	Topo	60	60	2020-04-18 20:36:57.53997
61	photo	Topo	61	61	2020-04-18 20:36:57.582671
62	photo	Topo	62	62	2020-04-18 20:36:57.6295
63	photo	Topo	63	63	2020-04-18 20:36:57.672459
64	photo	Topo	64	64	2020-04-18 20:36:57.721642
65	photo	Topo	65	65	2020-04-18 20:36:57.758309
66	photo	Topo	66	66	2020-04-18 20:36:57.804316
67	photo	Topo	67	67	2020-04-18 20:36:57.852759
68	photo	Topo	68	68	2020-04-18 20:36:57.901094
69	photo	Topo	69	69	2020-04-18 20:36:57.934643
70	photo	Topo	70	70	2020-04-18 20:36:57.973821
71	photo	Topo	71	71	2020-04-18 20:36:58.015627
72	photo	Topo	72	72	2020-04-18 20:36:58.052925
73	photo	Topo	73	73	2020-04-18 20:36:58.096081
74	photo	Topo	74	74	2020-04-18 20:36:58.13459
75	photo	Topo	75	75	2020-04-18 20:36:58.172538
76	photo	Topo	76	76	2020-04-18 20:36:58.216045
77	photo	Topo	77	77	2020-04-18 20:36:58.252088
78	photo	Topo	78	78	2020-04-18 20:36:58.292627
79	photo	Topo	79	79	2020-04-18 20:36:58.328899
80	photo	Topo	80	80	2020-04-18 20:36:58.366016
81	photo	Topo	81	81	2020-04-18 20:36:58.418572
82	photo	Topo	82	82	2020-04-18 20:36:58.45358
83	photo	Topo	83	83	2020-04-18 20:36:58.4934
84	photo	Topo	84	84	2020-04-18 20:36:58.53101
85	photo	Topo	85	85	2020-04-18 20:36:58.568921
86	photo	Topo	86	86	2020-04-18 20:36:58.616252
87	photo	Topo	87	87	2020-04-18 20:36:58.659135
88	photo	Topo	88	88	2020-04-18 20:36:58.698315
89	photo	Topo	89	89	2020-04-18 20:36:58.738591
90	photo	Topo	90	90	2020-04-18 20:36:58.78209
91	photo	Topo	91	91	2020-04-18 20:36:58.82679
92	photo	Topo	92	92	2020-04-18 20:36:58.86822
93	photo	Topo	93	93	2020-04-18 20:36:58.916833
94	photo	Topo	94	94	2020-04-18 20:36:58.952489
95	photo	Topo	95	95	2020-04-18 20:36:58.994077
96	photo	Topo	96	96	2020-04-18 20:36:59.03393
97	photo	Topo	97	97	2020-04-18 20:36:59.073017
98	photo	Topo	98	98	2020-04-18 20:36:59.122078
99	photo	Topo	99	99	2020-04-18 20:36:59.162696
100	photo	Topo	100	100	2020-04-18 20:36:59.20772
101	photo	Topo	101	101	2020-04-18 20:36:59.241551
102	photo	Topo	102	102	2020-04-18 20:36:59.280197
103	photo	Topo	103	103	2020-04-18 20:36:59.321582
104	photo	Topo	104	104	2020-04-18 20:36:59.36241
105	photo	Topo	105	105	2020-04-18 20:36:59.405588
106	photo	Topo	106	106	2020-04-18 20:36:59.448483
107	photo	Topo	107	107	2020-04-18 20:36:59.488409
108	photo	Topo	108	108	2020-04-18 20:36:59.559439
109	photo	Topo	109	109	2020-04-18 20:36:59.607744
110	photo	Topo	110	110	2020-04-18 20:36:59.650097
111	photo	Topo	111	111	2020-04-18 20:36:59.687634
112	photo	Topo	112	112	2020-04-18 20:36:59.727175
113	photo	Topo	113	113	2020-04-18 20:36:59.76451
114	photo	Topo	114	114	2020-04-18 20:36:59.81176
115	photo	Topo	115	115	2020-04-18 20:36:59.8423
116	photo	Topo	116	116	2020-04-18 20:36:59.880497
117	photo	Topo	117	117	2020-04-18 20:36:59.924535
118	photo	Topo	118	118	2020-04-18 20:36:59.966241
119	photo	Topo	119	119	2020-04-18 20:37:00.004964
120	photo	Topo	120	120	2020-04-18 20:37:00.040752
121	photo	Topo	121	121	2020-04-18 20:37:00.079113
122	photo	Topo	122	122	2020-04-18 20:37:00.122991
123	photo	Topo	123	123	2020-04-18 20:37:00.160905
124	photo	Topo	124	124	2020-04-18 20:37:00.193638
125	photo	Topo	125	125	2020-04-18 20:37:00.230417
126	photo	Topo	126	126	2020-04-18 20:37:00.265506
127	photo	Topo	127	127	2020-04-18 20:37:00.305596
128	photo	Topo	128	128	2020-04-18 20:37:00.340728
129	photo	Topo	129	129	2020-04-18 20:37:00.376677
130	photo	Topo	130	130	2020-04-18 20:37:00.41676
131	photo	Topo	131	131	2020-04-18 20:37:00.456093
132	photo	Topo	132	132	2020-04-18 20:37:00.490183
133	photo	Topo	133	133	2020-04-18 20:37:00.528537
134	photo	Topo	134	134	2020-04-18 20:37:00.563087
135	photo	Topo	135	135	2020-04-18 20:37:00.596122
136	photo	Topo	136	136	2020-04-18 20:37:00.633399
137	photo	Topo	137	137	2020-04-18 20:37:00.668315
138	photo	Topo	138	138	2020-04-18 20:37:00.706039
139	photo	Topo	139	139	2020-04-18 20:37:00.740192
140	photo	Topo	140	140	2020-04-18 20:37:00.775057
141	photo	Topo	141	141	2020-04-18 20:37:00.816471
142	photo	Topo	142	142	2020-04-18 20:37:00.85104
143	photo	Topo	143	143	2020-04-18 20:37:00.885674
144	photo	Topo	144	144	2020-04-18 20:37:00.927004
145	photo	Topo	145	145	2020-04-18 20:37:00.962661
146	photo	Topo	146	146	2020-04-18 20:37:00.996599
147	photo	Topo	147	147	2020-04-18 20:37:01.05192
148	photo	Topo	148	148	2020-04-18 20:37:01.082408
149	photo	Topo	149	149	2020-04-18 20:37:01.123711
150	photo	Topo	150	150	2020-04-18 20:37:01.157663
151	photo	Topo	151	151	2020-04-18 20:37:01.190737
152	photo	Topo	152	152	2020-04-18 20:37:01.229399
153	photo	Topo	153	153	2020-04-18 20:37:01.26498
154	photo	Topo	154	154	2020-04-18 20:37:01.300228
155	photo	Topo	155	155	2020-04-18 20:37:01.345559
156	photo	Topo	156	156	2020-04-18 20:37:01.3816
157	photo	Topo	157	157	2020-04-18 20:37:01.427523
158	photo	Topo	158	158	2020-04-18 20:37:01.465836
159	photo	Topo	159	159	2020-04-18 20:37:01.500117
160	photo	Topo	160	160	2020-04-18 20:37:01.539132
161	photo	Topo	161	161	2020-04-18 20:37:01.575211
162	photo	Topo	162	162	2020-04-18 20:37:01.618085
163	photo	Topo	163	163	2020-04-18 20:37:01.656413
164	photo	Topo	164	164	2020-04-18 20:37:01.698181
165	photo	Topo	165	165	2020-04-18 20:37:01.742168
166	photo	Topo	166	166	2020-04-18 20:37:01.778181
167	photo	Topo	167	167	2020-04-18 20:37:01.823235
168	photo	Topo	168	168	2020-04-18 20:37:01.862998
169	photo	Topo	169	169	2020-04-18 20:37:01.896093
170	photo	Topo	170	170	2020-04-18 20:37:01.939605
171	photo	Topo	171	171	2020-04-18 20:37:01.990068
172	photo	Topo	172	172	2020-04-18 20:37:02.03759
173	photo	Topo	173	173	2020-04-18 20:37:02.07352
174	photo	Topo	174	174	2020-04-18 20:37:02.116922
175	photo	Topo	175	175	2020-04-18 20:37:02.15418
176	photo	Topo	176	176	2020-04-18 20:37:02.188079
177	photo	Topo	177	177	2020-04-18 20:37:02.229702
178	photo	Topo	178	178	2020-04-18 20:37:02.264346
179	photo	Topo	179	179	2020-04-18 20:37:02.298018
180	photo	Topo	180	180	2020-04-18 20:37:02.342254
181	photo	Topo	181	181	2020-04-18 20:37:02.377101
182	photo	Topo	182	182	2020-04-18 20:37:02.418531
183	photo	Topo	183	183	2020-04-18 20:37:02.46195
184	photo	Topo	184	184	2020-04-18 20:37:02.500665
185	photo	Topo	185	185	2020-04-18 20:37:02.543518
186	photo	Topo	186	186	2020-04-18 20:37:02.57787
187	photo	Topo	187	187	2020-04-18 20:37:02.617223
188	photo	Topo	188	188	2020-04-18 20:37:02.656083
189	photo	Topo	189	189	2020-04-18 20:37:02.686717
190	photo	Topo	190	190	2020-04-18 20:37:02.727789
191	photo	Topo	191	191	2020-04-18 20:37:02.76593
192	photo	Topo	192	192	2020-04-18 20:37:02.801146
193	photo	Topo	193	193	2020-04-18 20:37:02.845555
194	photo	Topo	194	194	2020-04-18 20:37:02.883292
195	photo	Topo	195	195	2020-04-18 20:37:02.930654
196	photo	Topo	196	196	2020-04-18 20:37:02.977199
197	photo	Topo	197	197	2020-04-18 20:37:03.041493
198	photo	Topo	198	198	2020-04-18 20:37:03.075132
199	photo	Topo	199	199	2020-04-18 20:37:03.121609
200	photo	Topo	200	200	2020-04-18 20:37:03.170737
201	photo	Topo	201	201	2020-04-18 20:37:03.22372
202	photo	Topo	202	202	2020-04-18 20:37:03.264435
203	photo	Topo	203	203	2020-04-18 20:37:03.313562
204	photo	Topo	204	204	2020-04-18 20:37:03.370926
205	photo	Topo	205	205	2020-04-18 20:37:03.417536
206	photo	Topo	206	206	2020-04-18 20:37:03.464038
207	photo	Topo	1	207	2020-04-18 20:37:03.510387
208	photo	Topo	207	208	2020-04-18 20:37:03.583786
209	photo	Topo	208	209	2020-04-18 20:37:03.631917
210	photo	Topo	209	210	2020-04-18 20:37:03.680462
211	photo	Topo	210	211	2020-04-18 20:37:03.729789
212	photo	Topo	211	212	2020-04-18 20:37:03.776494
213	photo	Topo	212	213	2020-04-18 20:37:03.819849
214	photo	Topo	213	214	2020-04-18 20:37:03.863247
215	photo	Topo	214	215	2020-04-18 20:37:03.902992
216	photo	Topo	215	216	2020-04-18 20:37:03.949838
217	photo	Topo	216	217	2020-04-18 20:37:03.993906
218	photo	Topo	217	218	2020-04-18 20:37:04.041864
219	photo	Topo	218	219	2020-04-18 20:37:04.091268
220	photo	Topo	219	220	2020-04-18 20:37:04.159244
221	photo	Topo	220	221	2020-04-18 20:37:04.206662
222	photo	Topo	221	222	2020-04-18 20:37:04.253678
223	photo	Topo	222	223	2020-04-18 20:37:04.300302
224	photo	Topo	223	224	2020-04-18 20:37:04.349661
225	photo	Topo	224	225	2020-04-18 20:37:04.392447
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
22	ihk4k6ulwji3qe9sks4r02636r64	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	600161	yyZGMNXcDIbpWHUl8OeLeg==	2020-04-18 20:36:56.055207
2	txz0l5wyvitad4400tlqdectfc8i	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	575857	8qnBSApfNMJ1tTph9bfh6A==	2020-04-18 20:36:55.289084
3	pvju7a3uanxjv69pzgtjnb5k5t06	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	518913	R0rXVQyG2c4ShbWtBS3s5g==	2020-04-18 20:36:55.341717
4	hee21816847ed3ua8sogledk028x	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	549985	YXF3weOEm2U3bIvMQC/0ww==	2020-04-18 20:36:55.379622
5	blqfou420yl2sbg65h131l1yrqtg	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	481385	+B3xnp+/TiHyp9KwAeUXDw==	2020-04-18 20:36:55.431411
6	lcuobxqdtgtf3hw4qkmzqdrkx2te	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	599450	L1Voy6p86lI7fsRWTAWmwg==	2020-04-18 20:36:55.51183
7	8htxqjbcsboxbl5jo0badbnayema	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	436285	hkrDueMnhXmxOzwaIW+O8A==	2020-04-18 20:36:55.549769
8	l974gd65hkwkwkungxuvzirwvmfh	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	528528	Bqo1cZOaPnXQwvLwE2aiuA==	2020-04-18 20:36:55.580746
9	vl4oby6o8awa4x03q49guvos2ovc	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	549985	YXF3weOEm2U3bIvMQC/0ww==	2020-04-18 20:36:55.616657
10	etr81e2ydxvhudzu9v4dwxqke81t	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	546483	AUc16+4jZy1HrCUhudMc0A==	2020-04-18 20:36:55.643028
11	1ex3v2til1bqzq6h66x0s2mtz167	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	635805	IGGMf8fGtCzO1evAtL9zwQ==	2020-04-18 20:36:55.684088
12	g0vne64i006mgermn1mj9bkj8gj7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	539185	ExVxE+vaJFF9Y5mpAGL0jw==	2020-04-18 20:36:55.720589
13	ixl51ivq58ols5pglxr0wbavja3n	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	433442	KPi+JMtp8YBfLc4tpbvvYw==	2020-04-18 20:36:55.752121
14	z6cpnoq4syvcv8evs84il0rtxmua	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	465803	UqnuxRnZoajA7aEC8KGxZg==	2020-04-18 20:36:55.786604
15	q1zqbnwfwmu7xprp8estkdmcivae	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	388653	DssvthfPVIuWM+BQZj/rpA==	2020-04-18 20:36:55.822125
16	ppl9nxh3ytkmn5stdvx6dkgb1gyk	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	572627	iuGLOrceGiXcTAbO/uQfxQ==	2020-04-18 20:36:55.848541
17	m47etj3zgqsildy28rlqwmm42tew	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	513766	kebBlUWPYTArf7vMedfdOw==	2020-04-18 20:36:55.883185
18	liipm957jdszdaycg4gbri4ny6sp	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	467454	xP/qVWCKPkpuKANrEJ9uWQ==	2020-04-18 20:36:55.919826
19	q9k8vzto0aeg1f8lk08z9ozi4twx	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	624677	v8a8HrFPsi446+8Lkatymg==	2020-04-18 20:36:55.947164
20	7wjhf79xjggisy5fzrk6q5537x9u	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	505711	aJFn9iWCyWXqrV3qmvqC8Q==	2020-04-18 20:36:55.982317
21	0g6eq9ih1zady8zrpmywwt93rwaz	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	567244	AWocO58ZuHhxHZDN0grv5w==	2020-04-18 20:36:56.023921
23	pyp98td1lrq6gt5ovfcvigr4xjny	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	554516	Zntt+B1Z/YFltPzc/2eo8w==	2020-04-18 20:36:56.093133
24	ic76lb7604r050qvvdhg8kvx5vv7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	571943	RXq7Qe6ZLCK5IDN2JyK+uA==	2020-04-18 20:36:56.128396
25	j5xu1h4behbein8jq67fci6ot1ga	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	630383	/YZAFKa7uDFQ6v5WQt5HwA==	2020-04-18 20:36:56.162769
26	387xat2olxqqpgrdvrwdjk9ycofm	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	568322	xkRwJnA/mC29rTOu4x2M6g==	2020-04-18 20:36:56.199629
27	6j9bnq6v47j0hhlpchckmpepuvrw	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	539185	ExVxE+vaJFF9Y5mpAGL0jw==	2020-04-18 20:36:56.233323
28	bq70f717fw70xpriji3si55dr4uu	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	643399	d7v7Mt4M6JFGIXwuz/rT+g==	2020-04-18 20:36:56.268576
29	wdzaeitgepu26ih9flg079ohvyw1	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	541176	rHPc1tf6fLxNWfwTKwBeHA==	2020-04-18 20:36:56.313589
30	s9uf0eux4gnls2520ubkkasl1u1j	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	559677	gS50BjR2RJNDNM2gzQHuzg==	2020-04-18 20:36:56.344306
31	uyl30nzs5dzxwisl2ny3spxdeagr	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	587683	/s9m97cSk/HaGJBLm0iO0Q==	2020-04-18 20:36:56.388424
32	01bijyeqjziv4v5awobp7vt8v8qg	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	575455	iizwpNg/p+r5WhthMVhaQg==	2020-04-18 20:36:56.425234
33	efu8lwt8qez8zms8tfre8v4y8ihh	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	663786	K8ZOyU7Cs16VoHg4/KCRqw==	2020-04-18 20:36:56.459775
34	s1phmsoydg0m0ns6n65j87hep77r	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	521462	5Evc10eig2kO8URvFNgx1A==	2020-04-18 20:36:56.494821
35	0ob38y6lpn5wg0e5to52k20q95bg	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	505711	aJFn9iWCyWXqrV3qmvqC8Q==	2020-04-18 20:36:56.532782
36	jc7quqce4xwclxfb4cayngjq0o80	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	572627	iuGLOrceGiXcTAbO/uQfxQ==	2020-04-18 20:36:56.571869
37	maumvc62l00bt2meqp90xqxidike	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	581520	MDtkpHEQ/0+CPAdqxgMydw==	2020-04-18 20:36:56.619409
38	tjzr6480hqmaknoycldh9w6fjnny	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	546747	0ozX6eGU+MUahu/44JF1IA==	2020-04-18 20:36:56.65576
39	6g6272h5ov3rqsjdzlbnpaur43oq	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	568261	1zP7a5gO/H5mrg2Ayu5Afw==	2020-04-18 20:36:56.705767
40	49wu0y3giuny1pxw49yr0h3femga	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	590130	lWTe9SqbVDPcnM+Yw+XWXA==	2020-04-18 20:36:56.742363
41	0ep3z0t035xybp45uck99baow252	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	627934	oOXx8MzdERT7DSbjV5yvoA==	2020-04-18 20:36:56.788115
42	92xwi71hm6xjzfyz8kutf3fgyn7f	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	610662	9MoL8W4iydQz1BPzdyCC3g==	2020-04-18 20:36:56.827089
43	o0ob562czb50927qg1r7spkt8ze9	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	610662	9MoL8W4iydQz1BPzdyCC3g==	2020-04-18 20:36:56.863113
44	cykb0ycetyx3gtlt7dvconwsjfrl	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	627934	oOXx8MzdERT7DSbjV5yvoA==	2020-04-18 20:36:56.912004
45	cfqufhx2hudsz1yth86dm4a9w5fq	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	605093	/3s4iR9+UzWBhAYqNGL5jQ==	2020-04-18 20:36:56.944133
46	rg2znh3sl3dis3a0qaawk1bm476p	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	556361	AWzvVK1H6da5I1lDI+LA4A==	2020-04-18 20:36:56.981911
47	4pel3po8t95olgh9srp4556qzizz	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	554516	Zntt+B1Z/YFltPzc/2eo8w==	2020-04-18 20:36:57.023717
48	uwxaj7c0wbyq5kahvenjx3vb3y39	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	577840	32kb4SGDYLLjkvgF1WuJww==	2020-04-18 20:36:57.067152
49	l4xev3ptjwvb6thbk2ctgb8ya5aw	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	553317	IiPEYsFsimr9l9F4d8UNhg==	2020-04-18 20:36:57.114302
50	6o8xvxceo1apbqcjgjsx8g3eufcs	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	544508	x3zahyCH8BQKaN9v9yQfGw==	2020-04-18 20:36:57.145508
51	8afaeduv4gfcs4qwy6i1qfrfpopl	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	560632	47whB847mG1Xw/13iNqPaA==	2020-04-18 20:36:57.182499
52	8zoihlozzupzxswc3q8l80phxvjb	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	595986	dWMvFQBtCilWfusfDhU4gw==	2020-04-18 20:36:57.225243
53	2adoje92x4yyrga29fm324l13ght	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	568261	1zP7a5gO/H5mrg2Ayu5Afw==	2020-04-18 20:36:57.260302
54	zkdawbc1y7luk8irv5omyafqxlae	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	616735	mSCSNRcOFa9GviO2RcgDaw==	2020-04-18 20:36:57.300202
55	8hwcojrpqx3x7wd09atqnmu9n9o2	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	559677	gS50BjR2RJNDNM2gzQHuzg==	2020-04-18 20:36:57.338215
56	f4o7xsp6mmjpbmadyz3sw1mj52qm	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	588852	mHkz52qOWQVQyFiHIcO8Tw==	2020-04-18 20:36:57.380872
57	ur7yu8leo9l3l9gj9pdvo22742ry	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	411624	HWPDeAbFIJ9VSwnQINpR8g==	2020-04-18 20:36:57.423737
58	m8148rtbffqnv2liu410q1txffbg	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	528501	4P8zLO0AOYid3FWF4e1P0w==	2020-04-18 20:36:57.457442
59	paw755lx3k9ods0mmkl38inm55m2	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	660421	HWWyMb6vgueX++7GAJZS2w==	2020-04-18 20:36:57.498404
60	bu2i5q05ojg5857b2khikt5edbhp	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	411624	HWPDeAbFIJ9VSwnQINpR8g==	2020-04-18 20:36:57.534438
61	8u21i4reryz3uah5wyc4zlf8d1f7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	609176	utBdiXZpWQR9L9fl2MY/GA==	2020-04-18 20:36:57.57952
62	ibrxfldkrouqh3qyx1w5v01q77t9	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	559677	gS50BjR2RJNDNM2gzQHuzg==	2020-04-18 20:36:57.626815
63	ltckgpwnnj89wnma6xibrxkok2e0	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	469126	8QFOsiCZQzIFH2Q7XGuc2A==	2020-04-18 20:36:57.669907
64	1hmici2a1lwwksqhrmun34756a4w	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	566337	7lDoD6Nf+iyAO3iWv1VSMQ==	2020-04-18 20:36:57.717706
65	9tj4mokwdhtz6xcn13t6g74pfi2r	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	592045	i4XEfSjNC8nM/oECmhw1YQ==	2020-04-18 20:36:57.754828
66	1yllzmb5ij664vihqt3e2gbbllyz	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	608710	m9OJTf5CacmXDZ3zaqkarw==	2020-04-18 20:36:57.799237
67	qlvo64eafwlwzzuxw4lltp4ns4h0	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	587872	eEhluj6EO5CwrvNv+iDt3A==	2020-04-18 20:36:57.847772
68	p16xeph0gti81hq0b5avb5gmpfta	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	565417	KGTflVdqGXYd5B0QVcjwfA==	2020-04-18 20:36:57.894208
69	oh157413n4lrl4ys0grurkdovv4q	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	595986	dWMvFQBtCilWfusfDhU4gw==	2020-04-18 20:36:57.932245
70	i4vb4aw8fv0pg4r1iiohq39481xq	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	635283	O0nfTU8HuN4awJHnKHOjMw==	2020-04-18 20:36:57.970831
71	g2bfjuaexly1j6ssjcrll4205fpn	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	597246	HRjOM+9PvpTPiC0Pj7c2FA==	2020-04-18 20:36:58.01323
72	jcne94fo51x0p6hwwf2pvazqy6iv	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	617099	Rmceyh8CMvleobIBLfRpgw==	2020-04-18 20:36:58.049943
73	cpeueb0wc12wjrtlt5l145yzdhxa	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	528501	4P8zLO0AOYid3FWF4e1P0w==	2020-04-18 20:36:58.092853
74	p9zmn90644fq8g1pzcpuwp6vpza0	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	506326	v0HSDnqLHpX/ArLH5bASeg==	2020-04-18 20:36:58.131914
75	4x2r5y2llnpjmya8sh1akcuq3hhv	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	582668	D4jBfv4wdzcCxR0Hby/aGA==	2020-04-18 20:36:58.169866
76	ut910qnyl4c22ajmk5rpauj10xr7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	619129	jB5yHNIORh+ax5WzkHvfqw==	2020-04-18 20:36:58.212926
77	zqh2iis9aeek0jhtv1wuets4mvuw	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	599233	64R5F0QvjWQg5gSXbYI2qg==	2020-04-18 20:36:58.249006
78	f9gmwrnywz9vrm29mb0krktfel3y	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	611650	DFpVRDyw8DjTgUBYeNw99w==	2020-04-18 20:36:58.289968
79	3pxruibbvlut7kw6036w26e94krj	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	588742	RAyT+YJQjR2LSmxU72euGQ==	2020-04-18 20:36:58.323959
80	egjb2rhx0403dqn22gihoqok73l2	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	611206	Yb4nIrTQH51R0MZtlWYo4Q==	2020-04-18 20:36:58.36068
81	lb58p7wx3u1b8i223vwx0qqy5b3a	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	595043	rX8r/pS1Trq6SMLl0quLdg==	2020-04-18 20:36:58.41313
82	prjbh2wx590n4hlbq8phkg719q8g	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	612321	/lcJ6gu/AWq6AimVhZiz7Q==	2020-04-18 20:36:58.45022
83	82oij2pwrvds7s17o9rq1ypuveke	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	534817	EasV1WfZAbPKDUXH/Gjglg==	2020-04-18 20:36:58.490954
84	9iuv0r73kssvfcqk9r11fpyik0ys	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	505963	TVlr5h5D/zhwZlx+drd0FA==	2020-04-18 20:36:58.528914
85	on5qf4zpwbct2asloapwesggi9r5	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	533717	itxtPs4L4Tc71dg/oAgWrA==	2020-04-18 20:36:58.565507
86	nzzti0s6ker8chbv789j2qemy6tr	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	534817	EasV1WfZAbPKDUXH/Gjglg==	2020-04-18 20:36:58.612842
87	mp68gs2pgqsxbqflxjh299uz6xvw	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	497397	pibqa08AfPlU0HA14Uz4Jg==	2020-04-18 20:36:58.655931
88	lerf0ancyke8ke8oe4ws96qvm48l	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	558073	xUmEGB/hs8uyIFYkILmXIQ==	2020-04-18 20:36:58.694778
89	8c9f0b6sdls6xhlecxralh3ip8sz	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552380	NFWBkVyPshvUe6dKCfikrg==	2020-04-18 20:36:58.735642
94	chbfld87e1uti41z2hgsce3g64zm	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	655187	JfSS6CJVNlbhM9BSQcUfiQ==	2020-04-18 20:36:58.948539
90	7xbolf7yh103bknmpcpgh9o5fefv	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552666	Dm0wiHkM2GUi3tvLskNkEQ==	2020-04-18 20:36:58.779509
91	3cj2f0btly9fot7vlb2jlinr7046	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	585603	KdN1+3tK3R5YPsBbk1M07A==	2020-04-18 20:36:58.824425
92	2x77g3cj3pmhwnwgq259wbcx1bu8	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	561662	4RS+1Yj9SCvkPvDcZh1mWw==	2020-04-18 20:36:58.864993
93	2irkcgb93qsy7p89tgqtfm7fay7v	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552666	Dm0wiHkM2GUi3tvLskNkEQ==	2020-04-18 20:36:58.914418
184	hzthztauabdsy516utn2lx030miy	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	551039	uiLpH2qapq3vsOXxP3xRYQ==	2020-04-18 20:37:02.49733
95	lq3553cgaykb1j7dpp25m04wkf9c	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552731	RuQluFGMFvPiTbdx7AfYKA==	2020-04-18 20:36:58.990817
96	pif7iv5f69q2pra8y33xprfab9w3	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	436285	hkrDueMnhXmxOzwaIW+O8A==	2020-04-18 20:36:59.031206
97	g31fqh5mutjgj7ybpayx9eegy62e	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	616499	avPqpogJOfnNt+NJQsKiSA==	2020-04-18 20:36:59.069541
98	8nhtlxni0799ghuxo1e0apilqk99	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	566715	ZQ8QHbAWcMis6vHpnvspVw==	2020-04-18 20:36:59.11413
99	pmyv5d7orfh3pzsb0s2gygi92mr6	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	600987	qMb0JpUpFtIQW45jSGz7YQ==	2020-04-18 20:36:59.160683
100	qrvjmuon80k92fne09cgyik3yhec	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	501411	B67OAUXoItC4HIdBtvql9w==	2020-04-18 20:36:59.202538
101	n8lsjm7eg219lsec1dtnb12b5ay7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	470674	CBaUiQ5JG0VbtaY2mzsyPw==	2020-04-18 20:36:59.239449
102	gyo0rvi9i4hiu9e2tb7t109gf56i	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	478351	+pk4yZW9oXMH7KtGQo/LtQ==	2020-04-18 20:36:59.277647
103	eowr3nv3hkkm1t9x2wt2ml9jpmmb	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	502013	OocUv9KjL1AjdqaYYGyTAA==	2020-04-18 20:36:59.318001
104	x44enn387dndvy1ir4x5f3fq3u5x	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	611206	Yb4nIrTQH51R0MZtlWYo4Q==	2020-04-18 20:36:59.359185
105	ye17fc1xyye0k40i7c9om5gxa9of	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	543222	OWwL+sGhmUvCDaiqZjvE+Q==	2020-04-18 20:36:59.400703
106	lq1gyti6554d5xgadf38m91bkz49	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	563148	b97jBFCTBjfm43Wts+LAwA==	2020-04-18 20:36:59.444921
107	0q4gdi9fgqc0r30fvonjai6zk0j7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	603790	HQtSznfof+/KuzClsvyLJQ==	2020-04-18 20:36:59.48445
108	mbob1gdvsileby3j6wfqglxoxvkw	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	528528	Bqo1cZOaPnXQwvLwE2aiuA==	2020-04-18 20:36:59.556192
109	9jd48vd86qsec4rrinlcvzng31s2	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	613715	sR901Oxxzh2G102s8CasOw==	2020-04-18 20:36:59.601828
110	vwmuko4mq54vjyun35bijz76jzt8	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	513611	Hz/wwE2xpdvrx3Uiw/tNEw==	2020-04-18 20:36:59.646831
111	w7oe37404qzj8sadgk35bo4lmepf	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	513611	Hz/wwE2xpdvrx3Uiw/tNEw==	2020-04-18 20:36:59.685108
112	h10v2ifemuz1iblbvl0v321yf2j8	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	528223	6AXjCZZInAjUf8wZPUvjjg==	2020-04-18 20:36:59.724913
113	ljyd55oqpbepp6z0xz0lxja5w37j	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	528528	Bqo1cZOaPnXQwvLwE2aiuA==	2020-04-18 20:36:59.762456
114	6a5qc8u976e3esdvfcua2ebdoguu	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	549013	tjAgcqs31ISUj3y8wpOesQ==	2020-04-18 20:36:59.801726
115	1pjp1whcrx8xb7amlenddhtp5xmc	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	619750	nrYnBhX4sDm7Mj1zGMIllQ==	2020-04-18 20:36:59.840265
116	turr0bvn2mjmky24kkj40x3ubxpn	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	606758	u8cxZQUtipgxIjSH7U5J+g==	2020-04-18 20:36:59.877091
117	nxol13tm824w6irnktbmxh6mbv89	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	575455	iizwpNg/p+r5WhthMVhaQg==	2020-04-18 20:36:59.922535
118	oeedaoqq3j8s2ibl54ucs5qujj1e	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	489092	vea7tSAuIm0f+aBulUPpcg==	2020-04-18 20:36:59.964176
119	k0zfwi9a7i3ror2vs0kbqqrx4rna	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	577048	LfAu/HND4ymwoq4QU14QYA==	2020-04-18 20:37:00.000136
120	f51o35j2cfriosb6h71bdaab9u42	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	599233	64R5F0QvjWQg5gSXbYI2qg==	2020-04-18 20:37:00.038668
121	rty4hbx7n0slgvhd25hkughjdbbb	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	469479	5caJHhKPBHz9FsIGAVoIhA==	2020-04-18 20:37:00.07694
122	weljh6g75khcqw633pqd1qtb4dix	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	610044	Sma82GqWvftUa+jUudCMJw==	2020-04-18 20:37:00.119908
123	vqvd9jdk6gm1r5xtviwraq3lj57x	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	615686	jrINowulP8YPo1zsHXDX+Q==	2020-04-18 20:37:00.157795
124	3qj2igjahyvbg7wy57h9lynnpmt3	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	610699	DWNjXjkgSo83drCeUHud3g==	2020-04-18 20:37:00.191748
125	ha4brlqedfmnhb7tu3igg14p3xh3	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	570416	gCxqeoJpCX6lXaI3uO7/6Q==	2020-04-18 20:37:00.228574
126	9q2kz1b814qqimz7h84pq27pua0e	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	616289	Hr0ihn6O/+MsSG4EGdrW9A==	2020-04-18 20:37:00.263284
127	6zhp9hljv9uoy9nmupt50w2atg8e	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	566715	ZQ8QHbAWcMis6vHpnvspVw==	2020-04-18 20:37:00.300197
128	c4rc2nzn18ec84iphj0i44tr2xb7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	610169	cvMZ3V9K90GhPLd1WWntag==	2020-04-18 20:37:00.338504
129	19pgefvvjd8yy8xt8q1d83940uyg	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	616289	Hr0ihn6O/+MsSG4EGdrW9A==	2020-04-18 20:37:00.371491
130	h4ul560cn2aplsx1jodcj074m4q0	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	553562	LjHYghrNlQk6+QBo1JaJdg==	2020-04-18 20:37:00.414435
131	2maypsu48yw4jyc2u6cu3nqbxev9	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	608710	m9OJTf5CacmXDZ3zaqkarw==	2020-04-18 20:37:00.452615
132	cjira8h8tz2zerx0wnkcl7f2j4hi	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	588304	eW+aYKmtN3TDJ+p8MJsXtw==	2020-04-18 20:37:00.487975
133	povcoco1psvrjvw0agwunye6ny2c	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	577345	Uqne62zzitG/Dx5AK39gXw==	2020-04-18 20:37:00.52641
134	u23fga4u6sf76mdmqp3qswcx4276	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	596028	wJrqriM/JV8t18yXVH3+pw==	2020-04-18 20:37:00.560541
135	r2wdm7glmvtqnnpirjg8x73oshm9	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	627896	Gsawh0v71Fgccj3laiueGA==	2020-04-18 20:37:00.593073
136	llo2o0ap8lyybddw4qkq3qbivs5e	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	563383	o8Z6o7/Oqqx3YUHeO6f0eQ==	2020-04-18 20:37:00.631374
137	okpqh40idtw06953s0t5ekq8a3tm	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	529108	7DwjmBfJcf8ufwhqTU9pdQ==	2020-04-18 20:37:00.66605
138	zakucmjelizsgryankbwwwvc6bzy	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	560632	47whB847mG1Xw/13iNqPaA==	2020-04-18 20:37:00.700773
139	ut602xy1cjqojejo0mmsuru9pc6z	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	613816	u0S/aBwBAxWZAcdBN+ahEA==	2020-04-18 20:37:00.738416
140	yfr2mbnnvu4crvzrvzuwlcozdyoq	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	577345	Uqne62zzitG/Dx5AK39gXw==	2020-04-18 20:37:00.772772
141	vzwnmqbajn2jw1ltl7o2tfptclag	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	535791	ZQZEDnB0cXY98Te1zpWicw==	2020-04-18 20:37:00.814345
142	cqt0pjpnqa622ylnj3ihumzb2y8n	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552298	L5oscuHE3hbhKmqLCbfQXw==	2020-04-18 20:37:00.848045
143	1opln8evi4w0xat62qj734o744ug	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	610101	ggj3KKJxRbtEVdsZIJeHFA==	2020-04-18 20:37:00.882723
144	ew7r9v2qhpcg9izmyaij3spv5ose	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	613715	2UDtK81It658Hd3J30ZcEg==	2020-04-18 20:37:00.924839
145	8ekdzqrw259a4lzy9h1ej4s3fu1h	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	541176	rHPc1tf6fLxNWfwTKwBeHA==	2020-04-18 20:37:00.960495
146	8051b5y2gcgh2hwwu4ionrlvb7aj	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	559677	gS50BjR2RJNDNM2gzQHuzg==	2020-04-18 20:37:00.993665
147	x1324fx7gvcqb2uykhqy4bj2f86w	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	529981	jtXSrfI81RtSyp+TqyNzBw==	2020-04-18 20:37:01.047631
148	3w4h4or8kosvag9q2aihny6x33zb	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	634513	2Wwd3qlE92kMEE7XWHk5kA==	2020-04-18 20:37:01.079678
149	pkzzz75tuuk2hkdpzdpaenezkep6	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	515135	G4eOKA5MiBbK+0m2BDa/Xw==	2020-04-18 20:37:01.121532
150	uss2r0n2afhumn84qjjjez4b8670	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	554910	UQxRG6QpQ525F7cJyJ0eaw==	2020-04-18 20:37:01.154444
151	7tdd4328dzuhep1ztlxswtv1sz9n	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552416	+/UnGslR9gOO8ZlA6OdPXw==	2020-04-18 20:37:01.188459
152	nvaiej7twhog0gvaeojtmj7jnfu5	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	593002	gvakYb81aSRjCSDG4Z6CUw==	2020-04-18 20:37:01.227466
153	70xrzj0xykfgjunmhdwnsnpflh2x	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	571869	z4wkoPTA/M9iccjfcRpTtA==	2020-04-18 20:37:01.262574
154	8bcf6v6gbt4e50zwlqpctbitw0th	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	655773	cxvFeMSviZVFmAXt9b+egQ==	2020-04-18 20:37:01.296928
155	2h090t187i9d1db1irt6inwxo9df	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	502006	N2J86WBfS0Ity6nADpjCUQ==	2020-04-18 20:37:01.336107
156	uq1qkoic73tk5af7znmqwbbzk10q	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	606075	P7Y5rH+YgEqGt9Q7WcJBrQ==	2020-04-18 20:37:01.379096
157	lsl98lap7tyctjmtcpoh65l4sg5r	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	561676	zipDRjChYUNdviK/aU316Q==	2020-04-18 20:37:01.424034
158	052g1iq7w747983wi2rzp5z2gids	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	595316	HZlxeSxvUZUC6MeWomZgEQ==	2020-04-18 20:37:01.464054
159	nc8akjucsef03pqftetelw9uc4vq	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	472078	4hQysGo1e7KBBo/83kDulQ==	2020-04-18 20:37:01.496527
160	afh562kmawcosfoyo4skzn627ewh	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	522109	l3yna27m9zi0MIVzzlfxWg==	2020-04-18 20:37:01.536766
161	p7yapegsrnfw4qmzrakejockkp0f	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	571869	z4wkoPTA/M9iccjfcRpTtA==	2020-04-18 20:37:01.572597
162	vrbb87b2a2ypguxc9v29liidmfxe	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	572585	ugug1HLeFfiqfkMIcqPySg==	2020-04-18 20:37:01.61502
163	k68gvbqpacez4skr4f1d522tzjww	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	591059	kLQ1zcq7aKkrF2v1a1QllQ==	2020-04-18 20:37:01.652656
164	cumljk0bxuhvwm0n07ytof7jz0bf	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	533756	hLQPYj3GWZzisAJrfFSSgw==	2020-04-18 20:37:01.694803
165	rrnb50tkrsbzbpp7csmjr78z7n4i	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	515135	G4eOKA5MiBbK+0m2BDa/Xw==	2020-04-18 20:37:01.739549
166	k5eurev6pdkebw9eh6a9v67xe8ve	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	481385	+B3xnp+/TiHyp9KwAeUXDw==	2020-04-18 20:37:01.775043
167	kp3o2pugrrmfbcx1p00mcj03wapl	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	592797	G/aChbkDYPhvsCNYTcMQzg==	2020-04-18 20:37:01.819322
168	t4td7mbba24qm6xxwce7vaht2hii	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	587872	eEhluj6EO5CwrvNv+iDt3A==	2020-04-18 20:37:01.860709
169	75h17e6u12v5otftwmqejvmf5oew	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552380	NFWBkVyPshvUe6dKCfikrg==	2020-04-18 20:37:01.892983
170	4jcuweqevuzfuoch57drwr3euukc	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	535791	ZQZEDnB0cXY98Te1zpWicw==	2020-04-18 20:37:01.936648
171	j1kqcnha6rm0jhefpjuv2mir65s3	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	526936	4yjH89A5bHEsX8NgBM25Xg==	2020-04-18 20:37:01.985461
172	shgovplq3qpp8asmu816qnmmuim6	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	572507	wjPfp3siObtRLQbAHklsbQ==	2020-04-18 20:37:02.035221
173	9fq3xlexhlarmqssxqqp1qqbu7v2	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	571212	vifTFbHVaTcCcCApgxDw9w==	2020-04-18 20:37:02.068844
174	ddmd2ffcl8myutap7w30bp8xbbh5	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	498621	tSGeWueipI1AHHBl+7eQVg==	2020-04-18 20:37:02.114034
175	f072k1u2ftr7wj000kvfmfwywrax	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	464374	OnInhw5UV3OetB8KCzmZ6g==	2020-04-18 20:37:02.151395
176	l5h54ty9l1g1oxwn2o6qzamogkkf	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	600491	nX27ZsQFqWswoabME9OEfQ==	2020-04-18 20:37:02.185395
177	puejvz643l0ih1vs6m0qimqjjzru	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	515247	iAsL5LUaK9cZ2Q139/NTIA==	2020-04-18 20:37:02.22683
178	ezwcnrwme11dni3d4trvan35xygo	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	531564	D14nidpSjZdh6RyPgMDm7g==	2020-04-18 20:37:02.262251
179	jmyfozrvp2uwyytiz7q9bhnnp3wg	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	497385	TDSVbz6X+JBbEUaBEmYckQ==	2020-04-18 20:37:02.2944
180	dx4eou0np7h7t41rwoqjnklz3e4y	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	572023	Alg06bTI6FYRTFTxpTOoAQ==	2020-04-18 20:37:02.340083
181	dtmi8l4ft8uwunmxij0hpq4bwcdp	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	657834	KYhYBNw60y3WDf9lf4/xXw==	2020-04-18 20:37:02.374785
182	nc5mlz5wrk6c48kp9gg3p0wtq2bx	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	609847	bKgAFfkweypjmcEPpkYlwQ==	2020-04-18 20:37:02.414765
183	ifbkbcuep83gjdzim4oksf5gc4h5	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	590254	JTkfXh+uIIXe+7U7F82kcQ==	2020-04-18 20:37:02.458824
185	r23jl04c3ugedk1qgfuudh1wgkak	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	582168	CsiLlO7ijJbi3sY7IdjMxw==	2020-04-18 20:37:02.541525
186	bco43bp8tsfdukkd40is9f2g1g8o	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	519842	3QlBFn3fZLv18LY3SeAH4g==	2020-04-18 20:37:02.575673
187	yiv45wn7j9vz5ddsi0cnbq3zi3rs	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	600320	AT0bX2jIwzbCBLZLGQRZng==	2020-04-18 20:37:02.615131
188	5411zlv9smn8rx924qhksaywshpp	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	504332	+ifg8GgFqsad3oOLvLCFUg==	2020-04-18 20:37:02.652864
189	z7amzoeaj5uaj7uzvsbxwrty0u5g	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	553317	IiPEYsFsimr9l9F4d8UNhg==	2020-04-18 20:37:02.684678
190	13sg4clrljngbzqb6084rvnua6ur	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	561342	E5M/EGBiqdlak9TkyiSW4Q==	2020-04-18 20:37:02.725422
191	73q2mc2orr4h4ip7cknn3pxyhrp2	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	472078	4hQysGo1e7KBBo/83kDulQ==	2020-04-18 20:37:02.763341
192	ahh9kjq7gi9z7th8w9e71jdsftpw	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	546483	AUc16+4jZy1HrCUhudMc0A==	2020-04-18 20:37:02.797737
193	l8481k6vflsjjb8hgus8lo0eq9qc	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	492448	FSsGFB7MGdKTO+uXWHWsew==	2020-04-18 20:37:02.84235
194	sbdyvv9dkz293buw288w8rg2vy5u	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	504619	HyLTosDSVVaxudQ5eTIdpw==	2020-04-18 20:37:02.881055
195	hqcf3138az5ih56cyqpig7ri6gwp	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	546596	iPbnGuHluHPFKzi3hoNdAA==	2020-04-18 20:37:02.924431
196	bww50hp07j95j2w4rytmefji22m0	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	600320	AT0bX2jIwzbCBLZLGQRZng==	2020-04-18 20:37:02.974546
197	qb6r7j67fjt3s1jvj2enamwt8xe1	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	519842	3QlBFn3fZLv18LY3SeAH4g==	2020-04-18 20:37:03.039188
198	ndc78b3k1z185q7jxmkxa6wxaahi	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	544745	PnU3TDHYjRqVMhig9MxxsQ==	2020-04-18 20:37:03.072377
199	rkjt1htwrohbknwdp9g2tj6sc3mu	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	550286	3jlJiT08F4eLXG+awFER5A==	2020-04-18 20:37:03.118293
200	330zoszzuh3k7ejnlx2wc2dmoe3x	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	628142	I6OAVAHyuOnsWU2pLep+QA==	2020-04-18 20:37:03.166897
201	1o7redmece9jbu1tt6bbj9xwudal	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	542993	+FU6fJD30xv1tNxf39lJBA==	2020-04-18 20:37:03.218578
202	kkng6frpvmi8wm0krdenmxp1yl11	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	571869	z4wkoPTA/M9iccjfcRpTtA==	2020-04-18 20:37:03.261092
203	1nzjeeepjibzl4m2u8ysddcuht4s	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	472078	4hQysGo1e7KBBo/83kDulQ==	2020-04-18 20:37:03.310068
204	69ehu6aqy9lhro4a602f7ju3ud5f	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	472225	WOOQ6Xpi9sE64QCWmoykzA==	2020-04-18 20:37:03.367308
205	038uwgm1kbgqkbk6kmcrirck1xti	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	538259	jByDfqkaEefmS05IA+XMIQ==	2020-04-18 20:37:03.414555
206	683iior9r64facw0120i8zzt4bpo	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	617366	i9UU9TF672hUQkLM4NucAg==	2020-04-18 20:37:03.46078
207	svesm5zureqav44u45sk5lhb0s8y	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	582668	D4jBfv4wdzcCxR0Hby/aGA==	2020-04-18 20:37:03.50528
208	s5ifl6tw87q35wultc7u9z6xgx7g	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	519842	3QlBFn3fZLv18LY3SeAH4g==	2020-04-18 20:37:03.579459
209	413gowku8bx39xehobqift6kzume	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	609031	4f3RHHhdqQXZopa//BB1Zw==	2020-04-18 20:37:03.628857
210	475brplqtfiwts6x213b29fojl38	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	625374	9PcBWhRQ1kP5LtAQVIF4/A==	2020-04-18 20:37:03.677867
211	i01dx1gksrf0tvj9j86r8yzlvlnh	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	589736	+VMc5ozirJl2iKZ2zOhqvg==	2020-04-18 20:37:03.72663
212	2mpxqncvad3infruwsq17vxbbn78	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	411624	HWPDeAbFIJ9VSwnQINpR8g==	2020-04-18 20:37:03.773695
213	itld66qfpcc7v28zjxmnrzhdmodn	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	478351	+pk4yZW9oXMH7KtGQo/LtQ==	2020-04-18 20:37:03.816521
214	p1r2x1qevzx2f8xoh19hno6melcs	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552486	u29/3KnStfym5nCdZ0dgkQ==	2020-04-18 20:37:03.860696
215	ej1ojjtozgu16xc06g5flc83borg	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552486	u29/3KnStfym5nCdZ0dgkQ==	2020-04-18 20:37:03.898021
216	x792sf9808rfc8t67v7hr5t8j1wo	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	469479	5caJHhKPBHz9FsIGAVoIhA==	2020-04-18 20:37:03.946329
217	75rhncs0xzqhq3fjaq8ng5dsavqm	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	536056	4VbQ8xHpQpOKuG++4tvrdA==	2020-04-18 20:37:03.990789
218	gm1k54132oy3c7ik6g0a9m6cyars	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	597295	EEMDEIYcPc4PEcxkzQJPKQ==	2020-04-18 20:37:04.038621
219	beqgh8a93p99kz0jwxvpun4ozb1j	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	550934	DL7iZ/kbx2UtZJEAFYjpgA==	2020-04-18 20:37:04.086042
220	jikn088uv52aahziuhx4wkaulnfp	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	603763	TXmNPRSSFkXjl3wiyOU49g==	2020-04-18 20:37:04.154823
221	uj5kfi574162phhqo9h01d1gu1zk	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	578311	hBEOwAVk0xWr4OKiPR9j/w==	2020-04-18 20:37:04.202005
222	qwfxy979gpehr3890cec328fto7b	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	562314	Dy1tYbHDYHvkuS5QXer2bQ==	2020-04-18 20:37:04.248601
224	z8kpibpl6ghihpwtk965sbz0r9y6	photo.jpg	image/jpeg	{"identified":true}	559787	6u0kI7pPzkfssbnbKI85og==	2020-04-18 20:37:04.343688
223	01nt181065tu4w4gqum3dc2xkt02	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	632161	zDH4+DUK+aQgecxF66Nt6A==	2020-04-18 20:37:04.296588
225	66tkapd2v566ggh3ebc9qgf4kib7	photo.jpg	image/jpeg	{"identified":true}	429829	c/3YtapllMupCNzrwsugPA==	2020-04-18 20:37:04.385608
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-04-16 09:10:26.289344	2020-04-16 09:10:26.289344
schema_sha1	196eee803fbc0fc5bc06a8363366774b589e5009	2020-04-16 09:10:26.294594	2020-04-16 09:10:26.294594
\.


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.areas (id, name, created_at, updated_at) FROM stdin;
1	Rocher Canon	2020-04-19 08:38:02.298542	2020-04-19 08:38:02.298542
2	Cul de Chien	2020-05-07 12:15:31.368298	2020-05-07 12:15:31.368298
\.


--
-- Data for Name: boulders; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.boulders (id, polygon, created_at, updated_at, area_id) FROM stdin;
205	0103000020E610000001000000050000002E724F57774C05403012DA722E3B4840E412471E884C05405F96766A2E3B4840EACF7EA4884C05403CF4DDAD2C3B4840342F87DD774C05403CF4DDAD2C3B48402E724F57774C05403012DA722E3B4840	2020-04-16 20:02:34.237974	2020-04-16 20:02:34.237974	1
206	0103000020E61000000100000005000000062FFA0AD24C0540A60EF27A303B48408EE733A0DE4C05406ADC9BDF303B484017A06D35EB4C0540F3AB3940303B48409961A3ACDF4C05402FDE8FDB2F3B4840062FFA0AD24C0540A60EF27A303B4840	2020-04-16 20:02:34.240121	2020-04-16 20:02:34.240121	1
207	0103000020E61000000100000007000000D2FD9C82FC4C0540D42AFA43333B484000E65AB4004D0540DFA46950343B4840DE3D40F7E54C05406DFDF49F353B484055850662D94C0540FC89CA86353B484055850662D94C05402D42B115343B48404A4563EDEF4C05407522C154333B4840D2FD9C82FC4C0540D42AFA43333B4840	2020-04-16 20:02:34.24215	2020-04-16 20:02:34.24215	1
208	0103000020E61000000100000005000000598638D6C54D0540B003E78C283B48403718EAB0C24D05408BF9B9A1293B48401570CFF3A74D05401A868F88293B4840C5538F34B84D0540DF878384283B4840598638D6C54D0540B003E78C283B4840	2020-04-16 20:02:34.243889	2020-04-16 20:02:34.243889	1
209	0103000020E610000001000000050000004206F2ECF24D0540AFCF9CF5293B48405303CDE7DC4D05402043C70E2A3B4840261B0FB6D84D0540217711A6283B48402B1213D4F04D05400F0C207C283B48404206F2ECF24D0540AFCF9CF5293B4840	2020-04-16 20:02:34.245774	2020-04-16 20:02:34.245774	1
210	0103000020E61000000100000005000000C6C4E6E3DA5005403788D68A363B4840041E1840F850054049F3C7B4363B48401B12F758FA50054032CB9E04363B48400F5EBBB4E150054091D3D7F3353B4840C6C4E6E3DA5005403788D68A363B4840	2020-04-16 20:02:34.247643	2020-04-16 20:02:34.247643	1
211	0103000020E610000001000000050000007F69519FE44E054046B58828263B48400D198F52094F0540F35A09DD253B484068E90AB6114F0540A4897780273B48400DDFC2BAF14E0540094FE8F5273B48407F69519FE44E054046B58828263B4840	2020-04-16 20:02:34.249541	2020-04-16 20:02:34.249541	1
212	0103000020E610000001000000050000007BDCB75A274E05401ADD41EC4C3B484009DE9046054E0540C19140834D3B4840A88AA9F4134E05404FEACBD24E3B4840C5758C2B2E4E0540DE76A1B94E3B48407BDCB75A274E05401ADD41EC4C3B4840	2020-04-16 20:02:34.251674	2020-04-16 20:02:34.251674	1
213	0103000020E61000000100000005000000D8F4A0A0144D0540DAE731CA333B4840F46BEBA7FF4C054075560BEC313B4840C7BDF90D134D054022FC8BA0313B4840DDEBA4BE2C4D054098F8A3A8333B4840D8F4A0A0144D0540DAE731CA333B4840	2020-04-16 20:02:34.253725	2020-04-16 20:02:34.253725	1
214	0103000020E6100000010000000600000068757286E24E0540EB353D28283B4840DAFF006BD54E0540289CDD5A263B4840DB8B683BA64E05407BF65CA6263B484096E99788B74E0540863C821B293B4840A794D74AE84E0540A4552DE9283B484068757286E24E0540EB353D28283B4840	2020-04-16 20:02:34.255624	2020-04-16 20:02:34.255624	1
215	0103000020E610000001000000050000006901DA56B34E0540B16B7BBB253B48403596B036C64E05409F008A91253B484013286211C34E0540F94B8BFA243B484041D653ABAF4E0540DB32E02C253B48406901DA56B34E0540B16B7BBB253B4840	2020-04-16 20:02:34.257335	2020-04-16 20:02:34.257335	1
216	0103000020E61000000100000006000000029F1F46084F0540EACDA8F92A3B48406E6C76A4FA4E0540A9DE1AD82A3B48408A1D8D43FD4E0540F0BE2A172A3B4840240D6E6B0B4F0540AFCF9CF5293B48407920B248134F0540B58CD47B2A3B4840029F1F46084F0540EACDA8F92A3B4840	2020-04-16 20:02:34.259246	2020-04-16 20:02:34.259246	1
217	0103000020E61000000100000007000000BDAAB35A604F054070CD1DFD2F3B48403FE08101844F0540EEEE01BA2F3B48400C7558E1964F054012F92EA52E3B4840B727486C774F05402A55A2EC2D3B4840A6F0A0D9754F054053E8BCC62E3B484062DA37F7574F054017B6662B2F3B4840BDAAB35A604F054070CD1DFD2F3B4840	2020-04-16 20:02:34.261134	2020-04-16 20:02:34.261134	1
218	0103000020E610000001000000060000008ACBF10A444F0540A185048C2E3B4840DFDE35E84B4F0540246420CF2E3B484040A6B5696C4F05403012DA722E3B484051DD5CFC6D4F054018EAB0C22D3B4840D95BCAF9624F054036035C902D3B48408ACBF10A444F0540A185048C2E3B4840	2020-04-16 20:02:34.262859	2020-04-16 20:02:34.262859	1
219	0103000020E6100000010000000B0000007F17B6662B4F0540F513CE6E2D3B4840ACFF73982F4F054018EAB0C22D3B48400D8D2782384F05405AD93EE42D3B48407E5182FE424F054018EAB0C22D3B4840D464C6DB4A4F054036035C902D3B4840EA58A5F44C4F054042B115342D3B4840CEA78E554A4F05401FDB32E02C3B484062A06B5F404F05407EE36BCF2C3B4840F0DB10E3354F05407EE36BCF2C3B484084D4EDEC2B4F054060CAC0012D3B48407F17B6662B4F0540F513CE6E2D3B4840	2020-04-16 20:02:34.264547	2020-04-16 20:02:34.264547	1
220	0103000020E610000001000000050000006C2409C215500540C9B08A37323B4840D865F84F37500540C9B08A37323B48405B61FA5E4350054063B7CF2A333B4840D26EF4311F500540B6114F76333B48406C2409C215500540C9B08A37323B4840	2020-04-16 20:02:34.266242	2020-04-16 20:02:34.266242	1
221	0103000020E6100000010000000500000093E52494BE5005403788D68A363B484076FA415DA45005407F349C32373B4840E2016553AE500540556D37C1373B4840EEB5A0F7C65005407F349C32373B484093E52494BE5005403788D68A363B4840	2020-04-16 20:02:34.267898	2020-04-16 20:02:34.267898	1
222	0103000020E61000000100000008000000DDD0949D7E5005404A27124C353B4840C6DCB5847C500540C748F608353B484038A1100187500540B5DD04DF343B4840BB9C121093500540446ADAC5343B4840DD0A613596500540D9B3E732353B484060CC96AC8A500540FC89CA86353B4840FF3EE3C281500540FC89CA86353B4840DDD0949D7E5005404A27124C353B4840	2020-04-16 20:02:34.270862	2020-04-16 20:02:34.270862	1
223	0103000020E610000001000000050000006BBA9EE8BA5005400D8D2782383B4840D13E56F0DB50054025E99AC9373B4840A3906456EF5005400D8D2782383B4840EEB5A0F7C65005401807978E393B48406BBA9EE8BA5005400D8D2782383B4840	2020-04-16 20:02:34.272674	2020-04-16 20:02:34.272674	1
224	0103000020E6100000010000000700000051A39064564F0540555051F52B3B484040321D3A3D4F0540A9DE1AD82A3B4840D464C6DB4A4F0540B58CD47B2A3B484062DA37F7574F0540C6F7C5A52A3B4840A6B6D4415E4F0540BA490C022B3B48407E8B4E965A4F0540E4DC26DC2B3B484051A39064564F0540555051F52B3B4840	2020-04-16 20:02:34.274338	2020-04-16 20:02:34.274338	1
225	0103000020E6100000010000000700000025034015374E054042B115342D3B48400395F1EF334E054066BB421F2C3B48404DF4F928234E0540A8AAD0402C3B4840E1ECD632194E05407235B22B2D3B484091D09673294E054078F2E9B12D3B484025034015374E0540950B957F2D3B484025034015374E054042B115342D3B4840	2020-04-16 20:02:34.276065	2020-04-16 20:02:34.276065	1
226	0103000020E610000001000000070000009CF86A47714E0540DA38622D3E3B484036AE7FD7674E05406F826F9A3E3B48405E9F39EB534E05405D177E703E3B48409D84D217424E05405726FC523F3B4840E6577380604E05401503249A403B4840853E58C6864E054045BB0A293F3B48409CF86A47714E0540DA38622D3E3B4840	2020-04-16 20:02:34.277785	2020-04-16 20:02:34.277785	1
227	0103000020E610000001000000060000006F9C14E63D4E05408D9B1A683E3B4840FD4B5299624E054087DEE2E13D3B4840B96FB54E5C4E05402219726C3D3B4840C4AF58C3454E05409F3A56293D3B48406422A5D93C4E05406308008E3D3B48406F9C14E63D4E05408D9B1A683E3B4840	2020-04-16 20:02:34.279527	2020-04-16 20:02:34.279527	1
228	0103000020E6100000010000000500000006A051BAF44F054001DF6DDE383B4840C7BAB88D065005401FF818AC383B48401711C5E40D500540F530B43A393B484033880FECF84F05401807978E393B484006A051BAF44F054001DF6DDE383B4840	2020-04-16 20:02:34.281182	2020-04-16 20:02:34.281182	1
229	0103000020E61000000100000005000000944F8F6D195005403CDD79E2393B48400057B26323500540FAEDEBC0393B48402D3F7095275005401EC4CE143A3B4840AA436E861B50054000AB23473A3B4840944F8F6D195005403CDD79E2393B4840	2020-04-16 20:02:34.282899	2020-04-16 20:02:34.282899	1
230	0103000020E610000001000000050000005BED612F14500540419AB1683A3B4840AA436E861B500540F4FC69A33A3B48406C2409C21550054077DB85E63A3B48401711C5E40D500540F4FC69A33A3B48405BED612F14500540419AB1683A3B4840	2020-04-16 20:02:34.284758	2020-04-16 20:02:34.284758	1
231	0103000020E6100000010000000500000066A19DD32C5005405FB35C363A3B48408ECC237F305005409BE5B2D1393B4840FAD346753A5005401EC4CE143A3B4840CCEB884336500540419AB1683A3B484066A19DD32C5005405FB35C363A3B4840	2020-04-16 20:02:34.286963	2020-04-16 20:02:34.286963	1
232	0103000020E61000000100000007000000DDD0949D7E5005403BA92F4B3B3B48401B2AC6F99B500540A06EA0C03B3B484093718C648F50054010AE80423D3B4840EE073C30805005402EC72B103D3B4840276A696E8550054046239F573C3B484088BD50C07650054052D158FB3B3B4840DDD0949D7E5005403BA92F4B3B3B4840	2020-04-16 20:02:34.288708	2020-04-16 20:02:34.288708	1
233	0103000020E61000000100000005000000357EE195244F0540B7627FD93D3B48409B02999D454F05407C6473D53C3B4840B130444E5F4F0540B7627FD93D3B48400D8D2782384F0540F2608BDD3E3B4840357EE195244F0540B7627FD93D3B4840	2020-04-16 20:02:34.290375	2020-04-16 20:02:34.290375	1
234	0103000020E610000001000000050000004C50C3B7B04E0540E57E87A2403B48403B8DB454DE4E0540E6B2D1393F3B4840F624B039074F0540E57E87A2403B48405DC136E2C94E054073D712F2413B48404C50C3B7B04E0540E57E87A2403B4840	2020-04-16 20:02:34.292004	2020-04-16 20:02:34.292004	1
235	0103000020E61000000100000005000000734BAB21714F05403A75E5B33C3B484018B5FB55804F0540E71A66683C3B48404B5AF10D854F05407C6473D53C3B4840ACADD85F764F0540CFBEF2203D3B4840734BAB21714F05403A75E5B33C3B4840	2020-04-16 20:02:34.29394	2020-04-16 20:02:34.29394	1
236	0103000020E610000001000000070000007E737FF5B84F0540EB3BBF28413B4840AB9509BFD44F0540A38FF980403B48406CB07092E64F054062A06B5F403B4840D3FA5B02F04F054038D906EE403B4840DE3AFF76D94F0540F0F8F6AE413B4840BC92E4B9BE4F0540F0F8F6AE413B48407E737FF5B84F0540EB3BBF28413B4840	2020-04-16 20:02:34.295603	2020-04-16 20:02:34.295603	1
237	0103000020E610000001000000070000003C6BB75D684E05403E963E74413B4840317DAF21384E05401AC05B20413B4840A8C4758C2B4E0540AED51EF6423B484075594C6C3E4E0540840EBA84433B48400E492D944C4E0540A818E76F423B4840525F96766A4E0540F6B52E35423B48403C6BB75D684E05403E963E74413B4840	2020-04-16 20:02:34.297267	2020-04-16 20:02:34.297267	1
238	0103000020E6100000010000000A000000B3B27DC85B4E05400DDE57E5423B4840147AFD497C4E05407E5182FE423B4840AD69DE718A4E0540C6FD47A6433B48408BC1C3B46F4E0540FB3E1C24443B4840A2B5A2CD714E0540EF906280443B4840A8380EBC5A4E054083DA6FED443B48400E492D944C4E054042EBE1CB443B4840ECDADE6E494E0540B94F8E02443B48401AC39CA04D4E054072A3C85A433B4840B3B27DC85B4E05400DDE57E5423B4840	2020-04-16 20:02:34.298841	2020-04-16 20:02:34.298841	1
239	0103000020E61000000100000005000000BFF2203D454E054068AED3484B3B4840F7C8E6AA794E0540DA5548F9493B4840C4E9245B5D4E05407C8159A1483B4840CA32C4B12E4E05407B4D0F0A4A3B4840BFF2203D454E054068AED3484B3B4840	2020-04-16 20:02:34.300494	2020-04-16 20:02:34.300494	1
240	0103000020E61000000100000008000000800D8810574E0540A96917D34C3B4840F1457BBC904E05405743E21E4B3B4840FDF9B660A94E05403239B5334C3B4840FD851E317A4E05403EB324404D3B4840804754A86E4E0540618907944D3B4840AD2F12DA724E0540F6D214014E3B48403C6BB75D684E054037C2A2224E3B4840800D8810574E0540A96917D34C3B4840	2020-04-16 20:02:34.302185	2020-04-16 20:02:34.302185	1
241	0103000020E6100000010000000900000058CA32C4B14E0540910DA48B4D3B484013286211C34E0540A3ACDF4C4C3B48402A560DC2DC4E0540DFDE35E84B3B48406E32AA0CE34E054021CEC3094C3B484035D07CCEDD4E05407FA2B2614D3B48407F2F8507CD4E0540618907944D3B48401FA2D11DC44E054019A9F7544E3B4840747B4963B44E0540F6D214014E3B484058CA32C4B14E0540910DA48B4D3B4840	2020-04-16 20:02:34.303839	2020-04-16 20:02:34.303839	1
242	0103000020E610000001000000050000002B6EDC627E4E0540B96C74CE4F3B484085B2F0F5B54E0540AEF204C24E3B4840B891B245D24E0540ADBEBA2A503B4840C45DBD8A8C4E0540F46A80D2503B48402B6EDC627E4E0540B96C74CE4F3B4840	2020-04-16 20:02:34.305586	2020-04-16 20:02:34.305586	1
243	0103000020E6100000010000000600000070067FBF984D05401D90847D3B3B4840DC476E4DBA4D054011E2CAD93B3B48408C2B2E8ECA4D05408F37F92D3A3B484043588D25AC4D05401807978E393B484049DBF813954D0540D026874F3A3B484070067FBF984D05401D90847D3B3B4840	2020-04-16 20:02:34.307485	2020-04-16 20:02:34.307485	1
244	0103000020E61000000100000005000000643A747ADE4D0540643C4A253C3B4840F86C1D1CEC4D054083893F8A3A3B4840D07B6308004E05402481069B3A3B4840E1B20A9B014E054052D158FB3B3B4840643A747ADE4D0540643C4A253C3B4840	2020-04-16 20:02:34.309198	2020-04-16 20:02:34.309198	1
245	0103000020E61000000100000005000000F419506F464D05403D62F4DC423B4840D2E5CDE15A4D0540558A1D8D433B484082035ABA824D0540D89C8367423B4840BBF1EEC8584D0540F0F8F6AE413B4840F419506F464D05403D62F4DC423B4840	2020-04-16 20:02:34.310842	2020-04-16 20:02:34.310842	1
246	0103000020E61000000100000007000000EE224C512E4D05402BF702B3423B484005DD5ED2184D0540A1F31ABB443B4840E9F17B9BFE4C054095456117453B4840772D211FF44C05403C2EAA45443B484055F99E91084D054055BE6724423B48404F7633A31F4D0540F6B52E35423B4840EE224C512E4D05402BF702B3423B4840	2020-04-16 20:02:34.312643	2020-04-16 20:02:34.312643	1
247	0103000020E6100000010000000600000049DBF813954D054024D236FE443B48400A302C7FBE4D0540C5C9FD0E453B484070404B57B04D0540AD6D8AC7453B484087342A70B24D05409ACE4E06473B484032E719FB924D0540CA52EBFD463B484049DBF813954D054024D236FE443B4840	2020-04-16 20:02:34.314637	2020-04-16 20:02:34.314637	1
248	0103000020E610000001000000050000000B0E2F88484D0540C782C2A04C3B4840CC6262F3714D054032056B9C4D3B4840BA6587F8874D0540E59B6D6E4C3B4840B534B742584D0540392A37514B3B48400B0E2F88484D0540C782C2A04C3B4840	2020-04-16 20:02:34.316481	2020-04-16 20:02:34.316481	1
249	0103000020E610000001000000070000002A90D959F44E054018B0E42A163B484057EC2FBB274F054036C98FF8153B4840950B957F2D4F0540A27F828B153B4840950B957F2D4F054019E42EC2143B4840B24813EF004F05408A5759DB143B4840026553AEF04E05400D36751E153B48402A90D959F44E054018B0E42A163B4840	2020-04-16 20:02:34.318297	2020-04-16 20:02:34.318297	1
250	0103000020E6100000010000000600000095B9F946744F0540EEB43522183B4840897956D28A4F0540174850FC183B484034A0DE8C9A4F054047CCECF3183B48403F1A4E999B4F0540D68C0C72173B4840346612F5824F054053AEF02E173B484095B9F946744F0540EEB43522183B4840	2020-04-16 20:02:34.320189	2020-04-16 20:02:34.320189	1
251	0103000020E6100000010000000500000050172994854F0540BF64E3C1163B48403F541A31B34F0540E23AC615173B484034DAAA24B24F0540664D2CF0153B48405C9198A0864F0540245E9ECE153B484050172994854F0540BF64E3C1163B4840	2020-04-16 20:02:34.32213	2020-04-16 20:02:34.32213	1
252	0103000020E61000000100000006000000848252B4724F05408466D7BD153B484068976F7D584F0540A87004A9143B48408ACBF10A444F05404277499C153B4840BDAAB35A604F05409B8E006E163B4840734BAB21714F0540FB96395D163B4840848252B4724F05408466D7BD153B4840	2020-04-16 20:02:34.323883	2020-04-16 20:02:34.323883	1
253	0103000020E61000000100000008000000195932C7F24E05404F594DD7133B48409B5434D6FE4E0540A2B3CC22143B48407FDDE9CE134F0540D237691A143B4840ACC5A700184F05407920B248133B48400D198F52094F054026C632FD123B48405D35CF11F94E0540F6419605133B4840139CFA40F24E0540BB0F406A133B4840195932C7F24E05404F594DD7133B4840	2020-04-16 20:02:34.32556	2020-04-16 20:02:34.32556	1
254	0103000020E6100000010000000700000002F1BA7EC14E05400D36751E153B484013EE9579AB4E0540AE2D3C2F153B48409C6C0377A04E054054E23AC6153B4840A2293BFDA04E05405A9F724C163B4840F1B913ECBF4E0540EEE87FB9163B48408BA9F413CE4E0540245E9ECE153B484002F1BA7EC14E05400D36751E153B4840	2020-04-16 20:02:34.327228	2020-04-16 20:02:34.327228	1
255	0103000020E610000001000000060000000874266DAA4E0540CC46E7FC143B4840EBFCDB65BF4E0540CC46E7FC143B48403596B036C64E0540E4A25A44143B4840747B4963B44E05404F594DD7133B484080BBECD79D4E05409605137F143B48400874266DAA4E0540CC46E7FC143B4840	2020-04-16 20:02:34.328909	2020-04-16 20:02:34.328909	1
256	0103000020E61000000100000005000000026553AEF04E05405EF415A4193B48404C38F4160F4F0540A5A0DB4B1A3B48402ACAA5F10B4F05408D4468041B3B4840B20E4757E94E0540D52478431A3B4840026553AEF04E05405EF415A4193B4840	2020-04-16 20:02:34.33054	2020-04-16 20:02:34.33054	1
257	0103000020E61000000100000005000000D42AFA43334F0540102384471B3B4840739D465A2A4F05408753E6E61B3B4840070ABC934F4F05400FEF39B01C3B484062DA37F7574F0540E65B1FD61B3B4840D42AFA43334F0540102384471B3B4840	2020-04-16 20:02:34.332263	2020-04-16 20:02:34.332263	1
258	0103000020E61000000100000005000000581CCEFC6A4E054012DC48D9223B4840A2293BFDA04E054095BA641C233B4840F17F4754A84E0540247B849A213B48404128EFE3684E054001A5A146213B4840581CCEFC6A4E054012DC48D9223B4840	2020-04-16 20:02:34.333901	2020-04-16 20:02:34.333901	1
259	0103000020E61000000100000006000000973B33C1704E0540EF39B01C213B484075CDE49B6D4E054078094E7D203B4840302B14E97E4E0540B43BA418203B4840F17F4754A84E0540C6A69542203B4840CA54C1A8A44E0540D120054F213B4840973B33C1704E0540EF39B01C213B4840	2020-04-16 20:02:34.33576	2020-04-16 20:02:34.33576	1
260	0103000020E61000000100000005000000A06D35EB8C4F05409065C1C41F3B48404B94BDA59C4F0540E4F38AA71E3B48401D2098A3C74F05409065C1C41F3B48401DE6CB0BB04F0540E97C7896203B4840A06D35EB8C4F05409065C1C41F3B4840	2020-04-16 20:02:34.338504	2020-04-16 20:02:34.338504	1
261	0103000020E61000000100000008000000A5D8D138D44F05409065C1C41F3B48404A0856D5CB4F054067D2A6EA1E3B484000E31934F44F05407380608E1E3B4840397F130A11500540793D98141F3B48407D5BB05417500540C0E95DBC1F3B4840C7BAB88D0650054007962364203B48406CB07092E64F054084B70721203B4840A5D8D138D44F05409065C1C41F3B4840	2020-04-16 20:02:34.340493	2020-04-16 20:02:34.340493	1
262	0103000020E6100000010000000600000061FC34EECD4F05401FBE4C14213B4840BCCCB051D64F05401901158E203B4840ABCFD556EC4F05406C5B94D9203B484094DBF63DEA4F0540E38BF678213B48409A5E622CD34F0540B3075A81213B484061FC34EECD4F05401FBE4C14213B4840	2020-04-16 20:02:34.342592	2020-04-16 20:02:34.342592	1
263	0103000020E61000000100000005000000CB4A9352D04D0540130A1170083B4840B49080D1E54D054073124A5F083B4840A91611C5E44D0540BBF2599E073B4840C0D02346CF4D05401AFB928D073B4840CB4A9352D04D0540130A1170083B4840	2020-04-16 20:02:34.344494	2020-04-16 20:02:34.344494	1
264	0103000020E6100000010000000500000065C6DB4AAF4D05402B323A20093B484021B07268914D0540D7A3703D0A3B48403D9B559FAB4D054000378B170B3B4840315BB22AC24D054054C554FA093B484065C6DB4AAF4D05402B323A20093B4840	2020-04-16 20:02:34.346331	2020-04-16 20:02:34.346331	1
265	0103000020E6100000010000000900000016C26A2C614D0540130A1170083B4840213CDA38624D0540494BE5ED083B48409E7AA4C16D4D05406C21C841093B484082035ABA824D0540FBAD9D28093B48400ABC934F8F4D0540B401D880083B4840EE0A7DB08C4D05401AFB928D073B48404E5E64027E4D0540B5352218073B4840327381CB634D05401AFB928D073B484016C26A2C614D0540130A1170083B4840	2020-04-16 20:02:34.348284	2020-04-16 20:02:34.348284	1
266	0103000020E6100000010000000A0000006DC83F33884F0540634337FB033B484034DAAA24B24F0540338B506C053B484089EDEE01BA4F0540F758FAD0053B484072F90FE9B74F05405070B1A2063B4840D9092FC1A94F054002D369DD063B484001FBE8D4954F0540384888F2053B48402EA9DA6E824F0540FD497CEE043B4840BDE47FF2774F054087191A4F043B484018B5FB55804F0540C24B70EA033B48406DC83F33884F0540634337FB033B4840	2020-04-16 20:02:34.350208	2020-04-16 20:02:34.350208	1
267	0103000020E61000000100000008000000685DA3E5404F054051A4FB39053B4840B7ED7BD45F4F0540F19BC24A053B484029B2D6506A4F0540E5ED08A7053B484067D13B15704F0540CD91955F063B48407311DF89594F054080F44D9A063B48406D1ADB6B414F0540AF78EA91063B48400D8D2782384F054027DD96C8053B4840685DA3E5404F054051A4FB39053B4840	2020-04-16 20:02:34.351984	2020-04-16 20:02:34.351984	1
268	0103000020E6100000010000000D000000E561A1D6344F0540DA73999A043B4840840EBA84434F054069006F81043B484034F279C5534F054034BF9A03043B48405C1D0071574F05405D86FF74033B48404BE658DE554F0540874D64E6023B4840685DA3E5404F0540F9C08EFF023B4840B2BCAB1E304F054058C9C7EE023B4840FC1BB4571F4F054058C9C7EE023B48402F87DD770C4F0540AB23473A033B4840FCE1E7BF074F05406FF1F09E033B4840CE33F6251B4F0540B1E07EC0033B48403A3B191C254F0540E621533E043B4840E561A1D6344F0540DA73999A043B4840	2020-04-16 20:02:34.353716	2020-04-16 20:02:34.353716	1
269	0103000020E610000001000000070000007E8B4E965A4F05409CA56439093B484034A0DE8C9A4F0540D1E638B7093B4840E4839ECDAA4F054013D6C6D8093B48402EE3A6069A4F0540958098840B3B48400DC7F319504F0540E90E62670A3B4840D921FE614B4F0540DD94F25A093B48407E8B4E965A4F05409CA56439093B4840	2020-04-16 20:02:34.355397	2020-04-16 20:02:34.355397	1
270	0103000020E61000000100000008000000D99596917A4F0540E21DE0490B3B484045292158554F0540E21DE0490B3B4840070ABC934F4F0540594E42E90B3B4840D95BCAF9624F05402F87DD770C3B48403A234A7B834F05405F0B7A6F0C3B4840E449D235934F05406BB933130C3B48408F368E588B4F0540F488D1730B3B4840D99596917A4F0540E21DE0490B3B4840	2020-04-16 20:02:34.357152	2020-04-16 20:02:34.357152	1
271	0103000020E61000000100000006000000F0FD0DDAAB4F0540535DC0CB0C3B4840C8D2872EA84F0540EE974F560C3B484034DAAA24B24F0540CAC16C020C3B484094675E0EBB4F05401D1CEC4D0C3B484061C26856B64F0540535DC0CB0C3B4840F0FD0DDAAB4F0540535DC0CB0C3B4840	2020-04-16 20:02:34.358813	2020-04-16 20:02:34.358813	1
272	0103000020E61000000100000007000000E4839ECDAA4F05408D2782380F3B484061889CBE9E4F054069519FE40E3B4840787C7BD7A04F054076FF58880E3B48401DE6CB0BB04F0540058C2E6F0E3B4840C24F1C40BF4F054076FF58880E3B48406D3CD862B74F05401CB4571F0F3B4840E4839ECDAA4F05408D2782380F3B4840	2020-04-16 20:02:34.360475	2020-04-16 20:02:34.360475	1
273	0103000020E6100000010000000B000000CE6DC2BD324F05409A0986730D3B484095456117454F05409A0986730D3B48407311DF89594F05407CF0DAA50D3B4840A0F99CBB5D4F0540522976340E3B48404BE658DE554F054058E6ADBA0E3B4840C8EA56CF494F0540C959D8D30E3B4840EB1ED95C354F0540AB402D060F3B48404B72C0AE264F0540C959D8D30E3B484007962364204F05406494675E0E3B4840357EE195244F05407CF0DAA50D3B4840CE6DC2BD324F05409A0986730D3B4840	2020-04-16 20:02:34.362342	2020-04-16 20:02:34.362342	1
274	0103000020E61000000100000007000000B8054B75014F054012A27C410B3B48403B8DB454DE4E0540D1B2EE1F0B3B48406EF8DD74CB4E0540D7A3703D0A3B48402499D53BDC4E0540A2629CBF093B48405778978BF84E0540D1E638B7093B48402ACAA5F10B4F0540FB7953910A3B4840B8054B75014F054012A27C410B3B4840	2020-04-16 20:02:34.364181	2020-04-16 20:02:34.364181	1
275	0103000020E61000000100000006000000BB7D5699294D0540ACA8C1340C3B4840990F0874264D0540B8567BD80B3B4840B03DB324404D0540240D6E6B0B3B48400B0E2F88484D05409B3DD00A0C3B484021C84109334D054041F2CEA10C3B4840BB7D5699294D0540ACA8C1340C3B4840	2020-04-16 20:02:34.366012	2020-04-16 20:02:34.366012	1
276	0103000020E61000000100000005000000EF74E789E74C05408FC360FE0A3B48406CB3B112F34C05408FC360FE0A3B484066F6798CF24C05402AFEEF880A3B4840F4311F10E84C05402AFEEF880A3B4840EF74E789E74C05408FC360FE0A3B4840	2020-04-16 20:02:34.367984	2020-04-16 20:02:34.367984	1
277	0103000020E6100000010000000700000038BC2022354D0540C4D0EAE40C3B484027BF45274B4D054047AF06280D3B4840FFCD8B135F4D0540B82231410D3B4840FFCD8B135F4D0540CF4A5AF10D3B48407C98BD6C3B4D0540CF4A5AF10D3B484005172B6A304D0540F911BF620D3B484038BC2022354D0540C4D0EAE40C3B4840	2020-04-16 20:02:34.370104	2020-04-16 20:02:34.370104	1
278	0103000020E61000000100000005000000166D8E739B50054026512FF8343B4840E884D0419750054050189469343B48408DEE2076A65005406E313F37343B4840D1CABDC0AC50054026512FF8343B4840166D8E739B50054026512FF8343B4840	2020-04-16 20:02:34.372049	2020-04-16 20:02:34.372049	1
279	0103000020E61000000100000008000000118E59F624500540246420CF2E3B48402882380F27500540486E4DBA2D3B4840CCEB884336500540E3A8DC442D3B4840492A53CC4150054042B115342D3B48407DCF48844650054036035C902D3B4840054EB6813B500540EE224C512E3B48402882380F2750054035CF11F92E3B4840118E59F624500540246420CF2E3B4840	2020-04-16 20:02:34.373905	2020-04-16 20:02:34.373905	1
280	0103000020E61000000100000005000000711B0DE02D500540D27135B22B3B484027BC04A73E500540D27135B22B3B4840492A53CC415005401A5245F12A3B4840556AF6402B500540BA490C022B3B4840711B0DE02D500540D27135B22B3B4840	2020-04-16 20:02:34.3758	2020-04-16 20:02:34.3758	1
281	0103000020E61000000100000005000000F0DB10E3354F05403A24B550323B4840CE6DC2BD324F0540BD361B2B313B48400D535BEA204F0540BD361B2B313B4840357EE195244F05407B134372323B4840F0DB10E3354F05403A24B550323B4840	2020-04-16 20:02:34.377652	2020-04-16 20:02:34.377652	1
282	0103000020E610000001000000060000005D6F9BA9104F0540BD361B2B313B484040BE840A0E4F0540768A5583303B4840B8054B75014F05404606B98B303B4840CFF9298E034F0540CFA10C55313B484068E90AB6114F05407099D365313B48405D6F9BA9104F0540BD361B2B313B4840	2020-04-16 20:02:34.379603	2020-04-16 20:02:34.379603	1
283	0103000020E61000000100000005000000029F1F46084F054025E99AC9373B4840D4F02DAC1B4F0540F564FED1373B4840EBE40CC51D4F0540CB9D9960383B4840029F1F46084F05403C11C479383B4840029F1F46084F054025E99AC9373B4840	2020-04-16 20:02:34.381385	2020-04-16 20:02:34.381385	1
284	0103000020E610000001000000050000007A3881E9B44E054025E99AC9373B484008AEF204C24E054025E99AC9373B484002F1BA7EC14E05404FB0FF3A373B48404C50C3B7B04E05404FB0FF3A373B48407A3881E9B44E054025E99AC9373B4840	2020-04-16 20:02:34.383122	2020-04-16 20:02:34.383122	1
295	0103000020E6100000010000000700000097C79A91412E04405AD6FD6321304840BFB854A52D2E044088F2052D243048404D689258522E04408EAF3DB324304840083A5AD5922E0440414640852330484019ABCDFFAB2E0440C4245CC823304840B360E28FA22E0440DDB419A72130484097C79A91412E04405AD6FD6321304840	2020-05-07 13:11:36.333959	2020-05-07 13:11:36.333959	2
296	0103000020E61000000100000005000000852348A5D83104402F6D382C0D304840B876A224243204402E39EE940E304840522CB7B41A320440452DCDAD10304840DBFCBFEAC8310440F20698F90E304840852348A5D83104402F6D382C0D304840	2020-05-07 13:11:36.337512	2020-05-07 13:11:36.337512	2
297	0103000020E6100000010000000500000069C4CC3E8F3104405BD07B63083048409772BED87B31044065E256410C304840E60297C79A31044088B839950C3048401F65C405A0310440664AEB6F0930484069C4CC3E8F3104405BD07B6308304840	2020-05-07 13:11:36.339555	2020-05-07 13:11:36.339555	2
298	0103000020E610000001000000050000008B321B64923104409702D2FE0730484036936FB6B931044044DC9C4A06304840A2D45E44DB3104405C04C6FA0630484014252191B63104400DFFE9060A3048408B321B64923104409702D2FE07304840	2020-05-07 13:11:36.341522	2020-05-07 13:11:36.341522	2
299	0103000020E61000000100000005000000C07B478D09310440DA59F44E053048408C4AEA0434310440E5D3635B0630484075CAA31B6131044033A5F5B704304840D6A9F23D23310440D5D0066003304840C07B478D09310440DA59F44E05304840	2020-05-07 13:11:36.343578	2020-05-07 13:11:36.343578	2
300	0103000020E610000001000000050000002C616D8C9D300440B54FC76306304840D7C1C1DEC4300440B54FC76306304840F372D87DC73004404510E7E1043048401B2AC6F99B300440A41820D1043048402C616D8C9D300440B54FC76306304840	2020-05-07 13:11:36.353489	2020-05-07 13:11:36.353489	2
301	0103000020E61000000100000005000000AF22A303923004403EEB1A2D07304840FE9AAC510F310440FCFB8C0B07304840ED6305BF0D31044078B5DC990930484070B1A206D3300440664AEB6F09304840AF22A303923004403EEB1A2D07304840	2020-05-07 13:11:36.356308	2020-05-07 13:11:36.356308	2
302	0103000020E610000001000000050000006170CD1DFD2F0440C0B2D2A4143048405039268BFB2F04402FBE688F173048404AF086342A3004408318E8DA1730484039B9DFA12830044061AA99B5143048406170CD1DFD2F0440C0B2D2A414304840	2020-05-07 13:11:36.358413	2020-05-07 13:11:36.358413	2
303	0103000020E61000000100000005000000F20BAF24792E04409CA8A5B9153048406EF8DD74CB2E04406C2409C21530484008AEF204C22E044012A5BDC117304840A8ACA6EB892E04408FC6A17E17304840F20BAF24792E04409CA8A5B915304840	2020-05-07 13:11:36.360384	2020-05-07 13:11:36.360384	2
304	0103000020E610000001000000050000002C64AE0CAA2D04404DD7135D17304840BA13ECBFCE2D044065FF3C0D1830484081EB8A19E12D0440EF0225051630484015AA9B8BBF2D0440D7DAFB54153048402C64AE0CAA2D04404DD7135D17304840	2020-05-07 13:11:36.362265	2020-05-07 13:11:36.362265	2
305	0103000020E61000000100000005000000986BD102B42D0440E4D9E55B1F30484070B4E386DF2D0440499F56D11F3048401ADB6B41EF2D0440C1374D9F1D304840439259BDC32D0440399CF9D51C304840986BD102B42D0440E4D9E55B1F304840	2020-05-07 13:11:36.364383	2020-05-07 13:11:36.364383	2
306	0103000020E61000000100000005000000DCBB067DE92D0440E5F04927123048400F9BC8CC052E04406346787B103048406AA510C8252E0440802BD9B1113048400F9BC8CC052E04409162804413304840DCBB067DE92D0440E5F0492712304840	2020-05-07 13:11:36.369473	2020-05-07 13:11:36.369473	2
307	0103000020E61000000100000005000000261B0FB6D82D04407B8505F703304840F86C1D1CEC2D0440B0C6D97404304840BF44BC75FE2D0440B7B75B9203304840EDF2AD0FEB2D0440FF976BD102304840261B0FB6D82D04407B8505F703304840	2020-05-07 13:11:36.37195	2020-05-07 13:11:36.37195	2
308	0103000020E610000001000000060000003752B648DA2D0440158C4AEA04304840B41CE8A1B62D0440DEAE97A608304840BB2BBB60702D0440DEAE97A60830484016C26A2C612D0440746039420630484021EA3E00A92D04401C7DCC07043048403752B648DA2D0440158C4AEA04304840	2020-05-07 13:11:36.373703	2020-05-07 13:11:36.373703	2
309	0103000020E6100000010000000600000074B515FBCB2E04403541D47D003048400DDFC2BAF12E044041BB438A013048400DDFC2BAF12E044081423D7D04304840A19DD32CD02E0440C9224DBC03304840DAC534D3BD2E0440FFCBB5680130484074B515FBCB2E04403541D47D00304840	2020-05-07 13:11:36.375426	2020-05-07 13:11:36.375426	2
310	0103000020E610000001000000060000000395F1EF332E0440CBF27519FE2F4840581CCEFC6A2E04402BFBAE08FE2F48409775FF58882E0440EE940ED6FF2F484075931804562E0440E2E6543200304840035B25581C2E04404E9D47C5FF2F48400395F1EF332E0440CBF27519FE2F4840	2020-05-07 13:11:36.377148	2020-05-07 13:11:36.377148	2
311	0103000020E610000001000000050000004084B872F62E0440D578E926313048409B5434D6FE2E044033198EE733304840F1F3DF83D72E0440D41055F8333048401EDC9DB5DB2E04407670B037313048404084B872F62E0440D578E92631304840	2020-05-07 13:11:36.379277	2020-05-07 13:11:36.379277	2
312	0103000020E61000000100000006000000BFF2203D452E04407B1002F225304840F20BAF24792E0440D55B035B253048407AC4E8B9852E044081CD397826304840C423F1F2742E04406F2EFEB62730484053EBFD463B2E0440D4F36E2C28304840BFF2203D452E04407B1002F225304840	2020-05-07 13:11:36.381203	2020-05-07 13:11:36.381203	2
313	0103000020E61000000100000005000000F702B342912E0440164B917C2530484014B4C9E1932E0440751F80D426304840E0826C59BE2E0440E0D57267263048406344A2D0B22E0440118E59F624304840F702B342912E0440164B917C25304840	2020-05-07 13:11:36.382809	2020-05-07 13:11:36.382809	2
314	0103000020E61000000100000005000000BFF2203D452E04402D0B26FE28304840E1D40792772E0440C845B58828304840302B14E97E2E0440FC523F6F2A304840D029C8CF462E0440DE3994A12A304840BFF2203D452E04402D0B26FE28304840	2020-05-07 13:11:36.384625	2020-05-07 13:11:36.384625	2
315	0103000020E61000000100000005000000FD3383F8C02E0440D6AC33BE2F3048408A1D8D43FD2E0440653909A52F3048408A1D8D43FD2E0440C5758C2B2E304840FD3383F8C02E0440656D533C2E304840FD3383F8C02E0440D6AC33BE2F304840	2020-05-07 13:11:36.386293	2020-05-07 13:11:36.386293	2
316	0103000020E61000000100000005000000D594641D8E2E0440EF3CF19C2D30484019ABCDFFAB2E0440EF3CF19C2D3048400874266DAA2E0440F52D73BA2C304840D594641D8E2E04405436ACA92C304840D594641D8E2E0440EF3CF19C2D304840	2020-05-07 13:11:36.388549	2020-05-07 13:11:36.388549	2
317	0103000020E610000001000000050000004DA25EF0692E0440EF703B342C3048404162BB7B802E0440EF703B342C304840302B14E97E2E04404888F2052D3048401FBAA0BE652E0440B9FB1C1F2D3048404DA25EF0692E0440EF703B342C304840	2020-05-07 13:11:36.390357	2020-05-07 13:11:36.390357	2
318	0103000020E61000000100000005000000EBFCDB65BF2E04407AC5538F3430484079AC1919E42E04404A41B7973430484079AC1919E42E044091B932A836304840E0826C59BE2E0440F0C16B9736304840EBFCDB65BF2E04407AC5538F34304840	2020-05-07 13:11:36.392131	2020-05-07 13:11:36.392131	2
319	0103000020E61000000100000005000000904E5DF92C2F04401D59F96530304840F015DD7A4D2F0440BE50C07630304840F015DD7A4D2F04406AC2F6933130484084D4EDEC2B2F0440C9CA2F8331304840904E5DF92C2F04401D59F96530304840	2020-05-07 13:11:36.39379	2020-05-07 13:11:36.39379	2
320	0103000020E61000000100000005000000A185048C2E2F044059BF99982E3048408A05BEA25B2F0440B9C7D2872E3048408A05BEA25B2F04409BE271512D304840739D465A2A2F0440FBEAAA402D304840A185048C2E2F044059BF99982E304840	2020-05-07 13:11:36.39571	2020-05-07 13:11:36.39571	2
321	0103000020E61000000100000005000000E5ED08A7052F04403D0E83F92B304840F624B039072F04402CD7DB662A30484018CDCAF6212F04403E42CD902A304840FC1BB4571F2F04404F7974232C304840E5ED08A7052F04403D0E83F92B304840	2020-05-07 13:11:36.397418	2020-05-07 13:11:36.397418	2
322	0103000020E6100000010000000500000084D4EDEC2B2F0440D28BDAFD2A30484084D4EDEC2B2F0440F69507E9293048405CE333D93F2F0440F69507E9293048406D1ADB6B412F044043FF04172B30484084D4EDEC2B2F0440D28BDAFD2A304840	2020-05-07 13:11:36.399188	2020-05-07 13:11:36.399188	2
323	0103000020E610000001000000050000006D54A703592F0440E4F6CB272B30484079CE16105A2F0440AFE94141293048401D7233DC802F04408065A5492930484029ECA2E8812F0440147B681F2B3048406D54A703592F0440E4F6CB272B304840	2020-05-07 13:11:36.40084	2020-05-07 13:11:36.40084	2
324	0103000020E61000000100000005000000B60F79CBD52F0440EAE74D452A304840ABCFD556EC2F0440D9B0A6B2283048401CCEFC6A0E300440A33B889D29304840E9EE3A1BF22F0440556AF6402B304840B60F79CBD52F0440EAE74D452A304840	2020-05-07 13:11:36.402628	2020-05-07 13:11:36.402628	2
325	0103000020E61000000100000005000000FA25E2ADF32F044066A19DD32C304840CD77F01307300440EF703B342C304840A58636001B30044066A19DD32C3048409F8F32E20230044060B01BB62D304840FA25E2ADF32F044066A19DD32C304840	2020-05-07 13:11:36.404368	2020-05-07 13:11:36.404368	2
326	0103000020E61000000100000005000000C72E51BD3530044091D0967329304840C72E51BD3530044039B9DFA12830484099805F234930044039B9DFA1283048407DCF48844630044032C85D8429304840C72E51BD3530044091D0967329304840	2020-05-07 13:11:36.406234	2020-05-07 13:11:36.406234	2
327	0103000020E6100000010000000500000071C971A774300440E08442041C3048407CB779E3A4300440E08442041C3048406B80D250A33004403E59315C1D304840664F029B733004409E616A4B1D30484071C971A774300440E08442041C304840	2020-05-07 13:11:36.408114	2020-05-07 13:11:36.408114	2
328	0103000020E61000000100000005000000E3C798BB963004409ECF807A333048400470B378B1300440C896E5EB32304840E8F86871C6300440F12900C6333048404FCFBBB1A030044039D6C56D34304840E3C798BB963004409ECF807A33304840	2020-05-07 13:11:36.409934	2020-05-07 13:11:36.409934	2
329	0103000020E610000001000000050000006A6803B0013104403FC7478B333048405F28603B18310440279F1EDB323048402043C70E2A3104409221C7D633304840D1B2EE1F0B31044098DEFE5C343048406A6803B0013104403FC7478B33304840	2020-05-07 13:11:36.411618	2020-05-07 13:11:36.411618	2
330	0103000020E6100000010000000500000070253B36023104409F03CB113230484037FDD98F143104409F03CB1132304840596B28B517310440821E6ADB3030484054742497FF30044070B378B13030484070253B36023104409F03CB1132304840	2020-05-07 13:11:36.420853	2020-05-07 13:11:36.420853	2
331	0103000020E61000000100000005000000EC8502B68331044040FB91223230484036E50AEF72310440E126A3CA30304840C4CE143AAF310440D6AC33BE2F3048409CDD5A26C3310440DB3521AD31304840EC8502B68331044040FB912232304840	2020-05-07 13:11:36.42302	2020-05-07 13:11:36.42302	2
332	0103000020E610000001000000050000003C2EAA4544310440B89388F02F304840B47570B03731044077D844662E30484086C77E164B310440247EC51A2E30484020B75F3E5931044035B56CAD2F3048403C2EAA4544310440B89388F02F304840	2020-05-07 13:11:36.425083	2020-05-07 13:11:36.425083	2
333	0103000020E610000001000000050000004225AE635C310440F4C5DE8B2F3048409772BED87B3104401E8D43FD2E30484025AE635C713104401213D4F02D304840F2CEA10C553104406B2A8BC22E3048404225AE635C310440F4C5DE8B2F304840	2020-05-07 13:11:36.426774	2020-05-07 13:11:36.426774	2
334	0103000020E61000000100000005000000645930F147310440E97FB9162D304840034015376E310440E97FB9162D3048401477BCC96F3104401FF5D72B2C3048407590D7834931044060E4654D2C304840645930F147310440E97FB9162D304840	2020-05-07 13:11:36.428556	2020-05-07 13:11:36.428556	2
335	0103000020E610000001000000050000002DCE18E6042D04406B9F8EC70C304840D82E6D382C2D0440AB5AD2510E30484027BF45274B2D044088B839950C3048409FCC3FFA262D0440C51EDAC70A3048402DCE18E6042D04406B9F8EC70C304840	2020-05-07 13:11:36.430422	2020-05-07 13:11:36.430422	2
336	0103000020E61000000100000005000000B2BCAB1E302F044032C85D842930484079944A78422F0440F1D8CF622930484035B8AD2D3C2F044039B9DFA128304840739D465A2A2F04408C135FED28304840B2BCAB1E302F044032C85D8429304840	2020-05-07 13:11:36.432296	2020-05-07 13:11:36.432296	2
337	0103000020E61000000100000005000000653733FAD1300440414640852330484059F78F85E83004407787140324304840DCB8C5FCDC3004404012F6ED2430484015E126A3CA300440CAE1934E24304840653733FAD13004404146408523304840	2020-05-07 13:11:36.434071	2020-05-07 13:11:36.434071	2
338	0103000020E610000001000000050000008D28ED0DBE3004402D3F70952730484043C9E4D4CE300440CE3637A62730484043C9E4D4CE300440274EEE772830484054C6BFCFB8300440E55E6056283048408D28ED0DBE3004402D3F709527304840	2020-05-07 13:11:36.435788	2020-05-07 13:11:36.435788	2
339	0103000020E610000001000000050000008DEE2076A6300440C0CFB8702030484098A25C1ABF300440904B1C79203048409E5F94A0BF300440DDB419A72130484076FA415DA4300440B9DE3653213048408DEE2076A6300440C0CFB87020304840	2020-05-07 13:11:36.438048	2020-05-07 13:11:36.438048	2
340	0103000020E6100000010000000500000028452BF702330440051A6CEA3C304840BC3D0801F93204409372F7393E30484067F0F78BD93204402EAD86C43D304840EFA83121E63204401D76DF313C30484028452BF702330440051A6CEA3C304840	2020-05-07 13:11:36.440543	2020-05-07 13:11:36.440543	2
341	0103000020E61000000100000005000000ECBFCE4D9B310440B5C35F9335304840F7730AF2B33104401A89D00836304840CA8B4CC0AF310440376E313F373048405E4A5D328E31044031B1F9B836304840ECBFCE4D9B310440B5C35F9335304840	2020-05-07 13:11:36.442602	2020-05-07 13:11:36.442602	2
342	0103000020E61000000100000005000000FDF675E09C310440C00985083830484030D63730B931044001F9122A3830484047CA1649BB310440EF59D76839304840D00EB8AE983104407DE6AC4F39304840FDF675E09C310440C009850838304840	2020-05-07 13:11:36.444814	2020-05-07 13:11:36.444814	2
343	0103000020E610000001000000050000006C21C84109330440B1BFEC9E3C30484028B9C3263233044070D05E7D3C3048404A27124C353304405F99B7EA3A304840170E846401330440473D44A33B3048406C21C84109330440B1BFEC9E3C304840	2020-05-07 13:11:36.447264	2020-05-07 13:11:36.447264	2
344	0103000020E61000000100000005000000FA0AD28C45330440F99FFCDD3B304840FA0AD28C453304405F99B7EA3A304840D21918795933044059DC7F643A30484005BF0D315E3304402367614F3B304840FA0AD28C45330440F99FFCDD3B304840	2020-05-07 13:11:36.449077	2020-05-07 13:11:36.449077	2
345	0103000020E610000001000000050000009FAEEE586C330440D00CE2033B3048408E7747C66A330440A779C7293A3048407D7A6CCB80330440C59272F7393048408237A451813304408F1D54E23A3048409FAEEE586C330440D00CE2033B304840	2020-05-07 13:11:36.451009	2020-05-07 13:11:36.451009	2
346	0103000020E61000000100000005000000D253E410713304409A97C3EE3B304840554FE61F7D3304409A97C3EE3B3048407100FDBE7F33044052B7B3AF3C304840B6A2CD716E330440C32ADEC83C304840D253E410713304409A97C3EE3B304840	2020-05-07 13:11:36.452842	2020-05-07 13:11:36.452842	2
347	0103000020E61000000100000007000000F9669B1BD3330440280D350A49304840CC7EDDE9CE3304409AB4A9BA473048409E0AB8E7F9330440B8CD548847304840041BD7BFEB330440B1DCD26A48304840D175E107E73304400AF4893C49304840F4A96395D23304405D4E098849304840F9669B1BD3330440280D350A49304840	2020-05-07 13:11:36.454947	2020-05-07 13:11:36.454947	2
348	0103000020E61000000100000005000000EEEC2B0FD23304403674B33F50304840D7F84CF6CF330440072461DF4E3048400A647616BD33044078978BF84E304840F92CCF83BB330440957CEC2E50304840EEEC2B0FD23304403674B33F50304840	2020-05-07 13:11:36.457046	2020-05-07 13:11:36.457046	2
349	0103000020E610000001000000050000004F0647C9AB3304402BFA43334F30484054C37E4FAC330440185B087250304840490F43AB9333044048DFA46950304840882EA86F99330440E90AB6114F3048404F0647C9AB3304402BFA43334F304840	2020-05-07 13:11:36.458905	2020-05-07 13:11:36.458905	2
350	0103000020E6100000010000000500000005F9D9C87533044096B036C64E304840F4FBFECD8B330440C0779B374E3048406C43C5387F33044038DC476E4D3048407D40A033693304401F80D4264E30484005F9D9C87533044096B036C64E304840	2020-05-07 13:11:36.460786	2020-05-07 13:11:36.460786	2
351	0103000020E610000001000000050000000C5A48C0E8320440E44D7E8B4E3048408315A75A0B330440B4C9E1934E3048408315A75A0B33044090BFB4A84F30484001E0D8B3E7320440BF4351A04F3048400C5A48C0E8320440E44D7E8B4E304840	2020-05-07 13:11:36.46251	2020-05-07 13:11:36.46251	2
352	0103000020E61000000100000005000000074147AB5A3204406FD6E07D55304840DA9255116E32044069E55E6056304840EB8F300C583204400F9A5DF7563048403BAC70CB47320440F2B4FCC055304840074147AB5A3204406FD6E07D55304840	2020-05-07 13:11:36.464606	2020-05-07 13:11:36.464606	2
353	0103000020E6100000010000000600000067B62BF4C13204402AC6F99B50304840FBE8D495CF320440B39597FC4F30484095D8B5BDDD320440E31934F44F30484078616BB6F23204409B3924B550304840CE001764CB320440535914765130484067B62BF4C13204402AC6F99B50304840	2020-05-07 13:11:36.466366	2020-05-07 13:11:36.466366	2
354	0103000020E61000000100000005000000450E1137A7320440E8A221E351304840A0185932C73204401827BEDA5130484089247A19C53204405FD38382523048400CACE3F8A13204402F4FE78A52304840450E1137A7320440E8A221E351304840	2020-05-07 13:11:36.468457	2020-05-07 13:11:36.468457	2
355	0103000020E6100000010000000500000078B306EFAB320440A67F492A53304840B14F00C5C83204405325CADE523048403A083A5AD5320440295E656D53304840BD8FA339B2320440FF9600FC5330484078B306EFAB320440A67F492A53304840	2020-05-07 13:11:36.470768	2020-05-07 13:11:36.470768	2
356	0103000020E61000000100000005000000B2A19BFD813204405D6BEF5355304840D449B6BA9C32044016BF29AC54304840A69BC420B0320440E0490B9755304840349D9D0C8E32044027F6D03E56304840B2A19BFD813204405D6BEF5355304840	2020-05-07 13:11:36.472921	2020-05-07 13:11:36.472921	2
357	0103000020E61000000100000005000000FB5C6DC5FE320440267156444D30484078616BB6F232044020B41EBE4C304840AB402D060F33044086ADD9CA4B30484033F9669B1B3304401406651A4D304840FB5C6DC5FE320440267156444D304840	2020-05-07 13:11:36.475053	2020-05-07 13:11:36.475053	2
358	0103000020E61000000100000005000000C16ED8B62833044037A8FDD64E304840890CAB78233304401F80D4264E3048401C3F541A313304403D997FF44D304840446ADAC534330440072461DF4E304840C16ED8B62833044037A8FDD64E304840	2020-05-07 13:11:36.479402	2020-05-07 13:11:36.479402	2
359	0103000020E61000000100000005000000685A626534320440CCF10A444F3048402F3201BF46320440672C9ACE4E3048408A027D224F3204407E54C37E4F304840850B790437320440A22AA6D24F304840685A626534320440CCF10A444F304840	2020-05-07 13:11:36.485958	2020-05-07 13:11:36.485958	2
360	0103000020E61000000100000005000000C2120F289B320440A662635E47304840CE52B29C84320440A662635E47304840B2A19BFD8132044034BBEEAD4830484007EFAB72A132044076AA7CCF48304840C2120F289B320440A662635E47304840	2020-05-07 13:11:36.488118	2020-05-07 13:11:36.488118	2
361	0103000020E610000001000000050000009B73F04C683204405E82531F48304840B8EA3A5453320440CFF57D3848304840BDA772DA53320440C904FC1A49304840BDE13E726B320440C904FC1A493048409B73F04C683204405E82531F48304840	2020-05-07 13:11:36.489873	2020-05-07 13:11:36.489873	2
362	0103000020E610000001000000050000001878EE3D5C3204405055A18158304840C85BAE7E6C3204407FD93D795830484029E9616875320440DEAD2CD159304840EB8F300C58320440DEAD2CD1593048401878EE3D5C3204405055A18158304840	2020-05-07 13:11:36.491637	2020-05-07 13:11:36.491637	2
363	0103000020E61000000100000005000000C6C1A563CE3304406919A9F754304840109546CCEC33044034D8D47954304840AF415F7AFB330440223999B855304840EEEC2B0FD233044069E55E6056304840C6C1A563CE3304406919A9F754304840	2020-05-07 13:11:36.493367	2020-05-07 13:11:36.493367	2
364	0103000020E6100000010000000500000033E197FA79330440677DCA3159304840276728EE7833044013EF004F5A3048408EEBDFF59933044073F7393E5A3048403E95D39E92330440F609A0185930484033E197FA79330440677DCA3159304840	2020-05-07 13:11:36.49525	2020-05-07 13:11:36.49525	2
365	0103000020E61000000100000005000000E38A8BA3723304400B96EA025E304840B5DC9909863304403B1A87FA5D304840B5DC99098633044064ADA1D45E304840CC96AC8A70330440352905DD5E304840E38A8BA3723304400B96EA025E304840	2020-05-07 13:11:36.496997	2020-05-07 13:11:36.496997	2
366	0103000020E6100000010000000500000001E0D8B3E7320440A14D0E9F74304840E42EC214E53204405EF6EB4E7730484039B69E211C3304405839B4C8763048400CCEE0EF173304403C889D297430484001E0D8B3E7320440A14D0E9F74304840	2020-05-07 13:11:36.498759	2020-05-07 13:11:36.498759	2
367	0103000020E610000001000000050000006DE7FBA9F13204409016670C7330484039B69E211C3304409016670C733048405567B5C01E3304402B85402E713048407E1EA33CF3320440D82AC1E2703048406DE7FBA9F13204409016670C73304840	2020-05-07 13:11:36.500492	2020-05-07 13:11:36.500492	2
368	0103000020E610000001000000050000004A27124C35330440637FD93D79304840608F899466330440215C01857A3048405B9885764E3304403293A8177C304840B03731242733044032C7F2AE7A3048404A27124C35330440637FD93D79304840	2020-05-07 13:11:36.502191	2020-05-07 13:11:36.502191	2
369	0103000020E6100000010000000500000077F700DD973304403E75AC527A304840D2C77C40A03304407BDB4C8578304840FFE9060ABC3304401CD3139678304840999F1B9AB2330440D3BEB9BF7A30484077F700DD973304403E75AC527A304840	2020-05-07 13:11:36.504121	2020-05-07 13:11:36.504121	2
370	0103000020E61000000100000005000000328FFCC1C0330440F7AB00DF6D304840041BD7BFEB33044027309DD66D304840D732198EE733044008E3A7716F304840328FFCC1C03304402DEDD45C6E304840328FFCC1C0330440F7AB00DF6D304840	2020-05-07 13:11:36.506304	2020-05-07 13:11:36.506304	2
371	0103000020E61000000100000005000000A98427F4FA3304408BC1C3B46F304840F9DA334B02340440CDE49B6D6E3048400A4CA7751B34044050C3B7B06E304840C0B2D2A414340440A3E9EC6470304840A98427F4FA3304408BC1C3B46F304840	2020-05-07 13:11:36.508373	2020-05-07 13:11:36.508373	2
372	0103000020E61000000100000005000000709692E5243404405B09DD257130484031B1F9B8363404405B09DD2571304840810706103E3404402594BE1072304840486B0C3A2134044066834C3272304840709692E5243404405B09DD2571304840	2020-05-07 13:11:36.510214	2020-05-07 13:11:36.510214	2
373	0103000020E61000000100000005000000F8C264AA603404402B51F6967230484026AB22DC64340440B42094F771304840315F5E807D34044037FFAF3A723048400377A04E79340440018A912573304840F8C264AA603404402B51F69672304840	2020-05-07 13:11:36.512028	2020-05-07 13:11:36.512028	2
374	0103000020E61000000100000005000000315F5E807D340440F6436CB070304840BFD4CF9B8A340440792288F3703048405E81E84999340440C10298327030484097A949F086340440BB4560AC6F304840315F5E807D340440F6436CB070304840	2020-05-07 13:11:36.513703	2020-05-07 13:11:36.513703	2
375	0103000020E6100000010000000500000058FE7C5BB03404403F58C6866E30484009E23C9CC0340440D3A1D3F36E304840B9C5FCDCD034044098A3C7EF6D304840BF4868CBB9340440C26A2C616D30484058FE7C5BB03404403F58C6866E304840	2020-05-07 13:11:36.515366	2020-05-07 13:11:36.515366	2
376	0103000020E61000000100000005000000D55B035B253804405E13D21A833048408B36C7B94D380440FE0A992B833048407442E8A04B380440E0BDA3C6843048408BC22E8A1E3804402D5BEB8B84304840D55B035B253804405E13D21A83304840	2020-05-07 13:11:36.517083	2020-05-07 13:11:36.517083	2
197	0103000020E6100000010000000500000073D712F2414F054055A18158363B484068976F7D584F05403E7958A8353B48400744882B674F0540670C7382363B4840C8EA56CF494F0540DE3CD521373B484073D712F2414F054055A18158363B4840	2020-04-16 20:02:34.222987	2020-04-16 20:02:34.222987	1
198	0103000020E61000000100000005000000FC1BB4571F4F0540EB1ED95C353B48409BC8CC052E4F054032CB9E04363B4840E59B6D6E4C4F0540D9B3E732353B4840F6984869364F05409EB5DB2E343B4840FC1BB4571F4F0540EB1ED95C353B4840	2020-04-16 20:02:34.22517	2020-04-16 20:02:34.22517	1
199	0103000020E61000000100000005000000AC8BDB68004F0540670C7382363B4840354415FE0C4F0540DE3CD521373B48403A3B191C254F0540F6984869363B48409B8E006E164F05409D819197353B4840AC8BDB68004F0540670C7382363B4840	2020-04-16 20:02:34.226872	2020-04-16 20:02:34.226872	1
200	0103000020E61000000100000007000000C9022670EB4E0540B2D991EA3B3B4840A7CEA3E2FF4E054059C2DA183B3B484040BE840A0E4F05400B2593533B3B4840F1A1444B1E4F05409AB1683A3B3B4840357EE195244F05402FFB75A73B3B4840BDC282FB014F05406AF981AB3C3B4840C9022670EB4E0540B2D991EA3B3B4840	2020-04-16 20:02:34.228673	2020-04-16 20:02:34.228673	1
201	0103000020E610000001000000070000000C01C0B1674F05409A6038D7303B4840CE1B2785794F05409F1D705D313B484067D13B15704F054069A85148323B4840B2F677B6474F0540DA1B7C61323B48405CE333D93F4F054052802898313B4840F015DD7A4D4F05400BD462F0303B48400C01C0B1674F05409A6038D7303B4840	2020-04-16 20:02:34.230549	2020-04-16 20:02:34.230549	1
202	0103000020E6100000010000000600000050172994854F054070CD1DFD2F3B4840A62A6D718D4F054029ED0DBE303B484023A30392B04F05407C7BD7A02F3B4840289A07B0C84F0540A185048C2E3B484023A30392B04F054078F2E9B12D3B484050172994854F054070CD1DFD2F3B4840	2020-04-16 20:02:34.232337	2020-04-16 20:02:34.232337	1
203	0103000020E61000000100000005000000BD732843554C0540A1B94E232D3B48403A782634494C05406B44300E2E3B48407E1AF7E6374C0540A77686A92D3B484007D3307C444C05407EE36BCF2C3B4840BD732843554C0540A1B94E232D3B4840	2020-04-16 20:02:34.234216	2020-04-16 20:02:34.234216	1
204	0103000020E61000000100000007000000346953758F4C0540D27135B22B3B48403FE3C281904C05403737A6272C3B4840B66455849B4C0540191EFB592C3B48404A97FE25A94C05403737A6272C3B484056116E32AA4C0540317A6EA12B3B4840C2DEC4909C4C05409082A7902B3B4840346953758F4C0540D27135B22B3B4840	2020-04-16 20:02:34.236166	2020-04-16 20:02:34.236166	1
377	0103000020E610000001000000050000002BD9B11188370440B9C667B27F3048402B137EA99F370440B9C667B27F3048408CA03193A837044012DE1E8480304840096B63EC84370440E259828C803048402BD9B11188370440B9C667B27F304840	2020-05-07 13:11:36.518669	2020-05-07 13:11:36.518669	2
378	0103000020E6100000010000000500000081785DBF60370440598AE42B81304840CBD765F84F3704406404543882304840D68BA19C68370440994528B6823048403DD68C0C72370440ACE463778130484081785DBF60370440598AE42B81304840	2020-05-07 13:11:36.520502	2020-05-07 13:11:36.520502	2
379	0103000020E6100000010000000500000044FD2E6CCD3604408A7615527E3048408813984EEB36044061E3FA777D3048408D0A9C6C03370440AD4CF8A57E3048408D96033DD43604402A3A92CB7F30484044FD2E6CCD3604408A7615527E304840	2020-05-07 13:11:36.522497	2020-05-07 13:11:36.522497	2
380	0103000020E61000000100000005000000874D64E6023704406D91B41B7D30484054E23AC6153704401903EB387E304840E257ACE122370440C6A86BED7D304840F94B8BFA2437044055698B6B7C304840874D64E6023704406D91B41B7D304840	2020-05-07 13:11:36.524113	2020-05-07 13:11:36.524113	2
381	0103000020E61000000100000006000000F99D2633DE3604407973B8567B3048409E077767ED360440FC51D4997B304840D1E638B709370440D3BEB9BF7A30484065A54929E8360440274D83A27930484088D9CBB6D33604404432E4D87A304840F99D2633DE3604407973B8567B304840	2020-05-07 13:11:36.525864	2020-05-07 13:11:36.525864	2
382	0103000020E61000000100000006000000EE5D83BEF4360440B6D958897930484021C9ACDEE13604405DC2A1B778304840AF3E1EFAEE36044057056A3178304840B5352218073704400A68226C78304840058C2E6F0E37044010255AF278304840EE5D83BEF4360440B6D9588979304840	2020-05-07 13:11:36.527543	2020-05-07 13:11:36.527543	2
383	0103000020E61000000100000005000000B891B245D22E0440E7E3DA50313048409CE09BA6CF2E0440BD1C76DF3130484008AEF204C22E04401C25AFCE313048403B53E8BCC62E04407670B03731304840B891B245D22E0440E7E3DA5031304840	2020-05-07 20:26:15.745383	2020-05-07 20:26:15.745383	2
384	0103000020E61000000100000005000000FCE1E7BF072F044049D9226937304840EBE40CC51D2F0440AE9E93DE3730484068E90AB6112F044018213CDA38304840AC8BDB68002F0440C5C6BC8E38304840FCE1E7BF072F044049D9226937304840	2020-05-07 20:26:15.779317	2020-05-07 20:26:15.779317	2
385	0103000020E610000001000000050000006E6C76A4FA2E04404FE78A52423048403B014D840D2F0440F0DE51634230484040BE840A0E2F0440E9EDCF454330484024D3A1D3F32E0440E9EDCF45433048406E6C76A4FA2E04404FE78A5242304840	2020-05-07 20:26:15.811364	2020-05-07 20:26:15.811364	2
386	0103000020E610000001000000050000002A90D959F42E044035EF384547304840F624B039072F044035EF384547304840F624B039072F0440DBA337DC47304840195932C7F22E0440DBA337DC473048402A90D959F42E044035EF384547304840	2020-05-07 20:26:15.843081	2020-05-07 20:26:15.843081	2
387	0103000020E61000000100000005000000EB707495EE2E044052D4997B4830484068AF3E1EFA2E044052D4997B4830484068AF3E1EFA2E0440280D350A49304840D47C957CEC2E0440280D350A49304840EB707495EE2E044052D4997B48304840	2020-05-07 20:26:15.875177	2020-05-07 20:26:15.875177	2
285	0103000020E610000001000000050000002BC0779B374E0540A4897780273B48404837C2A2224E05406F48A302273B48402BC0779B374E054064CE33F6253B48401406651A4D4E0540BDE5EAC7263B48402BC0779B374E0540A4897780273B4840	2020-04-16 20:02:34.384883	2020-04-16 20:02:34.384883	1
286	0103000020E61000000100000006000000365CE49EAE4E0540FDA02E52283B48400874266DAA4E0540C85F5AD4273B48408B355CE49E4E054015FDA199273B48404759BF99984E0540F8E3F6CB273B48402AA8A8FA954E0540035E66D8283B4840365CE49EAE4E0540FDA02E52283B4840	2020-04-16 20:02:34.387062	2020-04-16 20:02:34.387062	1
287	0103000020E610000001000000050000005778978BF84E054008CA6DFB1E3B4840FCA71B28F04E0540F52A323A203B4840CE6DC2BD324F05404E42E90B213B484046B58828264F05407FFACF9A1F3B48405778978BF84E054008CA6DFB1E3B4840	2020-04-16 20:02:34.388845	2020-04-16 20:02:34.388845	1
288	0103000020E61000000100000005000000B24813EF004F05401FBE4C14213B484096D1C8E7154F05407218CC5F213B484068E90AB6114F0540485167EE213B48409697FC4FFE4E0540C5724BAB213B4840B24813EF004F05401FBE4C14213B4840	2020-04-16 20:02:34.390591	2020-04-16 20:02:34.390591	1
289	0103000020E610000001000000050000001E8A027D224F05402A38BC20223B48404B72C0AE264F054054FF2092213B4840F6984869364F0540A759A0DD213B4840BD361B2B314F05407D923B6C223B48401E8A027D224F05402A38BC20223B4840	2020-04-16 20:02:34.392516	2020-04-16 20:02:34.392516	1
290	0103000020E610000001000000050000009AEAC9FCA34F054050AA7D3A1E3B4840BC92E4B9BE4F054044FCC3961E3B4840FBB1497EC44F0540AFB2B6291E3B4840B79BE09BA64F05404AED45B41D3B48409AEAC9FCA34F054050AA7D3A1E3B4840	2020-04-16 20:02:34.394361	2020-04-16 20:02:34.394361	1
291	0103000020E61000000100000005000000C11F7EFE7B500540BFB51325213B4840823AE5D18D5005400E87A5811F3B4840DD442DCDAD500540734C16F71F3B4840F9BB77D498500540666A12BC213B4840C11F7EFE7B500540BFB51325213B4840	2020-04-16 20:02:34.396283	2020-04-16 20:02:34.396283	1
292	0103000020E6100000010000000500000029B2D6506A4F0540E8BD3104003B4840BDAAB35A604F0540E8BD3104003B4840C8242367614F05404209336DFF3A48406D8E739B704F0540B37C5D86FF3A484029B2D6506A4F0540E8BD3104003B4840	2020-04-16 20:02:34.398146	2020-04-16 20:02:34.398146	1
293	0103000020E61000000100000007000000AB9509BFD44F0540A4E194B9F93A4840662D05A4FD4F0540EB8D5A61FA3A48404AF086342A500540EB8D5A61FA3A48408352B4722F5005403F1C2444F93A48401CCEFC6A0E500540336E6AA0F93A4840BCCCB051D64F05409E245D33F93A4840AB9509BFD44F0540A4E194B9F93A4840	2020-04-16 20:02:34.399994	2020-04-16 20:02:34.399994	1
294	0103000020E610000001000000070000009E5F94A0BF500540BDC282FB013B4840921FF12BD6500540E198654F023B484087DF4DB7EC500540BDC282FB013B484087DF4DB7EC5005408881AE7D013B484070B1A206D35005408881AE7D013B484093E52494BE5005409AEC9FA7013B48409E5F94A0BF500540BDC282FB013B4840	2020-04-16 20:02:34.401926	2020-04-16 20:02:34.401926	1
\.


--
-- Data for Name: circuits; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.circuits (id, color, created_at, updated_at, area_id) FROM stdin;
1	yellow	2020-04-16 20:02:33.505445	2020-04-19 08:39:56.331282	1
2	orange	2020-04-16 20:02:33.697495	2020-04-19 08:39:56.335633	1
3	skyblue	2020-04-16 20:02:33.796183	2020-04-19 08:39:56.338009	1
4	red	2020-04-16 20:02:33.813724	2020-04-19 08:39:56.340577	1
5	blue	2020-04-16 20:02:33.912494	2020-04-19 08:39:56.342898	1
6	white	2020-04-16 20:02:34.149902	2020-04-19 08:39:56.345078	1
10	orange	2020-05-07 12:44:29.55628	2020-05-07 12:44:29.55628	2
11	red	2020-05-07 12:44:29.606787	2020-05-07 12:44:29.606787	2
12	blue	2020-05-07 12:44:29.615897	2020-05-07 12:44:29.615897	2
\.


--
-- Data for Name: pois; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.pois (id, title, subtitle, description, location, route, area_id, created_at, updated_at) FROM stdin;
1	Parking	2 min de marche	Parking Rocher Canon	0101000020E6100000446ADAC534530540A818E76F423B4840	0102000020E6100000140000003EB308E2265305406432F5C9423B4840894D9EDBB3520540BC1A6094533B48406EAD0070235205405D3038FF523B484020F2AAC0D0500540A3CDD5195B3B48400E2FA1667C500540B64DCED9543B4840A2B8775BB3500540B57DF1884C3B4840079CB7293351054037DF6F4F4A3B48403DAB6D4F47510540DBD34F90483B48403DAB6D4F47510540743F39EF463B4840BDEDB14E2651054034E644BA453B484035B76A8DEC5005401423172A453B4840821BBBB9C5500540F5D885A0453B48407DBCF89AA85005405721D643453B48409ED5C13CA45005400FDFDD75443B4840DC83E44FB25005404396E5A7433B484073C71C49D45005405777A85A433B4840FEA498FCE1500540368D5D43423B48400539D378E1500540A4999680413B484016BAE760D8500540F18CB5B4403B48405CA07A6AC150054081A940813F3B4840	1	2020-05-09 19:45:02.796229	2020-05-09 19:50:49.931636
2	Parking	15 min de marche	Parking Roche aux Sabots	0101000020E610000082E2C798BB160440EAAEEC82C12F4840	0102000020E610000011000000CDCD37A27B160440DE0033DFC12F48403C32569BFF1704408E76DCF0BB2F484006F357C85C1904400A815CE2C82F48404757E9EE3A1B0440D3F4D901D72F4840F0FB372F4E1C0440DDD26A48DC2F484053CE177B2F1E0440FF40B96DDF2F484068925852EE1E0440D4450A65E12F4840D960E124CD1F0440C6FB71FBE52F48407B82C476F720044009707A17EF2F4840C425C79DD22104409981CAF8F72F4840A64412BD8C220440AF415F7AFB2F4840C748F60835230440DCF5D214013048405F0839EFFF230440C4CDA96400304840F52D73BA2C26044062D8614CFA2F48407CF0DAA50D270440F8A6E9B303304840CAA99D616A2B04405D6C5A2904304840444E5FCFD72C044004AC55BB26304840	2	2020-05-09 21:18:37.4188	2020-05-09 21:44:44.481227
\.


--
-- Data for Name: problems; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.problems (id, name, grade, created_at, updated_at, location, circuit_id, circuit_number, steepness, height, area_id, tags) FROM stdin;
14	\N	2a	2020-04-16 20:19:03.01478	2020-04-28 19:19:45.535645	0101000020E61000003B53E8BCC64E0540A27F828B153B4840	1	36	slab	\N	1	{risky}
15	\N	2a	2020-04-16 20:19:03.017287	2020-04-28 19:19:45.537721	0101000020E61000004641F0F8F64E0540D828EB37133B4840	1	35	traverse	\N	1	{risky}
27	\N	2b	2020-04-16 20:19:03.050092	2020-04-28 19:19:45.539703	0101000020E61000004C16F71F994E05404B3E7617283B4840	1	23	wall	\N	1	{risky}
32	\N	2a	2020-04-16 20:19:03.064545	2020-04-28 19:19:45.541474	0101000020E6100000427A8A1C224E0540CB80B3942C3B4840	1	18	wall	\N	1	{risky}
40	Sauvetage	2a	2020-04-16 20:19:03.087615	2020-04-28 19:38:52.764662	0101000020E61000005A643BDF4F4D0540C1C58A1A4C3B4840	1	9	wall	5	1	{risky}
21	Magouilles	3b	2020-04-16 20:19:03.033315	2020-04-28 19:38:52.767785	0101000020E6100000EA060ABC934F05403D0B42791F3B4840	1	29	wall	5	1	{risky}
13	\N	2a	2020-04-16 20:19:03.012177	2020-04-28 13:25:02.237091	0101000020E610000010919A76314D0540DC2C5E2C0C3B4840	1	37	wall	\N	1	{}
26	\N	3a	2020-04-16 20:19:03.047543	2020-04-28 13:25:15.232235	0101000020E6100000B360E28FA24E054039D384ED273B4840	1	24	wall	\N	1	{}
25	Fun and Games	2a	2020-04-16 20:19:03.044576	2020-04-28 19:19:45.519691	0101000020E6100000A7E67283A14E05407D923B6C223B4840	1	25	wall	4	1	{risky}
2	\N	2c	2020-04-16 20:19:02.975036	2020-04-28 19:19:45.526248	0101000020E6100000BBB72231414D054021205F42053B4840	1	48	slab	\N	1	{risky}
4	\N	2a	2020-04-16 20:19:02.980786	2020-04-28 19:19:45.528694	0101000020E61000007689EAAD814D0540F624B039073B4840	1	46	traverse	\N	1	{risky}
8	\N	3a	2020-04-16 20:19:02.99152	2020-04-28 19:19:45.531033	0101000020E610000081EB8A19E14D0540FA4509FA0B3B4840	1	42	slab	\N	1	{risky}
10	\N	2a	2020-04-16 20:19:02.997912	2020-04-28 19:19:45.533233	0101000020E6100000DC476E4DBA4D0540DBC4C9FD0E3B4840	1	40	slab	\N	1	{risky}
272	Le bac à Eau	2a+	2020-05-07 12:44:29.706829	2020-05-07 20:38:24.579585	0101000020E6100000B378B130442E04403CBD529621304840	10	10	traverse	\N	2	{}
313	La Gageure	3a+	2020-05-07 12:44:29.893979	2020-05-07 20:42:53.325072	0101000020E6100000F2086EA46C31044006651A4D2E304840	10	25	wall	\N	2	{}
1	Poseurs	3b	2020-04-16 20:19:02.969757	2020-04-19 08:39:46.515762	0101000020E6100000884CF910544D0540F0C4AC17433B4840	1	13	slab	4	1	{}
3	\N	3a	2020-04-16 20:19:02.977993	2020-04-19 08:39:46.523101	0101000020E6100000BB7D5699294D05401AFB928D073B4840	1	47	slab	\N	1	{}
5	\N	2a+	2020-04-16 20:19:02.983516	2020-04-19 08:39:46.527943	0101000020E6100000266DAAEE914D054019C748F6083B4840	1	45	slab	\N	1	{}
6	\N	2a	2020-04-16 20:19:02.98631	2020-04-19 08:39:46.529729	0101000020E6100000E2CAD93BA34D0540E90E62670A3B4840	1	44	traverse	\N	1	{}
7	\N	2b	2020-04-16 20:19:02.988854	2020-04-19 08:39:46.531437	0101000020E61000009E62D520CC4D0540FBAD9D28093B4840	1	43	traverse	\N	1	{}
9	\N	2b	2020-04-16 20:19:02.994807	2020-04-19 08:39:46.534764	0101000020E6100000C0D02346CF4D05409B3DD00A0C3B4840	1	41	wall	\N	1	{}
11	\N	2a	2020-04-16 20:19:03.0008	2020-04-19 08:39:46.538134	0101000020E6100000B5E21B0A9F4D054093E4B9BE0F3B4840	1	39	slab	\N	1	{}
12	\N	3a	2020-04-16 20:19:03.009542	2020-04-19 08:39:46.539991	0101000020E610000071581AF8514D0540172B6A300D3B4840	1	38	traverse	\N	1	{}
16	\N	1b	2020-04-16 20:19:03.019868	2020-04-19 08:39:46.547316	0101000020E6100000A7CEA3E2FF4E054020D5B0DF133B4840	1	34	slab	\N	1	{}
17	Lola	2c	2020-04-16 20:19:03.022537	2020-04-19 08:39:46.548954	0101000020E6100000E5ED08A7054F05400745F300163B4840	1	33	slab	\N	1	{}
18	\N	2a	2020-04-16 20:19:03.025123	2020-04-19 08:39:46.550596	0101000020E61000002F87DD770C4F05408787307E1A3B4840	1	32	traverse	\N	1	{}
19	\N	3b	2020-04-16 20:19:03.027729	2020-04-19 08:39:46.552206	0101000020E61000006D1ADB6B414F0540C2853C821B3B4840	1	31	wall	\N	1	{}
20	\N	2b	2020-04-16 20:19:03.03048	2020-04-19 08:39:46.553828	0101000020E610000034DAAA24B24F0540F1A1444B1E3B4840	1	30	slab	\N	1	{}
22	\N	2b	2020-04-16 20:19:03.036242	2020-04-19 08:39:46.555936	0101000020E6100000512FF834274F05400762D9CC213B4840	1	28	traverse	\N	1	{}
24	\N	2a	2020-04-16 20:19:03.041946	2020-04-19 08:39:46.558048	0101000020E6100000037D224F924E0540F52A323A203B4840	1	26	slab	\N	1	{}
28	\N	3a	2020-04-16 20:19:03.052401	2020-04-19 08:39:46.564119	0101000020E61000005E656D533C4E0540E6AC4F39263B4840	1	22	wall	\N	1	{}
29	\N	2c	2020-04-16 20:19:03.056197	2020-04-19 08:39:46.565844	0101000020E6100000E1606F62484E05404B72C0AE263B4840	1	21	traverse	\N	1	{}
31	Autoroute du Soleil	2c	2020-04-16 20:19:03.061908	2020-04-19 08:39:46.567456	0101000020E6100000FED7B969334E0540FB04508C2C3B4840	1	19	overhang	\N	1	{}
33	\N	2b	2020-04-16 20:19:03.067215	2020-04-19 08:39:46.570904	0101000020E6100000DC2F9FAC184E05402785798F333B4840	1	17	wall	\N	1	{}
34	\N	2c	2020-04-16 20:19:03.069571	2020-04-19 08:39:46.572651	0101000020E610000064E8D841254E05405B5EB9DE363B4840	1	16	traverse	\N	1	{}
35	\N	1c	2020-04-16 20:19:03.071902	2020-04-19 08:39:46.574613	0101000020E6100000F3AFE595EB4D05403197546D373B4840	1	15	slab	\N	1	{}
37	\N	3a	2020-04-16 20:19:03.077151	2020-04-19 08:39:46.576372	0101000020E6100000A515DF50F84C0540ADA1D45E443B4840	1	12	slab	\N	1	{}
38	\N	2c	2020-04-16 20:19:03.082451	2020-04-19 08:39:46.578063	0101000020E61000009F1EDB32E04C05405D34643C4A3B4840	1	11	wall	\N	1	{}
39	\N	2b	2020-04-16 20:19:03.085051	2020-04-19 08:39:46.579804	0101000020E610000055BFD2F9F04C0540C1C58A1A4C3B4840	1	10	slab	\N	1	{}
42	\N	2a	2020-04-16 20:19:03.092604	2020-04-19 08:39:46.581444	0101000020E6100000C501F4FBFE4D0540A1BFD023463B4840	1	7	traverse	\N	1	{}
36	Le Bistrot	3a	2020-04-16 20:19:03.0744	2020-04-19 08:39:46.584653	0101000020E61000000A302C7FBE4D054059C2DA183B3B4840	1	14	slab	3	1	{}
30	Pseudonyme	2b	2020-04-16 20:19:03.059233	2020-04-19 08:39:46.586214	0101000020E61000002BC0779B374E054022AB5B3D273B4840	1	20	wall	2	1	{}
23	Tintin	2b	2020-04-16 20:19:03.039262	2020-04-19 08:39:46.58961	0101000020E6100000BDC282FB014F054001A5A146213B4840	1	27	wall	3	1	{}
248	La Motte de Grès	2a	2020-05-07 12:44:29.61171	2020-05-07 20:35:25.165508	0101000020E6100000026553AEF02E0440B7B75B9203304840	10	1	slab	\N	2	{}
246	Le Rebord	2c	2020-05-07 12:44:29.557853	2020-05-07 20:35:45.477092	0101000020E610000075931804562E04400000000000304840	10	2	wall	\N	2	{}
80	L'Ex Saut du Jaune	2c	2020-04-16 20:19:03.211104	2020-04-28 13:11:40.329082	0101000020E61000008A3F8A3A734F0540710168942E3B4840	2	8	traverse	\N	1	{}
50	La calandre	3a	2020-04-16 20:19:03.113229	2020-04-28 19:21:14.76474	0101000020E6100000D865F84F37500540B69DB646043B4840	2	42	overhang	\N	1	{risky}
69	Confiance	4a	2020-04-16 20:19:03.17155	2020-04-28 19:24:47.312144	0101000020E61000001EDC9DB5DB4E0540D3D9C9E0283B4840	2	22	slab	6	1	{risky}
60	Imogen	3c	2020-04-16 20:19:03.141151	2020-04-28 19:38:52.771732	0101000020E61000002BC0779B374E05407A1A3048FA3A4840	2	31	wall	5	1	{risky}
49	La Crêpe	4a	2020-04-16 20:19:03.110558	2020-04-28 19:38:52.773941	0101000020E6100000B79BE09BA64F05403F390A10053B4840	2	43	slab	5	1	{risky}
72	Tour d'Eiffel	3b	2020-04-16 20:19:03.188287	2020-04-28 19:38:52.776005	0101000020E61000004BAC8C463E4F054008E753C72A3B4840	2	19	slab	6	1	{risky}
66	L'Arête gauche du Cervin	2c+	2020-04-16 20:19:03.163135	2020-04-28 19:38:52.778354	0101000020E61000006EF8DD74CB4E05408466D7BD153B4840	2	25	slab	6	1	{risky}
247	\N	\N	2020-05-07 12:44:29.607908	2020-05-07 12:44:29.607908	0101000020E610000074B515FBCB2E04406A4E5E6402304840	11	1	other	\N	2	{}
249	\N	\N	2020-05-07 12:44:29.617078	2020-05-07 12:44:29.617078	0101000020E6100000B20E4757E92E04400589EDEE01304840	12	1	other	\N	2	{}
260	Les Petits Pas	3c	2020-05-07 12:44:29.655082	2020-05-07 20:36:01.918002	0101000020E6100000F86C1D1CEC2D04408176871403304840	10	3	traverse	\N	2	{}
261	L'Angle Rond	3a	2020-05-07 12:44:29.658253	2020-05-07 20:36:19.719437	0101000020E610000021EA3E00A92D04409F5BE84A04304840	10	4	slab	\N	2	{}
259	L'Additif	2c	2020-05-07 12:44:29.6514	2020-05-07 20:50:18.323493	0101000020E61000003D98141F9F30044021AE9CBD33304840	10	48	traverse	\N	2	{}
262	\N	\N	2020-05-07 12:44:29.673559	2020-05-07 12:44:29.673559	0101000020E610000054E1CFF0662D044068B27F9E06304840	12	3	other	\N	2	{}
263	\N	\N	2020-05-07 12:44:29.676841	2020-05-07 12:44:29.676841	0101000020E6100000D11F9A79722D04409CBF098508304840	11	2	other	\N	2	{}
43	\N	2b	2020-04-16 20:19:03.09497	2020-04-19 08:39:46.594269	0101000020E6100000E76F4221024E0540B35E0CE5443B4840	1	6	wall	\N	1	{}
44	\N	3a	2020-04-16 20:19:03.097409	2020-04-19 08:39:46.59611	0101000020E610000025C9737D1F4E054083DA6FED443B4840	1	5	slab	\N	1	{}
45	\N	2b	2020-04-16 20:19:03.099817	2020-04-19 08:39:46.597935	0101000020E6100000D6AC33BE2F4E05400DDE57E5423B4840	1	4	overhang	\N	1	{}
46	\N	2c	2020-04-16 20:19:03.102135	2020-04-19 08:39:46.599662	0101000020E6100000C4AF58C3454E05402BF702B3423B4840	1	3	traverse	\N	1	{}
47	\N	2a	2020-04-16 20:19:03.105104	2020-04-19 08:39:46.60163	0101000020E61000008BC1C3B46F4E05404FCDE506433B4840	1	2	slab	\N	1	{}
48	\N	2c	2020-04-16 20:19:03.107744	2020-04-19 08:39:46.603258	0101000020E6100000D520CCED5E4E0540CE8AA8893E3B4840	1	1	traverse	\N	1	{}
51	\N	3b	2020-04-16 20:19:03.116043	2020-04-19 08:39:46.608928	0101000020E6100000CC5F217365500540566133C0053B4840	2	41	overhang	\N	1	{}
52	\N	3b+	2020-04-16 20:19:03.118716	2020-04-19 08:39:46.610765	0101000020E6100000D74D29AF95500540B0AC3429053B4840	2	40	wall	\N	1	{}
53	\N	4a	2020-04-16 20:19:03.121574	2020-04-19 08:39:46.612753	0101000020E610000081E84999D4500540B7D100DE023B4840	2	39	traverse	\N	1	{}
54	\N	3a	2020-04-16 20:19:03.124347	2020-04-19 08:39:46.614451	0101000020E61000005B61FA5E435005405FEE93A3003B4840	2	38	wall	\N	1	{}
55	La cheminée	3b	2020-04-16 20:19:03.127257	2020-04-19 08:39:46.616166	0101000020E610000072E14048165005407A1A3048FA3A4840	2	36	traverse	\N	1	{}
56	\N	3a	2020-04-16 20:19:03.130012	2020-04-19 08:39:46.617782	0101000020E6100000DE74CB0EF14F05407A1A3048FA3A4840	2	35	wall	\N	1	{}
57	Le Tour de Canon	2b	2020-04-16 20:19:03.13278	2020-04-19 08:39:46.619428	0101000020E610000045292158554F05405053CBD6FA3A4840	2	34	wall	\N	1	{}
58	\N	4a	2020-04-16 20:19:03.135732	2020-04-19 08:39:46.621038	0101000020E6100000F65E7CD11E4F054056444DF4F93A4840	2	33	traverse	\N	1	{}
61	\N	3c	2020-04-16 20:19:03.143768	2020-04-19 08:39:46.623174	0101000020E61000002CD8463CD94D05402DCE18E6043B4840	2	30	slab	\N	1	{}
62	\N	3c+	2020-04-16 20:19:03.146353	2020-04-19 08:39:46.625396	0101000020E610000075E5B33C0F4E05407633A31F0D3B4840	2	28	wall	\N	1	{}
63	\N	2c	2020-04-16 20:19:03.152875	2020-04-19 08:39:46.627506	0101000020E61000003D9B559FAB4D0540A54FABE80F3B4840	2	27	wall	\N	1	{}
64	\N	3a	2020-04-16 20:19:03.157965	2020-04-19 08:39:46.629642	0101000020E6100000A3E5400FB54D0540B98AC56F0A3B4840	2	29	slab	\N	1	{}
67	Drambruie	3a	2020-04-16 20:19:03.165587	2020-04-19 08:39:46.631417	0101000020E6100000A1116C5CFF4E0540287FF78E1A3B4840	2	24	wall	\N	1	{}
71	\N	2a	2020-04-16 20:19:03.185163	2020-04-19 08:39:46.633121	0101000020E6100000FC8F4C874E4F0540D862B7CF2A3B4840	2	20	overhang	\N	1	{}
73	\N	2b+	2020-04-16 20:19:03.191173	2020-04-19 08:39:46.634859	0101000020E6100000ADDD76A1B94E0540E4F90CA8373B4840	2	14	wall	\N	1	{}
74	\N	3a	2020-04-16 20:19:03.193952	2020-04-19 08:39:46.636522	0101000020E6100000C3B986191A4F054078431A15383B4840	2	13	wall	\N	1	{}
75	\N	3a+	2020-04-16 20:19:03.196731	2020-04-19 08:39:46.638163	0101000020E610000040BE840A0E4F05402EAA4544313B4840	2	18	overhang	\N	1	{}
76	\N	1a+	2020-04-16 20:19:03.199881	2020-04-19 08:39:46.639891	0101000020E610000084D4EDEC2B4F0540EDBAB722313B4840	2	12	wall	\N	1	{}
78	\N	2c	2020-04-16 20:19:03.20556	2020-04-19 08:39:46.642175	0101000020E6100000C32D1F49494F0540D009A1832E3B4840	2	10	wall	\N	1	{}
79	La Contrabasse	3c+	2020-04-16 20:19:03.208392	2020-04-19 08:39:46.644058	0101000020E6100000D464C6DB4A4F054042B115342D3B4840	2	9	slab	\N	1	{}
81	\N	3c	2020-04-16 20:19:03.213609	2020-04-19 08:39:46.647541	0101000020E6100000A5C00298325005409082A7902B3B4840	2	6	traverse	\N	1	{}
77	Couche-Tard	3a	2020-04-16 20:19:03.202691	2020-04-19 08:39:46.649259	0101000020E6100000950B957F2D4F0540C9B08A37323B4840	2	17	wall	4	1	{}
70	Le Bouchon	3b	2020-04-16 20:19:03.178619	2020-04-19 08:39:46.652559	0101000020E61000000D198F52094F054050C763062A3B4840	2	21	overhang	3	1	{}
68	Ninkenphoop	4b+	2020-04-16 20:19:03.168278	2020-04-19 08:39:46.656365	0101000020E61000004B72C0AE264F0540315D88D51F3B4840	2	23	traverse	4	1	{}
65	Bofinger	3b	2020-04-16 20:19:03.160686	2020-04-19 08:39:46.658391	0101000020E6100000F1B913ECBF4E05402592E865143B4840	2	26	slab	4	1	{}
59	Candide	4a+	2020-04-16 20:19:03.138365	2020-04-19 08:39:46.662436	0101000020E61000000F0F61FC344E0540DFDFA0BDFA3A4840	2	32	overhang	4	1	{}
102	L'Impossible	5a+	2020-04-16 20:19:03.275219	2020-04-28 12:12:13.542338	0101000020E6100000A7E67283A14E0540C55565DF153B4840	3	38	wall	\N	1	{}
88	Le Pilier du Dromadaire	4c	2020-04-16 20:19:03.234423	2020-04-28 19:38:52.780528	0101000020E6100000E449D235934F054061E124CD1F3B4840	3	14	wall	5	1	{risky}
104	Superlative	6b+	2020-04-16 20:19:03.281088	2020-04-28 19:38:52.782557	0101000020E610000008AEF204C24E05405A9F724C163B4840	4	14	slab	6	1	{risky}
101	Le Cervin	4b	2020-04-16 20:19:03.272614	2020-04-28 19:38:52.784439	0101000020E6100000B39AAE27BA4E0540FB96395D163B4840	3	40	slab	6	1	{risky}
118	L'Appuyette	5b	2020-04-16 20:19:03.324845	2020-04-28 19:38:52.786752	0101000020E610000089B3226AA24F0540A71FD4450A3B4840	3	4	slab	5	1	{risky}
86	Le Beaufort	5b	2020-04-16 20:19:03.228394	2020-04-28 19:38:52.788892	0101000020E6100000782AE09EE74F054030293E3E213B4840	3	12	overhang	5	1	{risky}
267	Le Flop	2a+	2020-05-07 12:44:29.690084	2020-05-07 20:37:00.899985	0101000020E6100000DCF5D214012E0440D976DA1A11304840	10	6	wall	\N	2	{}
265	\N	\N	2020-05-07 12:44:29.683406	2020-05-07 12:44:29.683406	0101000020E6100000A54FABE80F2D0440DC12B9E00C304840	12	4	other	\N	2	{}
266	\N	\N	2020-05-07 12:44:29.6869	2020-05-07 12:44:29.6869	0101000020E61000002D08E57D1C2D044011548D5E0D304840	11	3	other	\N	2	{}
270	\N	\N	2020-05-07 12:44:29.699491	2020-05-07 12:44:29.699491	0101000020E6100000ADA3AA09A22E04407E8FFAEB15304840	12	5	other	\N	2	{}
273	\N	\N	2020-05-07 12:44:29.710103	2020-05-07 12:44:29.710103	0101000020E6100000B3EC4960732E04401EA4A7C821304840	12	6	other	\N	2	{}
274	\N	\N	2020-05-07 12:44:29.713637	2020-05-07 12:44:29.713637	0101000020E610000085B2F0F5B52E04406AA510C825304840	11	5	other	\N	2	{}
275	\N	\N	2020-05-07 12:44:29.717511	2020-05-07 12:44:29.717511	0101000020E610000058CA32C4B12E044005E09F5225304840	12	7	other	\N	2	{}
276	\N	\N	2020-05-07 12:44:29.72365	2020-05-07 12:44:29.72365	0101000020E6100000AEBB79AA432E04401BD47E6B27304840	11	6	other	\N	2	{}
278	\N	\N	2020-05-07 12:44:29.739906	2020-05-07 12:44:29.739906	0101000020E6100000034356B77A2E0440EAE74D452A304840	11	7	other	\N	2	{}
282	\N	\N	2020-05-07 12:44:29.754642	2020-05-07 12:44:29.754642	0101000020E6100000FCA71B28F02E0440C44142942F304840	11	11	other	\N	2	{}
283	\N	\N	2020-05-07 12:44:29.758001	2020-05-07 12:44:29.758001	0101000020E61000005DFB027AE12E0440D99942E735304840	11	13	other	\N	2	{}
285	\N	\N	2020-05-07 12:44:29.764821	2020-05-07 12:44:29.764821	0101000020E61000003A75E5B33C2F044028D3687231304840	11	14	other	\N	2	{}
89	La Queue du Dromadaire	4b+	2020-04-16 20:19:03.23842	2020-04-19 08:39:46.696921	0101000020E61000008F705AF0A24F0540E4BF4010203B4840	3	13	wall	4	1	{}
100	Le French Cancan	4c	2020-04-16 20:19:03.269684	2020-04-19 08:39:46.70669	0101000020E61000001E166A4DF34E05404277499C153B4840	3	36	wall	3	1	{}
109	Le Smig	6a+	2020-04-16 20:19:03.295059	2020-04-19 08:39:46.708912	0101000020E61000008B6F287CB64E05404F594DD7133B4840	4	13	wall	4	1	{}
103	Le Jeu de Go	5a+	2020-04-16 20:19:03.278128	2020-04-19 08:39:46.710711	0101000020E61000001FA2D11DC44E05401327F73B143B4840	3	39	wall	4	1	{}
114	Le dévers	4b	2020-04-16 20:19:03.312006	2020-04-19 08:39:46.715737	0101000020E6100000070ABC934F4F0540467BBC900E3B4840	3	7	overhang	3	1	{}
117	Le Bloc	5b	2020-04-16 20:19:03.321877	2020-04-19 08:39:46.722963	0101000020E610000072F90FE9B74F0540BE13B35E0C3B4840	3	5	wall	4	1	{}
115	Le Talon d'Achille	6a+	2020-04-16 20:19:03.315145	2020-04-19 08:39:46.725516	0101000020E61000001D386744694F05401D1CEC4D0C3B4840	4	3	wall	3	1	{}
111	Presse Citron	6a	2020-04-16 20:19:03.301355	2020-04-19 08:39:46.730037	0101000020E6100000A4AB74779D4D0540425A63D0093B4840	4	8	wall	3	1	{}
110	Jets Interdits	6a+	2020-04-16 20:19:03.29833	2020-04-19 08:39:46.731759	0101000020E61000003221E692AA4D0540AE105663093B4840	4	7	wall	3	1	{}
84	La Folklorique	2a	2020-04-16 20:19:03.222079	2020-04-19 08:39:46.666038	0101000020E61000002C616D8C9D500540A47213B5343B4840	2	3	traverse	\N	1	{}
85	\N	3a	2020-04-16 20:19:03.225198	2020-04-19 08:39:46.667673	0101000020E610000098A25C1ABF500540A9FB00A4363B4840	2	2	traverse	\N	1	{}
87	L'Ex-Souche	3c+	2020-04-16 20:19:03.231431	2020-04-19 08:39:46.669285	0101000020E61000005073F222135005407FFACF9A1F3B4840	3	11	wall	\N	1	{}
90	Le Prétoire	4c	2020-04-16 20:19:03.241177	2020-04-19 08:39:46.675825	0101000020E6100000F702B342914E05404260E5D0223B4840	3	31	wall	\N	1	{}
94	La Norma	3b	2020-04-16 20:19:03.25223	2020-04-19 08:39:46.677987	0101000020E6100000D4B66114044F054008CA6DFB1E3B4840	3	33	wall	\N	1	{}
95	L'Imprévue	5a+	2020-04-16 20:19:03.255305	2020-04-19 08:39:46.680235	0101000020E6100000A67C08AA464F054033F9669B1B3B4840	3	34	wall	\N	1	{}
96	La Cachée	4c	2020-04-16 20:19:03.258264	2020-04-19 08:39:46.68221	0101000020E6100000856055BDFC4E054052465C001A3B4840	3	35	wall	\N	1	{}
105	Le Rouge et le Noir	5b+	2020-04-16 20:19:03.28409	2020-04-19 08:39:46.685583	0101000020E61000009983A0A3554D0540BDDF68C70D3B4840	4	12	wall	\N	1	{}
106	Le Nain Jaune	5c+	2020-04-16 20:19:03.286851	2020-04-19 08:39:46.687359	0101000020E6100000E3E2A8DC444D05402ACAA5F10B3B4840	4	11	wall	\N	1	{}
107	Adrénaline	6a	2020-04-16 20:19:03.289388	2020-04-19 08:39:46.689059	0101000020E6100000E96514CB2D4D0540A7EB89AE0B3B4840	4	10	overhang	\N	1	{}
108	Coup de Poker	5c	2020-04-16 20:19:03.292023	2020-04-19 08:39:46.691213	0101000020E61000002D944C4EED4C05401E5036E50A3B4840	4	9	wall	\N	1	{}
91	La Fédérale	5a+	2020-04-16 20:19:03.243833	2020-04-19 08:39:46.693411	0101000020E6100000A2293BFDA04E05407EC68503213B4840	3	32	wall	3	1	{}
93	Le Whist	5c	2020-04-16 20:19:03.249386	2020-04-19 08:39:46.695185	0101000020E610000002D9EBDD1F4F05409622F94A203B4840	4	17	wall	4	1	{}
97	Le Sphinx (droite)	5c+	2020-04-16 20:19:03.261062	2020-04-19 08:39:46.701895	0101000020E61000004563EDEF6C4F0540B9A7AB3B163B4840	3	8	wall	4	1	{}
98	La Golgotha (gauche)	5b+	2020-04-16 20:19:03.26406	2020-04-19 08:39:46.703487	0101000020E6100000EA58A5F44C4F0540E36E10AD153B4840	3	9	wall	4	1	{}
99	Le Serpent	4c	2020-04-16 20:19:03.266975	2020-04-19 08:39:46.705025	0101000020E61000006EE00ED4294F05400D36751E153B4840	3	37	traverse	3	1	{}
112	L'Ancien	6a	2020-04-16 20:19:03.30446	2020-04-19 08:39:46.71733	0101000020E61000005281936DE04E0540A2629CBF093B4840	4	5	overhang	4	1	{}
113	Dure Limite	6b	2020-04-16 20:19:03.307868	2020-04-19 08:39:46.719169	0101000020E61000000DDFC2BAF14E0540D1E638B7093B4840	4	4	overhang	4	1	{}
116	L'Atrappe-Mouche	5a+	2020-04-16 20:19:03.318314	2020-04-19 08:39:46.720886	0101000020E61000004ACE893DB44F0540A583F57F0E3B4840	3	6	wall	4	1	{}
119	Le Pied Levé	4a	2020-04-16 20:19:03.327877	2020-04-28 19:38:52.790903	0101000020E610000046EF54C03D4F0540A4FE7A85053B4840	3	2	overhang	6	1	{risky}
122	Force G	6a+	2020-04-16 20:19:03.336502	2020-04-28 19:38:52.792704	0101000020E6100000BD70E7C2484F054016A6EF35043B4840	4	1	wall	6	1	{risky}
126	Le Cap Gap	5a	2020-04-16 20:19:03.34717	2020-04-28 19:38:52.794544	0101000020E610000001FBE8D4954F054075AE2825043B4840	3	1	slab	5	1	{risky}
171	L'Abîme	4a+	2020-04-16 20:19:03.475224	2020-04-28 19:38:52.796364	0101000020E61000006571FF91E9500540670C7382363B4840	5	1	wall	5	1	{risky}
195	Le Tabac	3a	2020-04-16 20:19:03.547996	2020-04-28 19:38:52.797941	0101000020E61000001BD82AC1E250054097900F7A363B4840	2	1	wall	5	1	{risky}
287	\N	\N	2020-05-07 12:44:29.771544	2020-05-07 12:44:29.771544	0101000020E6100000B779E3A4302F0440E38E37F92D304840	11	10	other	\N	2	{}
288	\N	\N	2020-05-07 12:44:29.774914	2020-05-07 12:44:29.774914	0101000020E610000079CE16105A2F0440247EC51A2E304840	11	15	other	\N	2	{}
286	L'Embarras	3a	2020-05-07 12:44:29.768207	2020-05-07 20:51:05.334291	0101000020E610000090882991442F044018D00B772E304840	10	50	other	\N	2	{}
290	\N	\N	2020-05-07 12:44:29.781526	2020-05-07 12:44:29.781526	0101000020E6100000E527D53E1D2F04408AABCABE2B304840	12	8	other	\N	2	{}
291	\N	\N	2020-05-07 12:44:29.78503	2020-05-07 12:44:29.78503	0101000020E6100000F1A1444B1E2F0440D84812842B304840	11	9	other	\N	2	{}
294	\N	\N	2020-05-07 12:44:29.806067	2020-05-07 12:44:29.806067	0101000020E610000051DD5CFC6D2F04407383A10E2B304840	12	10	other	\N	2	{}
295	\N	\N	2020-05-07 12:44:29.810017	2020-05-07 12:44:29.810017	0101000020E61000009B3C65355D2F04403E42CD902A304840	12	9	other	\N	2	{}
296	\N	\N	2020-05-07 12:44:29.813464	2020-05-07 12:44:29.813464	0101000020E61000009B3C65355D2F04401A6CEA3C2A304840	11	8	other	\N	2	{}
297	\N	\N	2020-05-07 12:44:29.817348	2020-05-07 12:44:29.817348	0101000020E61000000C3B8C497F2F04405B5B785E2A304840	11	16	other	\N	2	{}
298	\N	\N	2020-05-07 12:44:29.820931	2020-05-07 12:44:29.820931	0101000020E6100000C7BAB88D06300440DDD1FF722D304840	11	17	other	\N	2	{}
299	\N	\N	2020-05-07 12:44:29.82442	2020-05-07 12:44:29.82442	0101000020E61000005BB39597FC2F04405AF3E32F2D304840	12	11	other	\N	2	{}
302	\N	\N	2020-05-07 12:44:29.834877	2020-05-07 12:44:29.834877	0101000020E61000003FC8B260E22F04400EBE30992A304840	11	18	other	\N	2	{}
130	Nocturne	3c	2020-04-16 20:19:03.358913	2020-04-19 08:39:46.759944	0101000020E6100000986BD102B44D0540ED0BE8853B3B4840	5	32	wall	3	1	{}
132	Saillie d'Esprit	6b+	2020-04-16 20:19:03.363868	2020-04-19 08:39:46.762167	0101000020E6100000B49080D1E54D05402FFB75A73B3B4840	4	42	wall	3	1	{}
127	Faute de Frappe	5c	2020-04-16 20:19:03.350497	2020-04-19 08:39:46.764103	0101000020E610000040BE840A0E4F0540A73CBA11163B4840	4	15	wall	3	1	{}
303	\N	\N	2020-05-07 12:44:29.838547	2020-05-07 12:44:29.838547	0101000020E61000006170CD1DFD2F0440CDCEA2772A304840	12	12	other	\N	2	{}
308	\N	\N	2020-05-07 12:44:29.876089	2020-05-07 12:44:29.876089	0101000020E6100000158F8B6A1131044086730D3334304840	12	13	other	\N	2	{}
120	Scarlatine	6b	2020-04-16 20:19:03.33075	2020-04-19 08:39:46.733428	0101000020E610000040321D3A3D4F0540384888F2053B4840	4	2	slab	\N	1	{}
121	Le Bombé	5a	2020-04-16 20:19:03.333627	2020-04-19 08:39:46.735074	0101000020E6100000B7B3AF3C484F05406E895C70063B4840	3	3	overhang	\N	1	{}
123	L'Intermédiaire	4a	2020-04-16 20:19:03.339222	2020-04-19 08:39:46.73668	0101000020E6100000DF52CE177B4F0540E2067C7E183B4840	3	10	wall	\N	1	{}
125	\N	3c	2020-04-16 20:19:03.344473	2020-04-19 08:39:46.73835	0101000020E6100000711B0DE02D500540FB90B75CFD3A4840	2	37	wall	\N	1	{}
128	Poésies	4a	2020-04-16 20:19:03.353357	2020-04-19 08:39:46.740221	0101000020E61000002D7C7DAD4B4D05409C6A2DCC423B4840	5	31	slab	\N	1	{}
131	Macadam	6a	2020-04-16 20:19:03.361354	2020-04-19 08:39:46.742478	0101000020E6100000CBD6FA22A14D05404D1421753B3B4840	4	41	wall	\N	1	{}
133	L'Araignée	6a	2020-04-16 20:19:03.366761	2020-04-19 08:39:46.744232	0101000020E61000001FBAA0BE654E05409F573CF5483B4840	4	38	overhang	\N	1	{}
138	Quatrain	4a+	2020-04-16 20:19:03.381005	2020-04-19 08:39:46.749019	0101000020E6100000BF2CEDD45C4E05406D1ADB6B413B4840	5	27	wall	4	1	{}
135	La Dame de Pique	5c	2020-04-16 20:19:03.37264	2020-04-19 08:39:46.75059	0101000020E61000002046088F364E05400ADAE4F0493B4840	4	39	slab	4	1	{}
134	Le Pont Mirabeau	5a	2020-04-16 20:19:03.369801	2020-04-19 08:39:46.75218	0101000020E61000008C4D2B85404E05407590D783493B4840	5	28	slab	4	1	{}
136	Hôtels	4b	2020-04-16 20:19:03.375385	2020-04-19 08:39:46.753749	0101000020E610000080812040864E054025068195433B4840	5	29	wall	4	1	{}
137	Le Pot de Fer	6b	2020-04-16 20:19:03.378151	2020-04-19 08:39:46.755445	0101000020E6100000F7C8E6AA794E0540D76839D0433B4840	4	40	overhang	4	1	{}
129	Contemplations	5b	2020-04-16 20:19:03.356315	2020-04-19 08:39:46.757373	0101000020E61000007D5EF1D4234D054001309E41433B4840	5	30	wall	3	1	{}
124	Quintessence	5c	2020-04-16 20:19:03.341645	2020-04-19 08:39:46.770718	0101000020E610000042CC2555DB4D0540130A1170083B4840	4	6	slab	4	1	{}
312	\N	\N	2020-05-07 12:44:29.890614	2020-05-07 12:44:29.890614	0101000020E61000008CBE823463310440B9C7D2872E304840	12	14	other	\N	2	{}
314	\N	\N	2020-05-07 12:44:29.897593	2020-05-07 12:44:29.897593	0101000020E6100000F2086EA46C310440B43EE5982C304840	11	25	other	\N	2	{}
315	\N	\N	2020-05-07 12:44:29.901467	2020-05-07 12:44:29.901467	0101000020E61000000859164CFC310440287CB60E0E304840	11	24	other	\N	2	{}
316	\N	\N	2020-05-07 12:44:29.905102	2020-05-07 12:44:29.905102	0101000020E610000008ABB184B53104405A9C31CC09304840	11	23	other	\N	2	{}
317	\N	\N	2020-05-07 12:44:29.908576	2020-05-07 12:44:29.908576	0101000020E61000006571FF91E9300440664AEB6F09304840	11	20	other	\N	2	{}
318	\N	\N	2020-05-07 12:44:29.911999	2020-05-07 12:44:29.911999	0101000020E6100000DC2C5E2C0C310440DEAE97A608304840	11	22	other	\N	2	{}
230	Lévitation	7a+	2020-04-16 20:19:03.648415	2020-04-28 15:19:59.708339	0101000020E6100000EF74E789E74C054039F06AB9333B4840	6	10	roof	4	1	{sit_start}
220	Cadeau du Vent	7b	2020-04-16 20:19:03.620885	2020-04-28 19:38:52.799596	0101000020E6100000F3380CE6AF5005407286E28E373B4840	6	1	overhang	5	1	{risky}
82	Le Dalle Bleu	4c	2020-04-16 20:19:03.216232	2020-04-28 19:38:52.801185	0101000020E61000001C42959A3D5005402A55A2EC2D3B4840	2	5	slab	5	1	{risky}
319	\N	\N	2020-05-07 12:44:29.915721	2020-05-07 12:44:29.915721	0101000020E610000015C9570229310440C9224DBC03304840	11	21	other	\N	2	{}
320	L'Autorisation	2c	2020-05-07 12:44:29.919458	2020-05-07 20:49:59.038242	0101000020E6100000CA8B4CC0AF31044091B932A836304840	10	47	slab	\N	2	{}
83	Le Butte	3b	2020-04-16 20:19:03.219112	2020-04-19 08:39:46.77502	0101000020E6100000B5DFDA8992500540F7CC9200353B4840	2	4	slab	3	1	{}
41	Champagne Frappé	2a	2020-04-16 20:19:03.090124	2020-04-19 08:39:46.778507	0101000020E6100000ED444948A44D054088635DDC463B4840	1	8	slab	4	1	{}
92	Le Bossu	6b	2020-04-16 20:19:03.246488	2020-04-19 08:39:46.781706	0101000020E610000057B26323104F054084B70721203B4840	4	16	overhang	4	1	{}
323	\N	\N	2020-05-07 12:44:29.939199	2020-05-07 12:44:29.939199	0101000020E61000000611A9691733044070D05E7D3C304840	12	15	other	\N	2	{}
325	\N	\N	2020-05-07 12:44:29.946172	2020-05-07 12:44:29.946172	0101000020E61000008E8F16670C330440E7340BB43B304840	11	26	other	\N	2	{}
330	\N	\N	2020-05-07 12:44:29.965474	2020-05-07 12:44:29.965474	0101000020E6100000D732198EE733044034BBEEAD48304840	12	17	other	\N	2	{}
335	\N	\N	2020-05-07 12:44:29.98695	2020-05-07 12:44:29.98695	0101000020E6100000766B990CC73304408A027D224F304840	12	18	other	\N	2	{}
336	\N	\N	2020-05-07 12:44:29.990595	2020-05-07 12:44:29.990595	0101000020E61000007CB4386398330440C500892650304840	11	28	other	\N	2	{}
337	\N	\N	2020-05-07 12:44:29.994277	2020-05-07 12:44:29.994277	0101000020E61000003ECF9F36AA330440DD5CFC6D4F304840	12	19	other	\N	2	{}
339	\N	\N	2020-05-07 12:44:30.008678	2020-05-07 12:44:30.008678	0101000020E61000003E5B07077B3304408445459C4E304840	12	20	other	\N	2	{}
340	\N	\N	2020-05-07 12:44:30.012221	2020-05-07 12:44:30.012221	0101000020E61000008237A45181330440A25EF0694E304840	11	29	other	\N	2	{}
343	\N	\N	2020-05-07 12:44:30.023209	2020-05-07 12:44:30.023209	0101000020E6100000001AA54BFF3204406E5166834C304840	12	21	other	\N	2	{}
345	\N	\N	2020-05-07 12:44:30.030029	2020-05-07 12:44:30.030029	0101000020E6100000D331E719FB320440C634D3BD4E304840	12	22	other	\N	2	{}
349	\N	\N	2020-05-07 12:44:30.04424	2020-05-07 12:44:30.04424	0101000020E6100000F52B9D0FCF3204403674B33F50304840	12	46	other	\N	2	{}
350	\N	\N	2020-05-07 12:44:30.047885	2020-05-07 12:44:30.047885	0101000020E610000095D8B5BDDD320440F584251E50304840	12	23	other	\N	2	{}
351	\N	\N	2020-05-07 12:44:30.051749	2020-05-07 12:44:30.051749	0101000020E61000009A5B21ACC6320440CBBDC0AC50304840	11	30	other	\N	2	{}
353	\N	\N	2020-05-07 12:44:30.058978	2020-05-07 12:44:30.058978	0101000020E61000000729780AB93204404777103B53304840	12	45	other	\N	2	{}
354	\N	\N	2020-05-07 12:44:30.070128	2020-05-07 12:44:30.070128	0101000020E61000005CC823B8913204407B849A2155304840	12	44	other	\N	2	{}
356	\N	\N	2020-05-07 12:44:30.077385	2020-05-07 12:44:30.077385	0101000020E610000095B6B8C6673204409DBE9EAF59304840	12	43	other	\N	2	{}
357	\N	\N	2020-05-07 12:44:30.081233	2020-05-07 12:44:30.081233	0101000020E61000001BD5E940D6330440577A6D3656304840	12	24	other	\N	2	{}
358	\N	\N	2020-05-07 12:44:30.084878	2020-05-07 12:44:30.084878	0101000020E61000004F92AE997C3304407FA5F3E159304840	12	25	other	\N	2	{}
359	\N	\N	2020-05-07 12:44:30.08839	2020-05-07 12:44:30.08839	0101000020E6100000003CA24275330440115322895E304840	12	42	other	\N	2	{}
360	\N	\N	2020-05-07 12:44:30.0917	2020-05-07 12:44:30.0917	0101000020E6100000B1C398F4F73204407EAB75E272304840	12	41	other	\N	2	{}
361	\N	\N	2020-05-07 12:44:30.095222	2020-05-07 12:44:30.095222	0101000020E610000094FAB2B4533304406EF9484A7A304840	11	33	other	\N	2	{}
362	\N	\N	2020-05-07 12:44:30.098802	2020-05-07 12:44:30.098802	0101000020E6100000CD22145B41330440683C11C479304840	12	39	other	\N	2	{}
363	\N	\N	2020-05-07 12:44:30.104679	2020-05-07 12:44:30.104679	0101000020E610000054C37E4FAC330440C153C8957A304840	11	34	other	\N	2	{}
364	\N	\N	2020-05-07 12:44:30.108294	2020-05-07 12:44:30.108294	0101000020E6100000999F1B9AB2330440683C11C479304840	12	38	other	\N	2	{}
365	\N	\N	2020-05-07 12:44:30.112054	2020-05-07 12:44:30.112054	0101000020E61000008BDD3EABCC340440DA9255116E304840	12	35	other	\N	2	{}
366	\N	\N	2020-05-07 12:44:30.115411	2020-05-07 12:44:30.115411	0101000020E610000031992A189534044061FA5E4370304840	12	36	other	\N	2	{}
367	\N	\N	2020-05-07 12:44:30.119058	2020-05-07 12:44:30.119058	0101000020E6100000FEB968C878340440BADDCB7D72304840	12	37	other	\N	2	{}
368	\N	\N	2020-05-07 12:44:30.122535	2020-05-07 12:44:30.122535	0101000020E6100000425C397B6734044037FFAF3A72304840	11	36	other	\N	2	{}
369	\N	\N	2020-05-07 12:44:30.126254	2020-05-07 12:44:30.126254	0101000020E6100000A33B889D293404403DF0315871304840	11	35	other	\N	2	{}
370	\N	\N	2020-05-07 12:44:30.137125	2020-05-07 12:44:30.137125	0101000020E6100000ED9A90D618340440A31D37FC6E304840	12	27	other	\N	2	{}
371	\N	\N	2020-05-07 12:44:30.141242	2020-05-07 12:44:30.141242	0101000020E61000007CD6355A0E340440F1BA7EC16E304840	11	32	other	\N	2	{}
372	\N	\N	2020-05-07 12:44:30.144909	2020-05-07 12:44:30.144909	0101000020E6100000D732198EE7330440AA0EB9196E304840	12	26	other	\N	2	{}
373	\N	\N	2020-05-07 12:44:30.148345	2020-05-07 12:44:30.148345	0101000020E6100000362383DC453804405265187783304840	12	30	other	\N	2	{}
374	\N	\N	2020-05-07 12:44:30.152936	2020-05-07 12:44:30.152936	0101000020E6100000378DEDB5A03704404D10751F80304840	12	31	other	\N	2	{}
375	\N	\N	2020-05-07 12:44:30.156365	2020-05-07 12:44:30.156365	0101000020E610000092AF0452623704407C60C77F81304840	12	32	other	\N	2	{}
376	\N	\N	2020-05-07 12:44:30.159825	2020-05-07 12:44:30.159825	0101000020E61000000518963FDF3604400798F90E7E304840	12	34	other	\N	2	{}
377	\N	\N	2020-05-07 12:44:30.163254	2020-05-07 12:44:30.163254	0101000020E61000008D4468041B3704400798F90E7E304840	12	33	other	\N	2	{}
378	\N	\N	2020-05-07 12:44:30.166774	2020-05-07 12:44:30.166774	0101000020E61000009E077767ED3604408BDEA9807B304840	11	37	other	\N	2	{}
379	\N	\N	2020-05-07 12:44:30.170205	2020-05-07 12:44:30.170205	0101000020E6100000CCEF3499F13604402D0ABB287A304840	12	29	other	\N	2	{}
380	\N	\N	2020-05-07 12:44:30.173697	2020-05-07 12:44:30.173697	0101000020E61000008813984EEB360440BCCADAA678304840	12	28	other	\N	2	{}
250	blue 16	\N	2020-05-07 12:44:29.621304	2020-05-07 20:26:12.165475	0101000020E6100000DEAB5626FC32044087F8872D3D304840	12	16	other	\N	2	{}
251	blue 2	\N	2020-05-07 12:44:29.624968	2020-05-07 20:26:12.182739	0101000020E6100000F29716F5492E04409C6ED921FE2F4840	12	2	other	\N	2	{}
252	blue 40	\N	2020-05-07 12:44:29.628237	2020-05-07 20:26:12.188148	0101000020E610000056F31C91EF320440B875374F75304840	12	40	other	\N	2	{}
253	red 12	\N	2020-05-07 12:44:29.631362	2020-05-07 20:26:12.192523	0101000020E6100000350A4966F52E0440ABB184B531304840	11	12	other	\N	2	{}
254	red 19	\N	2020-05-07 12:44:29.634962	2020-05-07 20:26:12.197879	0101000020E6100000AB09A2EE0330044001A260C614304840	11	19	other	\N	2	{}
255	red 27	\N	2020-05-07 12:44:29.638657	2020-05-07 20:26:12.203567	0101000020E61000001618B2BAD5330440C904FC1A49304840	11	27	other	\N	2	{}
256	red 31	\N	2020-05-07 12:44:29.641858	2020-05-07 20:26:12.208806	0101000020E61000006211C30E63320440B682A62556304840	11	31	other	\N	2	{}
257	red 38	\N	2020-05-07 12:44:29.64496	2020-05-07 20:26:12.21499	0101000020E610000096766A2E373804406F7EC34483304840	11	38	other	\N	2	{}
258	red 4	\N	2020-05-07 12:44:29.647939	2020-05-07 20:26:12.222687	0101000020E6100000CAA65CE15D2E04403CBD529621304840	11	4	other	\N	2	{}
155	Cadavre Exquis	4c	2020-04-16 20:19:03.426854	2020-04-19 08:39:46.78878	0101000020E6100000D464C6DB4A4F0540D2C26515363B4840	5	18	slab	4	1	{}
156	Paysage	3b	2020-04-16 20:19:03.429431	2020-04-19 08:39:46.790668	0101000020E6100000C9B08A37324F0540AFEC82C1353B4840	5	19	wall	4	1	{}
154	Mariage de Figaro	3b+	2020-04-16 20:19:03.424206	2020-04-19 08:39:46.792907	0101000020E6100000904E5DF92C4F0540AFEC82C1353B4840	2	16	traverse	4	1	{}
149	Les Temps Modernes	6b	2020-04-16 20:19:03.411405	2020-04-19 08:39:46.81567	0101000020E610000095456117454F05401C5C3AE63C3B4840	4	29	traverse	\N	1	{}
150	Le Chou-Fleur	4a	2020-04-16 20:19:03.413927	2020-04-19 08:39:46.817268	0101000020E6100000622CD32F114F05403BA92F4B3B3B4840	5	22	wall	\N	1	{}
152	Prison	2b	2020-04-16 20:19:03.419142	2020-04-19 08:39:46.818838	0101000020E6100000B83F170D194F054008043A93363B4840	2	15	wall	\N	1	{}
159	Complainte	3b	2020-04-16 20:19:03.437792	2020-04-19 08:39:46.820628	0101000020E6100000D2A8C0C9365005408F37F92D3A3B4840	5	5	slab	\N	1	{}
160	L'Hiver	4b+	2020-04-16 20:19:03.441015	2020-04-19 08:39:46.822364	0101000020E610000088F71C588E5005408DCF64FF3C3B4840	5	4	overhang	\N	1	{}
148	Pyramide	5c	2020-04-16 20:19:03.408707	2020-04-28 19:26:53.275014	0101000020E6100000BC92E4B9BE4F05401AC05B20413B4840	4	36	slab	\N	1	{risky}
140	Chanson d'Automne	4a	2020-04-16 20:19:03.387309	2020-04-28 19:38:52.80295	0101000020E610000086048C2E6F4E0540ECA353573E3B4840	5	23	wall	5	1	{risky}
141	Bateau Ivre	4b+	2020-04-16 20:19:03.390152	2020-04-28 19:38:52.804997	0101000020E61000004128EFE3684E05400F46EC13403B4840	5	24	wall	5	1	{risky}
157	Ode	4b+	2020-04-16 20:19:03.432134	2020-04-19 08:39:46.783797	0101000020E6100000F5A276BF0A50054084BD8921393B4840	5	7	wall	3	1	{}
161	Puzzle	5c	2020-04-16 20:19:03.444224	2020-04-19 08:39:46.78548	0101000020E6100000F4FE3F4E9850054070EA03C93B3B4840	4	28	overhang	4	1	{}
158	Ballade	4a+	2020-04-16 20:19:03.434597	2020-04-19 08:39:46.787091	0101000020E6100000EF1F0BD1215005401EC4CE143A3B4840	5	6	wall	4	1	{}
151	L'Amour du Mensonge	4c	2020-04-16 20:19:03.416527	2020-04-19 08:39:46.794655	0101000020E6100000C3B986191A4F0540F0DB10E3353B4840	5	20	wall	4	1	{}
153	Prose	4c	2020-04-16 20:19:03.421549	2020-04-19 08:39:46.796269	0101000020E6100000B8054B75014F054097900F7A363B4840	5	21	wall	4	1	{}
264	La Bête de Somme	2b+	2020-05-07 12:44:29.680027	2020-05-07 20:36:43.553635	0101000020E6100000990F0874262D0440778192020B304840	10	5	wall	\N	2	{}
271	Le Livret	3a	2020-05-07 12:44:29.703409	2020-05-07 20:38:07.819761	0101000020E6100000B49080D1E52D04401A4F04711E304840	10	9	slab	\N	2	{}
309	La Fuite en Amont	3b	2020-05-07 12:44:29.879339	2020-05-07 20:42:21.099323	0101000020E6100000BABE0F07093104406F4BE48233304840	10	23	traverse	\N	2	{}
322	Le Bourru	2b	2020-05-07 12:44:29.926841	2020-05-07 20:43:28.834576	0101000020E6100000D9B45208E4320440A51133FB3C304840	10	27	wall	\N	2	{}
324	Le Boisseau	2b+	2020-05-07 12:44:29.94265	2020-05-07 20:43:44.990199	0101000020E61000006C21C841093304401D76DF313C304840	10	28	other	\N	2	{}
342	La Placette	3a	2020-05-07 12:44:30.019746	2020-05-07 20:46:40.143874	0101000020E61000001C3F541A313304404356B77A4E304840	10	37	other	\N	2	{}
321	Le Vigoureux	2b	2020-05-07 12:44:29.923071	2020-05-07 20:49:43.513227	0101000020E6100000E63C635FB23104407DE6AC4F39304840	10	46	traverse	\N	2	{}
143	Le Pion Cassé	5a	2020-04-16 20:19:03.39548	2020-04-19 08:39:46.797986	0101000020E6100000C345EEE9EA4E0540EB6F09C03F3B4840	4	32	wall	4	1	{}
144	L'Astragale	6b	2020-04-16 20:19:03.39802	2020-04-19 08:39:46.799612	0101000020E6100000A1116C5CFF4E05404487C091403B4840	4	33	wall	4	1	{}
145	Caprice	6a	2020-04-16 20:19:03.400619	2020-04-19 08:39:46.801198	0101000020E610000085268925E54E05401AC05B20413B4840	4	34	wall	4	1	{}
139	Le Sylphe	5a	2020-04-16 20:19:03.384731	2020-04-19 08:39:46.806531	0101000020E6100000F8544E7B4A4E05402C2B4D4A413B4840	5	26	wall	4	1	{}
147	L'Oeuf de Colombe	6a	2020-04-16 20:19:03.405965	2020-04-19 08:39:46.808493	0101000020E610000085B2F0F5B54E05401503249A403B4840	4	31	wall	3	1	{}
142	Il va Neiger	3c	2020-04-16 20:19:03.392806	2020-04-19 08:39:46.810241	0101000020E6100000FD1186014B4E05406891ED7C3F3B4840	5	25	wall	\N	1	{}
146	La Longue Marche	6b	2020-04-16 20:19:03.40327	2020-04-19 08:39:46.811883	0101000020E61000007F2F8507CD4E0540C1745AB7413B4840	4	35	traverse	\N	1	{}
175	Fantaisie	4a	2020-04-16 20:19:03.486351	2020-04-28 13:10:18.084687	0101000020E61000002CD505BCCC50054048BF7D1D383B4840	5	D	wall	4	1	{}
180	La Soprano	4a	2020-04-16 20:19:03.500527	2020-04-28 19:21:57.359481	0101000020E6100000B24813EF004F054050C763062A3B4840	3	18	overhang	5	1	{risky}
163	La Contralto	5a	2020-04-16 20:19:03.451859	2020-04-28 19:38:52.807974	0101000020E61000008ACBF10A444F0540F67B629D2A3B4840	3	20	wall	6	1	{risky}
183	Chlorophylle	6b	2020-04-16 20:19:03.508384	2020-04-28 19:38:52.810487	0101000020E6100000191F662FDB4E054045813E91273B4840	4	20	slab	6	1	{risky}
182	Le Cheval d'Arçon	5b+	2020-04-16 20:19:03.505746	2020-04-28 19:38:52.812368	0101000020E61000007F69519FE44E054092EA3BBF283B4840	3	17	wall	6	1	{risky}
184	La Vieille	5c+	2020-04-16 20:19:03.511011	2020-04-28 19:38:52.81392	0101000020E6100000E0BC38F1D54E0540035E66D8283B4840	4	21	wall	6	1	{risky}
162	Le Dé	5b	2020-04-16 20:19:03.447369	2020-04-28 19:38:52.815595	0101000020E6100000193735D07C4E054081ED60C43E3B4840	4	30	overhang	5	1	{risky}
173	La Belle Vieille	3c	2020-04-16 20:19:03.48083	2020-04-28 19:38:52.817438	0101000020E6100000B55373B9C15005405B5EB9DE363B4840	5	3	wall	5	1	{risky}
174	Solitude	4a	2020-04-16 20:19:03.483646	2020-04-28 19:38:52.819725	0101000020E6100000D1048A58C4500540DE3CD521373B4840	5	2	wall	5	1	{risky}
172	La Prothèse	6a+	2020-04-16 20:19:03.478131	2020-04-28 19:38:52.82173	0101000020E6100000494C50C3B7500540909F8D5C373B4840	4	27	wall	5	1	{risky}
166	La Bendix	5b+	2020-04-16 20:19:03.461333	2020-04-28 19:38:52.823527	0101000020E6100000CEE15AED614F0540A77686A92D3B4840	3	21	wall	5	1	{risky}
381	La Sortie du Tunnel	2a+	2020-05-07 20:11:37.743528	2020-05-07 20:27:42.01377	0101000020E61000006EF8DD74CB2E0440ABB184B531304840	10	51	traverse	\N	2	{}
382	L'Embarcadère	2a+	2020-05-07 20:11:37.76795	2020-05-07 20:28:00.360285	0101000020E6100000E030D120052F0440F54A598638304840	10	53	other	\N	2	{}
383	Le Front de Mer	3a	2020-05-07 20:11:37.771971	2020-05-07 20:28:18.847562	0101000020E6100000240D6E6B0B2F0440024A438D42304840	10	54	wall	\N	2	{}
384	Le Brise-Lame	2b	2020-05-07 20:11:37.775359	2020-05-07 20:28:36.678045	0101000020E61000004641F0F8F62E0440475A2A6F47304840	10	55	other	\N	2	{}
385	Le Terminal	2b+	2020-05-07 20:11:37.778837	2020-05-07 20:28:53.800669	0101000020E61000002A90D959F42E0440043752B648304840	10	56	other	\N	2	{}
176	Le Damier	6b+	2020-04-16 20:19:03.489102	2020-04-19 08:39:46.861937	0101000020E6100000823AE5D18D5005401AA37554353B4840	4	26	slab	4	1	{}
177	L'Espace	5a	2020-04-16 20:19:03.491804	2020-04-19 08:39:46.863594	0101000020E6100000F4C473B6805005401AA37554353B4840	5	8	wall	4	1	{}
164	Égérie	4b	2020-04-16 20:19:03.455374	2020-04-19 08:39:46.86521	0101000020E6100000AC394030474F05409C3061342B3B4840	5	10	slab	4	1	{}
193	Les Petits Pieds	6a	2020-04-16 20:19:03.541645	2020-04-19 08:39:46.884946	0101000020E6100000DAFF006BD54E0540698B6B7C263B4840	4	19	slab	4	1	{}
196	Outrage	5b+	2020-04-16 20:19:03.550693	2020-04-19 08:39:46.888141	0101000020E6100000DDB1D826154D0540096CCEC1333B4840	4	43	wall	4	1	{}
165	Sonnets Posthumes	4c	2020-04-16 20:19:03.45845	2020-04-19 08:39:46.824743	0101000020E61000002FFB75A73B4F05407EE36BCF2C3B4840	5	11	wall	\N	1	{}
167	Opus Dei	3c	2020-04-16 20:19:03.464213	2020-04-19 08:39:46.826799	0101000020E61000008FC2F5285C4F0540B8AD2D3C2F3B4840	2	11	wall	\N	1	{}
168	Strophe	4a	2020-04-16 20:19:03.466775	2020-04-19 08:39:46.828457	0101000020E610000045292158554F0540FAD005F52D3B4840	5	12	wall	\N	1	{}
169	Stances	4c	2020-04-16 20:19:03.46935	2020-04-19 08:39:46.83019	0101000020E6100000B727486C774F0540EE224C512E3B4840	5	13	overhang	\N	1	{}
170	Crépuscule	4b	2020-04-16 20:19:03.472262	2020-04-19 08:39:46.831847	0101000020E610000034A0DE8C9A4F054082380F27303B4840	5	9	wall	\N	1	{}
181	Le Cruciverbiste	6a	2020-04-16 20:19:03.503077	2020-04-19 08:39:46.833458	0101000020E6100000F1F3DF83D74E0540BDE5EAC7263B4840	3	16b	slab	\N	1	{}
185	Styrax	5c	2020-04-16 20:19:03.513481	2020-04-19 08:39:46.835069	0101000020E61000005704FF5BC94E0540D3D9C9E0283B4840	4	22	wall	\N	1	{}
186	La Dalle de Marbre	4c	2020-04-16 20:19:03.516731	2020-04-19 08:39:46.836745	0101000020E6100000BE141E34BB4E05401074B4AA253B4840	3	15	slab	\N	1	{}
187	L'eunnuque	4a	2020-04-16 20:19:03.523176	2020-04-19 08:39:46.838347	0101000020E6100000952D9276A34F05408F1A13622E3B4840	3	22	wall	\N	1	{}
188	La Frouch'mammouth	4c	2020-04-16 20:19:03.527786	2020-04-19 08:39:46.840029	0101000020E6100000897956D28A4F0540C4279D48303B4840	3	24	wall	\N	1	{}
189	Les Plats	4b	2020-04-16 20:19:03.530687	2020-04-19 08:39:46.842063	0101000020E6100000F0FD0DDAAB4F05404DF73AA92F3B4840	3	23	wall	\N	1	{}
190	\N	3c	2020-04-16 20:19:03.533414	2020-04-19 08:39:46.844151	0101000020E6100000B7D5AC33BE4F05400C3CF71E2E3B4840	2	7	overhang	\N	1	{}
191	SOS Glycogène	5c	2020-04-16 20:19:03.536171	2020-04-19 08:39:46.845847	0101000020E6100000ADDD76A1B94E0540035E66D8283B4840	4	23	overhang	\N	1	{}
192	Le Couloir	4b	2020-04-16 20:19:03.539036	2020-04-19 08:39:46.84759	0101000020E61000003B191C25AF4E0540DAFE9595263B4840	3	30	wall	\N	1	{}
194	L'Emmenthal	4a	2020-04-16 20:19:03.544902	2020-04-19 08:39:46.849273	0101000020E6100000A794D74AE84E0540E6AC4F39263B4840	3	16	wall	\N	1	{}
197	Échec et Mat	5c	2020-04-16 20:19:03.553306	2020-04-19 08:39:46.851028	0101000020E61000009D4A06802A4E05400E2F88484D3B4840	4	37	wall	\N	1	{}
198	Bateau Pilote	6a	2020-04-16 20:19:03.556024	2020-04-19 08:39:46.852693	0101000020E6100000C9022670EB4E0540AB7AF99D263B4840	4	18	wall	\N	1	{}
178	Le Fourre-Tout	6a+	2020-04-16 20:19:03.494721	2020-04-19 08:39:46.869993	0101000020E6100000A1116C5CFF4E05402600FF942A3B4840	4	24	traverse	4	1	{}
179	La Goulotte	3c	2020-04-16 20:19:03.497705	2020-04-19 08:39:46.873317	0101000020E610000057B26323104F0540850838842A3B4840	3	19	wall	3	1	{}
206	Boute-en-Train	4c	2020-04-16 20:19:03.57939	2020-04-28 13:10:50.027971	0101000020E6100000C18C2958E34C0540D5928E72303B4840	4	45	wall	\N	1	{}
229	Beaux Mouvements sur Fonds Sableux	6c+	2020-04-16 20:19:03.64575	2020-04-28 15:18:34.68931	0101000020E6100000144031B2644E0540BF0CC688443B4840	6	9	overhang	3	1	{sit_start}
269	L'Encoignure	3a	2020-05-07 12:44:29.696251	2020-05-07 20:37:25.80573	0101000020E61000005E13D21A832E04404E0B5EF415304840	10	7	wall	\N	2	{}
226	Morphotype	6c+	2020-04-16 20:19:03.636799	2020-04-28 19:38:52.825149	0101000020E6100000A19DD32CD04E05407FA2B2614D3B4840	6	6	overhang	5	1	{sit_start,risky}
213	Boomerang	6a	2020-04-16 20:19:03.601495	2020-04-28 19:38:52.826786	0101000020E6100000FB58C16F434C054024986A662D3B4840	4	46	wall	5	1	{risky}
212	Fables	4a+	2020-04-16 20:19:03.597443	2020-04-28 19:38:52.828425	0101000020E6100000D9EA724A404C0540A1B94E232D3B4840	5	40	slab	5	1	{risky}
268	L'Aisée	2a+	2020-05-07 12:44:29.693119	2020-05-07 20:37:49.855747	0101000020E610000048895DDBDB2D0440016E162F16304840	10	8	overhang	\N	2	{}
221	Magifix	6c+	2020-04-16 20:19:03.623733	2020-04-19 08:39:46.925703	0101000020E6100000A4A833F790500540E71A66683C3B4840	6	2	overhang	4	1	{}
223	L'Innominata	6c+	2020-04-16 20:19:03.629074	2020-04-19 08:39:46.927441	0101000020E61000004CFE277FF74E0540F12C4146403B4840	6	4	wall	4	1	{}
277	L'Envers du Toit	2b	2020-05-07 12:44:29.727318	2020-05-07 20:38:40.753508	0101000020E6100000FD1186014B2E0440AFE9414129304840	10	11	traverse	\N	2	{}
279	Le Paisible	2a	2020-05-07 12:44:29.743657	2020-05-07 20:38:59.370712	0101000020E6100000BE66B96C742E0440780C8FFD2C304840	10	12	slab	\N	2	{}
209	Les Chimères	4a	2020-04-16 20:19:03.588394	2020-04-19 08:39:46.932252	0101000020E6100000501A6A14924C0540C6C37B0E2C3B4840	5	37	traverse	3	1	{}
211	Anthologie	4b	2020-04-16 20:19:03.594483	2020-04-19 08:39:46.933872	0101000020E61000005CE674594C4C0540EF5696E82C3B4840	5	39	slab	4	1	{}
280	L'Indulgent	2b	2020-05-07 12:44:29.747438	2020-05-07 20:39:15.800775	0101000020E61000001F2E39EE942E0440361D01DC2C304840	10	13	slab	\N	2	{}
281	L'Évitable Bi	3a	2020-05-07 12:44:29.751089	2020-05-07 20:39:33.313061	0101000020E61000002A1C412AC52E04407D957CEC2E304840	10	14	wall	\N	2	{}
289	Le Cireur	2a	2020-05-07 12:44:29.778233	2020-05-07 20:39:51.303678	0101000020E61000007FDDE9CE132F04403D0E83F92B304840	10	15	wall	\N	2	{}
292	Le Réta	2b	2020-05-07 12:44:29.788733	2020-05-07 20:40:08.162802	0101000020E6100000B2BCAB1E302F0440D97C5C1B2A304840	10	16	overhang	\N	2	{}
293	Le Coiné	3a	2020-05-07 12:44:29.792276	2020-05-07 20:40:29.577914	0101000020E61000000D8D2782382F0440C154336B29304840	10	17	wall	\N	2	{}
301	La Rampe	2a	2020-05-07 12:44:29.831278	2020-05-07 20:40:47.447999	0101000020E6100000C2C3B46FEE2F0440A3073E062B304840	10	18	wall	\N	2	{}
304	Le Vigoureux	3b	2020-05-07 12:44:29.842521	2020-05-07 20:41:04.919884	0101000020E61000000B0BEE073C300440C154336B29304840	10	19	traverse	\N	2	{}
305	L'Aérien	2a+	2020-05-07 12:44:29.846057	2020-05-07 20:41:24.825727	0101000020E6100000EE7BD45FAF3004408A5A9A5B21304840	10	20	overhang	\N	2	{}
306	Le Montant	2b+	2020-05-07 12:44:29.859307	2020-05-07 20:41:43.285938	0101000020E6100000921FF12BD630044094A0BFD023304840	10	21	wall	\N	2	{}
307	La Glissade	2b	2020-05-07 12:44:29.872361	2020-05-07 20:42:03.784967	0101000020E6100000BA10AB3FC23004400F26C5C727304840	10	22	slab	\N	2	{}
199	Le But	4a	2020-04-16 20:19:03.559041	2020-04-19 08:39:46.889977	0101000020E61000001A89D008364E0540904E5DF92C3B4840	3	26	wall	\N	1	{}
200	L'Oubliée	4b	2020-04-16 20:19:03.561823	2020-04-19 08:39:46.892241	0101000020E6100000CB845FEAE74D05400ED8D5E4293B4840	3	27	wall	\N	1	{}
203	Les Horloges	3b	2020-04-16 20:19:03.570915	2020-04-19 08:39:46.894129	0101000020E6100000DE770C8FFD4C05409EB5DB2E343B4840	5	33	wall	\N	1	{}
204	Gravitation	4a	2020-04-16 20:19:03.573668	2020-04-19 08:39:46.895857	0101000020E610000066BCADF4DA4C0540C18BBE82343B4840	5	34	overhang	\N	1	{}
205	Le Tarot	5c	2020-04-16 20:19:03.576541	2020-04-19 08:39:46.89764	0101000020E61000006C79E57ADB4C0540FDBD141E343B4840	4	44	overhang	\N	1	{}
207	Angoisse	4b	2020-04-16 20:19:03.58209	2020-04-19 08:39:46.901293	0101000020E61000000569C6A2E94C0540F3AB3940303B4840	5	35	wall	\N	1	{}
208	Tristesse	4a	2020-04-16 20:19:03.585363	2020-04-19 08:39:46.90295	0101000020E61000008942CBBA7F4C0540BF9EAF592E3B4840	5	36	overhang	\N	1	{}
210	Méditation	4c	2020-04-16 20:19:03.591445	2020-04-19 08:39:46.90457	0101000020E610000000FE2955A24C0540317A6EA12B3B4840	5	38	wall	\N	1	{}
222	Lune de Fiel	7a	2020-04-16 20:19:03.626411	2020-04-19 08:39:46.906352	0101000020E6100000BDC282FB014F0540D5AF743E3C3B4840	6	3	traverse	\N	1	{}
224	Les Câlins de Kim	7a	2020-04-16 20:19:03.631588	2020-04-19 08:39:46.908187	0101000020E6100000CAA65CE15D4E05408DEC4ACB483B4840	6	5	overhang	\N	1	{}
225	Cocaline	7b+	2020-04-16 20:19:03.634118	2020-04-19 08:39:46.909862	0101000020E61000006953758F6C4E054016889E94493B4840	6	5b	traverse	\N	1	{}
227	Canonnerie	6c	2020-04-16 20:19:03.640143	2020-04-19 08:39:46.911521	0101000020E6100000861C5BCF104E0540083E062B4E3B4840	6	7	traverse	\N	1	{}
228	Pot de Terre	6c+	2020-04-16 20:19:03.642973	2020-04-19 08:39:46.913133	0101000020E61000003CA583F57F4E054066F50EB7433B4840	6	8	wall	\N	1	{}
219	Nuage Blanc	6a+	2020-04-16 20:19:03.618292	2020-04-19 08:39:46.914731	0101000020E610000034F279C5534F0540DB4FC6F8303B4840	4	25	overhang	4	1	{}
218	Le Surplomb du Bengale	5c	2020-04-16 20:19:03.61576	2020-04-19 08:39:46.916321	0101000020E6100000DF180280634F05403A58FFE7303B4840	3	25	overhang	4	1	{}
217	Élégie	3c	2020-04-16 20:19:03.613172	2020-04-19 08:39:46.917906	0101000020E610000040A6B5696C4F0540DB4FC6F8303B4840	5	14	wall	4	1	{}
216	L'Amérique	4a	2020-04-16 20:19:03.610389	2020-04-19 08:39:46.919487	0101000020E610000029B2D6506A4F0540573D601E323B4840	5	15	wall	4	1	{}
215	Le Vallon	5c	2020-04-16 20:19:03.60743	2020-04-19 08:39:46.921241	0101000020E61000009B3C65355D4F0540F834272F323B4840	5	16	wall	4	1	{}
214	Soleil Couchant	4b	2020-04-16 20:19:03.604353	2020-04-19 08:39:46.923481	0101000020E610000012842BA0504F0540C9B08A37323B4840	5	17	wall	4	1	{}
310	La Marche	2a	2020-05-07 12:44:29.883384	2020-05-07 20:42:38.236442	0101000020E61000008CD651D50431044087DBA16131304840	10	24	wall	\N	2	{}
311	L'Autre Voie	3a	2020-05-07 12:44:29.887012	2020-05-07 20:43:10.738364	0101000020E61000001F2BF86D883104409946938B31304840	10	26	wall	\N	2	{}
201	La Spéciale	4a+	2020-04-16 20:19:03.564889	2020-04-19 08:39:46.93866	0101000020E610000059C0046EDD4D05402634492C293B4840	3	28	wall	4	1	{}
202	La Bizuth	4b	2020-04-16 20:19:03.568045	2020-04-19 08:39:46.940828	0101000020E6100000439259BDC34D0540D3D9C9E0283B4840	3	29	wall	3	1	{}
326	L'Audacieuse	3a+	2020-05-07 12:44:29.949997	2020-05-07 20:44:02.401973	0101000020E610000078D503E621330440C45E28603B304840	10	29	overhang	\N	2	{}
327	Le Couloir	3a	2020-05-07 12:44:29.954071	2020-05-07 20:44:20.172645	0101000020E61000001C7920B24833044017B9A7AB3B304840	10	30	traverse	\N	2	{}
328	La Combine	4a	2020-05-07 12:44:29.957855	2020-05-07 20:44:49.158528	0101000020E6100000C7D97404703304403BC3D4963A304840	10	31	wall	\N	2	{}
329	La Trace	2a+	2020-05-07 12:44:29.961774	2020-05-07 20:45:09.09453	0101000020E610000049D576137C330440BD6DA6423C304840	10	32	other	\N	2	{}
331	La Mogette	2b	2020-05-07 12:44:29.969669	2020-05-07 20:45:27.875712	0101000020E6100000EE26F8A6E9330440DBA337DC47304840	10	33	other	\N	2	{}
300	L'Obstiné	2c	2020-05-07 12:44:29.827788	2020-05-07 20:50:41.906909	0101000020E61000002ECBD765F82F0440D714C8EC2C304840	10	49	wall	\N	2	{}
284	Le Bustier	2b	2020-05-07 12:44:29.761396	2020-05-07 20:51:23.300589	0101000020E61000005DFB027AE12E0440E547FC8A35304840	10	52	overhang	\N	2	{}
334	Le Terminus	2a	2020-05-07 12:44:29.980827	2020-05-07 20:45:42.671787	0101000020E6100000CC7EDDE9CE33044072A609DB4F304840	10	34	other	\N	2	{}
338	Le Pas de Géant	2b+	2020-05-07 12:44:30.005055	2020-05-07 20:45:59.320795	0101000020E6100000FFAF3A72A43304406CE9D1544F304840	10	35	traverse	\N	2	{}
232	Jour de Pluie	7b	2020-04-16 20:19:03.653963	2020-04-28 15:20:21.658634	0101000020E610000009A4C4AEED4D05405C751DAA293B4840	6	12	overhang	4	1	{sit_start}
234	Les Copains d'abord	7a	2020-04-16 20:19:03.659414	2020-04-28 15:20:41.828763	0101000020E61000004F95EF19895005408A743FA7203B4840	6	14	overhang	\N	1	{sit_start}
244	La Théorie du Chaos	7b	2020-04-16 20:19:03.688228	2020-04-28 19:22:36.3846	0101000020E6100000DE3AFF76D94F05403F1C2444F93A4840	6	23	overhang	4	1	{risky}
243	Les Grimpeurs se Cachent pour Médire	7a	2020-04-16 20:19:03.684865	2020-04-28 19:38:52.830087	0101000020E61000000744882B674F0540D65240DAFF3A4840	6	22	wall	5	1	{risky}
237	Délivrance / Marquis de Sade	7a+	2020-04-16 20:19:03.668523	2020-04-28 19:38:52.831782	0101000020E61000002A1C412AC54E0540D7C05609163B4840	6	17	slab	6	1	{risky}
341	La Rabiboche	2b	2020-05-07 12:44:30.015624	2020-05-07 20:46:20.02431	0101000020E6100000992B836A83330440CC2555DB4D304840	10	36	other	\N	2	{}
352	Le Sortant	2a	2020-05-07 12:44:30.055227	2020-05-07 20:47:04.116282	0101000020E6100000AC58FCA6B0320440E76ED74B53304840	10	38	wall	\N	2	{}
355	La Rotation	2a+	2020-05-07 12:44:30.073804	2020-05-07 20:47:20.676748	0101000020E6100000CE8C7E349C3204406919A9F754304840	10	39	wall	\N	2	{}
347	L'Abri	2b	2020-05-07 12:44:30.03722	2020-05-07 20:47:35.74894	0101000020E6100000F06E6589CE320440126A865451304840	10	40	other	\N	2	{}
348	La Cheminée	3a	2020-05-07 12:44:30.04072	2020-05-07 20:47:52.876218	0101000020E610000012DDB3AED13204407172BF4351304840	10	41	other	\N	2	{}
344	La Bravoure	2c	2020-05-07 12:44:30.026746	2020-05-07 20:48:15.579622	0101000020E6100000B1C398F4F73204404ED026874F304840	10	42	wall	\N	2	{}
346	L'Oblique	2a	2020-05-07 12:44:30.033726	2020-05-07 20:48:38.492142	0101000020E61000004CE3175E493204404ED026874F304840	10	43	wall	\N	2	{}
231	Sledgehammer	7a	2020-04-16 20:19:03.651288	2020-04-19 08:39:46.942704	0101000020E61000007D24253D0C4D054004E3E0D2313B4840	6	11	traverse	\N	1	{}
233	Expositions retrospectives	6c+	2020-04-16 20:19:03.656695	2020-04-19 08:39:46.944387	0101000020E610000002F1BA7EC14E0540035E66D8283B4840	6	13	wall	\N	1	{}
333	Le Briscard	2b	2020-05-07 12:44:29.977091	2020-05-07 20:49:03.215903	0101000020E610000057975302623204405891D10149304840	10	44	wall	\N	2	{}
240	36.15 Power	7c	2020-04-16 20:19:03.67612	2020-04-19 08:39:46.947648	0101000020E610000062DA37F7574F0540931804560E3B4840	6	20b	overhang	\N	1	{}
241	36.15 Gauche	7a	2020-04-16 20:19:03.678818	2020-04-19 08:39:46.949284	0101000020E610000079CE16105A4F054082AD122C0E3B4840	6	20	overhang	\N	1	{}
332	Le Roi Mage	2b	2020-05-07 12:44:29.973382	2020-05-07 20:49:20.982534	0101000020E6100000EA03C93B873204400B28D4D347304840	10	45	slab	\N	2	{}
236	Gainage et Dévers	6c	2020-04-16 20:19:03.665873	2020-04-19 08:39:46.952584	0101000020E61000002F4D11E0F44E0540A5A0DB4B1A3B4840	6	16	traverse	3	1	{}
235	La Singlette	6b+	2020-04-16 20:19:03.662079	2020-04-19 08:39:46.954221	0101000020E61000005CCB64389E4F05408FE046CA163B4840	6	15	traverse	4	1	{}
238	La Dénoyautée	7a+	2020-04-16 20:19:03.671096	2020-04-19 08:39:46.955911	0101000020E61000007FDDE9CE134F05401A187959133B4840	6	18	wall	4	1	{}
239	Nut's	7b	2020-04-16 20:19:03.673611	2020-04-19 08:39:46.960359	0101000020E6100000293E3E213B4F0540F8DD74CB0E3B4840	6	19	overhang	4	1	{}
242	Fantasia chez les Ploucs	7a+	2020-04-16 20:19:03.682064	2020-04-19 08:39:46.962022	0101000020E610000034A0DE8C9A4F0540D93F4F03063B4840	6	21	overhang	4	1	{}
245	Chasseur de Prises	7a	2020-04-16 20:19:03.691413	2020-04-19 08:39:46.965498	0101000020E61000008D62B9A5D5500540B8054B75013B4840	6	24	wall	4	1	{}
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.schema_migrations (version) FROM stdin;
20200416080911
20200416122424
20200416193749
20200416195009
20200416195506
20200416200511
20200416201305
20200418095046
20200418194159
20200418210357
20200419083233
20200419083551
20200419083712
20200428120744
20200428150852
20200507130052
20200509193959
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: topos; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.topos (id, line, problem_id, created_at, updated_at) FROM stdin;
6	[{"x":0.4178,"y":0.9134},{"x":0.3906,"y":0.7149},{"x":0.3577,"y":0.5219},{"x":0.3923,"y":0.3443}]	176	2020-04-18 20:36:55.470758	2020-04-21 13:38:05.098216
4	[{"x":0.375,"y":0.9539},{"x":0.3808,"y":0.6776},{"x":0.4112,"y":0.42},{"x":0.3618,"y":0.1195}]	77	2020-04-18 20:36:55.36101	2020-04-21 13:35:44.876981
10	[{"x":0.7785,"y":0.9178},{"x":0.7599,"y":0.5789},{"x":0.8213,"y":0.4309},{"x":0.8575,"y":0.259}]	200	2020-04-18 20:36:55.630165	2020-04-21 13:39:37.301329
11	[{"x":0.3882,"y":0.9561},{"x":0.3906,"y":0.5614},{"x":0.4013,"y":0.3805},{"x":0.3931,"y":0.0724}]	201	2020-04-18 20:36:55.670284	2020-04-21 13:39:47.1239
13	[{"x":0.6291,"y":0.9375},{"x":0.6735,"y":0.7632},{"x":0.7656,"y":0.6217},{"x":0.7845,"y":0.455},{"x":0.7837,"y":0.33},{"x":0.75,"y":0.3037}]	229	2020-04-18 20:36:55.734295	2020-04-21 13:40:19.956168
16	[{"x":0.3339,"y":0.8542},{"x":0.3224,"y":0.6261},{"x":0.3026,"y":0.432},{"x":0.3051,"y":0.2083},{"x":0.3331,"y":0.0395}]	163	2020-04-18 20:36:55.834834	2020-04-21 13:41:03.797073
19	[{"x":0.4572,"y":0.7807},{"x":0.4589,"y":0.4583},{"x":0.4285,"y":0.318},{"x":0.4202,"y":0.102}]	74	2020-04-18 20:36:55.933529	2020-04-21 13:41:50.114825
24	[{"x":0.5351,"y":0.7813},{"x":0.5318,"y":0.5164},{"x":0.5143,"y":0.3405},{"x":0.5428,"y":0.1924},{"x":0.6294,"y":0.1209}]	161	2020-04-18 20:36:56.114268	2020-04-21 13:42:55.93633
27	[{"x":0.176,"y":0.739},{"x":0.1801,"y":0.4605},{"x":0.19,"y":0.318},{"x":0.2525,"y":0.0691}]	216	2020-04-18 20:36:56.219626	2020-04-21 13:43:30.704816
28	[{"x":0.375,"y":0.9474},{"x":0.3618,"y":0.7007},{"x":0.3396,"y":0.4287},{"x":0.3725,"y":0.1524}]	202	2020-04-18 20:36:56.250382	2020-04-21 13:43:49.882216
33	[{"x":0.7122,"y":0.8235},{"x":0.7105,"y":0.5888},{"x":0.7418,"y":0.0779}]	61	2020-04-18 20:36:56.437838	2020-04-21 13:44:36.373651
35	[{"x":0.2196,"y":0.8684},{"x":0.2097,"y":0.5998},{"x":0.2196,"y":0.4057},{"x":0.2311,"y":0.193}]	59	2020-04-18 20:36:56.514756	2020-04-21 13:44:56.257547
37	[{"x":0.347,"y":0.92},{"x":0.3594,"y":0.648},{"x":0.4194,"y":0.1985},{"x":0.4688,"y":0.0307}]	65	2020-04-18 20:36:56.59497	2020-04-21 13:45:15.734954
43	[{"x":0.3479,"y":0.9386},{"x":0.3405,"y":0.6491},{"x":0.3709,"y":0.3794},{"x":0.3166,"y":0.0493}]	213	2020-04-18 20:36:56.842231	2020-04-21 13:46:20.678616
45	[{"x":0.3059,"y":0.9529},{"x":0.3109,"y":0.5866},{"x":0.3512,"y":0.3958},{"x":0.3462,"y":0.0384}]	159	2020-04-18 20:36:56.929777	2020-04-21 13:46:36.000952
48	[{"x":0.4605,"y":0.8503},{"x":0.4693,"y":0.5403},{"x":0.5,"y":0.3734},{"x":0.6075,"y":0.1505}]	64	2020-04-18 20:36:57.044109	2020-04-21 13:47:17.608002
51	[{"x":0.2385,"y":0.8904},{"x":0.2525,"y":0.614},{"x":0.2961,"y":0.3333},{"x":0.3594,"y":0.2204},{"x":0.4046,"y":0.0647}]	198	2020-04-18 20:36:57.165773	2020-04-21 13:54:23.394209
53	[{"x":0.6423,"y":0.9627},{"x":0.653,"y":0.636},{"x":0.6752,"y":0.3498},{"x":0.6785,"y":0.0691}]	72	2020-04-18 20:36:57.24196	2020-04-21 13:54:42.252805
56	[{"x":0.4161,"y":0.9156},{"x":0.4449,"y":0.682},{"x":0.5107,"y":0.3202},{"x":0.5781,"y":0.0658},{"x":0.5995,"y":0.0066}]	211	2020-04-18 20:36:57.358564	2020-04-21 13:55:27.909519
58	[{"x":0.7459,"y":0.8476},{"x":0.7418,"y":0.534},{"x":0.7171,"y":0.4134},{"x":0.7459,"y":0.2763},{"x":0.7155,"y":0.2029}]	239	2020-04-18 20:36:57.438395	2020-04-21 13:57:10.082725
64	[{"x":0.287,"y":0.8454},{"x":0.2969,"y":0.5614},{"x":0.3051,"y":0.3739},{"x":0.3742,"y":0.1239}]	98	2020-04-18 20:36:57.702249	2020-04-21 13:58:09.335409
65	[{"x":0.403,"y":0.92},{"x":0.4095,"y":0.6908},{"x":0.4013,"y":0.1086},{"x":0.4063,"y":0.0581}]	73	2020-04-18 20:36:57.737684	2020-04-21 13:58:16.883117
67	[{"x":0.4942,"y":0.9035},{"x":0.491,"y":0.6382},{"x":0.4893,"y":0.4079},{"x":0.5107,"y":0.1754}]	67	2020-04-18 20:36:57.823657	2020-04-21 13:58:30.694166
70	[{"x":0.6554,"y":0.8136},{"x":0.6316,"y":0.4923},{"x":0.6135,"y":0.284},{"x":0.5905,"y":0.1042}]	28	2020-04-18 20:36:57.949455	2020-04-21 13:59:07.983045
72	[{"x":0.6809,"y":0.8462},{"x":0.6305,"y":0.5641},{"x":0.6053,"y":0.3914},{"x":0.5735,"y":0.2253}]	115	2020-04-18 20:36:58.032896	2020-04-21 13:59:21.053191
75	[{"x":0.8832,"y":0.8925},{"x":0.8569,"y":0.6436},{"x":0.8479,"y":0.4452},{"x":0.7903,"y":0.2862}]	128	2020-04-18 20:36:58.149081	2020-04-21 13:59:43.868568
78	[{"x":0.5345,"y":0.9518},{"x":0.5058,"y":0.568},{"x":0.4589,"y":0.2796},{"x":0.4498,"y":0.0154}]	116	2020-04-18 20:36:58.267143	2020-04-21 14:07:20.936282
81	[{"x":0.1897,"y":0.8865},{"x":0.2193,"y":0.5765},{"x":0.2719,"y":0.4063},{"x":0.3531,"y":0.2023}]	117	2020-04-18 20:36:58.382356	2020-04-21 14:07:44.578106
86	[{"x":0.426,"y":0.9682},{"x":0.4054,"y":0.6458},{"x":0.4786,"y":0.4221},{"x":0.5329,"y":0.2357},{"x":0.5584,"y":0.0592}]	112	2020-04-18 20:36:58.589598	2020-04-21 14:08:26.92738
90	[{"x":0.4811,"y":0.8805},{"x":0.491,"y":0.6305},{"x":0.5493,"y":0.2675}]	110	2020-04-18 20:36:58.761552	2020-04-21 14:09:04.451284
91	[{"x":0.1195,"y":0.7212},{"x":0.0998,"y":0.5206},{"x":0.1107,"y":0.3257},{"x":0.1612,"y":0.2155}]	138	2020-04-18 20:36:58.806167	2020-04-21 14:09:10.656651
93	[{"x":0.0748,"y":0.9178},{"x":0.0863,"y":0.7237},{"x":0.1299,"y":0.5493},{"x":0.2122,"y":0.2719},{"x":0.2113,"y":0.182}]	111	2020-04-18 20:36:58.889003	2020-04-21 14:09:24.585363
96	[{"x":0.6785,"y":0.8871},{"x":0.6949,"y":0.6239},{"x":0.662,"y":0.4452},{"x":0.6094,"y":0.3366},{"x":0.5543,"y":0.1316}]	21	2020-04-18 20:36:59.010758	2020-04-21 14:10:09.307452
102	[{"x":0.0702,"y":0.6867},{"x":0.1151,"y":0.5156},{"x":0.159,"y":0.4202},{"x":0.2478,"y":0.2673},{"x":0.2763,"y":0.2549}]	135	2020-04-18 20:36:59.257692	2020-04-21 14:11:02.064592
103	[{"x":0.5471,"y":0.8544},{"x":0.5296,"y":0.6176},{"x":0.5011,"y":0.4753},{"x":0.5493,"y":0.148}]	121	2020-04-18 20:36:59.295566	2020-04-21 14:11:07.912406
106	[{"x":0.3799,"y":0.8827},{"x":0.3956,"y":0.534},{"x":0.3873,"y":0.3048},{"x":0.4137,"y":0.1765}]	36	2020-04-18 20:36:59.424191	2020-04-21 14:11:28.731251
109	[{"x":0.4235,"y":0.8454},{"x":0.4416,"y":0.5022},{"x":0.4408,"y":0.2697},{"x":0.4745,"y":0.0526}]	123	2020-04-18 20:36:59.583821	2020-04-21 14:12:05.382211
111	[{"x":0.4046,"y":0.8076},{"x":0.2522,"y":0.4293},{"x":0.2599,"y":0.273},{"x":0.3257,"y":0.1661}]	240	2020-04-18 20:36:59.668278	2020-04-21 14:13:50.688338
113	[{"x":0.2393,"y":0.8684},{"x":0.25,"y":0.466},{"x":0.2796,"y":0.2862},{"x":0.3405,"y":0.1393}]	136	2020-04-18 20:36:59.740272	2020-04-21 14:14:05.712301
119	[{"x":0.2952,"y":0.9507},{"x":0.2722,"y":0.7259},{"x":0.4211,"y":0.5066},{"x":0.4186,"y":0.2895},{"x":0.3964,"y":0.1941},{"x":0.3339,"y":0.0241}]	245	2020-04-18 20:36:59.981833	2020-04-21 14:15:00.359853
122	[{"x":0.8174,"y":0.8925},{"x":0.8092,"y":0.648},{"x":0.7278,"y":0.545},{"x":0.7015,"y":0.3816},{"x":0.6891,"y":0.1886},{"x":0.6801,"y":0.1086}]	32	2020-04-18 20:37:00.094688	2020-04-21 14:15:26.89932
124	[{"x":0.5345,"y":0.9079},{"x":0.5419,"y":0.602},{"x":0.5724,"y":0.4507},{"x":0.6209,"y":0.2007}]	30	2020-04-18 20:37:00.175966	2020-04-21 14:15:39.112112
3	[{"x":0.7451,"y":0.8531},{"x":0.7064,"y":0.625},{"x":0.7344,"y":0.4737},{"x":0.7311,"y":0.3805},{"x":0.7229,"y":0.3355}]	189	2020-04-18 20:36:55.332313	2020-04-21 13:35:23.860365
132	[{"x":0.259,"y":0.7873},{"x":0.2706,"y":0.5493},{"x":0.264,"y":0.3015},{"x":0.2887,"y":0.1875}]	25	2020-04-18 20:37:00.470415	2020-04-21 14:16:54.233764
5	[{"x":0.5584,"y":0.9254},{"x":0.5699,"y":0.5504},{"x":0.5905,"y":0.3191},{"x":0.5707,"y":0.0515}]	162	2020-04-18 20:36:55.415765	2020-04-21 13:37:51.669785
136	[{"x":0.5584,"y":0.8443},{"x":0.5082,"y":0.5252},{"x":0.4581,"y":0.2884},{"x":0.4515,"y":0.0603}]	56	2020-04-18 20:37:00.616095	2020-04-21 14:17:31.761511
138	[{"x":0.4465,"y":0.9627},{"x":0.4655,"y":0.6009},{"x":0.4951,"y":0.3805},{"x":0.5099,"y":0.2511},{"x":0.537,"y":0.102}]	194	2020-04-18 20:37:00.681426	2020-04-21 14:17:55.803696
7	[{"x":0.5469,"y":0.9342},{"x":0.5107,"y":0.5888},{"x":0.4794,"y":0.3695},{"x":0.44,"y":0.0987}]	88	2020-04-18 20:36:55.537502	2020-04-21 13:38:18.631501
141	[{"x":0.5748,"y":0.9145},{"x":0.5485,"y":0.4726},{"x":0.5617,"y":0.2719},{"x":0.5304,"y":0.0548}]	143	2020-04-18 20:37:00.793299	2020-04-21 14:18:18.074817
9	[{"x":0.2048,"y":0.9364},{"x":0.2122,"y":0.557},{"x":0.1719,"y":0.3849},{"x":0.1102,"y":0.2237},{"x":0.1209,"y":0.1173},{"x":0.1176,"y":0.0691},{"x":0.0921,"y":0.0307}]	214	2020-04-18 20:36:55.602905	2020-04-21 13:39:27.103645
148	[{"x":0.5699,"y":0.9452},{"x":0.5592,"y":0.5154},{"x":0.514,"y":0.33},{"x":0.4696,"y":0.1371},{"x":0.4786,"y":0.1294}]	208	2020-04-18 20:37:01.06601	2020-04-21 14:19:34.474365
151	[{"x":0.3791,"y":0.9024},{"x":0.398,"y":0.5647},{"x":0.4137,"y":0.2072},{"x":0.4334,"y":0.1711},{"x":0.5197,"y":0.1491}]	94	2020-04-18 20:37:01.170633	2020-04-21 14:20:08.23647
12	[{"x":0.5214,"y":0.8575},{"x":0.5016,"y":0.523},{"x":0.4984,"y":0.42},{"x":0.4934,"y":0.2752},{"x":0.514,"y":0.1765}]	215	2020-04-18 20:36:55.708032	2020-04-21 13:40:05.391846
153	[{"x":0.6908,"y":0.8224},{"x":0.6702,"y":0.5515},{"x":0.6719,"y":0.4254},{"x":0.6168,"y":0.2796},{"x":0.5617,"y":0.1382}]	181	2020-04-18 20:37:01.243795	2020-04-21 14:20:23.751017
156	[{"x":0.6012,"y":0.83},{"x":0.5913,"y":0.58},{"x":0.5724,"y":0.3487},{"x":0.574,"y":0.2632}]	43	2020-04-18 20:37:01.362609	2020-04-21 14:20:45.906389
14	[{"x":0.5132,"y":0.8002},{"x":0.5164,"y":0.5173},{"x":0.511,"y":0.3676},{"x":0.5318,"y":0.2492},{"x":0.5603,"y":0.1678}]	177	2020-04-18 20:36:55.767721	2020-04-21 13:40:32.826108
158	[{"x":0.6143,"y":0.8816},{"x":0.5938,"y":0.4704},{"x":0.5896,"y":0.2708},{"x":0.5502,"y":0.0877}]	41	2020-04-18 20:37:01.442855	2020-04-21 14:21:10.477079
160	[{"x":0.4161,"y":0.9331},{"x":0.4021,"y":0.5702},{"x":0.361,"y":0.3684},{"x":0.3462,"y":0.1711},{"x":0.3536,"y":0.0932}]	197	2020-04-18 20:37:01.521857	2020-04-21 14:21:27.404796
15	[{"x":0.3035,"y":0.9518},{"x":0.2985,"y":0.6809},{"x":0.2969,"y":0.4989},{"x":0.2911,"y":0.4068},{"x":0.2656,"y":0.1864}]	89	2020-04-18 20:36:55.80428	2020-04-21 13:40:50.080939
162	[{"x":0.648,"y":0.9885},{"x":0.5307,"y":0.5683},{"x":0.4901,"y":0.3956},{"x":0.4814,"y":0.1168}]	96	2020-04-18 20:37:01.58881	2020-04-21 14:21:51.610035
165	[{"x":0.8158,"y":0.9419},{"x":0.8215,"y":0.614},{"x":0.7697,"y":0.5022},{"x":0.7278,"y":0.2961}]	154	2020-04-18 20:37:01.717044	2020-04-21 14:22:12.776146
17	[{"x":0.5115,"y":0.932},{"x":0.5,"y":0.5998},{"x":0.4901,"y":0.3991},{"x":0.5313,"y":0.0428}]	188	2020-04-18 20:36:55.868135	2020-04-21 13:41:12.446243
172	[{"x":0.5765,"y":0.9671},{"x":0.5518,"y":0.5614},{"x":0.5411,"y":0.3662},{"x":0.5115,"y":0.1173}]	155	2020-04-18 20:37:02.015801	2020-04-21 14:24:04.600736
18	[{"x":0.5011,"y":0.8618},{"x":0.5208,"y":0.6094},{"x":0.5406,"y":0.3898},{"x":0.5,"y":0.1875}]	62	2020-04-18 20:36:55.907439	2020-04-21 13:41:40.533038
173	[{"x":0.19,"y":0.9079},{"x":0.2179,"y":0.5877},{"x":0.241,"y":0.398},{"x":0.3191,"y":0.1864},{"x":0.4071,"y":0.1053}]	83	2020-04-18 20:37:02.053489	2020-04-21 14:24:12.165629
177	[{"x":0.097,"y":0.6228},{"x":0.1003,"y":0.5768},{"x":0.1094,"y":0.4134},{"x":0.153,"y":0.2061}]	196	2020-04-18 20:37:02.203214	2020-04-21 14:24:58.328323
20	[{"x":0.9375,"y":0.8772},{"x":0.9202,"y":0.6283},{"x":0.9104,"y":0.4167},{"x":0.8602,"y":0.1129}]	60	2020-04-18 20:36:55.965327	2020-04-21 13:41:59.934637
178	[{"x":0.7917,"y":0.8396},{"x":0.7357,"y":0.5173},{"x":0.6382,"y":0.3882},{"x":0.6239,"y":0.2434}]	54	2020-04-18 20:37:02.240658	2020-04-21 14:25:19.176772
129	[{"x":0.5378,"y":0.8717},{"x":0.4836,"y":0.602},{"x":0.4383,"y":0.4287},{"x":0.4539,"y":0.1272}]	130	2020-04-18 20:37:00.356404	2020-04-21 14:16:21.926856
181	[{"x":0.7393,"y":0.818},{"x":0.7229,"y":0.5186},{"x":0.7015,"y":0.3081},{"x":0.6414,"y":0.0241}]	186	2020-04-18 20:37:02.357726	2020-04-21 14:25:39.811476
183	[{"x":0.4397,"y":0.9071},{"x":0.4287,"y":0.5411},{"x":0.4079,"y":0.4021},{"x":0.4364,"y":0.2747}]	50	2020-04-18 20:37:02.43824	2020-04-21 14:25:56.306132
185	[{"x":0.4827,"y":0.9145},{"x":0.4803,"y":0.5987},{"x":0.472,"y":0.398},{"x":0.4926,"y":0.2292},{"x":0.4712,"y":0.0932}]	151	2020-04-18 20:37:02.527586	2020-04-21 14:26:14.14237
188	[{"x":0.5625,"y":0.8528},{"x":0.5395,"y":0.4868},{"x":0.5384,"y":0.3051},{"x":0.5318,"y":0.0831}]	87	2020-04-18 20:37:02.634556	2020-04-21 14:26:42.837949
194	[{"x":0.4079,"y":0.9638},{"x":0.4359,"y":0.5274},{"x":0.5033,"y":0.3004},{"x":0.5337,"y":0.1327},{"x":0.5247,"y":0.0395}]	86	2020-04-18 20:37:02.863059	2020-04-21 14:27:52.029331
197	[{"x":0.2928,"y":0.8421},{"x":0.3067,"y":0.5482},{"x":0.3799,"y":0.3958},{"x":0.3882,"y":0.2862},{"x":0.384,"y":0.2083},{"x":0.3775,"y":0.1228}]	144	2020-04-18 20:37:02.996215	2020-04-21 14:28:25.041611
199	[{"x":0.5559,"y":0.9923},{"x":0.5773,"y":0.5669},{"x":0.5913,"y":0.3213},{"x":0.6324,"y":0.1009}]	3	2020-04-18 20:37:03.096536	2020-04-21 14:28:48.1651
202	[{"x":0.5444,"y":0.8586},{"x":0.5263,"y":0.5987},{"x":0.5115,"y":0.3059},{"x":0.4548,"y":0.0789}]	193	2020-04-18 20:37:03.240685	2020-04-21 14:29:09.165992
205	[{"x":0.5263,"y":0.8695},{"x":0.5296,"y":0.5691},{"x":0.5304,"y":0.3794},{"x":0.5699,"y":0.216}]	47	2020-04-18 20:37:03.3901	2020-04-21 14:29:29.618748
210	[{"x":0.6176,"y":0.8936},{"x":0.5954,"y":0.5789},{"x":0.6209,"y":0.4112},{"x":0.5814,"y":0.2007}]	90	2020-04-18 20:37:03.70411	2020-04-21 14:30:54.515781
212	[{"x":0.443,"y":0.8725},{"x":0.4715,"y":0.5658},{"x":0.5022,"y":0.4688},{"x":0.5954,"y":0.3495},{"x":0.6272,"y":0.2689},{"x":0.5768,"y":0.2286}]	224	2020-04-18 20:37:03.793979	2020-04-21 14:31:20.75183
217	[{"x":0.5181,"y":0.7873},{"x":0.528,"y":0.5154},{"x":0.551,"y":0.33},{"x":0.5214,"y":0.1634}]	91	2020-04-18 20:37:04.016163	2020-04-21 14:32:18.099099
221	[{"x":0.364,"y":0.8396},{"x":0.341,"y":0.5107},{"x":0.3618,"y":0.338},{"x":0.4342,"y":0.1719}]	52	2020-04-18 20:37:04.229757	2020-04-21 14:32:52.633474
223	[{"x":0.3109,"y":0.9134},{"x":0.2648,"y":0.5625},{"x":0.2599,"y":0.3586},{"x":0.2459,"y":0.1831}]	190	2020-04-18 20:37:04.316844	2020-04-21 14:33:15.704427
25	[{"x":0.3037,"y":0.8051},{"x":0.2906,"y":0.5387},{"x":0.2906,"y":0.3306},{"x":0.3454,"y":0.1538}]	203	2020-04-18 20:36:56.142631	2020-04-21 13:43:10.510826
26	[{"x":0.3692,"y":0.7664},{"x":0.3495,"y":0.5395},{"x":0.315,"y":0.2851},{"x":0.3092,"y":0.1612},{"x":0.3224,"y":0.0998}]	217	2020-04-18 20:36:56.179514	2020-04-21 13:43:20.936801
29	[{"x":0.5995,"y":0.9759},{"x":0.6012,"y":0.6272},{"x":0.6127,"y":0.477},{"x":0.5913,"y":0.3235},{"x":0.5313,"y":0.1798},{"x":0.5148,"y":0.0713}]	160	2020-04-18 20:36:56.293222	2020-04-21 13:43:59.920039
30	[{"x":0.4688,"y":0.852},{"x":0.449,"y":0.6042},{"x":0.4276,"y":0.4627},{"x":0.4482,"y":0.307},{"x":0.4877,"y":0.1974}]	174	2020-04-18 20:36:56.329741	2020-04-21 13:44:09.227368
31	[{"x":0.5329,"y":0.9408},{"x":0.4298,"y":0.5995},{"x":0.3531,"y":0.44},{"x":0.3311,"y":0.2969},{"x":0.3607,"y":0.1867},{"x":0.4375,"y":0.0946},{"x":0.4912,"y":0.0724}]	148	2020-04-18 20:36:56.364656	2020-04-21 13:44:21.09593
34	[{"x":0.5189,"y":0.943},{"x":0.4597,"y":0.6217},{"x":0.3512,"y":0.3882},{"x":0.2294,"y":0.0592}]	75	2020-04-18 20:36:56.477018	2020-04-21 13:44:45.791506
36	[{"x":0.6678,"y":0.7675},{"x":0.662,"y":0.5658},{"x":0.6291,"y":0.3893},{"x":0.69,"y":0.2478},{"x":0.69,"y":0.0779}]	71	2020-04-18 20:36:56.548958	2020-04-21 13:45:06.832291
38	[{"x":0.5502,"y":0.9594},{"x":0.5789,"y":0.6469},{"x":0.6094,"y":0.4693},{"x":0.5099,"y":0.1458}]	170	2020-04-18 20:36:56.636095	2020-04-21 13:45:36.232698
39	[{"x":0.3273,"y":0.8618},{"x":0.3495,"y":0.5987},{"x":0.3808,"y":0.4539},{"x":0.4161,"y":0.3443},{"x":0.4465,"y":0.1842}]	164	2020-04-18 20:36:56.676968	2020-04-21 13:45:45.923566
41	[{"x":0.7064,"y":0.7752},{"x":0.6793,"y":0.5866},{"x":0.6817,"y":0.2675},{"x":0.6579,"y":0.0833}]	206	2020-04-18 20:36:56.762915	2020-04-21 13:46:03.259615
42	[{"x":0.7344,"y":0.9145},{"x":0.6801,"y":0.6173},{"x":0.6398,"y":0.3893},{"x":0.5773,"y":0.1721}]	212	2020-04-18 20:36:56.812715	2020-04-21 13:46:12.161475
46	[{"x":0.6316,"y":0.8739},{"x":0.5888,"y":0.5768},{"x":0.5502,"y":0.4474},{"x":0.5502,"y":0.2895},{"x":0.5419,"y":0.0976}]	165	2020-04-18 20:36:56.963857	2020-04-21 13:46:44.802971
47	[{"x":0.3158,"y":0.7807},{"x":0.3026,"y":0.4178},{"x":0.287,"y":0.2807},{"x":0.2993,"y":0.2083},{"x":0.3174,"y":0.1513}]	171	2020-04-18 20:36:57.006742	2020-04-21 13:46:56.983921
50	[{"x":0.5,"y":0.8742},{"x":0.4814,"y":0.6217},{"x":0.341,"y":0.4992},{"x":0.3026,"y":0.4079},{"x":0.3509,"y":0.259},{"x":0.4715,"y":0.1875}]	8	2020-04-18 20:36:57.13078	2020-04-21 13:54:15.891098
52	[{"x":0.6886,"y":0.9367},{"x":0.682,"y":0.5888},{"x":0.6195,"y":0.3964},{"x":0.6305,"y":0.2278},{"x":0.6612,"y":0.0773}]	66	2020-04-18 20:36:57.208816	2020-04-21 13:54:34.290804
54	[{"x":0.2738,"y":0.852},{"x":0.2837,"y":0.6195},{"x":0.3002,"y":0.5088},{"x":0.4202,"y":0.5296},{"x":0.6497,"y":0.5395},{"x":0.7286,"y":0.4397},{"x":0.7401,"y":0.2325},{"x":0.7146,"y":0.1721}]	99	2020-04-18 20:36:57.278584	2020-04-21 13:54:59.756131
55	[{"x":0.19,"y":0.7489},{"x":0.1982,"y":0.5746},{"x":0.2023,"y":0.4232},{"x":0.2007,"y":0.2906},{"x":0.2155,"y":0.2193}]	173	2020-04-18 20:36:57.324444	2020-04-21 13:55:16.479653
59	[{"x":0.5633,"y":0.9496},{"x":0.5592,"y":0.5373},{"x":0.435,"y":0.3805},{"x":0.3742,"y":0.2401},{"x":0.3479,"y":0.0954},{"x":0.3372,"y":0.0318}]	238	2020-04-18 20:36:57.477727	2020-04-21 13:57:21.293261
61	[{"x":0.7196,"y":0.9485},{"x":0.7007,"y":0.58},{"x":0.6785,"y":0.2774},{"x":0.662,"y":0.1217}]	210	2020-04-18 20:36:57.55429	2020-04-21 13:57:45.935035
62	[{"x":0.6201,"y":0.8366},{"x":0.6143,"y":0.5779},{"x":0.616,"y":0.4792},{"x":0.6612,"y":0.2796},{"x":0.6554,"y":0.2138},{"x":0.625,"y":0.1952}]	172	2020-04-18 20:36:57.608789	2020-04-21 13:57:53.901354
63	[{"x":0.4523,"y":0.9737},{"x":0.4433,"y":0.6086},{"x":0.4169,"y":0.4189},{"x":0.4178,"y":0.261},{"x":0.4934,"y":0.1075},{"x":0.5016,"y":0.0471}]	166	2020-04-18 20:36:57.645884	2020-04-21 13:58:02.516215
66	[{"x":0.4613,"y":0.9342},{"x":0.4507,"y":0.6184},{"x":0.412,"y":0.4221},{"x":0.4194,"y":0.261},{"x":0.3775,"y":0.0669}]	199	2020-04-18 20:36:57.776354	2020-04-21 13:58:24.888369
68	[{"x":0.4104,"y":0.9013},{"x":0.4219,"y":0.5592},{"x":0.44,"y":0.3344},{"x":0.4901,"y":0.0757}]	9	2020-04-18 20:36:57.869007	2020-04-21 13:58:49.147925
69	[{"x":0.5439,"y":0.9375},{"x":0.5428,"y":0.56},{"x":0.443,"y":0.4581},{"x":0.3882,"y":0.3396},{"x":0.3925,"y":0.3076}]	14	2020-04-18 20:36:57.917624	2020-04-21 13:59:00.438455
71	[{"x":0.4309,"y":0.8893},{"x":0.4178,"y":0.5011},{"x":0.4112,"y":0.2654},{"x":0.4317,"y":0.068}]	129	2020-04-18 20:36:57.994555	2020-04-21 13:59:13.856589
74	[{"x":0.3651,"y":0.909},{"x":0.3405,"y":0.5395},{"x":0.2549,"y":0.3706},{"x":0.2656,"y":0.2533},{"x":0.3363,"y":0.1338},{"x":0.3947,"y":0.0384}]	100	2020-04-18 20:36:58.1157	2020-04-21 13:59:37.918714
76	[{"x":0.0781,"y":0.7873},{"x":0.1086,"y":0.5658},{"x":0.1579,"y":0.4397},{"x":0.2549,"y":0.3991},{"x":0.4301,"y":0.4035},{"x":0.6776,"y":0.3618},{"x":0.8487,"y":0.3333},{"x":0.8429,"y":0.2083}]	29	2020-04-18 20:36:58.189541	2020-04-21 13:59:56.095516
79	[{"x":0.7681,"y":0.841},{"x":0.7887,"y":0.6678},{"x":0.8191,"y":0.568},{"x":0.8125,"y":0.5175},{"x":0.7418,"y":0.3421}]	102	2020-04-18 20:36:58.312885	2020-04-21 14:07:29.523718
80	[{"x":0.7664,"y":0.9079},{"x":0.7459,"y":0.5548},{"x":0.6801,"y":0.2654},{"x":0.5715,"y":0.0307}]	103	2020-04-18 20:36:58.3403	2020-04-21 14:07:37.450912
82	[{"x":0.0428,"y":0.5658},{"x":0.1217,"y":0.477},{"x":0.2286,"y":0.4868}]	16	2020-04-18 20:36:58.429653	2020-04-21 14:07:57.310638
84	[{"x":0.5181,"y":0.8509},{"x":0.4901,"y":0.5395},{"x":0.4786,"y":0.4101},{"x":0.5296,"y":0.2522},{"x":0.5995,"y":0.1228}]	107	2020-04-18 20:36:58.512773	2020-04-21 14:08:12.238051
85	[{"x":0.4967,"y":0.8465},{"x":0.5107,"y":0.5493},{"x":0.5419,"y":0.3914},{"x":0.5074,"y":0.1875},{"x":0.4778,"y":0.1239}]	106	2020-04-18 20:36:58.546359	2020-04-21 14:08:18.648392
88	[{"x":0.8141,"y":0.932},{"x":0.7393,"y":0.6393},{"x":0.5526,"y":0.5022},{"x":0.3799,"y":0.3268},{"x":0.2977,"y":0.1502}]	11	2020-04-18 20:36:58.676284	2020-04-21 14:08:49.87644
92	[{"x":0.591,"y":0.8783},{"x":0.5691,"y":0.5584},{"x":0.5592,"y":0.3799},{"x":0.534,"y":0.1209}]	139	2020-04-18 20:36:58.84357	2020-04-21 14:09:17.364553
94	[{"x":0.4572,"y":0.9605},{"x":0.4781,"y":0.7393},{"x":0.5614,"y":0.4786},{"x":0.5691,"y":0.2368},{"x":0.4934,"y":0.1447}]	105	2020-04-18 20:36:58.933692	2020-04-21 14:09:31.670298
95	[{"x":0.6118,"y":0.9452},{"x":0.6044,"y":0.6064},{"x":0.611,"y":0.3717},{"x":0.5806,"y":0.1261}]	38	2020-04-18 20:36:58.969379	2020-04-21 14:09:37.15947
97	[{"x":0.4792,"y":0.9326},{"x":0.4605,"y":0.5518},{"x":0.477,"y":0.3166},{"x":0.4298,"y":0.0946}]	108	2020-04-18 20:36:59.048247	2020-04-21 14:10:15.547684
99	[{"x":0.6283,"y":0.9211},{"x":0.6439,"y":0.6491},{"x":0.7229,"y":0.4474},{"x":0.7878,"y":0.1842}]	134	2020-04-18 20:36:59.136377	2020-04-21 14:10:38.262327
100	[{"x":0.7771,"y":0.6787},{"x":0.7804,"y":0.4923},{"x":0.8281,"y":0.2467},{"x":0.838,"y":0.1656},{"x":0.8059,"y":0.1151}]	242	2020-04-18 20:36:59.180781	2020-04-21 14:10:46.673199
101	[{"x":0.4523,"y":0.9836},{"x":0.4729,"y":0.83},{"x":0.5633,"y":0.5757},{"x":0.5781,"y":0.364},{"x":0.5691,"y":0.1908},{"x":0.5337,"y":0.0373}]	243	2020-04-18 20:36:59.221288	2020-04-21 14:10:54.777981
104	[{"x":0.3594,"y":0.9397},{"x":0.352,"y":0.6162},{"x":0.3257,"y":0.386},{"x":0.3257,"y":0.1985},{"x":0.3536,"y":0.1469}]	109	2020-04-18 20:36:59.337064	2020-04-21 14:11:15.910804
105	[{"x":0.5658,"y":0.9232},{"x":0.5411,"y":0.6689},{"x":0.5206,"y":0.3991},{"x":0.4803,"y":0.0581}]	20	2020-04-18 20:36:59.377541	2020-04-21 14:11:22.297359
176	[{"x":0.5632,"y":0.1807},{"x":0.4645,"y":0.1842},{"x":0.4303,"y":0.486},{"x":0.2605,"y":0.5193},{"x":0.0039,"y":0.4702}]	68	2020-04-18 20:37:02.167926	2020-04-18 21:00:40.317518
108	[{"x":0.6472,"y":0.7873},{"x":0.6645,"y":0.4441},{"x":0.6612,"y":0.3465},{"x":0.6316,"y":0.2544},{"x":0.5946,"y":0.1579}]	137	2020-04-18 20:36:59.511006	2020-04-21 14:11:59.803475
110	[{"x":0.4079,"y":0.8109},{"x":0.2982,"y":0.4613},{"x":0.1316,"y":0.3692},{"x":0.1612,"y":0.3191},{"x":0.2171,"y":0.2607}]	241	2020-04-18 20:36:59.62738	2020-04-21 14:13:30.484403
114	[{"x":0.3026,"y":0.9452},{"x":0.3018,"y":0.6075},{"x":0.2813,"y":0.3958},{"x":0.3224,"y":0.1502}]	23	2020-04-18 20:36:59.778806	2020-04-21 14:14:11.228392
115	[{"x":0.4688,"y":0.9781},{"x":0.4581,"y":0.6195},{"x":0.5625,"y":0.4682},{"x":0.6028,"y":0.3015},{"x":0.5822,"y":0.17},{"x":0.5576,"y":0.0526}]	37	2020-04-18 20:36:59.827503	2020-04-21 14:14:21.075759
117	[{"x":0.4161,"y":0.9178},{"x":0.384,"y":0.6601},{"x":0.3544,"y":0.3947},{"x":0.3495,"y":0.1908}]	126	2020-04-18 20:36:59.899503	2020-04-21 14:14:32.068886
118	[{"x":0.6787,"y":0.8857},{"x":0.5757,"y":0.5115},{"x":0.3564,"y":0.4169},{"x":0.2599,"y":0.2796},{"x":0.2566,"y":0.1842},{"x":0.3059,"y":0.1538},{"x":0.3673,"y":0.1398}]	244	2020-04-18 20:36:59.937785	2020-04-21 14:14:52.284167
120	[{"x":0.3117,"y":0.92},{"x":0.3306,"y":0.6009},{"x":0.3791,"y":0.3651},{"x":0.3931,"y":0.1732},{"x":0.3931,"y":0.0998}]	127	2020-04-18 20:37:00.023369	2020-04-21 14:15:07.080822
121	[{"x":0.477,"y":0.8838},{"x":0.4975,"y":0.5252},{"x":0.5222,"y":0.3015},{"x":0.5123,"y":0.1842},{"x":0.4046,"y":0.1425},{"x":0.3939,"y":0.1118},{"x":0.4219,"y":0.0855}]	133	2020-04-18 20:37:00.059559	2020-04-21 14:15:17.253113
123	[{"x":0.3429,"y":0.8607},{"x":0.3602,"y":0.6283},{"x":0.3923,"y":0.4463},{"x":0.4235,"y":0.1513}]	24	2020-04-18 20:37:00.141466	2020-04-21 14:15:33.05313
125	[{"x":0.7577,"y":0.8306},{"x":0.6996,"y":0.509},{"x":0.6732,"y":0.3512},{"x":0.6107,"y":0.1571}]	125	2020-04-18 20:37:00.214023	2020-04-21 14:15:46.721659
126	[{"x":0.7336,"y":0.8717},{"x":0.7508,"y":0.5976},{"x":0.7944,"y":0.4002},{"x":0.7821,"y":0.3081},{"x":0.7467,"y":0.1952}]	131	2020-04-18 20:37:00.242728	2020-04-21 14:15:54.966413
127	[{"x":0.5814,"y":0.9496},{"x":0.5773,"y":0.6886},{"x":0.5921,"y":0.398},{"x":0.6283,"y":0.1107}]	119	2020-04-18 20:37:00.277291	2020-04-21 14:16:00.190411
133	[{"x":0.3454,"y":0.773},{"x":0.3183,"y":0.568},{"x":0.2919,"y":0.4364},{"x":0.3117,"y":0.2906},{"x":0.3561,"y":0.1952}]	19	2020-04-18 20:37:00.508484	2020-04-21 14:17:01.895109
130	[{"x":0.4926,"y":0.9276},{"x":0.4309,"y":0.7686},{"x":0.4383,"y":0.6184},{"x":0.4391,"y":0.3509},{"x":0.4622,"y":0.0307}]	124	2020-04-18 20:37:00.390445	2020-04-21 14:16:39.76611
135	[{"x":0.5641,"y":0.9945},{"x":0.5115,"y":0.591},{"x":0.347,"y":0.5154},{"x":0.2229,"y":0.4715},{"x":0.1414,"y":0.3377}]	4	2020-04-18 20:37:00.574293	2020-04-21 14:17:24.043921
137	[{"x":0.3734,"y":0.8564},{"x":0.3479,"y":0.58},{"x":0.3199,"y":0.4474},{"x":0.3298,"y":0.1886}]	180	2020-04-18 20:37:00.644319	2020-04-21 14:17:39.759349
139	[{"x":0.5748,"y":0.8333},{"x":0.5584,"y":0.6919},{"x":0.5033,"y":0.3684}]	81	2020-04-18 20:37:00.724581	2020-04-21 14:18:03.044723
140	[{"x":0.5008,"y":0.8618},{"x":0.5008,"y":0.5548},{"x":0.5099,"y":0.3607},{"x":0.4877,"y":0.1557}]	95	2020-04-18 20:37:00.75431	2020-04-21 14:18:10.383882
142	[{"x":0.4408,"y":0.9287},{"x":0.4104,"y":0.5658},{"x":0.3717,"y":0.3542},{"x":0.3808,"y":0.0746}]	157	2020-04-18 20:37:00.833463	2020-04-21 14:18:23.92604
144	[{"x":0.8904,"y":0.5214},{"x":0.7873,"y":0.5321},{"x":0.6458,"y":0.5025},{"x":0.4287,"y":0.4786},{"x":0.2621,"y":0.4342},{"x":0.136,"y":0.3758},{"x":0.1765,"y":0.2566},{"x":0.2588,"y":0.1184}]	235	2020-04-18 20:37:00.903547	2020-04-21 14:18:46.691454
146	[{"x":0.7771,"y":0.7993},{"x":0.7722,"y":0.5768},{"x":0.7632,"y":0.4408},{"x":0.7755,"y":0.2917},{"x":0.7294,"y":0.182}]	220	2020-04-18 20:37:00.976245	2020-04-21 14:19:06.364658
147	[{"x":0.4814,"y":0.8355},{"x":0.4792,"y":0.7459},{"x":0.4868,"y":0.6036},{"x":0.3629,"y":0.5},{"x":0.3191,"y":0.3586},{"x":0.3465,"y":0.2574},{"x":0.4419,"y":0.1604}]	234	2020-04-18 20:37:01.020426	2020-04-21 14:19:15.476912
149	[{"x":0.6028,"y":0.8596},{"x":0.5789,"y":0.5636},{"x":0.5288,"y":0.4836},{"x":0.4778,"y":0.3772},{"x":0.3783,"y":0.3553},{"x":0.3503,"y":0.3202},{"x":0.3569,"y":0.2796}]	156	2020-04-18 20:37:01.10395	2020-04-21 14:19:44.403401
150	[{"x":0.3487,"y":0.9334},{"x":0.3618,"y":0.6299},{"x":0.4923,"y":0.5526},{"x":0.4989,"y":0.384},{"x":0.4912,"y":0.1998},{"x":0.4112,"y":0.1168}]	142	2020-04-18 20:37:01.136938	2020-04-21 14:19:52.891925
152	[{"x":0.8117,"y":0.7763},{"x":0.7615,"y":0.5822},{"x":0.69,"y":0.4167},{"x":0.6595,"y":0.2895},{"x":0.6176,"y":0.1634}]	195	2020-04-18 20:37:01.206705	2020-04-21 14:20:16.746208
154	[{"x":0.7204,"y":0.9507},{"x":0.602,"y":0.6316},{"x":0.5088,"y":0.44},{"x":0.3991,"y":0.1891},{"x":0.3333,"y":0.0962}]	5	2020-04-18 20:37:01.28052	2020-04-21 14:20:31.018999
155	[{"x":0.514,"y":0.9901},{"x":0.5,"y":0.8311},{"x":0.4704,"y":0.6612},{"x":0.301,"y":0.6107},{"x":0.1217,"y":0.5395},{"x":0.0732,"y":0.4046}]	57	2020-04-18 20:37:01.321264	2020-04-21 14:20:39.317409
157	[{"x":0.6206,"y":0.9786},{"x":0.5932,"y":0.5699},{"x":0.6184,"y":0.4309},{"x":0.727,"y":0.3199},{"x":0.8103,"y":0.2714}]	7	2020-04-18 20:37:01.395994	2020-04-21 14:20:54.694699
159	[{"x":0.3602,"y":0.8805},{"x":0.3059,"y":0.67},{"x":0.273,"y":0.5548},{"x":0.2081,"y":0.3925},{"x":0.1982,"y":0.148},{"x":0.2113,"y":0.0044}]	69	2020-04-18 20:37:01.480908	2020-04-21 14:21:20.724616
161	[{"x":0.7607,"y":0.7061},{"x":0.7747,"y":0.5537},{"x":0.8281,"y":0.3651},{"x":0.8446,"y":0.1996},{"x":0.8026,"y":0.1447}]	183	2020-04-18 20:37:01.555363	2020-04-21 14:21:40.675913
164	[{"x":0.259,"y":0.9561},{"x":0.2582,"y":0.7379},{"x":0.2681,"y":0.6075},{"x":0.3084,"y":0.4287},{"x":0.3824,"y":0.2971}]	82	2020-04-18 20:37:01.678052	2020-04-21 14:22:04.976207
166	[{"x":0.3109,"y":0.9452},{"x":0.3224,"y":0.5735},{"x":0.315,"y":0.4024},{"x":0.3454,"y":0.2204},{"x":0.3717,"y":0.0658},{"x":0.3783,"y":0.0296}]	140	2020-04-18 20:37:01.758745	2020-04-21 14:22:21.057093
168	[{"x":0.0724,"y":0.6853},{"x":0.199,"y":0.5296},{"x":0.2829,"y":0.5044},{"x":0.3947,"y":0.5044},{"x":0.5058,"y":0.5175},{"x":0.6546,"y":0.511},{"x":0.7928,"y":0.5219},{"x":0.8923,"y":0.4934},{"x":0.9441,"y":0.5099},{"x":0.9605,"y":0.5329}]	236	2020-04-18 20:37:01.838319	2020-04-21 14:23:30.237815
170	[{"x":0.6998,"y":0.9331},{"x":0.6891,"y":0.511},{"x":0.7023,"y":0.2785},{"x":0.7113,"y":0.1107},{"x":0.6867,"y":0.0614}]	223	2020-04-18 20:37:01.917484	2020-04-21 14:23:50.423655
171	[{"x":0.5658,"y":0.9748},{"x":0.5592,"y":0.6184},{"x":0.5674,"y":0.466},{"x":0.5609,"y":0.2566},{"x":0.5362,"y":0.1349},{"x":0.5197,"y":0.0307}]	141	2020-04-18 20:37:01.957603	2020-04-21 14:23:57.800484
174	[{"x":0.4868,"y":0.9145},{"x":0.4803,"y":0.5471},{"x":0.491,"y":0.364},{"x":0.5715,"y":0.1173}]	97	2020-04-18 20:37:02.087672	2020-04-21 14:24:17.974863
175	[{"x":0.4934,"y":0.6469},{"x":0.4942,"y":0.557},{"x":0.477,"y":0.4792},{"x":0.4671,"y":0.3421},{"x":0.4153,"y":0.1601},{"x":0.3988,"y":0.0844}]	182	2020-04-18 20:37:02.133861	2020-04-21 14:24:31.273464
179	[{"x":0.5156,"y":0.9309},{"x":0.5099,"y":0.4583},{"x":0.4885,"y":0.2204},{"x":0.4811,"y":0.1217},{"x":0.5296,"y":0.0592}]	192	2020-04-18 20:37:02.279234	2020-04-21 14:25:26.643225
211	[{"x":0.4829,"y":0.7614},{"x":0.4921,"y":0.7561},{"x":0.5276,"y":0.7263},{"x":0.5395,"y":0.6947},{"x":0.5447,"y":0.6509},{"x":0.5592,"y":0.6158},{"x":0.5961,"y":0.5579},{"x":0.6079,"y":0.5439},{"x":0.6237,"y":0.4561},{"x":0.6211,"y":0.3579},{"x":0.6079,"y":0.2667},{"x":0.5789,"y":0.1614},{"x":0.5645,"y":0.1053}]	230	2020-04-18 20:37:03.757978	2020-04-18 21:00:40.391042
215	[{"x":0.8711,"y":0.507},{"x":0.7961,"y":0.5333},{"x":0.6026,"y":0.5246},{"x":0.4316,"y":0.4632},{"x":0.2763,"y":0.4807},{"x":0.1829,"y":0.4491},{"x":0.1658,"y":0.3018},{"x":0.1855,"y":0.1772},{"x":0.1974,"y":0.1316},{"x":0.2211,"y":0.1035}]	225	2020-04-18 20:37:03.924789	2020-04-18 21:00:40.401858
216	[{"x":0.7961,"y":0.5053},{"x":0.7316,"y":0.4526},{"x":0.6711,"y":0.414},{"x":0.5737,"y":0.414},{"x":0.4474,"y":0.4123},{"x":0.3461,"y":0.4263},{"x":0.2671,"y":0.4719},{"x":0.1724,"y":0.4702},{"x":0.1395,"y":0.4193},{"x":0.1592,"y":0.4}]	231	2020-04-18 20:37:03.972043	2020-04-18 21:00:40.404725
44	[{"x":0.2673,"y":0.8827},{"x":0.2788,"y":0.5384},{"x":0.389,"y":0.1184},{"x":0.4202,"y":0.0691}]	207	2020-04-18 20:36:56.891662	2020-04-21 13:46:28.938427
23	[{"x":0.2622,"y":0.7071},{"x":0.2252,"y":0.4478},{"x":0.2477,"y":0.2989},{"x":0.2667,"y":0.1765}]	175	2020-04-18 20:36:56.077299	2020-04-20 16:29:03.424279
1	[{"x":0.0222,"y":0.7818},{"x":0.0781,"y":0.5855},{"x":0.1793,"y":0.4605},{"x":0.2508,"y":0.4101},{"x":0.352,"y":0.4287},{"x":0.5016,"y":0.4309},{"x":0.5896,"y":0.2686},{"x":0.5699,"y":0.1601}]	1	2020-04-18 19:51:17.374644	2020-04-21 13:33:46.367889
2	[{"x":0.491,"y":0.8805},{"x":0.4901,"y":0.6502},{"x":0.4696,"y":0.4079},{"x":0.4819,"y":0.0877}]	63	2020-04-18 20:36:55.239653	2020-04-21 13:34:27.027339
8	[{"x":0.3651,"y":0.8761},{"x":0.3898,"y":0.5482},{"x":0.3577,"y":0.352},{"x":0.4227,"y":0.2796},{"x":0.4622,"y":0.1875},{"x":0.4671,"y":0.1096}]	228	2020-04-18 20:36:55.565201	2020-04-21 13:39:07.618489
21	[{"x":0.0288,"y":0.7599},{"x":0.0535,"y":0.5844},{"x":0.1316,"y":0.5493},{"x":0.2492,"y":0.5208},{"x":0.3906,"y":0.5033},{"x":0.5214,"y":0.5186},{"x":0.6209,"y":0.4879},{"x":0.6414,"y":0.3355},{"x":0.6694,"y":0.1897}]	48	2020-04-18 20:36:56.005996	2020-04-21 13:42:23.230116
22	[{"x":0.44,"y":0.9046},{"x":0.4161,"y":0.6458},{"x":0.2516,"y":0.659},{"x":0.1143,"y":0.6382},{"x":0.0419,"y":0.5274},{"x":0.0238,"y":0.3925},{"x":0.0855,"y":0.3114},{"x":0.1669,"y":0.216}]	149	2020-04-18 20:36:56.039619	2020-04-21 13:42:41.227811
32	[{"x":0.625,"y":0.8465},{"x":0.5913,"y":0.568},{"x":0.5715,"y":0.3509},{"x":0.528,"y":0.0658}]	49	2020-04-18 20:36:56.409067	2020-04-21 13:44:29.35076
40	[{"x":0.472,"y":0.9671},{"x":0.4992,"y":0.6305},{"x":0.5485,"y":0.4189},{"x":0.6291,"y":0.2752},{"x":0.6414,"y":0.1754},{"x":0.6209,"y":0.0493}]	158	2020-04-18 20:36:56.726179	2020-04-21 13:45:55.554652
49	[{"x":0.528,"y":0.8114},{"x":0.5625,"y":0.5844},{"x":0.565,"y":0.4221},{"x":0.5732,"y":0.2456},{"x":0.5872,"y":0.1316},{"x":0.5674,"y":0.0954}]	70	2020-04-18 20:36:57.09079	2020-04-21 13:53:48.459033
57	[{"x":0.3569,"y":0.8553},{"x":0.3692,"y":0.7259},{"x":0.2878,"y":0.6853},{"x":0.2253,"y":0.5197},{"x":0.199,"y":0.3849},{"x":0.2039,"y":0.2697},{"x":0.2212,"y":0.205},{"x":0.2549,"y":0.1524}]	205	2020-04-18 20:36:57.40939	2020-04-21 13:56:29.971594
60	[{"x":0.1916,"y":0.7961},{"x":0.1612,"y":0.6173},{"x":0.111,"y":0.5},{"x":0.1283,"y":0.3476},{"x":0.1735,"y":0.2423}]	204	2020-04-18 20:36:57.522941	2020-04-21 13:57:38.412157
182	[{"x":0.1678,"y":0.8169},{"x":0.213,"y":0.614},{"x":0.2706,"y":0.5461},{"x":0.4211,"y":0.5362},{"x":0.5222,"y":0.4298},{"x":0.6192,"y":0.1524}]	2	2020-04-18 20:37:02.392176	2020-04-21 14:25:50.476895
184	[{"x":0.3865,"y":0.9156},{"x":0.3405,"y":0.5987},{"x":0.3224,"y":0.3893},{"x":0.3503,"y":0.1261},{"x":0.3651,"y":0.0954}]	44	2020-04-18 20:37:02.476536	2020-04-21 14:26:06.387603
187	[{"x":0.5411,"y":0.9243},{"x":0.5304,"y":0.5186},{"x":0.5016,"y":0.307},{"x":0.4934,"y":0.1217}]	93	2020-04-18 20:37:02.59408	2020-04-21 14:26:26.252653
189	[{"x":0.6965,"y":0.818},{"x":0.7072,"y":0.5296},{"x":0.7664,"y":0.3607},{"x":0.7854,"y":0.2204},{"x":0.7541,"y":0.182}]	179	2020-04-18 20:37:02.66842	2020-04-21 14:26:50.542769
190	[{"x":0.8838,"y":0.5},{"x":0.761,"y":0.5247},{"x":0.4496,"y":0.5263},{"x":0.3169,"y":0.4457},{"x":0.2884,"y":0.315},{"x":0.3553,"y":0.2253}]	227	2020-04-18 20:37:02.700822	2020-04-21 14:27:11.891713
193	[{"x":0.7917,"y":0.9038},{"x":0.7368,"y":0.6192},{"x":0.6217,"y":0.4268},{"x":0.5943,"y":0.2714},{"x":0.5746,"y":0.1735},{"x":0.5713,"y":0.0518}]	226	2020-04-18 20:37:02.825696	2020-04-21 14:27:44.605272
195	[{"x":0.2442,"y":0.9002},{"x":0.2401,"y":0.6886},{"x":0.2393,"y":0.5899},{"x":0.338,"y":0.4912},{"x":0.5189,"y":0.5044},{"x":0.7401,"y":0.5548},{"x":0.8717,"y":0.4726},{"x":0.8808,"y":0.3618},{"x":0.8413,"y":0.17}]	178	2020-04-18 20:37:02.900519	2020-04-21 14:28:09.272792
196	[{"x":0.7023,"y":0.8706},{"x":0.6628,"y":0.5504},{"x":0.7007,"y":0.3882},{"x":0.7023,"y":0.3015},{"x":0.6513,"y":0.2292},{"x":0.6176,"y":0.1524},{"x":0.6135,"y":0.1075}]	92	2020-04-18 20:37:02.947674	2020-04-21 14:28:17.773065
198	[{"x":0.6456,"y":0.9101},{"x":0.6488,"y":0.6535},{"x":0.6809,"y":0.4024},{"x":0.6686,"y":0.0625}]	150	2020-04-18 20:37:03.056544	2020-04-21 14:28:41.116503
200	[{"x":0.3824,"y":0.9627},{"x":0.3503,"y":0.5581},{"x":0.4169,"y":0.3454},{"x":0.4613,"y":0.0329}]	51	2020-04-18 20:37:03.141585	2020-04-21 14:28:55.985865
201	[{"x":0.4457,"y":0.9671},{"x":0.4038,"y":0.5866},{"x":0.3906,"y":0.3673},{"x":0.3183,"y":0.1557},{"x":0.3067,"y":0.0636}]	187	2020-04-18 20:37:03.190245	2020-04-21 14:29:03.092361
203	[{"x":0.4334,"y":0.8838},{"x":0.4021,"y":0.5406},{"x":0.3289,"y":0.2577},{"x":0.3495,"y":0.1162},{"x":0.3742,"y":0.0296}]	185	2020-04-18 20:37:03.285476	2020-04-21 14:29:15.925628
204	[{"x":0.4748,"y":0.9391},{"x":0.4496,"y":0.5543},{"x":0.511,"y":0.4021},{"x":0.5735,"y":0.2459},{"x":0.5987,"y":0.1464},{"x":0.5669,"y":0.0913}]	191	2020-04-18 20:37:03.340594	2020-04-21 14:29:23.914335
206	[{"x":0.102,"y":0.8432},{"x":0.1694,"y":0.4868},{"x":0.3528,"y":0.5011},{"x":0.5666,"y":0.5143},{"x":0.7138,"y":0.4989},{"x":0.8322,"y":0.4518},{"x":0.9038,"y":0.4123}]	53	2020-04-18 20:37:03.438698	2020-04-21 14:29:53.73391
209	[{"x":0.6382,"y":0.8246},{"x":0.6299,"y":0.5603},{"x":0.6488,"y":0.4693},{"x":0.759,"y":0.4485},{"x":0.8701,"y":0.4221},{"x":0.903,"y":0.318},{"x":0.9235,"y":0.3103}]	84	2020-04-18 20:37:03.659325	2020-04-21 14:30:48.856758
213	[{"x":0.6349,"y":0.9112},{"x":0.6086,"y":0.5702},{"x":0.5724,"y":0.3838},{"x":0.5313,"y":0.1974},{"x":0.4663,"y":0.0537}]	218	2020-04-18 20:37:03.840809	2020-04-21 14:31:27.057385
214	[{"x":0.3561,"y":0.9331},{"x":0.3676,"y":0.5526},{"x":0.2804,"y":0.3893},{"x":0.264,"y":0.2445},{"x":0.3035,"y":0.1897}]	219	2020-04-18 20:37:03.878065	2020-04-21 14:31:35.509429
219	[{"x":0.5329,"y":0.9452},{"x":0.5419,"y":0.5779},{"x":0.5543,"y":0.3476},{"x":0.6234,"y":0.08}]	153	2020-04-18 20:37:04.125333	2020-04-21 14:32:42.091138
220	[{"x":0.4482,"y":0.9287},{"x":0.4564,"y":0.5208},{"x":0.4704,"y":0.3684},{"x":0.5329,"y":0.1217}]	147	2020-04-18 20:37:04.18197	2020-04-21 14:32:47.255802
222	[{"x":0.2325,"y":0.9169},{"x":0.318,"y":0.5444},{"x":0.3607,"y":0.4589},{"x":0.489,"y":0.491},{"x":0.6634,"y":0.4416},{"x":0.7511,"y":0.3586},{"x":0.7204,"y":0.2845},{"x":0.659,"y":0.2245}]	46	2020-04-18 20:37:04.272266	2020-04-21 14:33:08.414593
224	[{"x":0.443,"y":0.5765},{"x":0.4726,"y":0.5123},{"x":0.5439,"y":0.236},{"x":0.5384,"y":0.0757}]	184	2020-04-18 20:37:04.370683	2020-04-21 14:33:22.248228
73	[{"x":0.4112,"y":0.9671},{"x":0.3832,"y":0.5417},{"x":0.3487,"y":0.3224},{"x":0.3668,"y":0.1754},{"x":0.3758,"y":0.1031}]	114	2020-04-18 20:36:58.06937	2020-04-21 13:59:28.574715
77	[{"x":0.7664,"y":0.9496},{"x":0.7541,"y":0.6031},{"x":0.676,"y":0.1952}]	17	2020-04-18 20:36:58.231256	2020-04-21 14:00:09.212403
83	[{"x":0.7179,"y":0.7971},{"x":0.6933,"y":0.6075},{"x":0.6299,"y":0.4364},{"x":0.5888,"y":0.2818},{"x":0.5995,"y":0.0866}]	113	2020-04-18 20:36:58.472796	2020-04-21 14:08:05.246821
87	[{"x":0.5938,"y":0.8706},{"x":0.5707,"y":0.5998},{"x":0.5724,"y":0.3662},{"x":0.5189,"y":0.2237}]	13	2020-04-18 20:36:58.632095	2020-04-21 14:08:32.891521
89	[{"x":0.5987,"y":0.9046},{"x":0.6162,"y":0.685},{"x":0.5987,"y":0.5313},{"x":0.5011,"y":0.4391},{"x":0.3684,"y":0.3692},{"x":0.3344,"y":0.2763},{"x":0.3366,"y":0.2196},{"x":0.3509,"y":0.1785}]	104	2020-04-18 20:36:58.719967	2020-04-21 14:08:59.329816
98	[{"x":0.4071,"y":0.9189},{"x":0.3939,"y":0.6086},{"x":0.4063,"y":0.455},{"x":0.3183,"y":0.3268},{"x":0.3092,"y":0.1941}]	120	2020-04-18 20:36:59.095596	2020-04-21 14:10:33.239133
107	[{"x":0.6571,"y":0.9002},{"x":0.5921,"y":0.5296},{"x":0.4893,"y":0.4123},{"x":0.4087,"y":0.2664},{"x":0.4087,"y":0.1623},{"x":0.426,"y":0.1261}]	22	2020-04-18 20:36:59.462889	2020-04-21 14:11:41.816482
112	[{"x":0.2541,"y":0.9189},{"x":0.2467,"y":0.6151},{"x":0.2697,"y":0.4518},{"x":0.3207,"y":0.3333},{"x":0.3799,"y":0.205},{"x":0.4441,"y":0.1371},{"x":0.5288,"y":0.0921}]	122	2020-04-18 20:36:59.707148	2020-04-21 14:13:59.603559
116	[{"x":0.3454,"y":0.9145},{"x":0.3339,"y":0.5219},{"x":0.3561,"y":0.2862},{"x":0.3832,"y":0.1228}]	132	2020-04-18 20:36:59.860067	2020-04-21 14:14:26.69707
128	[{"x":0.4235,"y":0.9507},{"x":0.4227,"y":0.5998},{"x":0.4441,"y":0.3542},{"x":0.4482,"y":0.1393}]	118	2020-04-18 20:37:00.32277	2020-04-21 14:16:15.859574
131	[{"x":0.3668,"y":0.9101},{"x":0.3618,"y":0.6985},{"x":0.278,"y":0.5515},{"x":0.25,"y":0.3772},{"x":0.2442,"y":0.2478},{"x":0.3035,"y":0.0417}]	31	2020-04-18 20:37:00.435148	2020-04-21 14:16:47.902917
134	[{"x":0.6924,"y":0.7456},{"x":0.69,"y":0.4485},{"x":0.6308,"y":0.3169},{"x":0.5247,"y":0.261}]	42	2020-04-18 20:37:00.539647	2020-04-21 14:17:11.53666
143	[{"x":0.4326,"y":0.9254},{"x":0.4309,"y":0.5779},{"x":0.44,"y":0.4989},{"x":0.56,"y":0.4803},{"x":0.6678,"y":0.4518},{"x":0.7212,"y":0.2774},{"x":0.7286,"y":0.17},{"x":0.69,"y":0.0877}]	209	2020-04-18 20:37:00.867425	2020-04-21 14:18:34.047299
145	[{"x":0.4087,"y":0.9638},{"x":0.4408,"y":0.6557},{"x":0.5214,"y":0.5362},{"x":0.5321,"y":0.3629},{"x":0.4712,"y":0.2423},{"x":0.2673,"y":0.1283},{"x":0.2549,"y":0.0779},{"x":0.2673,"y":0.057}]	221	2020-04-18 20:37:00.939492	2020-04-21 14:18:59.706697
163	[{"x":0.5674,"y":0.8618},{"x":0.5469,"y":0.4879},{"x":0.4926,"y":0.2971},{"x":0.4679,"y":0.1886},{"x":0.4556,"y":0.0757}]	168	2020-04-18 20:37:01.633238	2020-04-21 14:21:58.265976
167	[{"x":0.8972,"y":0.5011},{"x":0.838,"y":0.4748},{"x":0.7352,"y":0.4507},{"x":0.6612,"y":0.4627},{"x":0.5181,"y":0.4287},{"x":0.4301,"y":0.409},{"x":0.347,"y":0.3618},{"x":0.1933,"y":0.3586},{"x":0.1012,"y":0.3816},{"x":0.051,"y":0.3794}]	222	2020-04-18 20:37:01.793838	2020-04-21 14:22:52.009377
169	[{"x":0.3465,"y":0.8446},{"x":0.3355,"y":0.6645},{"x":0.432,"y":0.537},{"x":0.4254,"y":0.4375},{"x":0.352,"y":0.3742},{"x":0.3125,"y":0.2632},{"x":0.3465,"y":0.1785}]	237	2020-04-18 20:37:01.877461	2020-04-21 14:23:42.781271
180	[{"x":0.4153,"y":0.8662},{"x":0.4095,"y":0.545},{"x":0.4013,"y":0.4057},{"x":0.3997,"y":0.2785},{"x":0.4276,"y":0.1809}]	78	2020-04-18 20:37:02.323557	2020-04-21 14:25:33.574261
186	[{"x":0.5633,"y":0.8333},{"x":0.5559,"y":0.58},{"x":0.5206,"y":0.4035},{"x":0.5049,"y":0.25},{"x":0.5082,"y":0.17}]	145	2020-04-18 20:37:02.559485	2020-04-21 14:26:20.715785
191	[{"x":0.5313,"y":0.9364},{"x":0.5748,"y":0.5768},{"x":0.6743,"y":0.4605},{"x":0.7204,"y":0.2818},{"x":0.7056,"y":0.1952}]	233	2020-04-18 20:37:02.742198	2020-04-21 14:27:22.589374
192	[{"x":0.1689,"y":0.8766},{"x":0.1941,"y":0.7607},{"x":0.2412,"y":0.7056},{"x":0.4375,"y":0.6801},{"x":0.5735,"y":0.588},{"x":0.5318,"y":0.4589},{"x":0.3706,"y":0.3717},{"x":0.2478,"y":0.3059},{"x":0.2434,"y":0.2525},{"x":0.3279,"y":0.1842}]	232	2020-04-18 20:37:02.78092	2020-04-21 14:27:35.967984
207	[{"x":0.9424,"y":0.545},{"x":0.8355,"y":0.5603},{"x":0.7245,"y":0.5296},{"x":0.5979,"y":0.5263},{"x":0.4737,"y":0.545},{"x":0.3865,"y":0.6031},{"x":0.2837,"y":0.5877},{"x":0.1711,"y":0.5362},{"x":0.0896,"y":0.5373},{"x":0.0559,"y":0.5504}]	146	2020-04-18 20:37:03.54561	2020-04-21 14:30:15.077179
208	[{"x":0.3363,"y":0.9046},{"x":0.3692,"y":0.6634},{"x":0.4729,"y":0.5625},{"x":0.5411,"y":0.4474},{"x":0.5403,"y":0.1678},{"x":0.5321,"y":0.1305}]	152	2020-04-18 20:37:03.608045	2020-04-21 14:30:33.573556
218	[{"x":0.7327,"y":0.9836},{"x":0.7007,"y":0.6502},{"x":0.5798,"y":0.5768},{"x":0.3906,"y":0.5055},{"x":0.3224,"y":0.3728},{"x":0.3051,"y":0.2412},{"x":0.3092,"y":0.1711},{"x":0.4219,"y":0.045}]	85	2020-04-18 20:37:04.067592	2020-04-21 14:32:35.398081
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 225, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 225, true);


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.areas_id_seq', 2, true);


--
-- Name: boulders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.boulders_id_seq', 387, true);


--
-- Name: circuits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.circuits_id_seq', 12, true);


--
-- Name: pois_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.pois_id_seq', 2, true);


--
-- Name: problems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.problems_id_seq', 385, true);


--
-- Name: topos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.topos_id_seq', 224, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: boulders boulders_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.boulders
    ADD CONSTRAINT boulders_pkey PRIMARY KEY (id);


--
-- Name: circuits circuits_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.circuits
    ADD CONSTRAINT circuits_pkey PRIMARY KEY (id);


--
-- Name: pois pois_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.pois
    ADD CONSTRAINT pois_pkey PRIMARY KEY (id);


--
-- Name: problems problems_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT problems_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: topos topos_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.topos
    ADD CONSTRAINT topos_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_boulders_on_area_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_boulders_on_area_id ON public.boulders USING btree (area_id);


--
-- Name: index_circuits_on_area_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_circuits_on_area_id ON public.circuits USING btree (area_id);


--
-- Name: index_pois_on_area_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_pois_on_area_id ON public.pois USING btree (area_id);


--
-- Name: index_pois_on_location; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_pois_on_location ON public.pois USING gist (location);


--
-- Name: index_problems_on_area_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_problems_on_area_id ON public.problems USING btree (area_id);


--
-- Name: index_problems_on_circuit_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_problems_on_circuit_id ON public.problems USING btree (circuit_id);


--
-- Name: index_problems_on_location; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_problems_on_location ON public.problems USING gist (location);


--
-- Name: index_problems_on_tags; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_problems_on_tags ON public.problems USING gin (tags);


--
-- Name: index_topos_on_problem_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_topos_on_problem_id ON public.topos USING btree (problem_id);


--
-- Name: boulders fk_rails_2e5c243105; Type: FK CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.boulders
    ADD CONSTRAINT fk_rails_2e5c243105 FOREIGN KEY (area_id) REFERENCES public.areas(id);


--
-- Name: circuits fk_rails_b52d84e673; Type: FK CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.circuits
    ADD CONSTRAINT fk_rails_b52d84e673 FOREIGN KEY (area_id) REFERENCES public.areas(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: problems fk_rails_d3a7f4c434; Type: FK CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT fk_rails_d3a7f4c434 FOREIGN KEY (area_id) REFERENCES public.areas(id);


--
-- PostgreSQL database dump complete
--

