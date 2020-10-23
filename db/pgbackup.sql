--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
    area_id bigint,
    "order" integer
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
    updated_at timestamp(6) without time zone NOT NULL,
    published boolean DEFAULT true NOT NULL,
    metadata json
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
688	photo	Topo	361	688	2020-09-03 20:46:57.963127
689	photo	Topo	362	689	2020-09-03 20:46:58.074955
690	photo	Topo	363	690	2020-09-03 20:46:58.256322
691	photo	Topo	364	691	2020-09-03 20:46:58.378397
692	photo	Topo	365	692	2020-09-03 20:46:58.486815
693	photo	Topo	366	693	2020-09-03 20:46:58.599957
694	photo	Topo	367	694	2020-09-03 20:46:58.723536
695	photo	Topo	368	695	2020-09-03 20:46:59.072133
696	photo	Topo	369	696	2020-09-03 20:46:59.243435
697	photo	Topo	370	697	2020-09-03 20:46:59.360176
698	photo	Topo	371	698	2020-09-03 20:46:59.509299
699	photo	Topo	372	699	2020-09-03 20:46:59.685702
700	photo	Topo	373	700	2020-09-03 20:46:59.870181
701	photo	Topo	374	701	2020-09-03 20:47:00.12823
702	photo	Topo	375	702	2020-09-03 20:47:00.262661
703	photo	Topo	376	703	2020-09-03 20:47:00.370248
704	photo	Topo	377	704	2020-09-03 20:47:00.50847
705	photo	Topo	378	705	2020-09-03 20:47:00.654337
706	photo	Topo	379	706	2020-09-03 20:47:00.900117
707	photo	Topo	380	707	2020-09-03 20:47:01.081351
708	photo	Topo	381	708	2020-09-03 20:47:01.241689
709	photo	Topo	441	709	2020-09-03 20:47:01.330914
710	photo	Topo	382	710	2020-09-03 20:47:01.442889
711	photo	Topo	383	711	2020-09-03 20:47:01.602531
712	photo	Topo	384	712	2020-09-03 20:47:01.822416
713	photo	Topo	385	713	2020-09-03 20:47:01.933397
714	photo	Topo	386	714	2020-09-03 20:47:02.040891
715	photo	Topo	387	715	2020-09-03 20:47:02.17587
716	photo	Topo	388	716	2020-09-03 20:47:02.290204
717	photo	Topo	389	717	2020-09-03 20:47:02.465318
718	photo	Topo	390	718	2020-09-03 20:47:02.625828
719	photo	Topo	391	719	2020-09-03 20:47:02.79386
720	photo	Topo	392	720	2020-09-03 20:47:02.934156
721	photo	Topo	393	721	2020-09-03 20:47:03.050405
722	photo	Topo	394	722	2020-09-03 20:47:03.185595
723	photo	Topo	395	723	2020-09-03 20:47:03.44132
724	photo	Topo	396	724	2020-09-03 20:47:03.685468
725	photo	Topo	397	725	2020-09-03 20:47:03.806298
726	photo	Topo	398	726	2020-09-03 20:47:03.922463
265	photo	Topo	225	265	2020-07-05 20:03:39.897451
266	photo	Topo	226	266	2020-07-05 20:03:39.985474
267	photo	Topo	227	267	2020-07-05 20:03:40.064203
268	photo	Topo	228	268	2020-07-05 20:03:40.170792
269	photo	Topo	229	269	2020-07-05 20:03:40.27087
270	photo	Topo	230	270	2020-07-05 20:03:40.334441
271	photo	Topo	231	271	2020-07-05 20:03:40.407191
272	photo	Topo	232	272	2020-07-05 20:03:40.460854
273	photo	Topo	233	273	2020-07-05 20:03:40.520997
274	photo	Topo	234	274	2020-07-05 20:03:40.584859
275	photo	Topo	235	275	2020-07-05 20:03:40.649338
276	photo	Topo	236	276	2020-07-05 20:03:40.726906
277	photo	Topo	237	277	2020-07-05 20:03:40.791831
278	photo	Topo	238	278	2020-07-05 20:03:40.869401
279	photo	Topo	239	279	2020-07-05 20:03:40.964097
280	photo	Topo	240	280	2020-07-05 20:03:41.059989
281	photo	Topo	241	281	2020-07-05 20:03:41.193463
282	photo	Topo	242	282	2020-07-05 20:03:41.285983
283	photo	Topo	243	283	2020-07-05 20:03:41.35944
284	photo	Topo	244	284	2020-07-05 20:03:41.426579
285	photo	Topo	245	285	2020-07-05 20:03:41.486372
286	photo	Topo	246	286	2020-07-05 20:03:41.54814
287	photo	Topo	247	287	2020-07-05 20:03:41.639317
288	photo	Topo	248	288	2020-07-05 20:03:41.771935
289	photo	Topo	249	289	2020-07-05 20:03:41.834762
290	photo	Topo	250	290	2020-07-05 20:03:41.904751
291	photo	Topo	251	291	2020-07-05 20:03:42.048707
292	photo	Topo	252	292	2020-07-05 20:03:42.135243
293	photo	Topo	253	293	2020-07-05 20:03:42.195866
294	photo	Topo	254	294	2020-07-05 20:03:42.294843
295	photo	Topo	255	295	2020-07-05 20:03:42.392581
296	photo	Topo	256	296	2020-07-05 20:03:42.459212
297	photo	Topo	257	297	2020-07-05 20:03:42.535999
298	photo	Topo	258	298	2020-07-05 20:03:42.611047
299	photo	Topo	259	299	2020-07-05 20:03:42.687692
300	photo	Topo	260	300	2020-07-05 20:03:42.771363
301	photo	Topo	261	301	2020-07-05 20:03:42.855913
302	photo	Topo	262	302	2020-07-05 20:03:42.944274
303	photo	Topo	263	303	2020-07-05 20:03:43.02952
304	photo	Topo	264	304	2020-07-05 20:03:43.14347
727	photo	Topo	399	727	2020-09-03 20:47:04.015525
728	photo	Topo	400	728	2020-09-03 20:47:04.125253
729	photo	Topo	401	729	2020-09-03 20:47:04.272478
730	photo	Topo	402	730	2020-09-03 20:47:04.505438
731	photo	Topo	403	731	2020-09-03 20:47:04.686007
732	photo	Topo	404	732	2020-09-03 20:47:04.818108
733	photo	Topo	405	733	2020-09-03 20:47:04.922405
734	photo	Topo	406	734	2020-09-03 20:47:05.0746
735	photo	Topo	407	735	2020-09-03 20:47:05.214144
736	photo	Topo	408	736	2020-09-03 20:47:05.331979
737	photo	Topo	409	737	2020-09-03 20:47:05.654713
738	photo	Topo	410	738	2020-09-03 20:47:05.754011
739	photo	Topo	411	739	2020-09-03 20:47:05.855519
740	photo	Topo	412	740	2020-09-03 20:47:05.951747
741	photo	Topo	413	741	2020-09-03 20:47:06.03682
742	photo	Topo	414	742	2020-09-03 20:47:06.142798
743	photo	Topo	415	743	2020-09-03 20:47:06.283184
744	photo	Topo	416	744	2020-09-03 20:47:06.620602
745	photo	Topo	417	745	2020-09-03 20:47:06.762706
746	photo	Topo	418	746	2020-09-03 20:47:06.872018
747	photo	Topo	419	747	2020-09-03 20:47:06.966732
748	photo	Topo	420	748	2020-09-03 20:47:07.073137
749	photo	Topo	421	749	2020-09-03 20:47:07.165501
750	photo	Topo	422	750	2020-09-03 20:47:07.38858
751	photo	Topo	423	751	2020-09-03 20:47:07.640136
752	photo	Topo	424	752	2020-09-03 20:47:07.732468
753	photo	Topo	425	753	2020-09-03 20:47:07.825045
754	photo	Topo	426	754	2020-09-03 20:47:07.920909
755	photo	Topo	427	755	2020-09-03 20:47:08.015384
756	photo	Topo	428	756	2020-09-03 20:47:08.141765
758	photo	Topo	429	758	2020-09-03 20:47:08.523515
759	photo	Topo	430	759	2020-09-03 20:47:08.613983
760	photo	Topo	431	760	2020-09-03 20:47:08.696705
761	photo	Topo	432	761	2020-09-03 20:47:08.802392
762	photo	Topo	433	762	2020-09-03 20:47:08.891759
763	photo	Topo	434	763	2020-09-03 20:47:09.001358
764	photo	Topo	435	764	2020-09-03 20:47:09.306017
765	photo	Topo	436	765	2020-09-03 20:47:09.431518
766	photo	Topo	437	766	2020-09-03 20:47:09.521963
767	photo	Topo	438	767	2020-09-03 20:47:09.61253
768	photo	Topo	439	768	2020-09-03 20:47:09.707852
769	photo	Topo	440	769	2020-09-03 20:47:09.797219
770	photo	Topo	442	770	2020-09-03 20:47:09.89875
771	photo	Topo	443	771	2020-09-03 20:47:10.000761
772	photo	Topo	459	772	2020-09-03 20:47:10.30379
773	photo	Topo	444	773	2020-09-03 20:47:10.400558
774	photo	Topo	445	774	2020-09-03 20:47:10.489856
775	photo	Topo	460	775	2020-09-03 20:47:10.590189
776	photo	Topo	461	776	2020-09-03 20:47:10.718362
777	photo	Topo	462	777	2020-09-03 20:47:10.831159
778	photo	Topo	446	778	2020-09-03 20:47:10.979693
779	photo	Topo	447	779	2020-09-03 20:47:11.202984
780	photo	Topo	463	780	2020-09-03 20:47:11.320452
781	photo	Topo	464	781	2020-09-03 20:47:11.44342
782	photo	Topo	465	782	2020-09-03 20:47:11.589348
783	photo	Topo	466	783	2020-09-03 20:47:11.83497
784	photo	Topo	448	784	2020-09-03 20:47:12.039638
785	photo	Topo	449	785	2020-09-03 20:47:12.151632
786	photo	Topo	450	786	2020-09-03 20:47:12.306506
787	photo	Topo	467	787	2020-09-03 20:47:12.399009
788	photo	Topo	451	788	2020-09-03 20:47:12.490272
789	photo	Topo	452	789	2020-09-03 20:47:12.649603
790	photo	Topo	453	790	2020-09-03 20:47:12.81247
791	photo	Topo	468	791	2020-09-03 20:47:12.953721
792	photo	Topo	469	792	2020-09-03 20:47:13.083301
793	photo	Topo	470	793	2020-09-03 20:47:13.200863
794	photo	Topo	454	794	2020-09-03 20:47:13.302549
795	photo	Topo	455	795	2020-09-03 20:47:13.537794
796	photo	Topo	471	796	2020-09-03 20:47:13.645811
797	photo	Topo	456	797	2020-09-03 20:47:13.74569
798	photo	Topo	457	798	2020-09-03 20:47:13.888299
799	photo	Topo	472	799	2020-09-03 20:47:13.988395
800	photo	Topo	473	800	2020-09-03 20:47:14.087346
801	photo	Topo	474	801	2020-09-03 20:47:14.353664
802	photo	Topo	458	802	2020-09-03 20:47:14.531306
803	photo	Topo	475	803	2020-09-03 20:47:14.780252
804	photo	Topo	476	804	2020-09-03 20:47:14.867073
812	photo	Topo	481	812	2020-10-15 13:39:03.019915
814	photo	Topo	483	814	2020-10-15 13:45:04.538133
818	photo	Topo	486	818	2020-10-19 21:37:29.342346
822	photo	Topo	490	822	2020-10-19 21:41:48.18961
826	photo	Topo	494	826	2020-10-19 21:46:13.366978
828	photo	Topo	496	828	2020-10-19 21:47:41.885011
833	photo	Topo	501	833	2020-10-19 21:51:38.378899
834	photo	Topo	502	834	2020-10-19 21:52:18.623322
835	photo	Topo	503	835	2020-10-19 21:52:57.931923
837	photo	Topo	505	837	2020-10-19 21:55:06.282351
838	photo	Topo	506	838	2020-10-19 21:56:23.375305
805	photo	Topo	477	805	2020-09-04 19:56:30.910566
809	photo	Topo	265	809	2020-10-14 17:04:55.028542
810	photo	Topo	479	810	2020-10-15 13:01:45.749114
813	photo	Topo	482	813	2020-10-15 13:44:53.444225
816	photo	Topo	484	816	2020-10-15 13:46:47.708063
819	photo	Topo	487	819	2020-10-19 21:39:07.397781
820	photo	Topo	488	820	2020-10-19 21:39:56.054436
823	photo	Topo	491	823	2020-10-19 21:43:14.101701
824	photo	Topo	492	824	2020-10-19 21:43:59.542417
829	photo	Topo	497	829	2020-10-19 21:48:23.905458
830	photo	Topo	498	830	2020-10-19 21:49:06.814048
831	photo	Topo	499	831	2020-10-19 21:50:01.83602
832	photo	Topo	500	832	2020-10-19 21:50:58.544387
593	photo	Topo	266	593	2020-09-03 20:46:42.282532
594	photo	Topo	267	594	2020-09-03 20:46:42.450484
595	photo	Topo	268	595	2020-09-03 20:46:42.603841
596	photo	Topo	269	596	2020-09-03 20:46:42.813111
597	photo	Topo	270	597	2020-09-03 20:46:43.051896
598	photo	Topo	271	598	2020-09-03 20:46:43.179962
599	photo	Topo	272	599	2020-09-03 20:46:43.28863
600	photo	Topo	273	600	2020-09-03 20:46:43.403705
601	photo	Topo	274	601	2020-09-03 20:46:43.572709
602	photo	Topo	275	602	2020-09-03 20:46:43.789318
603	photo	Topo	276	603	2020-09-03 20:46:43.918042
604	photo	Topo	277	604	2020-09-03 20:46:44.045615
605	photo	Topo	278	605	2020-09-03 20:46:44.159941
606	photo	Topo	279	606	2020-09-03 20:46:44.272314
607	photo	Topo	280	607	2020-09-03 20:46:44.41385
608	photo	Topo	281	608	2020-09-03 20:46:44.650312
609	photo	Topo	282	609	2020-09-03 20:46:44.762164
610	photo	Topo	283	610	2020-09-03 20:46:44.975473
611	photo	Topo	284	611	2020-09-03 20:46:45.097664
612	photo	Topo	285	612	2020-09-03 20:46:45.208861
613	photo	Topo	286	613	2020-09-03 20:46:45.427515
614	photo	Topo	287	614	2020-09-03 20:46:45.515025
615	photo	Topo	288	615	2020-09-03 20:46:45.628659
616	photo	Topo	289	616	2020-09-03 20:46:45.757452
617	photo	Topo	290	617	2020-09-03 20:46:45.933042
618	photo	Topo	291	618	2020-09-03 20:46:46.207722
619	photo	Topo	292	619	2020-09-03 20:46:46.433381
620	photo	Topo	293	620	2020-09-03 20:46:46.565465
621	photo	Topo	294	621	2020-09-03 20:46:46.719892
622	photo	Topo	295	622	2020-09-03 20:46:46.833548
623	photo	Topo	296	623	2020-09-03 20:46:46.954504
624	photo	Topo	297	624	2020-09-03 20:46:47.062601
625	photo	Topo	298	625	2020-09-03 20:46:47.207283
626	photo	Topo	299	626	2020-09-03 20:46:47.491298
627	photo	Topo	300	627	2020-09-03 20:46:47.618614
628	photo	Topo	301	628	2020-09-03 20:46:47.839889
629	photo	Topo	302	629	2020-09-03 20:46:47.94703
630	photo	Topo	303	630	2020-09-03 20:46:48.08461
631	photo	Topo	304	631	2020-09-03 20:46:48.3893
632	photo	Topo	305	632	2020-09-03 20:46:48.531859
633	photo	Topo	306	633	2020-09-03 20:46:48.646116
634	photo	Topo	307	634	2020-09-03 20:46:48.737952
635	photo	Topo	308	635	2020-09-03 20:46:48.835829
636	photo	Topo	309	636	2020-09-03 20:46:48.949839
637	photo	Topo	310	637	2020-09-03 20:46:49.291268
638	photo	Topo	311	638	2020-09-03 20:46:49.52093
639	photo	Topo	312	639	2020-09-03 20:46:49.629321
640	photo	Topo	313	640	2020-09-03 20:46:49.752178
641	photo	Topo	314	641	2020-09-03 20:46:49.860419
642	photo	Topo	315	642	2020-09-03 20:46:49.963817
643	photo	Topo	316	643	2020-09-03 20:46:50.178294
644	photo	Topo	317	644	2020-09-03 20:46:50.472048
645	photo	Topo	318	645	2020-09-03 20:46:50.617728
646	photo	Topo	319	646	2020-09-03 20:46:50.747643
647	photo	Topo	320	647	2020-09-03 20:46:50.87306
648	photo	Topo	321	648	2020-09-03 20:46:51.010226
649	photo	Topo	322	649	2020-09-03 20:46:51.124619
650	photo	Topo	323	650	2020-09-03 20:46:51.560405
651	photo	Topo	324	651	2020-09-03 20:46:51.703244
652	photo	Topo	325	652	2020-09-03 20:46:51.837368
653	photo	Topo	326	653	2020-09-03 20:46:52.05418
654	photo	Topo	327	654	2020-09-03 20:46:52.249751
655	photo	Topo	328	655	2020-09-03 20:46:52.613427
656	photo	Topo	329	656	2020-09-03 20:46:52.770193
657	photo	Topo	330	657	2020-09-03 20:46:52.89124
658	photo	Topo	331	658	2020-09-03 20:46:53.009175
659	photo	Topo	332	659	2020-09-03 20:46:53.178774
660	photo	Topo	333	660	2020-09-03 20:46:53.32076
661	photo	Topo	334	661	2020-09-03 20:46:53.595577
662	photo	Topo	335	662	2020-09-03 20:46:53.892568
663	photo	Topo	336	663	2020-09-03 20:46:54.010303
664	photo	Topo	337	664	2020-09-03 20:46:54.135899
665	photo	Topo	338	665	2020-09-03 20:46:54.248536
666	photo	Topo	339	666	2020-09-03 20:46:54.415575
667	photo	Topo	340	667	2020-09-03 20:46:54.571707
668	photo	Topo	341	668	2020-09-03 20:46:54.848274
669	photo	Topo	342	669	2020-09-03 20:46:54.996246
670	photo	Topo	343	670	2020-09-03 20:46:55.110248
671	photo	Topo	344	671	2020-09-03 20:46:55.235667
672	photo	Topo	345	672	2020-09-03 20:46:55.442092
673	photo	Topo	346	673	2020-09-03 20:46:55.671713
674	photo	Topo	347	674	2020-09-03 20:46:55.937204
675	photo	Topo	348	675	2020-09-03 20:46:56.046864
676	photo	Topo	349	676	2020-09-03 20:46:56.140131
677	photo	Topo	350	677	2020-09-03 20:46:56.230002
678	photo	Topo	351	678	2020-09-03 20:46:56.32783
679	photo	Topo	352	679	2020-09-03 20:46:56.458144
680	photo	Topo	353	680	2020-09-03 20:46:56.72835
681	photo	Topo	354	681	2020-09-03 20:46:56.895326
682	photo	Topo	355	682	2020-09-03 20:46:57.013191
683	photo	Topo	356	683	2020-09-03 20:46:57.141901
684	photo	Topo	357	684	2020-09-03 20:46:57.289263
685	photo	Topo	358	685	2020-09-03 20:46:57.432568
686	photo	Topo	359	686	2020-09-03 20:46:57.560502
687	photo	Topo	360	687	2020-09-03 20:46:57.818153
811	photo	Topo	480	811	2020-10-15 13:24:49.713655
817	photo	Topo	485	817	2020-10-19 19:41:22.714091
821	photo	Topo	489	821	2020-10-19 21:41:02.630096
825	photo	Topo	493	825	2020-10-19 21:45:00.846251
827	photo	Topo	495	827	2020-10-19 21:46:52.969721
836	photo	Topo	504	836	2020-10-19 21:53:46.600817
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
805	zj3clkozr9g2foltlzb5zb25r1af	photo.jpg	image/jpeg	{"identified":true}	4306728	et+4prkLzLbjgu18iW/hdQ==	2020-09-04 19:56:30.90713
593	i4fltkuzm9ezutl1hl3aws7hm9y5	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12052891	LjXR5YQvXWHwE9o/G7eurA==	2020-09-03 20:46:42.279863
594	cabm5m4tny5cubxfn0tyvmzteq6q	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13538722	0mcAdCAt6Abi9GOfR/Ehcw==	2020-09-03 20:46:42.439646
595	f8eoggfp4ki65o1nr91re6abd8jx	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12668967	ixSpkxhrXTpgjS8D7FKHTQ==	2020-09-03 20:46:42.598308
596	1enu8idag7fhbz4jsn70qp7xr4w4	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13137960	7be5UvsIgpXi1TzGvb32EA==	2020-09-03 20:46:42.809788
599	2959cu4hobk6atn4t7ymddfc265o	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11885364	SA9ncu7edKvB377IxxI0cg==	2020-09-03 20:46:43.282
601	4jqsjd09nhkwy01aaervldkz8k8c	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12420724	SmU2xzRCT1TwL5JLFHmGag==	2020-09-03 20:46:43.557355
602	phajc7ggwfbnv38asi6rrhsavhfc	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12708044	a98Gwpfc0vcOtVP17fn6nA==	2020-09-03 20:46:43.785283
603	041ob7e6mojtbsmqyyigwziun6q0	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12629203	Huu9d1CMSEG5qGH22ouPZg==	2020-09-03 20:46:43.914808
756	5yg6uobmbwoj2svz686s7dh459hm	photo.jpg	image/jpeg	{"identified":true}	12509382	TESEbmSX6K+Ma6Qo6v1M5g==	2020-09-03 20:47:08.137712
276	c2gi0husx7443o6iszh47k3owbzy	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4693832	E6FVyTXXYZzb1vpsZXcqFg==	2020-07-05 20:03:40.725012
277	61h2j0nck5fc3vw8b7ym4hskblkp	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4848581	Kh0cxeN7E6F967ldXgGZBw==	2020-07-05 20:03:40.789325
278	84opfrji694amu1t00n118vhciqa	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4643995	d1XXjjV+jDeq4JtAcF4/0g==	2020-07-05 20:03:40.866124
279	305mdyvttky2ac5nrtsm85xgtko5	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4767903	RoGbtx7pwPuQJ1FabhlHNw==	2020-07-05 20:03:40.960444
280	axau9m97fx86m7ein9w6mwiwizky	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4679078	EQE/dVjGWn0FbLxGbMfEeA==	2020-07-05 20:03:41.05481
281	g2pas66ka8wyi1ly8awe17drgbx7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4275765	Dcufvr0uXude0xsWFqEITg==	2020-07-05 20:03:41.190867
282	iv3pym4t791t17d0ildp71sivc4u	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	5600939	tyTxlIQ+ARhY5DTVcVPFjg==	2020-07-05 20:03:41.284195
283	8oa4tny7judlx5bhqpxxaov4w9cl	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	5413726	76Dwr5JwRisuFm0w8GZYjQ==	2020-07-05 20:03:41.357189
284	nvu98bvbx6s1umg0cnnu7fz8z8l2	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4854774	ancT1iFz2monLxOwvEaqpQ==	2020-07-05 20:03:41.423575
285	vltqrps953gep2ru8ycnr3crj68e	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4809823	T31W3sGduTCVZxuBUjK+8w==	2020-07-05 20:03:41.484666
286	jafrk6eu9d32jbr652e0a78cpy0c	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4324273	AP/lLL2XYukKYBZIR86xaA==	2020-07-05 20:03:41.545452
287	j1uuwgwm2fsgurm9cqyzs2kpz4n1	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4607654	nBsCc2Bnr5wAcFF81yk1MQ==	2020-07-05 20:03:41.636316
288	1wyqbkaygcu7qwru9oj3zhkjuefj	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4774001	fHxoOiuVnttxhpezfNA9BA==	2020-07-05 20:03:41.769871
289	y7judvp30fmj0pciybgt43t2uy4y	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4645728	1VG6ZHME7ZYXMCZokiNefQ==	2020-07-05 20:03:41.83293
290	p6h2frcmf49t065e6wo4ee752bt7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4829016	GSYA77VtxB9Bmh5D0qvvgg==	2020-07-05 20:03:41.896639
291	wrfd4w419z51f1ngl8usiwg5yq6t	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4333740	v7Cs6SF6AF0kMKo5DVo96Q==	2020-07-05 20:03:42.045949
292	qtub1vcm42b09e0gaq5q9ttxm970	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	5536399	2hmGiPhdJNOSzODbdT3X7w==	2020-07-05 20:03:42.133367
293	7e4q86ipqp3xb4330ipq05o7quig	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4134239	E2roZsPWgX6mAZSZy/dVrA==	2020-07-05 20:03:42.19335
294	rbmawxv8tr1tzx1g0bep4cp71cpf	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4676385	XNh8c6QjBnx44CCyolEQQw==	2020-07-05 20:03:42.291788
295	2ql6fu0gv5sz5sozr9h1nqcdn78q	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	6188662	Sjk6edMamx1kE0JBEbj19Q==	2020-07-05 20:03:42.387969
296	74uq8svd58sabnuod109hsyczvly	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4520064	a0kn9bcuFmB6j38svx2q5A==	2020-07-05 20:03:42.454889
297	ejurawkpbxfcryksiqau19go9mz5	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4673690	2EQ0JdfiWbNDBGaHVMTwQQ==	2020-07-05 20:03:42.533717
298	gf1sm965zafo044xilvnk9n86zva	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	5941477	zf9ILpCskOQ+Yvn7cxQkJw==	2020-07-05 20:03:42.608119
299	pwphls93uy3mrudxhpp8a4yrt8eg	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4690436	+vpgZ7VKgYXI/60wT5c7/g==	2020-07-05 20:03:42.683401
300	q8ykj6v8x1d7oq6e9z3sfogzwnp0	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	5099648	uViCxZQghl6S3FpgKevxOg==	2020-07-05 20:03:42.768312
301	4altts72gvgesnxae24nzj9b0nty	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4854867	2vKdbQaNdTjB3WdJ2qUh2A==	2020-07-05 20:03:42.850746
302	uq522tjcc9rmmv80oelw4e2wuqwj	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4592453	Na/wIUsJkYpmE6vpLjbIwQ==	2020-07-05 20:03:42.940998
264	ukjqywkz6o0e3k93zi440ros17i6	photo.jpg	image/jpeg	{"identified":true}	4841578	73PzXoygujwK69NeSQ7cxA==	2020-07-05 20:00:25.224666
265	eufdx47h6tke5z51fxlywgrzlscv	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4801202	5iKz4VJ9uyLqlIjBF8MKTw==	2020-07-05 20:03:39.895543
266	86qoinmhze2ho030b0dfjen5harh	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	5715053	cDmRrOKZxqwtJLGw++KHtw==	2020-07-05 20:03:39.980381
267	nrl4trdm5xiq6ziw64zu32g9d8ma	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4606935	jN6ysWnla2cmY6RhKlok5g==	2020-07-05 20:03:40.061343
268	rceerao34q0byks7hveb28yaq99o	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4610947	u4rYGubV6o2N5gQgB4K+og==	2020-07-05 20:03:40.165094
269	uybfuq4y7mo2kmm8qhofucz0zczw	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4450520	aswPFlIWphHlJi4kLhd/LQ==	2020-07-05 20:03:40.268365
270	4fmeii352e3xbgez98j3ml0qqhq6	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	5155719	JNZ/waKeQ7gZQ6EgRUbt4Q==	2020-07-05 20:03:40.332591
271	k2512uzb19o7k2l3xsnstsuky85r	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4584128	aJhA9IrfBq+qF+8ePLv7VQ==	2020-07-05 20:03:40.404256
272	44tnwie8splkjr3olk9jhy4fz0uu	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4700980	0OJszAZwvOSGuyFI2if57A==	2020-07-05 20:03:40.457812
273	6onoqodpp6lfzw04h4g123uvw1g5	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	5050831	fFfkn13fjE1+xxI2mSZWjQ==	2020-07-05 20:03:40.518919
274	rmaj98jpdvemzvos8vd2ufdycr16	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4657756	tzt7B8ckYCGvFf6yhn7vBw==	2020-07-05 20:03:40.583109
275	10x0x0s9la0ramf29jgpv2gb6f8a	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4863717	Vh28nM5y5HLy7+C7LYJwRg==	2020-07-05 20:03:40.646704
303	x4d5q9sb4hu7wfsljnila7z5sivl	photo.jpg	image/jpeg	{"identified":true}	3886187	mYw+3f2/vpnT3cEdlUvDwg==	2020-07-05 20:03:43.027067
304	n4drw607bctfenkjjz41j77p3i3t	photo.jpg	image/jpeg	{"identified":true}	4841578	73PzXoygujwK69NeSQ7cxA==	2020-07-05 20:03:43.140573
305	rkh8ffsdlfarvz2wkk3b5arwhzat	photo.jpg	image/jpeg	{"identified":true}	12709511	Iv9dymVkhOUL8HBQ+7BWWQ==	2020-09-03 19:26:29.494057
306	qmibkqwnb939884ijgb60bg5k27t	photo.jpg	image/jpeg	{"identified":true}	12709511	Iv9dymVkhOUL8HBQ+7BWWQ==	2020-09-03 19:27:58.970537
307	ltcf36x5bg8hw96ev2zfakbc2pq6	photo.jpg	image/jpeg	{"identified":true}	12709511	Iv9dymVkhOUL8HBQ+7BWWQ==	2020-09-03 19:28:25.510985
597	gj4xiyzgpwfma1pctkm4r7fmxvm7	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11809878	RFABai+n2SRFlFMmHO5kkw==	2020-09-03 20:46:43.048642
628	rv76sx4k3klnhm0q8g0ueo2vt4te	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11943255	qRDatL6RoiBNv6qrNgHBFA==	2020-09-03 20:46:47.836841
632	p9fcn4elqykd8jruf7tf1g1hjae3	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13071236	laGti68kLczzhmx01zjXZA==	2020-09-03 20:46:48.518042
641	pc0evspe8imivws4tddvc10kelsk	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12411159	tHs3DmFUxVQS69LW7yQhsA==	2020-09-03 20:46:49.857791
649	752h6268vkmhepwdyqd4eaf7mc0w	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12747280	3wBnNYk5STU/AN6RRIUGXg==	2020-09-03 20:46:51.122232
758	rkisoie2gbl76byr292br9xv15my	photo.jpg	image/jpeg	{"identified":true}	11753536	5Iv6dS6a8cOhcPkJ81sDXg==	2020-09-03 20:47:08.519948
759	tkvchyp0xu9f4ksdo0xgp3sfsw43	photo.jpg	image/jpeg	{"identified":true}	11557945	A/G04p55vI41iEUr+V9OcA==	2020-09-03 20:47:08.611335
760	26ovkya4xsonleikb4hgmrwtbtdz	photo.jpg	image/jpeg	{"identified":true}	11715658	6g4syMmEvOYDEP1gAMWpIQ==	2020-09-03 20:47:08.694323
761	ivtfy7ltfjg8wrpgmr1w5s2cne6c	photo.jpg	image/jpeg	{"identified":true}	12204006	9QHpq1IoXMoP7ME5WbOhjA==	2020-09-03 20:47:08.798998
762	g2nfz26oy6hxa091yxgbyyv64b4p	photo.jpg	image/jpeg	{"identified":true}	11088441	dqylx4tLa8xhsCmfJ8RxBA==	2020-09-03 20:47:08.889242
763	qglexs8wwksrxrryg6hgah6jdrpl	photo.jpg	image/jpeg	{"identified":true}	14671113	mpXJccG4Rz3sYTSlz2Dp2w==	2020-09-03 20:47:08.995679
774	zqxt7nxva8qh1hmgxonmfr4lv3qw	photo.jpg	image/jpeg	{"identified":true}	11930470	f/YQQfbRp5C23/HJRmXLrQ==	2020-09-03 20:47:10.487095
775	zin606hdicnn8vm48n2zgohjjgpo	photo.jpg	image/jpeg	{"identified":true}	13008013	kGUZwfls2bkw0t7pduOI/g==	2020-09-03 20:47:10.586857
776	93cfp191a45nwxg16vnt50c5voxz	photo.jpg	image/jpeg	{"identified":true}	10851240	vMmx0DTtG3/sFpBCG7eOxA==	2020-09-03 20:47:10.715165
764	7hfnew7fy1fz9f8wrdasfofav9w3	photo.jpg	image/jpeg	{"identified":true}	13199274	ky+po13EVImC0Ea3WX2IeQ==	2020-09-03 20:47:09.302989
765	3n00avtawhx2xyfpc8pcenwvbvae	photo.jpg	image/jpeg	{"identified":true}	12335782	aqbzTzc9QO7V270Jp7JhLQ==	2020-09-03 20:47:09.427866
766	8fmd7za9zi4irpvgad0nurmqqk2l	photo.jpg	image/jpeg	{"identified":true}	11285667	k5CddUZzQSrn+95YPrM+sQ==	2020-09-03 20:47:09.51879
767	mwve6h79gzo9lv8uyhpq46xxiq21	photo.jpg	image/jpeg	{"identified":true}	13577225	uZ8/Z2sPvhIjGhvT3ftuhQ==	2020-09-03 20:47:09.609441
777	i39lp88c9xjt5qs1sjaan3c2ibp8	photo.jpg	image/jpeg	{"identified":true}	11006336	4K8aIULMnf8y3LQpmz0Yrw==	2020-09-03 20:47:10.828106
778	gjbaqvydvp8z0w65ddmi5b93v7aq	photo.jpg	image/jpeg	{"identified":true}	14154706	9zLXM6zlqmbeiPbaC/LH7w==	2020-09-03 20:47:10.973488
768	5gpnsxuupqpgzaxjurg53iqzwby1	photo.jpg	image/jpeg	{"identified":true}	13055461	KfVs/uNJZCNC4JTT25GCJQ==	2020-09-03 20:47:09.705219
769	up03p89rpnz9txx6cri1divbeoz9	photo.jpg	image/jpeg	{"identified":true}	12411159	tHs3DmFUxVQS69LW7yQhsA==	2020-09-03 20:47:09.79467
770	u9hcltpjk7im10g23qcneq1fwi39	photo.jpg	image/jpeg	{"identified":true}	9178021	Gz+ON5kwxOJB/Zv2h4ARNg==	2020-09-03 20:47:09.895608
771	05lacnnwosg485kd4yzxp46ghd2p	photo.jpg	image/jpeg	{"identified":true}	12950270	lcwrH6OjRuPeZcs0FE7iWg==	2020-09-03 20:47:09.99658
772	82uwob5vo0j5mpmkausd2e03nqhx	photo.jpg	image/jpeg	{"identified":true}	13442173	Il6D+gHZqE1IBvvgxq09Mg==	2020-09-03 20:47:10.292297
773	dy7vmg00jjdpx5vbe753dcxgok4v	photo.jpg	image/jpeg	{"identified":true}	12400237	RSD77HVeiC+0lmy/7fdoIQ==	2020-09-03 20:47:10.397305
779	ixg5od0buehdnmunnaa4zb6y3r5h	photo.jpg	image/jpeg	{"identified":true}	14264827	9sWU+89qPvwxJMfPkjsgkQ==	2020-09-03 20:47:11.198455
780	rrkx74c3kro4coxi94euu0n2k3fz	photo.jpg	image/jpeg	{"identified":true}	12859050	t1jV5fYfSl/qi/q7gps+hw==	2020-09-03 20:47:11.315398
781	dpnl925tf1fhq4pjy3j2gd8juvfx	photo.jpg	image/jpeg	{"identified":true}	11669153	MGXBMP3vRPJbRW5bwbZJ2A==	2020-09-03 20:47:11.440106
782	i2rtst6klfbz9as8baz3ay7lhokb	photo.jpg	image/jpeg	{"identified":true}	14132098	QyymjZ1R0Ij6WFdD8nkoug==	2020-09-03 20:47:11.581798
783	pgdu5uvywvr6j2md2z8sjde82cy1	photo.jpg	image/jpeg	{"identified":true}	13228383	VVIIqoHlnJ7oML3GNIBFng==	2020-09-03 20:47:11.829209
784	luqjcsgs6hgzgnugnx0r3ofe7zxc	photo.jpg	image/jpeg	{"identified":true}	13105019	omQDgVMGQpUg1t72uFMs9g==	2020-09-03 20:47:12.035726
785	a1rjmc88pqzr7xft87o2us2wlt96	photo.jpg	image/jpeg	{"identified":true}	14148755	jULwvDPVF3Dfypp+oCvVig==	2020-09-03 20:47:12.145931
786	h500qtit8sawdqg7a511rljml73g	photo.jpg	image/jpeg	{"identified":true}	13351969	ygAbbLJGUgC6mRR51sywBA==	2020-09-03 20:47:12.303167
787	144uyabzoxqobqjhfjzvc81cz4m0	photo.jpg	image/jpeg	{"identified":true}	8924293	NVmFU973wgkeQZmWn0r9bg==	2020-09-03 20:47:12.395007
788	iqrm00dthku23n4tgqjpzcckybmw	photo.jpg	image/jpeg	{"identified":true}	10772965	q93KwY2ne26eykZbhZv4WQ==	2020-09-03 20:47:12.48449
789	cnnu7p6o7vrv9sblae8sidfv197s	photo.jpg	image/jpeg	{"identified":true}	11796734	bZI7wf1W9pgQphCBAahW5g==	2020-09-03 20:47:12.644844
790	uz1autyadme2vvyyilvmwbxy6i6w	photo.jpg	image/jpeg	{"identified":true}	11344943	JHgsfu6Yqv3fb8G7+R8ZpQ==	2020-09-03 20:47:12.808902
791	di2efu84neo9urlj8wtyas63k043	photo.jpg	image/jpeg	{"identified":true}	13247017	h4yaYymKznKx9W/1iJJM/g==	2020-09-03 20:47:12.948711
792	8ac1t0ra34u094a35xg0uxwb8icz	photo.jpg	image/jpeg	{"identified":true}	12055149	D7zT29Pm/dZLNPhMjXHhXQ==	2020-09-03 20:47:13.079434
793	ro2d8ku5cru6se9rwvxnvid62rr9	photo.jpg	image/jpeg	{"identified":true}	12946604	jWr0ECBPJI1b8YvBSfEgnw==	2020-09-03 20:47:13.198323
794	zkbigv3bzqbk7cojldcf59xcze15	photo.jpg	image/jpeg	{"identified":true}	11921188	sAB5iRttNzh3P9Sxh4wrkA==	2020-09-03 20:47:13.299143
795	zqfnvebx9gq5a8fleo3xdz53u0ak	photo.jpg	image/jpeg	{"identified":true}	11167384	2sYyZHudHV85jzY4JdgcdQ==	2020-09-03 20:47:13.528014
796	hhn29k3vov16dzxj5cvqca8np579	photo.jpg	image/jpeg	{"identified":true}	13361673	QinvJYlDJdDWbVE5/hnw0g==	2020-09-03 20:47:13.643352
797	er23j3mhbui1ydwzguwubkoyof31	photo.jpg	image/jpeg	{"identified":true}	13361673	QinvJYlDJdDWbVE5/hnw0g==	2020-09-03 20:47:13.743498
798	xyd9cfl1kvlxngu7e6iwsf29unsg	photo.jpg	image/jpeg	{"identified":true}	12020426	ACHpDZNMsm/387VODXylJQ==	2020-09-03 20:47:13.884648
799	eaxl1m62zng4walt8mk7s19bqo4t	photo.jpg	image/jpeg	{"identified":true}	12287076	x0qXVG+Wt1zREiQmXXS/tw==	2020-09-03 20:47:13.985371
800	c0rejsofdrl9q471i4lo0ilh1tlp	photo.jpg	image/jpeg	{"identified":true}	14520711	PoE1WzseYCpvAgNr0D85uw==	2020-09-03 20:47:14.080262
801	gagkq7siio7yg1jy47l4ao2wi31o	photo.jpg	image/jpeg	{"identified":true}	11167384	2sYyZHudHV85jzY4JdgcdQ==	2020-09-03 20:47:14.350431
605	9yu7nigmdv80jv3j51kqbdb05397	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12193084	/4DQP3TsPqRzHKRW4KpmhQ==	2020-09-03 20:46:44.156455
606	m0ho6rpetf8vnut16keiwufbbops	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13685498	DenPmMXSexbQL/PFbnYgRg==	2020-09-03 20:46:44.269254
607	q609aq8wfn39iutwpvo5acar9j64	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11506557	ZoDu+PjH81P6sUyGlQOBAQ==	2020-09-03 20:46:44.406783
608	cn2naql8lpzhxl3zxmgfsi3mnqmw	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10950151	0OvxwsBEbmM4MzTsYXhjrw==	2020-09-03 20:46:44.645308
609	pu5hwj69dy0smz6vcrv5uzyq5p2v	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	15254222	Nx4uTs4Tm6QQ9fIlZNqwYQ==	2020-09-03 20:46:44.757182
612	n28a5sz4zmpvf8jzs5gldne9t3ep	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10022485	fmsSiiMvzH+72/AzYeqFGA==	2020-09-03 20:46:45.201939
611	b78b5da2pnc25u6x84s26onvgy6o	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11952530	e3O5CArBNgPrkqxomOXazA==	2020-09-03 20:46:45.094491
610	jta9zpljy4vy24dtk98e7s8ezrid	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13485877	EXVSnABJfo83koUaQvSZSw==	2020-09-03 20:46:44.970801
613	y17v7eb17ksfh0zdzz81ngkwhqq3	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11333384	tvgfv6pBFxJ8ySOWO+Oj7w==	2020-09-03 20:46:45.422452
615	edr25oe7cnd7gj4xgltuqhql26mq	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12879651	CTgAGEwVcyqVXIFyrTL8ww==	2020-09-03 20:46:45.625398
616	65akdf5xioe34agbzamggapozxna	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13023633	Kajcp8zKICv59x+yFj/EEw==	2020-09-03 20:46:45.753273
614	yy85zqegckc1ifukaq1dilbjlyqm	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13920397	8FhNdbM2MdO5ZvI8wk1zZQ==	2020-09-03 20:46:45.511852
617	muaewogeqo97t2svi32aulz5buzx	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12172660	yK8Mgy9A6XdhNNjJOMr7dQ==	2020-09-03 20:46:45.929544
618	scgapi2yv3p5ul70x015eex6obd0	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11706862	6E97KPpLvtKNmbxnBWB5rw==	2020-09-03 20:46:46.192591
620	r6aq9psetivhsr7ckw5khxqjf4f5	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10838014	158IxlC7lXoqlBA9LniGiA==	2020-09-03 20:46:46.560555
619	ya3ahq1iioc80xu9nq9b7ci0l3rq	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12954948	+Qrbrsp3toxYjhZZtiycMg==	2020-09-03 20:46:46.429105
621	0082wu7fbueiz9bjlu1xw07zb84p	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12368301	0zbeA1WG9GUUIBCMdrdzQQ==	2020-09-03 20:46:46.71654
622	8hhzf0m4ajy5j4bkv0g3ujessrm7	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12284560	p+PX93LOYTAHzpFy75lusA==	2020-09-03 20:46:46.830649
624	98vucqv836llj2i6tx8goaaifjj0	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10935978	glN5kbNUixMn1QKDxLdmfw==	2020-09-03 20:46:47.059886
625	wqov69dhf63r2g9d0sd34nupptmi	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10624428	kJt0f00qV7ouJVei+k2a6g==	2020-09-03 20:46:47.199037
623	b4ulhfgly8cr00wey157abelmy7x	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	15975273	R94NJEzU1EVSvpyC4NLupg==	2020-09-03 20:46:46.951733
629	heaxg3e907x3yaxrfhnabw2cfy61	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	15995441	yrQcRV8iI3FARwJcfNjtpw==	2020-09-03 20:46:47.944552
630	o5daklgq1c2fazwuly1uc10nphc8	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12688989	tl22Wgl0UFHV9ubUd+ebcA==	2020-09-03 20:46:48.074909
633	jon4wtozlzzawups66pfhwr3q25m	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9201128	1/iD+E7EnNJIofGYomN3KA==	2020-09-03 20:46:48.642328
634	fclund8lera8gapz6siowr0cskhk	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13011790	4XrRLhi4/5XNnlg4dDIOmg==	2020-09-03 20:46:48.735193
635	q1jfcq3w2dtjqdy7124e5aevsmmm	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12708044	a98Gwpfc0vcOtVP17fn6nA==	2020-09-03 20:46:48.832477
636	75w27lfpz9bg7in0f7xhb8ns9kss	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12855677	jnCXrf7nR9/hna7C7sWP3A==	2020-09-03 20:46:48.946579
638	ixdo6bqbpxrxaanly6l8m66edxa6	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12386631	RiZKmVdZFo2CBQ5DY/xe0g==	2020-09-03 20:46:49.511033
639	rg0d9swkazglxyg5m4u8zyqmt7fs	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13132116	KleosxBubMBBvmufw4q57Q==	2020-09-03 20:46:49.624525
640	rbvdxz3ct20rtq44s6o3zbplnh3j	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13038900	9oOe+bsQ7tdaFaBVdhNZwg==	2020-09-03 20:46:49.748446
642	ng5ctg7muntiq8ja0fqug15ji97r	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11748063	uRvJOtw+ojHqdaQQWaf1uw==	2020-09-03 20:46:49.95722
643	2lud29t9haut5nwwnhfo94kj4ioa	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13538722	0mcAdCAt6Abi9GOfR/Ehcw==	2020-09-03 20:46:50.163895
644	74zkl6030xdn5hzfb608bx9llhbj	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12994163	ei0+n1DjXpIt42Jsi54/bg==	2020-09-03 20:46:50.467998
646	ls3sp09p25xokhj83mimvreqoufy	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13928676	ifzRKSV4ZvlrigggBZRlzg==	2020-09-03 20:46:50.74393
647	r9w7s1y2lo98puu610a4zmkqvm1g	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11335696	zxBfqrIVbwmcM8bai8z8rQ==	2020-09-03 20:46:50.868036
648	lqkyae5ezf84bau750zvraotgjet	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13002684	6yLwDGhZOcexcysGUwFosA==	2020-09-03 20:46:51.005833
650	2ja4uvl76thtl4kf8jvuj0u47w7i	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	8836833	rgABtL0QQXzp0nwFgl1a1A==	2020-09-03 20:46:51.556732
651	5aexrgxrocm81vonfqgmli015ed8	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13440722	UDuiy+kmyM8gHhC34JTLLg==	2020-09-03 20:46:51.69821
598	v9e7t0kax8hj0id8xx4jalo7yvuf	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10484680	qz1NP8hOybvtgq5PW0y0XA==	2020-09-03 20:46:43.170263
627	6krwk99lo4roi2kwfr4b0dhy0xrz	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12386631	RiZKmVdZFo2CBQ5DY/xe0g==	2020-09-03 20:46:47.613423
809	132qn4z51jp2l4mxfmj0bjbvmviu	orange-1.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12709511	Iv9dymVkhOUL8HBQ+7BWWQ==	2020-10-14 17:04:55.026023
713	lza1ydj1s5tpk3ig96f6ggj474va	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10910934	gKEZ/z1cLzxXPCeqSjv2rg==	2020-09-03 20:47:01.930015
822	wvxfh66o3xo0unsgsmqy9j5lxe6k	IMG_0907.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11571314	5ASgeFJkdsCcVuRE/gsUcA==	2020-10-19 21:41:48.187649
825	e3okv8d6sq8lj8ohdewdafkrj4ei	IMG_0911.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12022184	+Dz1XpTK/NNvhBnOcYOZmA==	2020-10-19 21:45:00.844661
827	g7i1p06vnhplof287id2rf2ye7bv	IMG_0914.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11145877	1TIRzTK/fXNGVKMHvEnMrg==	2020-10-19 21:46:52.968111
835	5bwtdbc5thx5dvsgf277yj01an6d	IMG_0930.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10751030	PGPPvv7MBJwnZ45upVBCUg==	2020-10-19 21:52:57.929724
836	em3ktraj2bvqzll70sirzytua3ee	IMG_0930.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10751030	PGPPvv7MBJwnZ45upVBCUg==	2020-10-19 21:53:46.599017
837	fx8601vo3ih86a12m9eh6dt698ww	IMG_0933.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10999482	XaQ/HW3mDMp/bcjUymH7vg==	2020-10-19 21:55:06.279983
600	y5nk5ds0if258vt17325s6encl2q	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9689040	yEqSzYTXZ554GrV1Fmwemg==	2020-09-03 20:46:43.397353
637	moway0kmmqfnoqpd1f1xthrls778	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	15231837	H71QuLssyq4O44k1e4kBHA==	2020-09-03 20:46:49.286786
645	y48v6chfj87qyf672x6f0uzj4ypo	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13595190	t0oGv4vVoLiHIfbTJGIh7w==	2020-09-03 20:46:50.60358
802	35o1qva50en91hv0xkji7uyhmleg	photo.jpg	image/jpeg	{"identified":true}	13189541	r34UUBbAt/QT9KSwErYCRQ==	2020-09-03 20:47:14.522832
803	k4szs2ed3fs0b9yyg9ijb5qxf2of	photo.jpg	image/jpeg	{"identified":true}	11859973	T93dxJoEWn3uCYohQEtUDQ==	2020-09-03 20:47:14.777055
804	x92daem6nguytvlwuyxqh2jhtjql	photo.jpg	image/jpeg	{"identified":true}	10162788	7CN5oHE2iQjypawQl3HakQ==	2020-09-03 20:47:14.864372
810	0v6zfjdcygquuhvq1jqpuh6ozhdi	orange-1-edited.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	4439568	woV6Y/MU6CrEUxCafSPk3A==	2020-10-15 13:01:45.743786
823	uq0ahetq85xe1ffov7h9kdn8knbf	IMG_0909.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11100366	Z8sUnYiPSk9ws/6864RGjA==	2020-10-19 21:43:14.099801
831	ef51jjqzmrt7jc2l09j75296j2ez	IMG_0923.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12363901	YKK5rvY9AvElheH4X5HYHA==	2020-10-19 21:50:01.834208
832	phvtuttc80f8w0uo0c7ti8k2rahp	IMG_0923.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12363901	YKK5rvY9AvElheH4X5HYHA==	2020-10-19 21:50:58.542766
446	gr9h5hzo9g7zhudhyo2g36e1lvyk	photo.jpg	image/jpeg	{"identified":true}	12287076	x0qXVG+Wt1zREiQmXXS/tw==	2020-09-03 20:43:28.947692
447	q3ysoxc62350f4t81k4plaxc1yqx	photo.jpg	image/jpeg	{"identified":true}	10984727	zbShp9JgSF2Ab2su+ZnK3w==	2020-09-03 20:43:29.046729
604	oe48clrmumli71vsoc3b073054v4	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13789824	B10XM2CF/nc3/mb4y/F2kg==	2020-09-03 20:46:44.042287
811	3sioprnpalduj205s7vgktyesckk	orange-1.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12709511	Iv9dymVkhOUL8HBQ+7BWWQ==	2020-10-15 13:24:49.711501
626	bevlzsgvko05maru4wdhyt3yxe4u	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12627287	81RxfXZKQLVpuQFDmQgptw==	2020-09-03 20:46:47.487918
631	6uuk4e7ke0sgaf7blgkokx62u4id	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10878374	VCpWAKvC83y3oqRt02VFYg==	2020-09-03 20:46:48.384628
812	t1x08u643pt3mf3jamhoookfhswu	orange-1-edited.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	4439568	woV6Y/MU6CrEUxCafSPk3A==	2020-10-15 13:39:03.016498
813	3h9b6e6ydgppearwcwfnt80vfjs4	orange-1-edited.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	4439568	woV6Y/MU6CrEUxCafSPk3A==	2020-10-15 13:44:53.441931
652	jsnxwn973hvrdok5ypt1kh22a73e	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10673929	7NTZdt+VxNJuWDZcYSnYrQ==	2020-09-03 20:46:51.833317
653	14v4xnuprp2orcv7kz2amxbq7usr	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11242769	oSZ4f7WwtN11h6Go3eXUQA==	2020-09-03 20:46:52.049788
654	3vlcuzhtthfihkvd35m4h6p97yd9	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13569812	6c51Qb8E2gszhePxkzzk2w==	2020-09-03 20:46:52.244929
655	qbdqs0pvrk6tdg6j5mr5d3ak9hjk	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13118977	fq4YYSoNB38f/SYAW4Omlw==	2020-09-03 20:46:52.600786
657	w616udtu89bsxk6t9xol81h9xwln	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12293922	gtrWGnRs+FOp2sgWvf+x2g==	2020-09-03 20:46:52.887675
656	8fa26fqxgve10gkf9va0ys0gbi1m	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14329280	RvwBvQeEz/wKjBhcgqebpQ==	2020-09-03 20:46:52.765855
658	w2gftmrxohg5aiq077ndbibvid78	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12609273	iDvJWPKqt5Nz8/cypmlzvQ==	2020-09-03 20:46:53.004903
659	p65n9wv9g8w3l2rv7mr468m0xyip	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9769390	Ye9Y828vcW7h+CsqoMukNg==	2020-09-03 20:46:53.175063
660	0qiyn7vtnfpiyo597fc0k3myi71l	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13745853	jOrBDnTkPVYcd5pStiv2mg==	2020-09-03 20:46:53.316206
661	qptu2artaka7w1zfneafxq47t2xn	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14203770	lNtmoge5GG0pGu7j3dZp+A==	2020-09-03 20:46:53.591786
662	icg5yjs7lf44wgaudymfgdxiffvm	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12971194	QyyGbxcLHD48xvjD+jZp2g==	2020-09-03 20:46:53.888171
663	g18btzecpffsb6scg8idnm9xtkpx	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13064306	DhOA1uakew4ZYawBXCkCJw==	2020-09-03 20:46:54.006673
664	teh4a7pqigs98lb008c1f5898aaf	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9855967	pK29+TFdS2FUNT/ueNMRLg==	2020-09-03 20:46:54.126558
665	8arsh5c8zwwnv5ssi9cmjuug0m5g	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9359635	tgWlreeg2W6jvLP1mNQbaw==	2020-09-03 20:46:54.243274
666	aegzl3amri3fufem4dkmh9150u4l	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13698725	eo8DMweR68cYZ1k11SecDw==	2020-09-03 20:46:54.39879
667	ucw62hls03pxqrfosf3jc3ksw5q9	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11930470	f/YQQfbRp5C23/HJRmXLrQ==	2020-09-03 20:46:54.563807
668	1ky2omxd1mfynd7lwa0167brrfk3	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11788985	fBSgGNGQl7blK9PCW7Rn7g==	2020-09-03 20:46:54.844651
669	y6gi6d0vu8ues5z39ero8626ea3g	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10686567	t5AI3DXxTrZWus6zmS58tA==	2020-09-03 20:46:54.992664
670	ux8jbiqj5dxn8h8ljg45rusy0pac	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13761982	6iUdRrg0xsoAelI2QJreog==	2020-09-03 20:46:55.10664
671	f9mnzbpj6n8o9i241qq4xp6mnugk	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11877651	HXeLUgjbuN9yB5bdBomWpg==	2020-09-03 20:46:55.231063
673	c7w2sq1hu5u5rqw9y7700i7wuc6c	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10780623	bae5SbIWs+n4FTCXTVwWCw==	2020-09-03 20:46:55.664454
672	v21hn41s4cowdn90td9snsbnhpub	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13867922	PSaoZVwhHMTTNjvjMgyLsg==	2020-09-03 20:46:55.439123
674	un85pztl48diu1gao0a32br3xx63	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12118342	yEa+jyRg1iuz+z6kOgF+WQ==	2020-09-03 20:46:55.934545
676	5n9ny5s9tlzb8dcxc4a9e7slook1	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	8924293	NVmFU973wgkeQZmWn0r9bg==	2020-09-03 20:46:56.13677
677	kk2oqzj47cvmwadzc929nppzdx5n	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10793112	apm04pxWt4j3l6QHwtPJLQ==	2020-09-03 20:46:56.226429
675	uj019ts0alfcvwxvkt95bwod0u21	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12532101	ZzTOjoiT5mcKqndA1oGK6A==	2020-09-03 20:46:56.043657
678	isvd7qy7fbm8ecqpfgojzb6ldssz	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12148827	4zs9fePQYmGY6df6OdsR/g==	2020-09-03 20:46:56.324261
680	3oguf7aqtgnaexot1p0av2bc867c	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	8919624	k6s7k/PzsSoNmZH6vr5Tuw==	2020-09-03 20:46:56.722668
679	v4p1a2konm0n25pdllimqyrcgp86	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12668967	ixSpkxhrXTpgjS8D7FKHTQ==	2020-09-03 20:46:56.45345
681	6x9n2ajpn0r4n1p7odunqsjq55ng	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12093188	cWBqM24ArhDx7YzGQfssug==	2020-09-03 20:46:56.891317
682	bjcjs0p793ha8jqhzxxcul6bhwt0	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13886264	V32PYZP8/XPORMTy4bI3uQ==	2020-09-03 20:46:57.009381
683	1de67p9sa1uy3kc9yon1b7cqdwoo	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14181501	KDYwAkaoelcJl4QvycfTgQ==	2020-09-03 20:46:57.138778
685	e9i1n1jo04td7u9akfab1psn39q1	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11177381	7/je1sGw0OysJn5bwjBQmw==	2020-09-03 20:46:57.4291
684	x2kp6wq0hyya47uhai1jjvvd6aml	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13440459	Slz+NcmdLmi3aKFFXNehwA==	2020-09-03 20:46:57.285559
686	wwnfszy0wj9ppi8qfxzn4tgzrsbz	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9401133	/0L1UkswfrvIWltWe9vBsQ==	2020-09-03 20:46:57.553335
687	czdwtzfbzvpe4se69rfboshakubi	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12400237	RSD77HVeiC+0lmy/7fdoIQ==	2020-09-03 20:46:57.814015
728	ra8d17iqwozy0nuovjlwsyqzg7e6	photo.jpg	image/jpeg	{"identified":true}	13994536	nWGW+UHqNhi3Jhd5CFfNEQ==	2020-09-03 20:47:04.117957
729	yex2y02kqjtewybbxrc8mjsw0a4n	photo.jpg	image/jpeg	{"identified":true}	12095882	0fGwkz0jSiQyHTI0LuBOOg==	2020-09-03 20:47:04.258147
730	af1ehabzk3zkl1vsn5jyukzfs056	photo.jpg	image/jpeg	{"identified":true}	13489747	0VAxEHjO9uPFgV3lC325Vw==	2020-09-03 20:47:04.500112
731	0fbnlbx0j1kvv4g83jwl2t3bdfw9	photo.jpg	image/jpeg	{"identified":true}	14697995	sibxthK5KfIUqxz/vAC7Ww==	2020-09-03 20:47:04.682616
732	ax2yzg161i8gxe8bohclq20figt1	photo.jpg	image/jpeg	{"identified":true}	12287076	x0qXVG+Wt1zREiQmXXS/tw==	2020-09-03 20:47:04.813799
733	gknw875cgqyelxhpf2aty34cvs3j	photo.jpg	image/jpeg	{"identified":true}	10984727	zbShp9JgSF2Ab2su+ZnK3w==	2020-09-03 20:47:04.918827
734	ccicufsrym4m4tu0ua5909nvrdlm	photo.jpg	image/jpeg	{"identified":true}	9920115	2KhBptEBXxCMRRLlWNR51w==	2020-09-03 20:47:05.071315
735	sew1w49wuhlt61zhlro6jdwjhkp3	photo.jpg	image/jpeg	{"identified":true}	12890940	quj3tlLSqHil+IFR0UeBCA==	2020-09-03 20:47:05.202415
736	wapezodkwvf9lly1d60lhqedu7wi	photo.jpg	image/jpeg	{"identified":true}	12799011	K9M/aRu++tSZnZiNJVF28g==	2020-09-03 20:47:05.326331
737	94orid3w83c19zxuemgosnftwv3y	photo.jpg	image/jpeg	{"identified":true}	10526840	jOOfBonXWR1L2I8ue4zW5w==	2020-09-03 20:47:05.650451
738	ev7c8je10j542p47dlv7ma7m1xs9	photo.jpg	image/jpeg	{"identified":true}	13847685	mLkyOSd7bTlSljOFvGa1lw==	2020-09-03 20:47:05.75015
739	8nomp9auybjlbg6rm4ko1pwj3kcz	photo.jpg	image/jpeg	{"identified":true}	10022485	fmsSiiMvzH+72/AzYeqFGA==	2020-09-03 20:47:05.851867
690	r797v8v8axzu2g5sgsoa22bmgxv4	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11169025	Y5MljmZNR3Kb9hgD4AnJ0Q==	2020-09-03 20:46:58.252478
692	ibs9tkomsi9nhfdjvoz8rrbuy7n6	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10587718	msqvtGCZKcUuD3y5hCgp1g==	2020-09-03 20:46:58.483258
691	slypamc80cq33t9xzs3yzc3od8fn	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13084009	jOaTj96ejyGz3LSKcCP1Lg==	2020-09-03 20:46:58.374336
694	fqulmzyy5bzzalpruutlmd4c4516	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11515904	1SyDYeRRqs+wYF9bI2Tm6A==	2020-09-03 20:46:58.720198
696	rf9kbuvnef4wlevmaq0f0jz9i1oi	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12052891	LjXR5YQvXWHwE9o/G7eurA==	2020-09-03 20:46:59.23842
695	0iyjjznj4dfhc7cjfhicczu95jpt	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13300183	ss4wPYWe7sstXoe1ojt87Q==	2020-09-03 20:46:59.067067
698	dg9ieacslrhj8f374zdgm3s0gpmp	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13781506	0uME1tDp1C8c87ja7WSulw==	2020-09-03 20:46:59.503601
702	sne77ubvms79nubnka141ir0e4t3	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9202066	jLy83b6TlKrJiC7TqAayNw==	2020-09-03 20:47:00.259518
700	m7d7yj9iym32s3o2lxq4iujyj0xq	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13713623	mQXWC962mnKzggBFkqKINg==	2020-09-03 20:46:59.861988
701	nfttt6h4uygxmym09tefybgrtwbh	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12915121	8S6jjFIk0lyEze//PU3b2g==	2020-09-03 20:47:00.124938
705	ez7tsdlz9y0jllvi7g7okb6rufg0	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11820206	y4tNtmV5fmuAk1vtYOjbbw==	2020-09-03 20:47:00.649178
703	b0zd893hd78wxf5hcdwmifqloz27	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14877013	7yB7aWgPQZZEFBG1ba2j4Q==	2020-09-03 20:47:00.366379
706	t389s9kve9qaly394l910h7t1xl5	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13478884	RF8pbyB7kumEzo6Z+PWadw==	2020-09-03 20:47:00.896775
709	c0l0xp9gknnv1fsgfxv6cey5mjkj	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	4215078	Okt9/BP0y0FK477zDqjbYw==	2020-09-03 20:47:01.32738
707	64raguho8kk5cyfa3fdvluzncdmt	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11088441	dqylx4tLa8xhsCmfJ8RxBA==	2020-09-03 20:47:01.059154
710	yy19sa4hndd1papwrz5oboui1d59	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14044351	tMSpNiinPKcVDpc0veMC8g==	2020-09-03 20:47:01.439026
711	zopbm57jftivwm6vv9frqf12swsj	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11242769	oSZ4f7WwtN11h6Go3eXUQA==	2020-09-03 20:47:01.599602
712	3wrnycvd4p4s688w9p51v657gaa9	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9918005	CiKthXSjv3ZmjvZSyAcdQw==	2020-09-03 20:47:01.818216
714	jh1wiq3ycxcuvx9hwamq0y6ljlsq	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10413997	VpogOGez7S+JM2NRgorfyQ==	2020-09-03 20:47:02.034451
715	ih6yizdjs66igfzwxcf74g9si3o2	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11968768	Jcm1Z4EokJ0FC1g5f51iUw==	2020-09-03 20:47:02.172277
716	gz0h26q5m2t83rsfwn0tmwlmurhc	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12535345	ao5PSRGXFRue99rXHBjatA==	2020-09-03 20:47:02.287312
718	h730d18mzknm5jmiwnw5cim6rgna	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13614346	vzw15zO9Y9MqBIgP23SD/Q==	2020-09-03 20:47:02.619548
719	anpmgg3jhbi2j9pingwkvi87lt7b	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12035784	cR4Hw3jeLaVOxGVPbXAtPA==	2020-09-03 20:47:02.789225
721	pe1xisy6jefxysxl015210ebsvi1	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10825900	RLEscjNnnSKqv02xjQVTqw==	2020-09-03 20:47:03.045086
722	lk9309u5m0m14btxkiawtoipkuv7	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12287076	x0qXVG+Wt1zREiQmXXS/tw==	2020-09-03 20:47:03.179147
723	t3zqe5rvujngyke3huu8mtpsuzlm	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14089610	EE7RrNNQ1moa26gTbe+AIQ==	2020-09-03 20:47:03.43556
724	weg4qxqqdf2o3ukw09fz0864x8ld	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13400565	4IbZIeHgx1F27K37204mdQ==	2020-09-03 20:47:03.680187
726	0c0rxqk9qxmpox7f1adg7ilixnsz	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10909194	EGT8QuVAsTvj1KbVDFv2yA==	2020-09-03 20:47:03.918551
727	sq6w1y9jloq3j9qnj7g4m37i2ayn	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10283069	ZHWxHyZSmTXscjdthDIG/w==	2020-09-03 20:47:04.012543
448	1y1lzb61h2i7cmmddpe89zwtg49p	photo.jpg	image/jpeg	{"identified":true}	9920115	2KhBptEBXxCMRRLlWNR51w==	2020-09-03 20:43:29.142161
449	e669mmkdrr42ixuotxlmd892xroy	photo.jpg	image/jpeg	{"identified":true}	12890940	quj3tlLSqHil+IFR0UeBCA==	2020-09-03 20:43:29.249435
450	ivdomf38tcw36eruubw7xjhauv60	photo.jpg	image/jpeg	{"identified":true}	12799011	K9M/aRu++tSZnZiNJVF28g==	2020-09-03 20:43:29.555602
451	vjkjrythh2o3y4wukoemtt0etpv3	photo.jpg	image/jpeg	{"identified":true}	10526840	jOOfBonXWR1L2I8ue4zW5w==	2020-09-03 20:43:29.654599
452	r65od9jf0uzjtc5o9lkz0know52n	photo.jpg	image/jpeg	{"identified":true}	13847685	mLkyOSd7bTlSljOFvGa1lw==	2020-09-03 20:43:29.748709
453	ekzy3xri1a7ij5gvaefxl8yfpj4a	photo.jpg	image/jpeg	{"identified":true}	10022485	fmsSiiMvzH+72/AzYeqFGA==	2020-09-03 20:43:29.843206
454	6tpm8av98nawf178s48v2v5odldk	photo.jpg	image/jpeg	{"identified":true}	9359635	tgWlreeg2W6jvLP1mNQbaw==	2020-09-03 20:43:29.921725
455	vqs1w7a5fvlll4patya5lov7pikj	photo.jpg	image/jpeg	{"identified":true}	10243701	g0eOiddk6wV9ExNvvm0Ezw==	2020-09-03 20:43:30.039634
456	dc81uonqyyc2cnglef5av7347ey1	photo.jpg	image/jpeg	{"identified":true}	12945129	3qcIxbJRH94GcSHd4aEukQ==	2020-09-03 20:43:30.145633
457	eg5f70p9lhr2gkuelcsix133fa5o	photo.jpg	image/jpeg	{"identified":true}	13569812	6c51Qb8E2gszhePxkzzk2w==	2020-09-03 20:43:30.443458
458	bm6j0ecbj73kxpw1xhi4f1zzbk0q	photo.jpg	image/jpeg	{"identified":true}	11601812	1/uaWnCWrycIbqmzcADfOQ==	2020-09-03 20:43:30.552502
459	bfw3mmnpn16m5g5pb1sb2eq7fmei	photo.jpg	image/jpeg	{"identified":true}	12769182	Ta0bqMzr9wpQaZU6BeEBkg==	2020-09-03 20:43:30.730635
460	262cnujx1fda3tbrcis9bj42uy03	photo.jpg	image/jpeg	{"identified":true}	12045271	ZNhbzWHxse59t0LdUPISNg==	2020-09-03 20:43:30.861978
461	n5zfqh6hhri9pvj4wvg102dibktp	photo.jpg	image/jpeg	{"identified":true}	13453817	XFKMfTDfYg5QJjpJP1S/8w==	2020-09-03 20:43:31.033226
462	t5r827dk26xhmr9fen0om4k5znph	photo.jpg	image/jpeg	{"identified":true}	13935560	40T59IC516cu2S9t2KBvHg==	2020-09-03 20:43:31.329199
463	4jo9lkp2zjtvdqdcwj9of5m3hl86	photo.jpg	image/jpeg	{"identified":true}	13621254	qUmtowKW5I9dcZap6NWxKQ==	2020-09-03 20:43:31.47145
464	wb7pbl42yo1odr7xn0pa8k8ygv9t	photo.jpg	image/jpeg	{"identified":true}	13331055	80bnjP7xgd6/QW4pRfNEmA==	2020-09-03 20:43:31.588721
465	adhf4iyzo6daro420mem2r07ua07	photo.jpg	image/jpeg	{"identified":true}	13759630	NK8B8WgNbL9wqtvMR6N6TA==	2020-09-03 20:43:31.702534
466	lyjst38apdotktt1sx4nn5g6vwjs	photo.jpg	image/jpeg	{"identified":true}	12106831	G+KWKj8CUq53iTFODpyZHQ==	2020-09-03 20:43:31.85006
467	54lyrweerwfx9z9mr1az6xykaxkl	photo.jpg	image/jpeg	{"identified":true}	12580558	MvWSEzlLzvNhWHZ2GdGJag==	2020-09-03 20:43:32.004993
468	x97mv4j5tib45x60jl01c60o6hug	photo.jpg	image/jpeg	{"identified":true}	12768848	1qaOiDn6gSeDCuEJk8s/sg==	2020-09-03 20:43:32.209485
469	iearv10zfd4l7xgmvz6muxlmsdot	photo.jpg	image/jpeg	{"identified":true}	10967227	6ys0UhjSRcnf7Q2fJn+yVQ==	2020-09-03 20:43:32.319103
470	kbput8au20qnfdn2aqwd6xcxfsv6	photo.jpg	image/jpeg	{"identified":true}	12509382	TESEbmSX6K+Ma6Qo6v1M5g==	2020-09-03 20:43:32.43823
471	122drbezy70hfwskigz1oe3wzgry	photo.jpg	image/jpeg	{"identified":true}	12709511	Iv9dymVkhOUL8HBQ+7BWWQ==	2020-09-03 20:43:32.544611
472	qab4oes5z0omh1a4mnht5iuscqcb	photo.jpg	image/jpeg	{"identified":true}	11753536	5Iv6dS6a8cOhcPkJ81sDXg==	2020-09-03 20:43:32.734699
473	jx56owq6wf07zaxmecd7hm9147t8	photo.jpg	image/jpeg	{"identified":true}	11557945	A/G04p55vI41iEUr+V9OcA==	2020-09-03 20:43:32.853605
474	6abuy96mtq7ki95w6cs6tc5drbiv	photo.jpg	image/jpeg	{"identified":true}	11715658	6g4syMmEvOYDEP1gAMWpIQ==	2020-09-03 20:43:33.107214
475	o9wq43pcvf5nlkrwi5yocezr3il8	photo.jpg	image/jpeg	{"identified":true}	12204006	9QHpq1IoXMoP7ME5WbOhjA==	2020-09-03 20:43:33.211487
476	l03ex0u37fvn0ip54t068555ojt9	photo.jpg	image/jpeg	{"identified":true}	11088441	dqylx4tLa8xhsCmfJ8RxBA==	2020-09-03 20:43:33.316063
477	gnmp4n7l7xx50u0joe7lkqaub24p	photo.jpg	image/jpeg	{"identified":true}	14671113	mpXJccG4Rz3sYTSlz2Dp2w==	2020-09-03 20:43:33.433691
478	qwtug52w3xnmxh9hdn964uqa23ci	photo.jpg	image/jpeg	{"identified":true}	13199274	ky+po13EVImC0Ea3WX2IeQ==	2020-09-03 20:43:33.568728
479	w2yxozi9nl51g9jjw68n6rixtd9f	photo.jpg	image/jpeg	{"identified":true}	12335782	aqbzTzc9QO7V270Jp7JhLQ==	2020-09-03 20:43:33.670677
480	b8bph9cqtyzbxsr20pp83adp7yzu	photo.jpg	image/jpeg	{"identified":true}	11285667	k5CddUZzQSrn+95YPrM+sQ==	2020-09-03 20:43:33.810935
481	fx92o66w555r46a7xh8ul3pussoi	photo.jpg	image/jpeg	{"identified":true}	13577225	uZ8/Z2sPvhIjGhvT3ftuhQ==	2020-09-03 20:43:34.025227
482	l7txweb3kxjfuiqkloaupfwo8fgv	photo.jpg	image/jpeg	{"identified":true}	13055461	KfVs/uNJZCNC4JTT25GCJQ==	2020-09-03 20:43:34.194444
483	j15kietdlchl9ds8cvz1cktjjl3n	photo.jpg	image/jpeg	{"identified":true}	12411159	tHs3DmFUxVQS69LW7yQhsA==	2020-09-03 20:43:34.28291
740	6ylan3io6kn3fnmqvyjixat7fwb4	photo.jpg	image/jpeg	{"identified":true}	9359635	tgWlreeg2W6jvLP1mNQbaw==	2020-09-03 20:47:05.948126
741	kcm5jo3k0980n3ogd0mj48dchly5	photo.jpg	image/jpeg	{"identified":true}	10243701	g0eOiddk6wV9ExNvvm0Ezw==	2020-09-03 20:47:06.033385
742	k90gqecocceonytdm1a33qlx3su0	photo.jpg	image/jpeg	{"identified":true}	12945129	3qcIxbJRH94GcSHd4aEukQ==	2020-09-03 20:47:06.139161
743	zcpiohixnm8k5unqajxn52d0i9a4	photo.jpg	image/jpeg	{"identified":true}	13569812	6c51Qb8E2gszhePxkzzk2w==	2020-09-03 20:47:06.276132
744	aais6og23g8pk0skax4jsq347x28	photo.jpg	image/jpeg	{"identified":true}	11601812	1/uaWnCWrycIbqmzcADfOQ==	2020-09-03 20:47:06.617539
745	lyljzare2lchdl1rzkhaaubunt1l	photo.jpg	image/jpeg	{"identified":true}	12769182	Ta0bqMzr9wpQaZU6BeEBkg==	2020-09-03 20:47:06.759051
746	4q68h4tgojycu9ftuy8jy441zs1p	photo.jpg	image/jpeg	{"identified":true}	12045271	ZNhbzWHxse59t0LdUPISNg==	2020-09-03 20:47:06.862787
747	c0ie4vzskvtkj6slebr11cy7hfw3	photo.jpg	image/jpeg	{"identified":true}	13453817	XFKMfTDfYg5QJjpJP1S/8w==	2020-09-03 20:47:06.963955
748	ggztdqvihhb7s89rag5ubgend426	photo.jpg	image/jpeg	{"identified":true}	13935560	40T59IC516cu2S9t2KBvHg==	2020-09-03 20:47:07.069944
749	4zpf2j01qvtc680kpje0lsojfv5k	photo.jpg	image/jpeg	{"identified":true}	13621254	qUmtowKW5I9dcZap6NWxKQ==	2020-09-03 20:47:07.163297
750	y5xw4krcg45jsce4j2eusa7mgy86	photo.jpg	image/jpeg	{"identified":true}	13331055	80bnjP7xgd6/QW4pRfNEmA==	2020-09-03 20:47:07.385337
751	kosjvs3odfu31oeuep8dsetlvfsf	photo.jpg	image/jpeg	{"identified":true}	13759630	NK8B8WgNbL9wqtvMR6N6TA==	2020-09-03 20:47:07.637336
752	c8jhr8kgh2439xgtio9ixtar2rvn	photo.jpg	image/jpeg	{"identified":true}	12106831	G+KWKj8CUq53iTFODpyZHQ==	2020-09-03 20:47:07.729772
753	izbj8hei8pzn6ved8kbuyaff4jln	photo.jpg	image/jpeg	{"identified":true}	12580558	MvWSEzlLzvNhWHZ2GdGJag==	2020-09-03 20:47:07.821277
754	euebjzfhoo80603lqlm4ameer3sm	photo.jpg	image/jpeg	{"identified":true}	12768848	1qaOiDn6gSeDCuEJk8s/sg==	2020-09-03 20:47:07.91788
755	g2gjegi4tncptyf59alpeexlhecr	photo.jpg	image/jpeg	{"identified":true}	10967227	6ys0UhjSRcnf7Q2fJn+yVQ==	2020-09-03 20:47:08.012223
814	4uyk0otd4f6cz1p307wagp0neauz	orange-1.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12709511	Iv9dymVkhOUL8HBQ+7BWWQ==	2020-10-15 13:45:04.536394
816	3zxywfgngecamviorcyhnl5gvgtn	orange-1.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12709511	Iv9dymVkhOUL8HBQ+7BWWQ==	2020-10-15 13:46:47.70639
688	pcrm1fnfe4mzqklqvwshcrk100km	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10248534	+QXHnpMUlebeDVyZLzXVbg==	2020-09-03 20:46:57.958508
720	8y0ly5gc60v07aey39mlph4t8o1h	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12143601	WNLc6g2yVXl87erMlSVvAA==	2020-09-03 20:47:02.930447
725	xdu5wm07hh50ap2q9x77e1hntbt1	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12023608	pxX/fCbzQ6pq7cflPyH2ng==	2020-09-03 20:47:03.802462
817	uel9pzuxd8zh1i0gyywvsle4o6oj	IMG_0893.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13262020	8/PtqOu4+18GTjcT2Zr5eA==	2020-10-19 19:41:22.711328
558	1dfbmhuxezafj0tppe6qvvnlzmfa	photo.jpg	image/jpeg	{"identified":true}	10984727	zbShp9JgSF2Ab2su+ZnK3w==	2020-09-03 20:45:09.817218
559	wkr0x00kn0fwh3p3qh4vqa4ceuwm	photo.jpg	image/jpeg	{"identified":true}	12799011	K9M/aRu++tSZnZiNJVF28g==	2020-09-03 20:45:09.926832
560	z6s0dprqxeoujsnarmds2z4p2ho9	photo.jpg	image/jpeg	{"identified":true}	10022485	fmsSiiMvzH+72/AzYeqFGA==	2020-09-03 20:45:10.055842
561	f0znok7dyxwdhgutw7u96vclwhy2	photo.jpg	image/jpeg	{"identified":true}	12945129	3qcIxbJRH94GcSHd4aEukQ==	2020-09-03 20:45:10.263646
562	10usnr91kipaxs5x5tu6pkgrsvwp	photo.jpg	image/jpeg	{"identified":true}	12769182	Ta0bqMzr9wpQaZU6BeEBkg==	2020-09-03 20:45:10.52071
563	cvl7sitzhleaqk3g6rwcweqr18g2	photo.jpg	image/jpeg	{"identified":true}	12045271	ZNhbzWHxse59t0LdUPISNg==	2020-09-03 20:45:10.707652
564	swo81xqyw1cvwubeq494g6v5t041	photo.jpg	image/jpeg	{"identified":true}	13453817	XFKMfTDfYg5QJjpJP1S/8w==	2020-09-03 20:45:10.885589
565	07fx9c7kpgoxckbhct2uivrg9735	photo.jpg	image/jpeg	{"identified":true}	13935560	40T59IC516cu2S9t2KBvHg==	2020-09-03 20:45:11.026542
566	mxovivyls9z63z869h7weicfdl43	photo.jpg	image/jpeg	{"identified":true}	13331055	80bnjP7xgd6/QW4pRfNEmA==	2020-09-03 20:45:11.193742
567	ifz0wyn4qejk0xc50lz1kd41wf7m	photo.jpg	image/jpeg	{"identified":true}	13759630	NK8B8WgNbL9wqtvMR6N6TA==	2020-09-03 20:45:11.60157
568	9l91u38xq3yvscb4j3t7ceds28h3	photo.jpg	image/jpeg	{"identified":true}	12106831	G+KWKj8CUq53iTFODpyZHQ==	2020-09-03 20:45:11.799707
569	k64xjcvq5ng3xzux2ze8t8u9x7o6	photo.jpg	image/jpeg	{"identified":true}	12509382	TESEbmSX6K+Ma6Qo6v1M5g==	2020-09-03 20:45:11.943893
570	5jjgh2oozy13ybmjyjrv839wkjbm	photo.jpg	image/jpeg	{"identified":true}	11753536	5Iv6dS6a8cOhcPkJ81sDXg==	2020-09-03 20:45:12.089601
571	o90so41i8jtz88ubsa0f4ys6lfvv	photo.jpg	image/jpeg	{"identified":true}	12204006	9QHpq1IoXMoP7ME5WbOhjA==	2020-09-03 20:45:12.23649
572	hkx3gidrzv5e2lbkmxvyjqcseghp	photo.jpg	image/jpeg	{"identified":true}	12335782	aqbzTzc9QO7V270Jp7JhLQ==	2020-09-03 20:45:12.358221
573	bo0r5mhqr8njnd11r2trz6s9cumu	photo.jpg	image/jpeg	{"identified":true}	11285667	k5CddUZzQSrn+95YPrM+sQ==	2020-09-03 20:45:12.656224
574	d5hq1vbbqu3ln5pvusrcl2qclilj	photo.jpg	image/jpeg	{"identified":true}	13577225	uZ8/Z2sPvhIjGhvT3ftuhQ==	2020-09-03 20:45:13.000644
575	ptols28z3wyz1du4njjx0njjppss	photo.jpg	image/jpeg	{"identified":true}	13055461	KfVs/uNJZCNC4JTT25GCJQ==	2020-09-03 20:45:13.12162
576	zgqsq8ytl8evwrqzlz8fm1x50ero	photo.jpg	image/jpeg	{"identified":true}	9178021	Gz+ON5kwxOJB/Zv2h4ARNg==	2020-09-03 20:45:13.248252
577	cwypgxzofyzeplule79g56mrdsk5	photo.jpg	image/jpeg	{"identified":true}	12950270	lcwrH6OjRuPeZcs0FE7iWg==	2020-09-03 20:45:13.344344
578	6g3z4ea39nw3omqvo6aeg3k5fcb5	photo.jpg	image/jpeg	{"identified":true}	12400237	RSD77HVeiC+0lmy/7fdoIQ==	2020-09-03 20:45:13.453747
579	apfs1jbnrhkumg5ywqyarc5chqsi	photo.jpg	image/jpeg	{"identified":true}	11930470	f/YQQfbRp5C23/HJRmXLrQ==	2020-09-03 20:45:13.56691
580	nt0xxs0dexqu4r3umtreob60zq9d	photo.jpg	image/jpeg	{"identified":true}	14154706	9zLXM6zlqmbeiPbaC/LH7w==	2020-09-03 20:45:13.733332
581	mvwut15z7afp4h3emtbfixjavh1b	photo.jpg	image/jpeg	{"identified":true}	14264827	9sWU+89qPvwxJMfPkjsgkQ==	2020-09-03 20:45:14.078906
582	8zxd0iv2o04hnllwnazx389ac9fv	photo.jpg	image/jpeg	{"identified":true}	13105019	omQDgVMGQpUg1t72uFMs9g==	2020-09-03 20:45:14.222623
583	4rkyb8bf5r2bz162nn6okmtfso4g	photo.jpg	image/jpeg	{"identified":true}	14148755	jULwvDPVF3Dfypp+oCvVig==	2020-09-03 20:45:14.359897
584	wnhirr9bmiywd8xasdaf6b2twswf	photo.jpg	image/jpeg	{"identified":true}	13351969	ygAbbLJGUgC6mRR51sywBA==	2020-09-03 20:45:14.507016
585	tgh7zrvzngk5y8199feskk557zve	photo.jpg	image/jpeg	{"identified":true}	10772965	q93KwY2ne26eykZbhZv4WQ==	2020-09-03 20:45:14.641174
586	wkr8yu46fjezgoul5g4z15nf7659	photo.jpg	image/jpeg	{"identified":true}	11796734	bZI7wf1W9pgQphCBAahW5g==	2020-09-03 20:45:14.794003
587	e4kzjueyikwlkqoulpxeok6yx9f9	photo.jpg	image/jpeg	{"identified":true}	11344943	JHgsfu6Yqv3fb8G7+R8ZpQ==	2020-09-03 20:45:15.080562
588	atnrfgc930bz6syk91ksdbmlq2yn	photo.jpg	image/jpeg	{"identified":true}	11921188	sAB5iRttNzh3P9Sxh4wrkA==	2020-09-03 20:45:15.184047
818	fyi0dl45agbyocof9rnudgno5e8q	IMG_0898.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11937363	LADdI0N7UCBiDN4fWM2VgA==	2020-10-19 21:37:29.33913
826	pum4d9pyhvfvfw4b8xbt9mq6ip1p	IMG_0914.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11145877	1TIRzTK/fXNGVKMHvEnMrg==	2020-10-19 21:46:13.365071
828	xd181mz6c4hcdrgwt3ci8efdn8rt	IMG_0916.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11458282	RrqUkfCotfUYzSvc4gUvyQ==	2020-10-19 21:47:41.88313
834	3gtfftehm1ic6fo0mfloqn8tnulz	IMG_0928.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13698345	NXSwMYKkrEbkK4ZpCckglg==	2020-10-19 21:52:18.621725
689	oxdofogka0ic9jwkcrqbe5eusc60	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11958581	pkOgyObKiui73AMzQRWo/w==	2020-09-03 20:46:58.070987
699	gg0y5xaxsekgm36f3tsj7wm2h02w	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12400237	RSD77HVeiC+0lmy/7fdoIQ==	2020-09-03 20:46:59.683107
704	naohqe2ewnx35mjab0yxbxakjvmk	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13781506	0uME1tDp1C8c87ja7WSulw==	2020-09-03 20:47:00.503712
708	70apgn1gi044iqh4nmmhnlbhv8vj	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13109470	7tudk8tiyxTjiqDoSFaMUQ==	2020-09-03 20:47:01.238003
717	ebctc12uw0jzc1ady3w6y7jid66k	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	8836833	rgABtL0QQXzp0nwFgl1a1A==	2020-09-03 20:47:02.461521
589	jgp4cntxfthx3aaqqh92i6bhesr9	photo.jpg	image/jpeg	{"identified":true}	11167384	2sYyZHudHV85jzY4JdgcdQ==	2020-09-03 20:45:15.310946
590	pv00tmmacx1opuchha6sx2u28yt7	photo.jpg	image/jpeg	{"identified":true}	13361673	QinvJYlDJdDWbVE5/hnw0g==	2020-09-03 20:45:15.458434
591	w2o08jur6dwhmkjgv8ffw3nyumfo	photo.jpg	image/jpeg	{"identified":true}	12020426	ACHpDZNMsm/387VODXylJQ==	2020-09-03 20:45:15.561233
592	71e8mx0yk86lzb0gd8582hrkf4v0	photo.jpg	image/jpeg	{"identified":true}	13189541	r34UUBbAt/QT9KSwErYCRQ==	2020-09-03 20:45:15.656877
693	ecqh4paf22fd0vmjko59d720g8cs	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13002684	6yLwDGhZOcexcysGUwFosA==	2020-09-03 20:46:58.596316
697	3vqwejgq2vkvx0q1ve0dhny31zts	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12980327	zpvBGY/GE1HgtUbXQ5qiQA==	2020-09-03 20:46:59.355795
819	y958yj3yturk85vap7n8j9zwlr22	IMG_0900.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11088326	OV86u2OTQQpvEpm3AsyIHQ==	2020-10-19 21:39:07.395423
820	tnhj1hs2oz8rpx3qyjrjh0arbiyk	IMG_0903.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11752048	QAPOXfrGx4h2oy0RC1qS5w==	2020-10-19 21:39:56.052809
821	kuy55k8aueugk3lehroykm5f0ha5	IMG_0905.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13156329	jvBQ1kPVL3xjNxLgchNM4Q==	2020-10-19 21:41:02.626212
824	8lb0wz0voygm61rjyawyf7k1y5rp	IMG_0909.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11100366	Z8sUnYiPSk9ws/6864RGjA==	2020-10-19 21:43:59.540133
829	kxorxqedb3ynutplts7t899tnfai	IMG_0918.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11693031	6GuINIlksvigft2J8sSXCQ==	2020-10-19 21:48:23.903818
830	yu0o9c741ga8utj4hi5xgus2q0ei	IMG_0920.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11784841	yaMRZSfFAuerRezXNXGjMA==	2020-10-19 21:49:06.812469
833	7vk65l3ghafw1cfujwgahtipik0k	IMG_0926.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	8773352	b8dBCNFC+Zvn7+DI5B/3JQ==	2020-10-19 21:51:38.376572
838	jfeeal4wijwm859fargc9bnv0h5x	IMG_0935.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11274277	Fl/rU50XMGD7ZFDGqUgowQ==	2020-10-19 21:56:23.373212
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
4	Cuvier	2020-10-19 19:16:55.941826	2020-10-19 19:16:55.941826
\.


--
-- Data for Name: boulders; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.boulders (id, polygon, created_at, updated_at, area_id) FROM stdin;
208	0103000020E61000000100000005000000598638D6C54D0540B003E78C283B48403718EAB0C24D05408BF9B9A1293B48401570CFF3A74D05401A868F88293B4840C5538F34B84D0540DF878384283B4840598638D6C54D0540B003E78C283B4840	2020-04-16 20:02:34.243889	2020-04-16 20:02:34.243889	1
209	0103000020E610000001000000050000004206F2ECF24D0540AFCF9CF5293B48405303CDE7DC4D05402043C70E2A3B4840261B0FB6D84D0540217711A6283B48402B1213D4F04D05400F0C207C283B48404206F2ECF24D0540AFCF9CF5293B4840	2020-04-16 20:02:34.245774	2020-04-16 20:02:34.245774	1
210	0103000020E61000000100000005000000C6C4E6E3DA5005403788D68A363B4840041E1840F850054049F3C7B4363B48401B12F758FA50054032CB9E04363B48400F5EBBB4E150054091D3D7F3353B4840C6C4E6E3DA5005403788D68A363B4840	2020-04-16 20:02:34.247643	2020-04-16 20:02:34.247643	1
212	0103000020E610000001000000050000007BDCB75A274E05401ADD41EC4C3B484009DE9046054E0540C19140834D3B4840A88AA9F4134E05404FEACBD24E3B4840C5758C2B2E4E0540DE76A1B94E3B48407BDCB75A274E05401ADD41EC4C3B4840	2020-04-16 20:02:34.251674	2020-04-16 20:02:34.251674	1
215	0103000020E610000001000000050000006901DA56B34E0540B16B7BBB253B48403596B036C64E05409F008A91253B484013286211C34E0540F94B8BFA243B484041D653ABAF4E0540DB32E02C253B48406901DA56B34E0540B16B7BBB253B4840	2020-04-16 20:02:34.257335	2020-04-16 20:02:34.257335	1
217	0103000020E61000000100000007000000BDAAB35A604F054070CD1DFD2F3B48403FE08101844F0540EEEE01BA2F3B48400C7558E1964F054012F92EA52E3B4840B727486C774F05402A55A2EC2D3B4840A6F0A0D9754F054053E8BCC62E3B484062DA37F7574F054017B6662B2F3B4840BDAAB35A604F054070CD1DFD2F3B4840	2020-04-16 20:02:34.261134	2020-04-16 20:02:34.261134	1
218	0103000020E610000001000000060000008ACBF10A444F0540A185048C2E3B4840DFDE35E84B4F0540246420CF2E3B484040A6B5696C4F05403012DA722E3B484051DD5CFC6D4F054018EAB0C22D3B4840D95BCAF9624F054036035C902D3B48408ACBF10A444F0540A185048C2E3B4840	2020-04-16 20:02:34.262859	2020-04-16 20:02:34.262859	1
219	0103000020E6100000010000000B0000007F17B6662B4F0540F513CE6E2D3B4840ACFF73982F4F054018EAB0C22D3B48400D8D2782384F05405AD93EE42D3B48407E5182FE424F054018EAB0C22D3B4840D464C6DB4A4F054036035C902D3B4840EA58A5F44C4F054042B115342D3B4840CEA78E554A4F05401FDB32E02C3B484062A06B5F404F05407EE36BCF2C3B4840F0DB10E3354F05407EE36BCF2C3B484084D4EDEC2B4F054060CAC0012D3B48407F17B6662B4F0540F513CE6E2D3B4840	2020-04-16 20:02:34.264547	2020-04-16 20:02:34.264547	1
220	0103000020E610000001000000050000006C2409C215500540C9B08A37323B4840D865F84F37500540C9B08A37323B48405B61FA5E4350054063B7CF2A333B4840D26EF4311F500540B6114F76333B48406C2409C215500540C9B08A37323B4840	2020-04-16 20:02:34.266242	2020-04-16 20:02:34.266242	1
222	0103000020E61000000100000008000000DDD0949D7E5005404A27124C353B4840C6DCB5847C500540C748F608353B484038A1100187500540B5DD04DF343B4840BB9C121093500540446ADAC5343B4840DD0A613596500540D9B3E732353B484060CC96AC8A500540FC89CA86353B4840FF3EE3C281500540FC89CA86353B4840DDD0949D7E5005404A27124C353B4840	2020-04-16 20:02:34.270862	2020-04-16 20:02:34.270862	1
223	0103000020E610000001000000050000006BBA9EE8BA5005400D8D2782383B4840D13E56F0DB50054025E99AC9373B4840A3906456EF5005400D8D2782383B4840EEB5A0F7C65005401807978E393B48406BBA9EE8BA5005400D8D2782383B4840	2020-04-16 20:02:34.272674	2020-04-16 20:02:34.272674	1
225	0103000020E6100000010000000700000025034015374E054042B115342D3B48400395F1EF334E054066BB421F2C3B48404DF4F928234E0540A8AAD0402C3B4840E1ECD632194E05407235B22B2D3B484091D09673294E054078F2E9B12D3B484025034015374E0540950B957F2D3B484025034015374E054042B115342D3B4840	2020-04-16 20:02:34.276065	2020-04-16 20:02:34.276065	1
226	0103000020E610000001000000070000009CF86A47714E0540DA38622D3E3B484036AE7FD7674E05406F826F9A3E3B48405E9F39EB534E05405D177E703E3B48409D84D217424E05405726FC523F3B4840E6577380604E05401503249A403B4840853E58C6864E054045BB0A293F3B48409CF86A47714E0540DA38622D3E3B4840	2020-04-16 20:02:34.277785	2020-04-16 20:02:34.277785	1
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
207	0103000020E6100000010000000700000080ED9C02324C05404AF8DD713C3B4840ADD55A34364C0540610F4D7E3D3B48408C2D40771B4C0540FDEED7CD3E3B4840037506E20E4C05408A86ADB43E3B4840037506E20E4C0540ACC294433D3B4840F834636D254C05406BEAA4823C3B484080ED9C02324C05404AF8DD713C3B4840	2020-04-16 20:02:34.24215	2020-10-23 10:10:11.859144	1
213	0103000020E6100000010000000500000086E4A0204A4C0540D58315F83C3B4840A25BEB27354C0540DE9CEF193B3B484074ADF98D484C0540085E70CE3A3B48408BDBA43E624C0540939F87D63C3B484086E4A0204A4C0540D58315F83C3B4840	2020-04-16 20:02:34.253725	2020-10-23 10:10:11.915022	1
206	0103000020E61000000100000005000000CD3FFA264D4C0540D8CD246F353B484055F833BC594C05401E8BCED3353B4840DEB06D51664C054024766C34353B48406072A3C85A4C05405EBEC2CF343B4840CD3FFA264D4C0540D8CD246F353B4840	2020-04-16 20:02:34.240121	2020-10-23 10:10:11.984691	1
227	0103000020E610000001000000050000008F6A4BC9434E0540836A76323E3B484018B2861E564E054064252EF53D3B48403B46B7B7424E0540AB10E7243C3B48408E4C928D334E054096AE27953C3B48408F6A4BC9434E0540836A76323E3B4840	2020-04-16 20:02:34.279527	2020-10-23 10:02:33.926258	1
205	0103000020E6100000010000000500000038984F13CB4B05401252B619313B4840EE3847DADB4B054041D65211313B4840F3F57E60DC4B05409965BA542F3B48403D558799CB4B05409965BA542F3B484038984F13CB4B05401252B619313B4840	2020-04-16 20:02:34.237974	2020-10-23 14:57:47.045403	1
216	0103000020E610000001000000070000000688A637FF4E0540637A18FD2A3B484079CD0778EF4E0540C3E0A7322A3B48401910A3E5154F0540E11261D1283B4840047D0207224F05400041B455293B4840A37ECA2E164F05400BACDFC3293B4840B65DE8C71C4F05406C1C8A142A3B48400688A637FF4E0540637A18FD2A3B4840	2020-04-16 20:02:34.259246	2020-10-23 10:02:33.973947	1
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
270	0103000020E61000000100000008000000D99596917A4F0540E21DE0490B3B484045292158554F0540E21DE0490B3B4840070ABC934F4F0540594E42E90B3B4840D95BCAF9624F05402F87DD770C3B48403A234A7B834F05405F0B7A6F0C3B4840E449D235934F05406BB933130C3B48408F368E588B4F0540F488D1730B3B4840D99596917A4F0540E21DE0490B3B4840	2020-04-16 20:02:34.357152	2020-04-16 20:02:34.357152	1
271	0103000020E61000000100000006000000F0FD0DDAAB4F0540535DC0CB0C3B4840C8D2872EA84F0540EE974F560C3B484034DAAA24B24F0540CAC16C020C3B484094675E0EBB4F05401D1CEC4D0C3B484061C26856B64F0540535DC0CB0C3B4840F0FD0DDAAB4F0540535DC0CB0C3B4840	2020-04-16 20:02:34.358813	2020-04-16 20:02:34.358813	1
272	0103000020E61000000100000007000000E4839ECDAA4F05408D2782380F3B484061889CBE9E4F054069519FE40E3B4840787C7BD7A04F054076FF58880E3B48401DE6CB0BB04F0540058C2E6F0E3B4840C24F1C40BF4F054076FF58880E3B48406D3CD862B74F05401CB4571F0F3B4840E4839ECDAA4F05408D2782380F3B4840	2020-04-16 20:02:34.360475	2020-04-16 20:02:34.360475	1
273	0103000020E6100000010000000B000000CE6DC2BD324F05409A0986730D3B484095456117454F05409A0986730D3B48407311DF89594F05407CF0DAA50D3B4840A0F99CBB5D4F0540522976340E3B48404BE658DE554F054058E6ADBA0E3B4840C8EA56CF494F0540C959D8D30E3B4840EB1ED95C354F0540AB402D060F3B48404B72C0AE264F0540C959D8D30E3B484007962364204F05406494675E0E3B4840357EE195244F05407CF0DAA50D3B4840CE6DC2BD324F05409A0986730D3B4840	2020-04-16 20:02:34.362342	2020-04-16 20:02:34.362342	1
274	0103000020E61000000100000007000000B8054B75014F054012A27C410B3B48403B8DB454DE4E0540D1B2EE1F0B3B48406EF8DD74CB4E0540D7A3703D0A3B48402499D53BDC4E0540A2629CBF093B48405778978BF84E0540D1E638B7093B48402ACAA5F10B4F0540FB7953910A3B4840B8054B75014F054012A27C410B3B4840	2020-04-16 20:02:34.364181	2020-04-16 20:02:34.364181	1
275	0103000020E61000000100000006000000BB7D5699294D0540ACA8C1340C3B4840990F0874264D0540B8567BD80B3B4840B03DB324404D0540240D6E6B0B3B48400B0E2F88484D05409B3DD00A0C3B484021C84109334D054041F2CEA10C3B4840BB7D5699294D0540ACA8C1340C3B4840	2020-04-16 20:02:34.366012	2020-04-16 20:02:34.366012	1
276	0103000020E61000000100000005000000EF74E789E74C05408FC360FE0A3B48406CB3B112F34C05408FC360FE0A3B484066F6798CF24C05402AFEEF880A3B4840F4311F10E84C05402AFEEF880A3B4840EF74E789E74C05408FC360FE0A3B4840	2020-04-16 20:02:34.367984	2020-04-16 20:02:34.367984	1
277	0103000020E6100000010000000700000038BC2022354D0540C4D0EAE40C3B484027BF45274B4D054047AF06280D3B4840FFCD8B135F4D0540B82231410D3B4840FFCD8B135F4D0540CF4A5AF10D3B48407C98BD6C3B4D0540CF4A5AF10D3B484005172B6A304D0540F911BF620D3B484038BC2022354D0540C4D0EAE40C3B4840	2020-04-16 20:02:34.370104	2020-04-16 20:02:34.370104	1
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
201	0103000020E610000001000000070000000C01C0B1674F05409A6038D7303B4840CE1B2785794F05409F1D705D313B484067D13B15704F054069A85148323B4840B2F677B6474F0540DA1B7C61323B48405CE333D93F4F054052802898313B4840F015DD7A4D4F05400BD462F0303B48400C01C0B1674F05409A6038D7303B4840	2020-04-16 20:02:34.230549	2020-04-16 20:02:34.230549	1
202	0103000020E6100000010000000600000050172994854F054070CD1DFD2F3B4840A62A6D718D4F054029ED0DBE303B484023A30392B04F05407C7BD7A02F3B4840289A07B0C84F0540A185048C2E3B484023A30392B04F054078F2E9B12D3B484050172994854F054070CD1DFD2F3B4840	2020-04-16 20:02:34.232337	2020-04-16 20:02:34.232337	1
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
394	0103000020E610000001000000050000008C7993189E500540BE4B599E353B484086A65437A55005400F1C0616353B484039C17ABAB05005406E7ACD68353B4840784EF588A75005403DDD7FD6353B48408C7993189E500540BE4B599E353B4840	2020-09-04 20:16:25.935808	2020-10-23 10:02:33.859631	1
204	0103000020E610000001000000070000003D8F5331E34B0540ABFE11592E3B48404909C33DE44B054092B382CE2E3B4840C08A5540EF4B0540F594D7002F3B484054BDFEE1FC4B054092B382CE2E3B48405F376EEEFD4B05400A074B482E3B4840CB04C54CF04B05406A0F84372E3B48403D8F5331E34B0540ABFE11592E3B4840	2020-04-16 20:02:34.236166	2020-10-23 14:57:47.037995	1
203	0103000020E61000000100000005000000C69928FFA84B0540801A2BCA2F3B4840439E26F09C4B05404C8F0CB5303B48408840F7A28B4B054087CC6250303B484010F93038984B05405B4F48762F3B4840C69928FFA84B0540801A2BCA2F3B4840	2020-04-16 20:02:34.234216	2020-10-23 14:57:47.161802	1
396	0103000020E6100000010000000500000060A0A821054E0540B63BFDB3423B4840835AF7E1074E05401BF5AEFC413B484049775BE61A4E054030709B0B423B48404709036F184E05403186FBD5423B484060A0A821054E0540B63BFDB3423B4840	2020-09-04 20:16:26.522671	2020-10-23 10:02:33.866416	1
392	0103000020E610000001000000050000009A4FAEF7AD4E054001CA9E672A3B48403E9BC9C9A44E054078904E5F293B4840083ABCF0B54E0540BAABFAE5283B4840048EE7FEC34E0540489FF1A5293B48409A4FAEF7AD4E054001CA9E672A3B4840	2020-07-12 22:25:17.522168	2020-10-23 10:02:33.89302	1
391	0103000020E61000000100000005000000089330BCA34E054053988BD7263B484033976917974E054012A87550263B4840D282C4BFA14E05402F453AE8253B4840B219321BAB4E0540C3346060263B4840089330BCA34E054053988BD7263B4840	2020-07-12 22:25:17.501404	2020-10-23 10:02:33.930055	1
224	0103000020E61000000100000007000000C9D6C8E85F4F0540219317EE2A3B48400E059C6C534F054008ED7A3A2B3B4840281DA5D0554F0540781443872B3B48408FA024AB4D4F05408C7A04CC2B3B4840FE03DE96744F05404170D2E22C3B48401361E750844F0540B72EB06F2C3B4840C9D6C8E85F4F0540219317EE2A3B4840	2020-04-16 20:02:34.274338	2020-10-23 10:02:33.955111	1
399	0103000020E61000000100000007000000A9858CEBCA4E05401F171F7D3A3B484007A5B54FAA4E0540B981B17B3B3B48406898187C984E0540CF7C74BE3A3B4840E7BDB9BAAB4E0540606E9EED393B4840616E2427B94E05401FF666093A3B48406D37301EC64E05402F3CC7D2393B4840A9858CEBCA4E05401F171F7D3A3B4840	2020-09-04 21:35:07.650344	2020-10-23 10:02:33.958417	1
269	0103000020E610000001000000050000003A0C24EFAE4F0540241581B70A3B48402EE3A6069A4F0540958098840B3B484012895FE6624F0540F0295D87093B4840D445BDB1764F054031D52380083B48403A0C24EFAE4F0540241581B70A3B4840	2020-04-16 20:02:34.355397	2020-10-23 10:02:33.970849	1
395	0103000020E61000000100000005000000877E0A1C594E0540E3E7B252263B48408F5A477A404E0540F6CE135B253B48409F4E5DDD4C4E054000352FBE243B4840840A92DC654E0540E3554EDF253B4840877E0A1C594E0540E3E7B252263B4840	2020-09-04 20:16:26.503178	2020-10-23 10:02:33.985975	1
397	0103000020E610000001000000050000003E5CA0CBF54E0540681AFE9E123B484093AC6D72F04E0540F8D9CD02133B484065074B15E74E05404D1EBEDD123B4840AB8FBAC5ED4E0540EB8DC772123B48403E5CA0CBF54E0540681AFE9E123B4840	2020-09-04 21:35:07.613082	2020-10-23 10:02:33.988823	1
393	0103000020E61000000100000005000000CD5F0006D04E0540EB5ECE522B3B4840F0C2363EBE4E0540FBB05D542A3B4840E8E4C103C94E054062A0D7D6293B4840C62A2BD4DB4E054084AF26CD2A3B4840CD5F0006D04E0540EB5ECE522B3B4840	2020-07-12 22:25:17.542236	2020-10-23 10:02:34.01147	1
221	0103000020E6100000010000000700000011A21AFACD50054097F1B9E9363B4840ABAB916EC85005403E7DBC8E363B484076FA415DA45005407F349C32373B4840E2016553AE500540556D37C1373B4840E18AF503C450054065A35244373B48407A0A09A1C350054027083021373B484011A21AFACD50054097F1B9E9363B4840	2020-04-16 20:02:34.267898	2020-10-23 10:02:34.043717	1
390	0103000020E610000001000000090000006922D6BBC64E054077C83C83263B4840562033C6B94E0540CBEBF663263B48404B6000C0AA4E054089AA8EBB263B4840A7AE0D25A84E054098276B5B273B4840DB05498DD24E0540B6174760293B484090741990E64E054022037214293B4840C11B8D07F24E0540FFDF4365283B4840F8F47CA2DC4E05405741757C273B48406922D6BBC64E054077C83C83263B4840	2020-07-12 22:25:15.997272	2020-10-23 10:02:34.07521	1
388	0103000020E61000000100000005000000FD0FE7F1B34E0540738B3C27433B4840D2B607C9D54E054046A046AC433B48400C76F5AEDF4E0540D1CC6C7F423B4840E0130292C24E05408EAEB2F4413B4840FD0FE7F1B34E0540738B3C27433B4840	2020-07-12 21:39:51.895464	2020-10-23 10:02:34.089759	1
389	0103000020E610000001000000050000003E528BA4004F05401F7406CF3F3B484050142A8FF74E05401574153B3F3B484095D789AB1E4F05404A0E73613F3B484057EAEE321F4F054087CEBE1E403B48403E528BA4004F05401F7406CF3F3B4840	2020-07-12 21:39:51.924468	2020-10-23 10:02:34.10775	1
398	0103000020E61000000100000005000000F87BAB73E14E054002A299C1123B4840BFFBC953D94E054035D0C687123B4840E85F7C9CE34E05400B190A28123B4840723D0FA6EA4E05407BE38E5A123B4840F87BAB73E14E054002A299C1123B4840	2020-09-04 21:35:07.631371	2020-10-23 10:02:34.112979	1
211	0103000020E610000001000000050000007F69519FE44E054046B58828263B4840F9836457FD4E0540E2FA7064253B4840B6D4EBE81C4F05406521F235273B484073A3D416014F054057CF68C9273B48407F69519FE44E054046B58828263B4840	2020-04-16 20:02:34.249541	2020-10-23 10:02:34.130531	1
\.


--
-- Data for Name: circuits; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.circuits (id, color, created_at, updated_at, area_id, "order") FROM stdin;
4	red	2020-04-16 20:02:33.813724	2020-04-19 08:39:56.340577	1	6
2	orange	2020-04-16 20:02:33.697495	2020-04-19 08:39:56.335633	1	3
6	white	2020-04-16 20:02:34.149902	2020-04-19 08:39:56.345078	1	7
5	blue	2020-04-16 20:02:33.912494	2020-04-19 08:39:56.342898	1	4
3	skyblue	2020-04-16 20:02:33.796183	2020-04-19 08:39:56.338009	1	5
1	yellow	2020-04-16 20:02:33.505445	2020-04-19 08:39:56.331282	1	2
12	blue	2020-05-07 12:44:29.615897	2020-05-07 12:44:29.615897	2	2
10	orange	2020-05-07 12:44:29.55628	2020-05-07 12:44:29.55628	2	1
11	red	2020-05-07 12:44:29.606787	2020-05-07 12:44:29.606787	2	3
13	blue	2020-10-19 19:23:45.171853	2020-10-19 19:23:45.171853	4	2
14	orange	2020-10-19 19:23:56.68021	2020-10-19 19:23:56.68021	4	1
15	red	2020-10-19 19:24:06.17002	2020-10-19 19:24:06.17002	4	3
\.


--
-- Data for Name: pois; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.pois (id, title, subtitle, description, location, route, area_id, created_at, updated_at) FROM stdin;
2	Parking	Roche aux Sabots	Parking Roche aux Sabots	0101000020E610000082E2C798BB160440EAAEEC82C12F4840	0102000020E610000011000000CDCD37A27B160440DE0033DFC12F48403C32569BFF1704408E76DCF0BB2F484006F357C85C1904400A815CE2C82F48404757E9EE3A1B0440D3F4D901D72F4840F0FB372F4E1C0440DDD26A48DC2F484053CE177B2F1E0440FF40B96DDF2F484068925852EE1E0440D4450A65E12F4840D960E124CD1F0440C6FB71FBE52F48407B82C476F720044009707A17EF2F4840C425C79DD22104409981CAF8F72F4840A64412BD8C220440AF415F7AFB2F4840C748F60835230440DCF5D214013048405F0839EFFF230440C4CDA96400304840F52D73BA2C26044062D8614CFA2F48407CF0DAA50D270440F8A6E9B303304840CAA99D616A2B04405D6C5A2904304840444E5FCFD72C044004AC55BB26304840	2	2020-05-09 21:18:37.4188	2020-05-09 21:44:44.481227
1	Parking	Rocher Canon	Parking Rocher Canon	0101000020E6100000446ADAC534530540A818E76F423B4840	0102000020E6100000030000001E5B274B30530540A82EC69C423B4840BBF7B1645253054084EBB3053D3B484092536B00145105404A76BD4F383B4840	1	2020-05-09 19:45:02.796229	2020-05-09 19:50:49.931636
\.


--
-- Data for Name: problems; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.problems (id, name, grade, created_at, updated_at, location, circuit_id, circuit_number, steepness, height, area_id, tags) FROM stdin;
14	\N	2a	2020-04-16 20:19:03.01478	2020-04-28 19:19:45.535645	0101000020E61000003B53E8BCC64E0540A27F828B153B4840	1	36	slab	\N	1	{risky}
40	Sauvetage	2a	2020-04-16 20:19:03.087615	2020-04-28 19:38:52.764662	0101000020E61000005A643BDF4F4D0540C1C58A1A4C3B4840	1	9	wall	5	1	{risky}
21	Magouilles	3b	2020-04-16 20:19:03.033315	2020-04-28 19:38:52.767785	0101000020E6100000EA060ABC934F05403D0B42791F3B4840	1	29	wall	5	1	{risky}
13	\N	2a	2020-04-16 20:19:03.012177	2020-04-28 13:25:02.237091	0101000020E610000010919A76314D0540DC2C5E2C0C3B4840	1	37	wall	\N	1	{}
25	Fun and Games	2a	2020-04-16 20:19:03.044576	2020-04-28 19:19:45.519691	0101000020E6100000A7E67283A14E05407D923B6C223B4840	1	25	wall	4	1	{risky}
2	\N	2c	2020-04-16 20:19:02.975036	2020-04-28 19:19:45.526248	0101000020E6100000BBB72231414D054021205F42053B4840	1	48	slab	\N	1	{risky}
4	\N	2a	2020-04-16 20:19:02.980786	2020-04-28 19:19:45.528694	0101000020E61000007689EAAD814D0540F624B039073B4840	1	46	traverse	\N	1	{risky}
8	\N	3a	2020-04-16 20:19:02.99152	2020-04-28 19:19:45.531033	0101000020E610000081EB8A19E14D0540FA4509FA0B3B4840	1	42	slab	\N	1	{risky}
10	\N	2a	2020-04-16 20:19:02.997912	2020-04-28 19:19:45.533233	0101000020E6100000DC476E4DBA4D0540DBC4C9FD0E3B4840	1	40	slab	\N	1	{risky}
272	Le bac à Eau	2a+	2020-05-07 12:44:29.706829	2020-05-10 10:16:01.153045	0101000020E6100000B378B130442E04403CBD529621304840	10	10	traverse	3	2	{}
313	La Gageure	3a+	2020-05-07 12:44:29.893979	2020-05-10 10:18:08.256312	0101000020E6100000F2086EA46C31044006651A4D2E304840	10	25	wall	4	2	{}
1	Poseurs	3b	2020-04-16 20:19:02.969757	2020-04-19 08:39:46.515762	0101000020E6100000884CF910544D0540F0C4AC17433B4840	1	13	slab	4	1	{}
3	\N	3a	2020-04-16 20:19:02.977993	2020-04-19 08:39:46.523101	0101000020E6100000BB7D5699294D05401AFB928D073B4840	1	47	slab	\N	1	{}
5	\N	2a+	2020-04-16 20:19:02.983516	2020-04-19 08:39:46.527943	0101000020E6100000266DAAEE914D054019C748F6083B4840	1	45	slab	\N	1	{}
6	\N	2a	2020-04-16 20:19:02.98631	2020-04-19 08:39:46.529729	0101000020E6100000E2CAD93BA34D0540E90E62670A3B4840	1	44	traverse	\N	1	{}
7	\N	2b	2020-04-16 20:19:02.988854	2020-04-19 08:39:46.531437	0101000020E61000009E62D520CC4D0540FBAD9D28093B4840	1	43	traverse	\N	1	{}
9	\N	2b	2020-04-16 20:19:02.994807	2020-04-19 08:39:46.534764	0101000020E6100000C0D02346CF4D05409B3DD00A0C3B4840	1	41	wall	\N	1	{}
11	\N	2a	2020-04-16 20:19:03.0008	2020-04-19 08:39:46.538134	0101000020E6100000B5E21B0A9F4D054093E4B9BE0F3B4840	1	39	slab	\N	1	{}
12	\N	3a	2020-04-16 20:19:03.009542	2020-04-19 08:39:46.539991	0101000020E610000071581AF8514D0540172B6A300D3B4840	1	38	traverse	\N	1	{}
17	Lola	2c	2020-04-16 20:19:03.022537	2020-04-19 08:39:46.548954	0101000020E6100000E5ED08A7054F05400745F300163B4840	1	33	slab	\N	1	{}
18	\N	2a	2020-04-16 20:19:03.025123	2020-04-19 08:39:46.550596	0101000020E61000002F87DD770C4F05408787307E1A3B4840	1	32	traverse	\N	1	{}
19	\N	3b	2020-04-16 20:19:03.027729	2020-04-19 08:39:46.552206	0101000020E61000006D1ADB6B414F0540C2853C821B3B4840	1	31	wall	\N	1	{}
20	\N	2b	2020-04-16 20:19:03.03048	2020-04-19 08:39:46.553828	0101000020E610000034DAAA24B24F0540F1A1444B1E3B4840	1	30	slab	\N	1	{}
22	\N	2b	2020-04-16 20:19:03.036242	2020-04-19 08:39:46.555936	0101000020E6100000512FF834274F05400762D9CC213B4840	1	28	traverse	\N	1	{}
24	\N	2a	2020-04-16 20:19:03.041946	2020-04-19 08:39:46.558048	0101000020E6100000037D224F924E0540F52A323A203B4840	1	26	slab	\N	1	{}
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
261	L'Angle Rond	3a	2020-05-07 12:44:29.658253	2020-05-10 10:08:12.573814	0101000020E610000021EA3E00A92D04409F5BE84A04304840	10	4	slab	3	2	{}
269	L'Encoignure	3a	2020-05-07 12:44:29.696251	2020-05-10 10:15:28.49858	0101000020E61000005E13D21A832E04404E0B5EF415304840	10	7	wall	3	2	{}
80	L'Ex Saut du Jaune	2c	2020-04-16 20:19:03.211104	2020-04-28 13:11:40.329082	0101000020E61000008A3F8A3A734F0540710168942E3B4840	2	8	traverse	\N	1	{}
50	La calandre	3a	2020-04-16 20:19:03.113229	2020-04-28 19:21:14.76474	0101000020E6100000D865F84F37500540B69DB646043B4840	2	42	overhang	\N	1	{risky}
60	Imogen	3c	2020-04-16 20:19:03.141151	2020-04-28 19:38:52.771732	0101000020E61000002BC0779B374E05407A1A3048FA3A4840	2	31	wall	5	1	{risky}
49	La Crêpe	4a	2020-04-16 20:19:03.110558	2020-04-28 19:38:52.773941	0101000020E6100000B79BE09BA64F05403F390A10053B4840	2	43	slab	5	1	{risky}
66	L'Arête gauche du Cervin	2c+	2020-04-16 20:19:03.163135	2020-04-28 19:38:52.778354	0101000020E61000006EF8DD74CB4E05408466D7BD153B4840	2	25	slab	6	1	{risky}
260	Les Petits Pas	3c	2020-05-07 12:44:29.655082	2020-05-07 20:36:01.918002	0101000020E6100000F86C1D1CEC2D04408176871403304840	10	3	traverse	\N	2	{}
15	\N	2a	2020-04-16 20:19:03.017287	2020-10-23 09:02:04.375275	0101000020E61000001002976CE14E05408B492476123B4840	1	35	traverse	\N	1	{risky}
27	\N	2b	2020-04-16 20:19:03.050092	2020-10-23 09:36:37.264322	0101000020E61000007DA06A94994E0540717F9889283B4840	1	23	wall	\N	1	{risky}
28	\N	3a	2020-04-16 20:19:03.052401	2020-10-23 09:36:37.527607	0101000020E61000004815BD0E4A4E05401E6C7990253B4840	1	22	wall	\N	1	{}
16	\N	1b	2020-04-16 20:19:03.019868	2020-10-23 09:36:37.874184	0101000020E6100000CB45F309EE4E0540AE2B35B1123B4840	1	34	slab	\N	1	{}
247	Pince sans Rire	6a	2020-05-07 12:44:29.607908	2020-05-10 12:13:12.395291	0101000020E610000074B515FBCB2E04406A4E5E6402304840	11	1	wall	3	2	{}
263	Antigel	5c	2020-05-07 12:44:29.676841	2020-05-10 12:13:28.538586	0101000020E6100000D11F9A79722D04409CBF098508304840	11	2	overhang	4	2	{}
262	Le Chameau	4a	2020-05-07 12:44:29.673559	2020-05-10 10:04:48.979461	0101000020E610000054E1CFF0662D044068B27F9E06304840	12	3	wall	3	2	{}
259	L'Additif	2c	2020-05-07 12:44:29.6514	2020-05-10 10:24:07.06878	0101000020E61000003D98141F9F30044021AE9CBD33304840	10	48	traverse	3	2	{}
249	La Meringue	3a	2020-05-07 12:44:29.617078	2020-05-10 10:04:31.414915	0101000020E6100000B20E4757E92E04400589EDEE01304840	12	1	wall	3	2	{}
246	Le Rebord	2c	2020-05-07 12:44:29.557853	2020-05-10 10:07:25.454255	0101000020E610000075931804562E04400000000000304840	10	2	wall	4	2	{}
43	\N	2b	2020-04-16 20:19:03.09497	2020-04-19 08:39:46.594269	0101000020E6100000E76F4221024E0540B35E0CE5443B4840	1	6	wall	\N	1	{}
44	\N	3a	2020-04-16 20:19:03.097409	2020-04-19 08:39:46.59611	0101000020E610000025C9737D1F4E054083DA6FED443B4840	1	5	slab	\N	1	{}
46	\N	2c	2020-04-16 20:19:03.102135	2020-04-19 08:39:46.599662	0101000020E6100000C4AF58C3454E05402BF702B3423B4840	1	3	traverse	\N	1	{}
47	\N	2a	2020-04-16 20:19:03.105104	2020-04-19 08:39:46.60163	0101000020E61000008BC1C3B46F4E05404FCDE506433B4840	1	2	slab	\N	1	{}
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
73	\N	2b+	2020-04-16 20:19:03.191173	2020-04-19 08:39:46.634859	0101000020E6100000ADDD76A1B94E0540E4F90CA8373B4840	2	14	wall	\N	1	{}
74	\N	3a	2020-04-16 20:19:03.193952	2020-04-19 08:39:46.636522	0101000020E6100000C3B986191A4F054078431A15383B4840	2	13	wall	\N	1	{}
75	\N	3a+	2020-04-16 20:19:03.196731	2020-04-19 08:39:46.638163	0101000020E610000040BE840A0E4F05402EAA4544313B4840	2	18	overhang	\N	1	{}
76	\N	1a+	2020-04-16 20:19:03.199881	2020-04-19 08:39:46.639891	0101000020E610000084D4EDEC2B4F0540EDBAB722313B4840	2	12	wall	\N	1	{}
78	\N	2c	2020-04-16 20:19:03.20556	2020-04-19 08:39:46.642175	0101000020E6100000C32D1F49494F0540D009A1832E3B4840	2	10	wall	\N	1	{}
79	La Contrabasse	3c+	2020-04-16 20:19:03.208392	2020-04-19 08:39:46.644058	0101000020E6100000D464C6DB4A4F054042B115342D3B4840	2	9	slab	\N	1	{}
77	Couche-Tard	3a	2020-04-16 20:19:03.202691	2020-04-19 08:39:46.649259	0101000020E6100000950B957F2D4F0540C9B08A37323B4840	2	17	wall	4	1	{}
68	Ninkenphoop	4b+	2020-04-16 20:19:03.168278	2020-04-19 08:39:46.656365	0101000020E61000004B72C0AE264F0540315D88D51F3B4840	2	23	traverse	4	1	{}
65	Bofinger	3b	2020-04-16 20:19:03.160686	2020-04-19 08:39:46.658391	0101000020E6100000F1B913ECBF4E05402592E865143B4840	2	26	slab	4	1	{}
59	Candide	4a+	2020-04-16 20:19:03.138365	2020-04-19 08:39:46.662436	0101000020E61000000F0F61FC344E0540DFDFA0BDFA3A4840	2	32	overhang	4	1	{}
102	L'Impossible	5a+	2020-04-16 20:19:03.275219	2020-04-28 12:12:13.542338	0101000020E6100000A7E67283A14E0540C55565DF153B4840	3	38	wall	\N	1	{}
88	Le Pilier du Dromadaire	4c	2020-04-16 20:19:03.234423	2020-04-28 19:38:52.780528	0101000020E6100000E449D235934F054061E124CD1F3B4840	3	14	wall	5	1	{risky}
104	Superlative	6b+	2020-04-16 20:19:03.281088	2020-04-28 19:38:52.782557	0101000020E610000008AEF204C24E05405A9F724C163B4840	4	14	slab	6	1	{risky}
101	Le Cervin	4b	2020-04-16 20:19:03.272614	2020-04-28 19:38:52.784439	0101000020E6100000B39AAE27BA4E0540FB96395D163B4840	3	40	slab	6	1	{risky}
118	L'Appuyette	5b	2020-04-16 20:19:03.324845	2020-04-28 19:38:52.786752	0101000020E610000089B3226AA24F0540A71FD4450A3B4840	3	4	slab	5	1	{risky}
86	Le Beaufort	5b	2020-04-16 20:19:03.228394	2020-04-28 19:38:52.788892	0101000020E6100000782AE09EE74F054030293E3E213B4840	3	12	overhang	5	1	{risky}
274	Tentation pour Quatre	4c	2020-05-07 12:44:29.713637	2020-05-10 12:14:22.503401	0101000020E610000085B2F0F5B52E04406AA510C825304840	11	5	overhang	3	2	{}
275	La Coque	4a	2020-05-07 12:44:29.717511	2020-05-10 10:05:32.944128	0101000020E610000058CA32C4B12E044005E09F5225304840	12	7	wall	2	2	{}
267	Le Flop	2a+	2020-05-07 12:44:29.690084	2020-05-10 10:14:07.960869	0101000020E6100000DCF5D214012E0440D976DA1A11304840	10	6	wall	2	2	{}
266	Coup de Sang	5c	2020-05-07 12:44:29.6869	2020-05-10 12:13:45.842861	0101000020E61000002D08E57D1C2D044011548D5E0D304840	11	3	wall	4	2	{}
276	Le Bilbo	5b	2020-05-07 12:44:29.72365	2020-05-10 12:14:36.262836	0101000020E6100000AEBB79AA432E04401BD47E6B27304840	11	6	wall	5	2	{}
265	La Dignité	5a	2020-05-07 12:44:29.683406	2020-05-10 10:05:01.259702	0101000020E6100000A54FABE80F2D0440DC12B9E00C304840	12	4	wall	4	2	{}
270	Le Château Fort	4a	2020-05-07 12:44:29.699491	2020-05-10 10:05:13.10074	0101000020E6100000ADA3AA09A22E04407E8FFAEB15304840	12	5	slab	3	2	{}
273	L'Accusation	3b+	2020-05-07 12:44:29.710103	2020-05-10 10:05:23.641848	0101000020E6100000B3EC4960732E04401EA4A7C821304840	12	6	wall	4	2	{}
278	Citron Vert	6a	2020-05-07 12:44:29.739906	2020-05-10 12:15:17.520809	0101000020E6100000034356B77A2E0440EAE74D452A304840	11	7	wall	4	2	{}
48	\N	2c	2020-04-16 20:19:03.107744	2020-10-23 09:36:37.295446	0101000020E61000003E461A664C4E054073BA60523D3B4840	1	1	traverse	\N	1	{}
45	\N	2b	2020-04-16 20:19:03.099817	2020-10-23 09:36:37.510984	0101000020E61000008B4A14BF174E0540F5933874423B4840	1	4	overhang	\N	1	{}
282	Le Cyanure Sucré	5c	2020-05-07 12:44:29.754642	2020-05-10 12:16:40.38446	0101000020E6100000FCA71B28F02E0440C44142942F304840	11	11	traverse	3	2	{}
283	Épreuve de Force	5b	2020-05-07 12:44:29.758001	2020-05-10 12:17:13.583146	0101000020E61000005DFB027AE12E0440D99942E735304840	11	13	traverse	2	2	{}
285	Coquetterie	6a+	2020-05-07 12:44:29.764821	2020-05-10 12:17:28.990529	0101000020E61000003A75E5B33C2F044028D3687231304840	11	14	traverse	3	2	{}
89	La Queue du Dromadaire	4b+	2020-04-16 20:19:03.23842	2020-04-19 08:39:46.696921	0101000020E61000008F705AF0A24F0540E4BF4010203B4840	3	13	wall	4	1	{}
100	Le French Cancan	4c	2020-04-16 20:19:03.269684	2020-04-19 08:39:46.70669	0101000020E61000001E166A4DF34E05404277499C153B4840	3	36	wall	3	1	{}
109	Le Smig	6a+	2020-04-16 20:19:03.295059	2020-04-19 08:39:46.708912	0101000020E61000008B6F287CB64E05404F594DD7133B4840	4	13	wall	4	1	{}
103	Le Jeu de Go	5a+	2020-04-16 20:19:03.278128	2020-04-19 08:39:46.710711	0101000020E61000001FA2D11DC44E05401327F73B143B4840	3	39	wall	4	1	{}
114	Le dévers	4b	2020-04-16 20:19:03.312006	2020-04-19 08:39:46.715737	0101000020E6100000070ABC934F4F0540467BBC900E3B4840	3	7	overhang	3	1	{}
117	Le Bloc	5b	2020-04-16 20:19:03.321877	2020-04-19 08:39:46.722963	0101000020E610000072F90FE9B74F0540BE13B35E0C3B4840	3	5	wall	4	1	{}
115	Le Talon d'Achille	6a+	2020-04-16 20:19:03.315145	2020-04-19 08:39:46.725516	0101000020E61000001D386744694F05401D1CEC4D0C3B4840	4	3	wall	3	1	{}
111	Presse Citron	6a	2020-04-16 20:19:03.301355	2020-04-19 08:39:46.730037	0101000020E6100000A4AB74779D4D0540425A63D0093B4840	4	8	wall	3	1	{}
110	Jets Interdits	6a+	2020-04-16 20:19:03.29833	2020-04-19 08:39:46.731759	0101000020E61000003221E692AA4D0540AE105663093B4840	4	7	wall	3	1	{}
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
97	Le Sphinx (droite)	5c+	2020-04-16 20:19:03.261062	2020-04-19 08:39:46.701895	0101000020E61000004563EDEF6C4F0540B9A7AB3B163B4840	3	8	wall	4	1	{}
99	Le Serpent	4c	2020-04-16 20:19:03.266975	2020-04-19 08:39:46.705025	0101000020E61000006EE00ED4294F05400D36751E153B4840	3	37	traverse	3	1	{}
112	L'Ancien	6a	2020-04-16 20:19:03.30446	2020-04-19 08:39:46.71733	0101000020E61000005281936DE04E0540A2629CBF093B4840	4	5	overhang	4	1	{}
113	Dure Limite	6b	2020-04-16 20:19:03.307868	2020-04-19 08:39:46.719169	0101000020E61000000DDFC2BAF14E0540D1E638B7093B4840	4	4	overhang	4	1	{}
116	L'Atrappe-Mouche	5a+	2020-04-16 20:19:03.318314	2020-04-19 08:39:46.720886	0101000020E61000004ACE893DB44F0540A583F57F0E3B4840	3	6	wall	4	1	{}
119	Le Pied Levé	4a	2020-04-16 20:19:03.327877	2020-04-28 19:38:52.790903	0101000020E610000046EF54C03D4F0540A4FE7A85053B4840	3	2	overhang	6	1	{risky}
122	Force G	6a+	2020-04-16 20:19:03.336502	2020-04-28 19:38:52.792704	0101000020E6100000BD70E7C2484F054016A6EF35043B4840	4	1	wall	6	1	{risky}
126	Le Cap Gap	5a	2020-04-16 20:19:03.34717	2020-04-28 19:38:52.794544	0101000020E610000001FBE8D4954F054075AE2825043B4840	3	1	slab	5	1	{risky}
195	Le Tabac	3a	2020-04-16 20:19:03.547996	2020-04-28 19:38:52.797941	0101000020E61000001BD82AC1E250054097900F7A363B4840	2	1	wall	5	1	{risky}
308	L'Indolent	4a+	2020-05-07 12:44:29.876089	2020-05-10 10:27:10.144553	0101000020E6100000158F8B6A1131044086730D3334304840	12	13	wall	3	2	{}
312	L'Autre Dalle	3a	2020-05-07 12:44:29.890614	2020-05-10 10:27:30.317717	0101000020E61000008CBE823463310440B9C7D2872E304840	12	14	slab	5	2	{}
295	La Bottine	4c	2020-05-07 12:44:29.810017	2020-05-10 10:04:02.725572	0101000020E61000009B3C65355D2F04403E42CD902A304840	12	9	traverse	4	2	{}
290	L'Écorce	4a	2020-05-07 12:44:29.781526	2020-05-10 10:05:59.986193	0101000020E6100000E527D53E1D2F04408AABCABE2B304840	12	8	wall	3	2	{}
286	L'Embarras	3a	2020-05-07 12:44:29.768207	2020-05-10 10:24:37.573497	0101000020E610000090882991442F044018D00B772E304840	10	50	other	3	2	{}
130	Nocturne	3c	2020-04-16 20:19:03.358913	2020-04-19 08:39:46.759944	0101000020E6100000986BD102B44D0540ED0BE8853B3B4840	5	32	wall	3	1	{}
132	Saillie d'Esprit	6b+	2020-04-16 20:19:03.363868	2020-04-19 08:39:46.762167	0101000020E6100000B49080D1E54D05402FFB75A73B3B4840	4	42	wall	3	1	{}
127	Faute de Frappe	5c	2020-04-16 20:19:03.350497	2020-04-19 08:39:46.764103	0101000020E610000040BE840A0E4F0540A73CBA11163B4840	4	15	wall	3	1	{}
294	Le Lux	5a	2020-05-07 12:44:29.806067	2020-05-10 10:25:58.381458	0101000020E610000051DD5CFC6D2F04407383A10E2B304840	12	10	wall	4	2	{}
299	La Borne	4a	2020-05-07 12:44:29.82442	2020-05-10 10:26:19.222109	0101000020E61000005BB39597FC2F04405AF3E32F2D304840	12	11	slab	4	2	{}
303	La Pacotille	4a	2020-05-07 12:44:29.838547	2020-05-10 10:26:40.148257	0101000020E61000006170CD1DFD2F0440CDCEA2772A304840	12	12	wall	3	2	{}
296	Navigation	5b	2020-05-07 12:44:29.813464	2020-05-10 12:15:32.151933	0101000020E61000009B3C65355D2F04401A6CEA3C2A304840	11	8	wall	4	2	{}
291	Mauvaise Pioche	5b+	2020-05-07 12:44:29.78503	2020-05-10 12:15:55.224083	0101000020E6100000F1A1444B1E2F0440D84812842B304840	11	9	wall	4	2	{}
287	Indécence	5b	2020-05-07 12:44:29.771544	2020-05-10 12:16:24.553157	0101000020E6100000B779E3A4302F0440E38E37F92D304840	11	10	wall	3	2	{}
288	Jeu de Quilles	5c	2020-05-07 12:44:29.774914	2020-05-10 12:18:04.193663	0101000020E610000079CE16105A2F0440247EC51A2E304840	11	15	wall	3	2	{}
297	Vol à Vue	5b+	2020-05-07 12:44:29.817348	2020-05-10 12:18:20.211553	0101000020E61000000C3B8C497F2F04405B5B785E2A304840	11	16	overhang	4	2	{}
407	\N	\N	2020-10-19 19:33:22.805085	2020-10-19 19:33:22.805085	\N	14	21	other	\N	4	{}
408	\N	\N	2020-10-19 19:33:22.807966	2020-10-19 19:33:22.807966	\N	14	22	other	\N	4	{}
120	Scarlatine	6b	2020-04-16 20:19:03.33075	2020-04-19 08:39:46.733428	0101000020E610000040321D3A3D4F0540384888F2053B4840	4	2	slab	\N	1	{}
121	Le Bombé	5a	2020-04-16 20:19:03.333627	2020-04-19 08:39:46.735074	0101000020E6100000B7B3AF3C484F05406E895C70063B4840	3	3	overhang	\N	1	{}
123	L'Intermédiaire	4a	2020-04-16 20:19:03.339222	2020-04-19 08:39:46.73668	0101000020E6100000DF52CE177B4F0540E2067C7E183B4840	3	10	wall	\N	1	{}
125	\N	3c	2020-04-16 20:19:03.344473	2020-04-19 08:39:46.73835	0101000020E6100000711B0DE02D500540FB90B75CFD3A4840	2	37	wall	\N	1	{}
128	Poésies	4a	2020-04-16 20:19:03.353357	2020-04-19 08:39:46.740221	0101000020E61000002D7C7DAD4B4D05409C6A2DCC423B4840	5	31	slab	\N	1	{}
131	Macadam	6a	2020-04-16 20:19:03.361354	2020-04-19 08:39:46.742478	0101000020E6100000CBD6FA22A14D05404D1421753B3B4840	4	41	wall	\N	1	{}
133	L'Araignée	6a	2020-04-16 20:19:03.366761	2020-04-19 08:39:46.744232	0101000020E61000001FBAA0BE654E05409F573CF5483B4840	4	38	overhang	\N	1	{}
298	Passage à Tabac	5c	2020-05-07 12:44:29.820931	2020-05-10 12:18:40.619151	0101000020E6100000C7BAB88D06300440DDD1FF722D304840	11	17	wall	3	2	{}
302	Coule Douce	5b	2020-05-07 12:44:29.834877	2020-05-10 12:18:53.230902	0101000020E61000003FC8B260E22F04400EBE30992A304840	11	18	slab	4	2	{}
138	Quatrain	4a+	2020-04-16 20:19:03.381005	2020-04-19 08:39:46.749019	0101000020E6100000BF2CEDD45C4E05406D1ADB6B413B4840	5	27	wall	4	1	{}
135	La Dame de Pique	5c	2020-04-16 20:19:03.37264	2020-04-19 08:39:46.75059	0101000020E61000002046088F364E05400ADAE4F0493B4840	4	39	slab	4	1	{}
134	Le Pont Mirabeau	5a	2020-04-16 20:19:03.369801	2020-04-19 08:39:46.75218	0101000020E61000008C4D2B85404E05407590D783493B4840	5	28	slab	4	1	{}
136	Hôtels	4b	2020-04-16 20:19:03.375385	2020-04-19 08:39:46.753749	0101000020E610000080812040864E054025068195433B4840	5	29	wall	4	1	{}
137	Le Pot de Fer	6b	2020-04-16 20:19:03.378151	2020-04-19 08:39:46.755445	0101000020E6100000F7C8E6AA794E0540D76839D0433B4840	4	40	overhang	4	1	{}
129	Contemplations	5b	2020-04-16 20:19:03.356315	2020-04-19 08:39:46.757373	0101000020E61000007D5EF1D4234D054001309E41433B4840	5	30	wall	3	1	{}
124	Quintessence	5c	2020-04-16 20:19:03.341645	2020-04-19 08:39:46.770718	0101000020E610000042CC2555DB4D0540130A1170083B4840	4	6	slab	4	1	{}
317	La Plaque Avant	4b	2020-05-07 12:44:29.908576	2020-05-10 12:19:32.136116	0101000020E61000006571FF91E9300440664AEB6F09304840	11	20	slab	3	2	{}
318	Pierre Ponce	5a	2020-05-07 12:44:29.911999	2020-05-10 12:20:12.485626	0101000020E6100000DC2C5E2C0C310440DEAE97A608304840	11	22	wall	3	2	{}
316	La Tanière	5c	2020-05-07 12:44:29.905102	2020-05-10 12:20:28.995868	0101000020E610000008ABB184B53104405A9C31CC09304840	11	23	overhang	2	2	{}
315	Belle au Fond de Teint	6a	2020-05-07 12:44:29.901467	2020-05-10 12:20:57.391887	0101000020E61000000859164CFC310440287CB60E0E304840	11	24	overhang	4	2	{}
314	La Mer à Boire	6a	2020-05-07 12:44:29.897593	2020-05-10 12:21:13.906159	0101000020E6100000F2086EA46C310440B43EE5982C304840	11	25	overhang	3	2	{}
82	Le Dalle Bleu	4c	2020-04-16 20:19:03.216232	2020-04-28 19:38:52.801185	0101000020E61000001C42959A3D5005402A55A2EC2D3B4840	2	5	slab	5	1	{risky}
366	La Bourrique	3c	2020-05-07 12:44:30.115411	2020-05-10 10:36:17.872118	0101000020E610000031992A189534044061FA5E4370304840	12	36	wall	3	2	{}
320	L'Autorisation	2c	2020-05-07 12:44:29.919458	2020-05-10 10:23:56.814286	0101000020E6100000CA8B4CC0AF31044091B932A836304840	10	47	slab	4	2	{}
83	Le Butte	3b	2020-04-16 20:19:03.219112	2020-04-19 08:39:46.77502	0101000020E6100000B5DFDA8992500540F7CC9200353B4840	2	4	slab	3	1	{}
323	La Téméraire	5a	2020-05-07 12:44:29.939199	2020-05-10 10:28:18.925403	0101000020E61000000611A9691733044070D05E7D3C304840	12	15	wall	4	2	{}
41	Champagne Frappé	2a	2020-04-16 20:19:03.090124	2020-04-19 08:39:46.778507	0101000020E6100000ED444948A44D054088635DDC463B4840	1	8	slab	4	1	{}
330	La Camée	4b	2020-05-07 12:44:29.965474	2020-05-10 10:29:51.048925	0101000020E6100000D732198EE733044034BBEEAD48304840	12	17	wall	4	2	{}
335	Le Bac Rond	4b	2020-05-07 12:44:29.98695	2020-05-10 10:30:13.435981	0101000020E6100000766B990CC73304408A027D224F304840	12	18	wall	3	2	{}
337	L'Existentiel	4a+	2020-05-07 12:44:29.994277	2020-05-10 10:30:34.192136	0101000020E61000003ECF9F36AA330440DD5CFC6D4F304840	12	19	wall	5	2	{}
339	Le Kyste	4c	2020-05-07 12:44:30.008678	2020-05-10 10:30:51.648584	0101000020E61000003E5B07077B3304408445459C4E304840	12	20	wall	4	2	{}
343	Le Bon Coin	4b+	2020-05-07 12:44:30.023209	2020-05-10 10:31:07.866235	0101000020E6100000001AA54BFF3204406E5166834C304840	12	21	wall	4	2	{}
345	Le Rentrant	4a	2020-05-07 12:44:30.030029	2020-05-10 10:31:22.478047	0101000020E6100000D331E719FB320440C634D3BD4E304840	12	22	wall	4	2	{}
350	La Dülfer	4a	2020-05-07 12:44:30.047885	2020-05-10 10:31:53.786107	0101000020E610000095D8B5BDDD320440F584251E50304840	12	23	wall	3	2	{}
357	Les Précieuses	3a	2020-05-07 12:44:30.081233	2020-05-10 10:32:21.242648	0101000020E61000001BD5E940D6330440577A6D3656304840	12	24	traverse	4	2	{}
358	Le Velouté	3c	2020-05-07 12:44:30.084878	2020-05-10 10:32:37.470938	0101000020E61000004F92AE997C3304407FA5F3E159304840	12	25	wall	4	2	{}
365	La Poulette	4b	2020-05-07 12:44:30.112054	2020-05-10 10:36:00.541068	0101000020E61000008BDD3EABCC340440DA9255116E304840	12	35	wall	4	2	{}
367	La Moucheture	5a	2020-05-07 12:44:30.119058	2020-05-10 10:36:37.237069	0101000020E6100000FEB968C878340440BADDCB7D72304840	12	37	slab	4	2	{}
364	La Coqueluche	4b	2020-05-07 12:44:30.108294	2020-05-10 10:36:53.168024	0101000020E6100000999F1B9AB2330440683C11C479304840	12	38	wall	3	2	{}
362	Le Crack	4a+	2020-05-07 12:44:30.098802	2020-05-10 10:37:24.991651	0101000020E6100000CD22145B41330440683C11C479304840	12	39	overhang	4	2	{}
360	L'Angle Solide	4b	2020-05-07 12:44:30.0917	2020-05-10 10:38:04.994851	0101000020E6100000B1C398F4F73204407EAB75E272304840	12	41	overhang	4	2	{}
359	Le Billet Doux	4b+	2020-05-07 12:44:30.08839	2020-05-10 10:38:38.444476	0101000020E6100000003CA24275330440115322895E304840	12	42	slab	3	2	{}
356	Et Tic en Toc	4b+	2020-05-07 12:44:30.077385	2020-05-10 10:39:00.460862	0101000020E610000095B6B8C6673204409DBE9EAF59304840	12	43	wall	3	2	{}
354	La Traversée du Temps	4a+	2020-05-07 12:44:30.070128	2020-05-10 10:39:20.790224	0101000020E61000005CC823B8913204407B849A2155304840	12	44	traverse	3	2	{}
353	La Bascule	4a	2020-05-07 12:44:30.058978	2020-05-10 10:39:39.165954	0101000020E61000000729780AB93204404777103B53304840	12	45	wall	3	2	{}
349	La Bastille	4b	2020-05-07 12:44:30.04424	2020-05-10 10:40:00.15185	0101000020E6100000F52B9D0FCF3204403674B33F50304840	12	46	wall	5	2	{}
319	Le Puzzle Brisé	5a	2020-05-07 12:44:29.915721	2020-05-10 12:19:52.914005	0101000020E610000015C9570229310440C9224DBC03304840	11	21	wall	4	2	{}
325	Du Genou	5b+	2020-05-07 12:44:29.946172	2020-05-10 12:21:36.823139	0101000020E61000008E8F16670C330440E7340BB43B304840	11	26	overhang	3	2	{}
336	Le Sourire	5b	2020-05-07 12:44:29.990595	2020-05-10 12:22:20.669779	0101000020E61000007CB4386398330440C500892650304840	11	28	overhang	3	2	{}
340	L'Éminence	5a	2020-05-07 12:44:30.012221	2020-05-10 12:22:42.506766	0101000020E61000008237A45181330440A25EF0694E304840	11	29	wall	4	2	{}
220	Cadeau du Vent	7b	2020-04-16 20:19:03.620885	2020-10-23 09:36:37.381001	0101000020E61000001108DAEBB15005403A584598373B4840	6	1	overhang	5	1	{risky}
230	Lévitation	7a+	2020-04-16 20:19:03.648415	2020-10-23 10:10:11.664885	0101000020E61000009D64E7091D4C0540B4914EE73C3B4840	6	10	roof	4	1	{sit_start}
351	L'Arête Principale	5a	2020-05-07 12:44:30.051749	2020-05-10 12:23:06.470839	0101000020E61000009A5B21ACC6320440CBBDC0AC50304840	11	30	overhang	5	2	{}
361	Le Virtuose	4c	2020-05-07 12:44:30.095222	2020-05-10 12:24:28.799041	0101000020E610000094FAB2B4533304406EF9484A7A304840	11	33	overhang	4	2	{}
363	Le Pare-Chocs	5c	2020-05-07 12:44:30.104679	2020-05-10 12:24:50.911849	0101000020E610000054C37E4FAC330440C153C8957A304840	11	34	wall	3	2	{}
369	L'Œuf du Chien	5b	2020-05-07 12:44:30.126254	2020-05-10 12:25:13.556865	0101000020E6100000A33B889D293404403DF0315871304840	11	35	wall	5	2	{}
368	Le Curseur	6a	2020-05-07 12:44:30.122535	2020-05-10 12:25:36.184157	0101000020E6100000425C397B6734044037FFAF3A72304840	11	36	wall	3	2	{}
372	La Bafouille	4b	2020-05-07 12:44:30.144909	2020-05-10 10:33:17.957372	0101000020E6100000D732198EE7330440AA0EB9196E304840	12	26	wall	3	2	{}
370	Le Pied de Nez	4c	2020-05-07 12:44:30.137125	2020-05-10 10:33:34.942936	0101000020E6100000ED9A90D618340440A31D37FC6E304840	12	27	wall	4	2	{}
380	Le Baraqué	4c	2020-05-07 12:44:30.173697	2020-05-10 10:33:58.208824	0101000020E61000008813984EEB360440BCCADAA678304840	12	28	wall	2	2	{}
379	Le Succédané	4a	2020-05-07 12:44:30.170205	2020-05-10 10:34:15.371086	0101000020E6100000CCEF3499F13604402D0ABB287A304840	12	29	traverse	3	2	{}
373	Le Phare	3c	2020-05-07 12:44:30.148345	2020-05-10 10:34:32.492763	0101000020E6100000362383DC453804405265187783304840	12	30	wall	5	2	{}
374	Le Combinard	4b	2020-05-07 12:44:30.152936	2020-05-10 10:34:48.553753	0101000020E6100000378DEDB5A03704404D10751F80304840	12	31	wall	3	2	{}
375	Les Bourses	4b	2020-05-07 12:44:30.156365	2020-05-10 10:35:05.65183	0101000020E610000092AF0452623704407C60C77F81304840	12	32	wall	4	2	{}
377	Le Pain Blanc	3c	2020-05-07 12:44:30.163254	2020-05-10 10:35:25.309359	0101000020E61000008D4468041B3704400798F90E7E304840	12	33	traverse	3	2	{}
376	Le Barbot	4a	2020-05-07 12:44:30.159825	2020-05-10 10:35:42.182074	0101000020E61000000518963FDF3604400798F90E7E304840	12	34	wall	3	2	{}
371	Le Bouton Salvateur	6a	2020-05-07 12:44:30.141242	2020-05-10 12:24:11.399597	0101000020E61000007CD6355A0E340440F1BA7EC16E304840	11	32	wall	3	2	{}
378	La Coquâtre	5b	2020-05-07 12:44:30.166774	2020-05-10 12:25:54.224687	0101000020E61000009E077767ED3604408BDEA9807B304840	11	37	wall	4	2	{}
251	Le Liseré	4a+	2020-05-07 12:44:29.624968	2020-05-10 10:04:39.789759	0101000020E6100000F29716F5492E04409C6ED921FE2F4840	12	2	wall	3	2	{}
250	L'Élégante	4b	2020-05-07 12:44:29.621304	2020-05-10 10:29:34.684468	0101000020E6100000DEAB5626FC32044087F8872D3D304840	12	16	slab	3	2	{}
252	La Dépêche	3c	2020-05-07 12:44:29.628237	2020-05-10 10:37:41.259763	0101000020E610000056F31C91EF320440B875374F75304840	12	40	wall	4	2	{}
258	Rage de Dents	5b	2020-05-07 12:44:29.647939	2020-05-10 12:14:01.662274	0101000020E6100000CAA65CE15D2E04403CBD529621304840	11	4	wall	4	2	{}
253	Bourre en Bref	5a	2020-05-07 12:44:29.631362	2020-05-10 12:16:58.434473	0101000020E6100000350A4966F52E0440ABB184B531304840	11	12	slab	3	2	{}
254	La Bordée	5a	2020-05-07 12:44:29.634962	2020-05-10 12:19:07.770343	0101000020E6100000AB09A2EE0330044001A260C614304840	11	19	wall	3	2	{}
255	La Caisse	5b	2020-05-07 12:44:29.638657	2020-05-10 12:22:03.452363	0101000020E61000001618B2BAD5330440C904FC1A49304840	11	27	overhang	2	2	{}
256	La Constance	5a	2020-05-07 12:44:29.641858	2020-05-10 12:23:29.381222	0101000020E61000006211C30E63320440B682A62556304840	11	31	wall	2	2	{}
257	Les Plaquettes de Chocolat	5c	2020-05-07 12:44:29.64496	2020-05-10 12:26:14.440858	0101000020E610000096766A2E373804406F7EC34483304840	11	38	overhang	5	2	{}
155	Cadavre Exquis	4c	2020-04-16 20:19:03.426854	2020-04-19 08:39:46.78878	0101000020E6100000D464C6DB4A4F0540D2C26515363B4840	5	18	slab	4	1	{}
156	Paysage	3b	2020-04-16 20:19:03.429431	2020-04-19 08:39:46.790668	0101000020E6100000C9B08A37324F0540AFEC82C1353B4840	5	19	wall	4	1	{}
154	Mariage de Figaro	3b+	2020-04-16 20:19:03.424206	2020-04-19 08:39:46.792907	0101000020E6100000904E5DF92C4F0540AFEC82C1353B4840	2	16	traverse	4	1	{}
149	Les Temps Modernes	6b	2020-04-16 20:19:03.411405	2020-04-19 08:39:46.81567	0101000020E610000095456117454F05401C5C3AE63C3B4840	4	29	traverse	\N	1	{}
152	Prison	2b	2020-04-16 20:19:03.419142	2020-04-19 08:39:46.818838	0101000020E6100000B83F170D194F054008043A93363B4840	2	15	wall	\N	1	{}
159	Complainte	3b	2020-04-16 20:19:03.437792	2020-04-19 08:39:46.820628	0101000020E6100000D2A8C0C9365005408F37F92D3A3B4840	5	5	slab	\N	1	{}
160	L'Hiver	4b+	2020-04-16 20:19:03.441015	2020-04-19 08:39:46.822364	0101000020E610000088F71C588E5005408DCF64FF3C3B4840	5	4	overhang	\N	1	{}
148	Pyramide	5c	2020-04-16 20:19:03.408707	2020-04-28 19:26:53.275014	0101000020E6100000BC92E4B9BE4F05401AC05B20413B4840	4	36	slab	\N	1	{risky}
157	Ode	4b+	2020-04-16 20:19:03.432134	2020-04-19 08:39:46.783797	0101000020E6100000F5A276BF0A50054084BD8921393B4840	5	7	wall	3	1	{}
161	Puzzle	5c	2020-04-16 20:19:03.444224	2020-04-19 08:39:46.78548	0101000020E6100000F4FE3F4E9850054070EA03C93B3B4840	4	28	overhang	4	1	{}
158	Ballade	4a+	2020-04-16 20:19:03.434597	2020-04-19 08:39:46.787091	0101000020E6100000EF1F0BD1215005401EC4CE143A3B4840	5	6	wall	4	1	{}
151	L'Amour du Mensonge	4c	2020-04-16 20:19:03.416527	2020-04-19 08:39:46.794655	0101000020E6100000C3B986191A4F0540F0DB10E3353B4840	5	20	wall	4	1	{}
153	Prose	4c	2020-04-16 20:19:03.421549	2020-04-19 08:39:46.796269	0101000020E6100000B8054B75014F054097900F7A363B4840	5	21	wall	4	1	{}
264	La Bête de Somme	2b+	2020-05-07 12:44:29.680027	2020-05-10 10:08:24.454522	0101000020E6100000990F0874262D0440778192020B304840	10	5	wall	4	2	{}
271	Le Livret	3a	2020-05-07 12:44:29.703409	2020-05-10 10:15:54.705748	0101000020E6100000B49080D1E52D04401A4F04711E304840	10	9	slab	2	2	{}
309	La Fuite en Amont	3b	2020-05-07 12:44:29.879339	2020-05-10 10:17:56.193423	0101000020E6100000BABE0F07093104406F4BE48233304840	10	23	traverse	4	2	{}
322	Le Bourru	2b	2020-05-07 12:44:29.926841	2020-05-10 10:18:23.179249	0101000020E6100000D9B45208E4320440A51133FB3C304840	10	27	wall	2	2	{}
324	Le Boisseau	2b+	2020-05-07 12:44:29.94265	2020-05-10 10:19:33.244948	0101000020E61000006C21C841093304401D76DF313C304840	10	28	other	3	2	{}
342	La Placette	3a	2020-05-07 12:44:30.019746	2020-05-10 10:22:41.406942	0101000020E61000001C3F541A313304404356B77A4E304840	10	37	other	3	2	{}
143	Le Pion Cassé	5a	2020-04-16 20:19:03.39548	2020-04-19 08:39:46.797986	0101000020E6100000C345EEE9EA4E0540EB6F09C03F3B4840	4	32	wall	4	1	{}
144	L'Astragale	6b	2020-04-16 20:19:03.39802	2020-04-19 08:39:46.799612	0101000020E6100000A1116C5CFF4E05404487C091403B4840	4	33	wall	4	1	{}
145	Caprice	6a	2020-04-16 20:19:03.400619	2020-04-19 08:39:46.801198	0101000020E610000085268925E54E05401AC05B20413B4840	4	34	wall	4	1	{}
321	Le Vigoureux	2b	2020-05-07 12:44:29.923071	2020-05-10 10:23:51.92159	0101000020E6100000E63C635FB23104407DE6AC4F39304840	10	46	traverse	5	2	{}
139	Le Sylphe	5a	2020-04-16 20:19:03.384731	2020-04-19 08:39:46.806531	0101000020E6100000F8544E7B4A4E05402C2B4D4A413B4840	5	26	wall	4	1	{}
147	L'Oeuf de Colombe	6a	2020-04-16 20:19:03.405965	2020-04-19 08:39:46.808493	0101000020E610000085B2F0F5B54E05401503249A403B4840	4	31	wall	3	1	{}
150	Le Chou-Fleur	4a	2020-04-16 20:19:03.413927	2020-10-23 09:36:37.838504	0101000020E6100000D024FE41BA4E0540679066103A3B4840	5	22	wall	\N	1	{}
142	Il va Neiger	3c	2020-04-16 20:19:03.392806	2020-04-19 08:39:46.810241	0101000020E6100000FD1186014B4E05406891ED7C3F3B4840	5	25	wall	\N	1	{}
146	La Longue Marche	6b	2020-04-16 20:19:03.40327	2020-04-19 08:39:46.811883	0101000020E61000007F2F8507CD4E0540C1745AB7413B4840	4	35	traverse	\N	1	{}
183	Chlorophylle	6b	2020-04-16 20:19:03.508384	2020-04-28 19:38:52.810487	0101000020E6100000191F662FDB4E054045813E91273B4840	4	20	slab	6	1	{risky}
166	La Bendix	5b+	2020-04-16 20:19:03.461333	2020-04-28 19:38:52.823527	0101000020E6100000CEE15AED614F0540A77686A92D3B4840	3	21	wall	5	1	{risky}
384	Le Brise-Lame	2b	2020-05-07 20:11:37.775359	2020-05-10 10:25:11.128965	0101000020E61000004641F0F8F62E0440475A2A6F47304840	10	55	other	4	2	{}
385	Le Terminal	2b+	2020-05-07 20:11:37.778837	2020-05-10 10:25:18.605531	0101000020E61000002A90D959F42E0440043752B648304840	10	56	other	4	2	{}
381	La Sortie du Tunnel	2a+	2020-05-07 20:11:37.743528	2020-05-10 10:24:44.635989	0101000020E61000006EF8DD74CB2E0440ABB184B531304840	10	51	traverse	4	2	{}
382	L'Embarcadère	2a+	2020-05-07 20:11:37.76795	2020-05-10 10:25:00.189894	0101000020E6100000E030D120052F0440F54A598638304840	10	53	other	3	2	{}
383	Le Front de Mer	3a	2020-05-07 20:11:37.771971	2020-05-10 10:25:05.723949	0101000020E6100000240D6E6B0B2F0440024A438D42304840	10	54	wall	3	2	{}
176	Le Damier	6b+	2020-04-16 20:19:03.489102	2020-04-19 08:39:46.861937	0101000020E6100000823AE5D18D5005401AA37554353B4840	4	26	slab	4	1	{}
177	L'Espace	5a	2020-04-16 20:19:03.491804	2020-04-19 08:39:46.863594	0101000020E6100000F4C473B6805005401AA37554353B4840	5	8	wall	4	1	{}
165	Sonnets Posthumes	4c	2020-04-16 20:19:03.45845	2020-04-19 08:39:46.824743	0101000020E61000002FFB75A73B4F05407EE36BCF2C3B4840	5	11	wall	\N	1	{}
167	Opus Dei	3c	2020-04-16 20:19:03.464213	2020-04-19 08:39:46.826799	0101000020E61000008FC2F5285C4F0540B8AD2D3C2F3B4840	2	11	wall	\N	1	{}
168	Strophe	4a	2020-04-16 20:19:03.466775	2020-04-19 08:39:46.828457	0101000020E610000045292158554F0540FAD005F52D3B4840	5	12	wall	\N	1	{}
169	Stances	4c	2020-04-16 20:19:03.46935	2020-04-19 08:39:46.83019	0101000020E6100000B727486C774F0540EE224C512E3B4840	5	13	overhang	\N	1	{}
170	Crépuscule	4b	2020-04-16 20:19:03.472262	2020-04-19 08:39:46.831847	0101000020E610000034A0DE8C9A4F054082380F27303B4840	5	9	wall	\N	1	{}
187	L'eunnuque	4a	2020-04-16 20:19:03.523176	2020-04-19 08:39:46.838347	0101000020E6100000952D9276A34F05408F1A13622E3B4840	3	22	wall	\N	1	{}
188	La Frouch'mammouth	4c	2020-04-16 20:19:03.527786	2020-04-19 08:39:46.840029	0101000020E6100000897956D28A4F0540C4279D48303B4840	3	24	wall	\N	1	{}
189	Les Plats	4b	2020-04-16 20:19:03.530687	2020-04-19 08:39:46.842063	0101000020E6100000F0FD0DDAAB4F05404DF73AA92F3B4840	3	23	wall	\N	1	{}
190	\N	3c	2020-04-16 20:19:03.533414	2020-04-19 08:39:46.844151	0101000020E6100000B7D5AC33BE4F05400C3CF71E2E3B4840	2	7	overhang	\N	1	{}
194	L'Emmenthal	4a	2020-04-16 20:19:03.544902	2020-04-19 08:39:46.849273	0101000020E6100000A794D74AE84E0540E6AC4F39263B4840	3	16	wall	\N	1	{}
197	Échec et Mat	5c	2020-04-16 20:19:03.553306	2020-04-19 08:39:46.851028	0101000020E61000009D4A06802A4E05400E2F88484D3B4840	4	37	wall	\N	1	{}
229	Beaux Mouvements sur Fonds Sableux	6c+	2020-04-16 20:19:03.64575	2020-04-28 15:18:34.68931	0101000020E6100000144031B2644E0540BF0CC688443B4840	6	9	overhang	3	1	{sit_start}
268	L'Aisée	2a+	2020-05-07 12:44:29.693119	2020-05-10 10:15:43.262808	0101000020E610000048895DDBDB2D0440016E162F16304840	10	8	overhang	2	2	{}
226	Morphotype	6c+	2020-04-16 20:19:03.636799	2020-04-28 19:38:52.825149	0101000020E6100000A19DD32CD04E05407FA2B2614D3B4840	6	6	overhang	5	1	{sit_start,risky}
277	L'Envers du Toit	2b	2020-05-07 12:44:29.727318	2020-05-10 10:16:13.297326	0101000020E6100000FD1186014B2E0440AFE9414129304840	10	11	traverse	6	2	{}
221	Magifix	6c+	2020-04-16 20:19:03.623733	2020-04-19 08:39:46.925703	0101000020E6100000A4A833F790500540E71A66683C3B4840	6	2	overhang	4	1	{}
223	L'Innominata	6c+	2020-04-16 20:19:03.629074	2020-04-19 08:39:46.927441	0101000020E61000004CFE277FF74E0540F12C4146403B4840	6	4	wall	4	1	{}
182	Le Cheval d'Arçon	5b+	2020-04-16 20:19:03.505746	2020-10-23 09:36:37.323309	0101000020E61000000AA4568EED4E0540F8F7435C283B4840	3	17	wall	6	1	{risky}
180	La Soprano	4a	2020-04-16 20:19:03.500527	2020-10-23 09:36:37.507718	0101000020E61000005890F620FC4E0540785E36C6293B4840	3	18	overhang	5	1	{risky}
163	La Contralto	5a	2020-04-16 20:19:03.451859	2020-10-23 09:36:37.579056	0101000020E61000002A60ACFF544F0540FB73A1572B3B4840	3	20	wall	6	1	{risky}
173	La Belle Vieille	3c	2020-04-16 20:19:03.48083	2020-10-23 09:36:37.646722	0101000020E61000009C19CAECCC500540404727E0363B4840	5	3	wall	5	1	{risky}
172	La Prothèse	6a+	2020-04-16 20:19:03.478131	2020-10-23 09:36:37.719241	0101000020E61000000E77113EBA50054048361367373B4840	4	27	wall	5	1	{risky}
164	Égérie	4b	2020-04-16 20:19:03.455374	2020-10-23 09:36:37.82065	0101000020E61000006944A04C5E4F0540AF4223342C3B4840	5	10	slab	4	1	{}
174	Solitude	4a	2020-04-16 20:19:03.483646	2020-10-23 09:36:37.958418	0101000020E61000004C9E97B3C3500540CAC9821C373B4840	5	2	wall	5	1	{risky}
196	Outrage	5b+	2020-04-16 20:19:03.550693	2020-10-23 10:10:11.801765	0101000020E61000008BA1D8A64A4C05400508B2EF3C3B4840	4	43	wall	4	1	{}
206	Boute-en-Train	4c	2020-04-16 20:19:03.57939	2020-10-23 10:10:11.810826	0101000020E6100000889D29745E4C05400852C166353B4840	4	45	wall	\N	1	{}
212	Fables	4a+	2020-04-16 20:19:03.597443	2020-10-23 14:57:46.406341	0101000020E6100000E3107306944B0540801A2BCA2F3B4840	5	40	slab	5	1	{risky}
213	Boomerang	6a	2020-04-16 20:19:03.601495	2020-10-23 14:57:46.872287	0101000020E6100000057FC12B974B054083F3460D303B4840	4	46	wall	5	1	{risky}
279	Le Paisible	2a	2020-05-07 12:44:29.743657	2020-05-10 10:16:36.724069	0101000020E6100000BE66B96C742E0440780C8FFD2C304840	10	12	slab	3	2	{}
280	L'Indulgent	2b	2020-05-07 12:44:29.747438	2020-05-10 10:16:43.623839	0101000020E61000001F2E39EE942E0440361D01DC2C304840	10	13	slab	3	2	{}
281	L'Évitable Bi	3a	2020-05-07 12:44:29.751089	2020-05-10 10:16:50.201793	0101000020E61000002A1C412AC52E04407D957CEC2E304840	10	14	wall	3	2	{}
289	Le Cireur	2a	2020-05-07 12:44:29.778233	2020-05-10 10:16:57.43926	0101000020E61000007FDDE9CE132F04403D0E83F92B304840	10	15	wall	4	2	{}
292	Le Réta	2b	2020-05-07 12:44:29.788733	2020-05-10 10:17:03.253351	0101000020E6100000B2BCAB1E302F0440D97C5C1B2A304840	10	16	overhang	3	2	{}
293	Le Coiné	3a	2020-05-07 12:44:29.792276	2020-05-10 10:17:12.761675	0101000020E61000000D8D2782382F0440C154336B29304840	10	17	wall	3	2	{}
301	La Rampe	2a	2020-05-07 12:44:29.831278	2020-05-10 10:17:18.757764	0101000020E6100000C2C3B46FEE2F0440A3073E062B304840	10	18	wall	4	2	{}
304	Le Vigoureux	3b	2020-05-07 12:44:29.842521	2020-05-10 10:17:24.501977	0101000020E61000000B0BEE073C300440C154336B29304840	10	19	traverse	2	2	{}
305	L'Aérien	2a+	2020-05-07 12:44:29.846057	2020-05-10 10:17:30.688146	0101000020E6100000EE7BD45FAF3004408A5A9A5B21304840	10	20	overhang	4	2	{}
306	Le Montant	2b+	2020-05-07 12:44:29.859307	2020-05-10 10:17:38.844629	0101000020E6100000921FF12BD630044094A0BFD023304840	10	21	wall	2	2	{}
307	La Glissade	2b	2020-05-07 12:44:29.872361	2020-05-10 10:17:45.854292	0101000020E6100000BA10AB3FC23004400F26C5C727304840	10	22	slab	3	2	{}
310	La Marche	2a	2020-05-07 12:44:29.883384	2020-05-10 10:18:02.262669	0101000020E61000008CD651D50431044087DBA16131304840	10	24	wall	2	2	{}
199	Le But	4a	2020-04-16 20:19:03.559041	2020-04-19 08:39:46.889977	0101000020E61000001A89D008364E0540904E5DF92C3B4840	3	26	wall	\N	1	{}
200	L'Oubliée	4b	2020-04-16 20:19:03.561823	2020-04-19 08:39:46.892241	0101000020E6100000CB845FEAE74D05400ED8D5E4293B4840	3	27	wall	\N	1	{}
224	Les Câlins de Kim	7a	2020-04-16 20:19:03.631588	2020-04-19 08:39:46.908187	0101000020E6100000CAA65CE15D4E05408DEC4ACB483B4840	6	5	overhang	\N	1	{}
227	Canonnerie	6c	2020-04-16 20:19:03.640143	2020-04-19 08:39:46.911521	0101000020E6100000861C5BCF104E0540083E062B4E3B4840	6	7	traverse	\N	1	{}
228	Pot de Terre	6c+	2020-04-16 20:19:03.642973	2020-04-19 08:39:46.913133	0101000020E61000003CA583F57F4E054066F50EB7433B4840	6	8	wall	\N	1	{}
219	Nuage Blanc	6a+	2020-04-16 20:19:03.618292	2020-04-19 08:39:46.914731	0101000020E610000034F279C5534F0540DB4FC6F8303B4840	4	25	overhang	4	1	{}
218	Le Surplomb du Bengale	5c	2020-04-16 20:19:03.61576	2020-04-19 08:39:46.916321	0101000020E6100000DF180280634F05403A58FFE7303B4840	3	25	overhang	4	1	{}
217	Élégie	3c	2020-04-16 20:19:03.613172	2020-04-19 08:39:46.917906	0101000020E610000040A6B5696C4F0540DB4FC6F8303B4840	5	14	wall	4	1	{}
216	L'Amérique	4a	2020-04-16 20:19:03.610389	2020-04-19 08:39:46.919487	0101000020E610000029B2D6506A4F0540573D601E323B4840	5	15	wall	4	1	{}
215	Le Vallon	5c	2020-04-16 20:19:03.60743	2020-04-19 08:39:46.921241	0101000020E61000009B3C65355D4F0540F834272F323B4840	5	16	wall	4	1	{}
214	Soleil Couchant	4b	2020-04-16 20:19:03.604353	2020-04-19 08:39:46.923481	0101000020E610000012842BA0504F0540C9B08A37323B4840	5	17	wall	4	1	{}
311	L'Autre Voie	3a	2020-05-07 12:44:29.887012	2020-05-10 10:18:14.16511	0101000020E61000001F2BF86D883104409946938B31304840	10	26	wall	4	2	{}
326	L'Audacieuse	3a+	2020-05-07 12:44:29.949997	2020-05-10 10:19:39.679174	0101000020E610000078D503E621330440C45E28603B304840	10	29	overhang	2	2	{}
201	La Spéciale	4a+	2020-04-16 20:19:03.564889	2020-04-19 08:39:46.93866	0101000020E610000059C0046EDD4D05402634492C293B4840	3	28	wall	4	1	{}
202	La Bizuth	4b	2020-04-16 20:19:03.568045	2020-04-19 08:39:46.940828	0101000020E6100000439259BDC34D0540D3D9C9E0283B4840	3	29	wall	3	1	{}
327	Le Couloir	3a	2020-05-07 12:44:29.954071	2020-05-10 10:19:44.968155	0101000020E61000001C7920B24833044017B9A7AB3B304840	10	30	traverse	2	2	{}
328	La Combine	4a	2020-05-07 12:44:29.957855	2020-05-10 10:19:52.013905	0101000020E6100000C7D97404703304403BC3D4963A304840	10	31	wall	3	2	{}
329	La Trace	2a+	2020-05-07 12:44:29.961774	2020-05-10 10:19:59.552431	0101000020E610000049D576137C330440BD6DA6423C304840	10	32	other	3	2	{}
331	La Mogette	2b	2020-05-07 12:44:29.969669	2020-05-10 10:21:55.796793	0101000020E6100000EE26F8A6E9330440DBA337DC47304840	10	33	other	3	2	{}
300	L'Obstiné	2c	2020-05-07 12:44:29.827788	2020-05-10 10:24:30.94371	0101000020E61000002ECBD765F82F0440D714C8EC2C304840	10	49	wall	4	2	{}
284	Le Bustier	2b	2020-05-07 12:44:29.761396	2020-05-10 10:24:53.381764	0101000020E61000005DFB027AE12E0440E547FC8A35304840	10	52	overhang	3	2	{}
232	Jour de Pluie	7b	2020-04-16 20:19:03.653963	2020-04-28 15:20:21.658634	0101000020E610000009A4C4AEED4D05405C751DAA293B4840	6	12	overhang	4	1	{sit_start}
234	Les Copains d'abord	7a	2020-04-16 20:19:03.659414	2020-04-28 15:20:41.828763	0101000020E61000004F95EF19895005408A743FA7203B4840	6	14	overhang	\N	1	{sit_start}
244	La Théorie du Chaos	7b	2020-04-16 20:19:03.688228	2020-04-28 19:22:36.3846	0101000020E6100000DE3AFF76D94F05403F1C2444F93A4840	6	23	overhang	4	1	{risky}
243	Les Grimpeurs se Cachent pour Médire	7a	2020-04-16 20:19:03.684865	2020-04-28 19:38:52.830087	0101000020E61000000744882B674F0540D65240DAFF3A4840	6	22	wall	5	1	{risky}
237	Délivrance / Marquis de Sade	7a+	2020-04-16 20:19:03.668523	2020-04-28 19:38:52.831782	0101000020E61000002A1C412AC54E0540D7C05609163B4840	6	17	slab	6	1	{risky}
241	36.15 Gauche	7a	2020-04-16 20:19:03.678818	2020-04-19 08:39:46.949284	0101000020E610000079CE16105A4F054082AD122C0E3B4840	6	20	overhang	\N	1	{}
222	Lune de Fiel	7a	2020-04-16 20:19:03.626411	2020-10-23 09:36:37.62566	0101000020E61000002B029C95A64E0540F7AD1F1E3B3B4840	6	3	traverse	\N	1	{}
205	Le Tarot	5c	2020-04-16 20:19:03.576541	2020-10-23 10:10:11.42846	0101000020E61000001A69E5FA104C0540FD38F84B3D3B4840	4	44	overhang	\N	1	{}
203	Les Horloges	3b	2020-04-16 20:19:03.570915	2020-10-23 10:10:11.491413	0101000020E61000008B670C0F334C05401E2BBF5C3D3B4840	5	33	wall	\N	1	{}
207	Angoisse	4b	2020-04-16 20:19:03.58209	2020-10-23 10:10:11.781024	0101000020E6100000CC79C6BE644C054024766C34353B4840	5	35	wall	\N	1	{}
209	Les Chimères	4a	2020-04-16 20:19:03.588394	2020-10-23 14:57:46.523469	0101000020E61000005A406AD0E54B0540A04558B52E3B4840	5	37	traverse	3	1	{}
210	Méditation	4c	2020-04-16 20:19:03.591445	2020-10-23 14:57:46.624049	0101000020E61000000A242A11F64B05400A074B482E3B4840	5	38	wall	\N	1	{}
211	Anthologie	4b	2020-04-16 20:19:03.594483	2020-10-23 14:57:46.883806	0101000020E6100000650C7515A04B0540CCC2728F2F3B4840	5	39	slab	4	1	{}
208	Tristesse	4a	2020-04-16 20:19:03.585363	2020-10-23 14:57:46.923501	0101000020E61000009368CB76D34B054020E48B00313B4840	5	36	overhang	\N	1	{}
236	Gainage et Dévers	6c	2020-04-16 20:19:03.665873	2020-04-19 08:39:46.952584	0101000020E61000002F4D11E0F44E0540A5A0DB4B1A3B4840	6	16	traverse	3	1	{}
235	La Singlette	6b+	2020-04-16 20:19:03.662079	2020-04-19 08:39:46.954221	0101000020E61000005CCB64389E4F05408FE046CA163B4840	6	15	traverse	4	1	{}
238	La Dénoyautée	7a+	2020-04-16 20:19:03.671096	2020-04-19 08:39:46.955911	0101000020E61000007FDDE9CE134F05401A187959133B4840	6	18	wall	4	1	{}
334	Le Terminus	2a	2020-05-07 12:44:29.980827	2020-05-10 10:22:02.849558	0101000020E6100000CC7EDDE9CE33044072A609DB4F304840	10	34	other	4	2	{}
239	Nut's	7b	2020-04-16 20:19:03.673611	2020-04-19 08:39:46.960359	0101000020E6100000293E3E213B4F0540F8DD74CB0E3B4840	6	19	overhang	4	1	{}
242	Fantasia chez les Ploucs	7a+	2020-04-16 20:19:03.682064	2020-04-19 08:39:46.962022	0101000020E610000034A0DE8C9A4F0540D93F4F03063B4840	6	21	overhang	4	1	{}
338	Le Pas de Géant	2b+	2020-05-07 12:44:30.005055	2020-05-10 10:22:25.746882	0101000020E6100000FFAF3A72A43304406CE9D1544F304840	10	35	traverse	5	2	{}
245	Chasseur de Prises	7a	2020-04-16 20:19:03.691413	2020-04-19 08:39:46.965498	0101000020E61000008D62B9A5D5500540B8054B75013B4840	6	24	wall	4	1	{}
341	La Rabiboche	2b	2020-05-07 12:44:30.015624	2020-05-10 10:22:32.596856	0101000020E6100000992B836A83330440CC2555DB4D304840	10	36	other	4	2	{}
352	Le Sortant	2a	2020-05-07 12:44:30.055227	2020-05-10 10:22:47.496745	0101000020E6100000AC58FCA6B0320440E76ED74B53304840	10	38	wall	3	2	{}
355	La Rotation	2a+	2020-05-07 12:44:30.073804	2020-05-10 10:23:02.459861	0101000020E6100000CE8C7E349C3204406919A9F754304840	10	39	wall	3	2	{}
347	L'Abri	2b	2020-05-07 12:44:30.03722	2020-05-10 10:23:10.456785	0101000020E6100000F06E6589CE320440126A865451304840	10	40	other	3	2	{}
348	La Cheminée	3a	2020-05-07 12:44:30.04072	2020-05-10 10:23:18.24712	0101000020E610000012DDB3AED13204407172BF4351304840	10	41	other	5	2	{}
344	La Bravoure	2c	2020-05-07 12:44:30.026746	2020-05-10 10:23:24.446733	0101000020E6100000B1C398F4F73204404ED026874F304840	10	42	wall	4	2	{}
346	L'Oblique	2a	2020-05-07 12:44:30.033726	2020-05-10 10:23:32.341456	0101000020E61000004CE3175E493204404ED026874F304840	10	43	wall	4	2	{}
333	Le Briscard	2b	2020-05-07 12:44:29.977091	2020-05-10 10:23:39.099257	0101000020E610000057975302623204405891D10149304840	10	44	wall	3	2	{}
332	Le Roi Mage	2b	2020-05-07 12:44:29.973382	2020-05-10 10:23:45.450678	0101000020E6100000EA03C93B873204400B28D4D347304840	10	45	slab	5	2	{}
175	l'Abîme	4a	2020-04-16 20:19:03.486351	2020-07-05 18:53:17.349524	0101000020E61000002CD505BCCC50054048BF7D1D383B4840	5	1	wall	4	1	{}
248	La Motte de Grès	2a	2020-05-07 12:44:29.61171	2020-10-15 12:57:33.8388	0101000020E6100000026553AEF02E0440B7B75B9203304840	10	1	slab	3	2	{}
387	\N	\N	2020-10-19 19:33:22.746816	2020-10-19 19:33:22.746816	\N	14	1	other	\N	4	{}
388	\N	\N	2020-10-19 19:33:22.75919	2020-10-19 19:33:22.75919	\N	14	2	other	\N	4	{}
389	\N	\N	2020-10-19 19:33:22.762098	2020-10-19 19:33:22.762098	\N	14	3	other	\N	4	{}
390	\N	\N	2020-10-19 19:33:22.767736	2020-10-19 19:33:22.767736	\N	14	4	other	\N	4	{}
391	\N	\N	2020-10-19 19:33:22.770223	2020-10-19 19:33:22.770223	\N	14	5	other	\N	4	{}
392	\N	\N	2020-10-19 19:33:22.773038	2020-10-19 19:33:22.773038	\N	14	6	other	\N	4	{}
393	\N	\N	2020-10-19 19:33:22.775594	2020-10-19 19:33:22.775594	\N	14	7	other	\N	4	{}
394	\N	\N	2020-10-19 19:33:22.777881	2020-10-19 19:33:22.777881	\N	14	8	other	\N	4	{}
395	\N	\N	2020-10-19 19:33:22.780038	2020-10-19 19:33:22.780038	\N	14	9	other	\N	4	{}
396	\N	\N	2020-10-19 19:33:22.782048	2020-10-19 19:33:22.782048	\N	14	10	other	\N	4	{}
397	\N	\N	2020-10-19 19:33:22.784022	2020-10-19 19:33:22.784022	\N	14	11	other	\N	4	{}
398	\N	\N	2020-10-19 19:33:22.786184	2020-10-19 19:33:22.786184	\N	14	12	other	\N	4	{}
400	\N	\N	2020-10-19 19:33:22.791313	2020-10-19 19:33:22.791313	\N	14	14	other	\N	4	{}
401	\N	\N	2020-10-19 19:33:22.793489	2020-10-19 19:33:22.793489	\N	14	15	other	\N	4	{}
402	\N	\N	2020-10-19 19:33:22.795314	2020-10-19 19:33:22.795314	\N	14	16	other	\N	4	{}
403	\N	\N	2020-10-19 19:33:22.797141	2020-10-19 19:33:22.797141	\N	14	17	other	\N	4	{}
404	\N	\N	2020-10-19 19:33:22.798931	2020-10-19 19:33:22.798931	\N	14	18	other	\N	4	{}
405	\N	\N	2020-10-19 19:33:22.800643	2020-10-19 19:33:22.800643	\N	14	19	other	\N	4	{}
406	\N	\N	2020-10-19 19:33:22.802832	2020-10-19 19:33:22.802832	\N	14	20	other	\N	4	{}
140	Chanson d'Automne	4a	2020-04-16 20:19:03.387309	2020-10-23 09:36:37.271399	0101000020E6100000D2D1D383674E0540F6AC5AB43E3B4840	5	23	wall	5	1	{risky}
399			2020-10-19 19:33:22.788514	2020-10-20 08:50:11.560399	0101000020E61000009C8D748A7E1A0540084A3C6641394840	14	13	other	\N	4	{}
409	\N	\N	2020-10-19 19:33:22.809804	2020-10-19 19:33:22.809804	\N	14	23	other	\N	4	{}
410	\N	\N	2020-10-19 19:33:22.811624	2020-10-19 19:33:22.811624	\N	14	24	other	\N	4	{}
412	\N	\N	2020-10-19 19:33:22.815085	2020-10-19 19:33:22.815085	\N	14	26	other	\N	4	{}
413	\N	\N	2020-10-19 19:33:22.816977	2020-10-19 19:33:22.816977	\N	14	27	other	\N	4	{}
414	\N	\N	2020-10-19 19:33:22.818914	2020-10-19 19:33:22.818914	\N	14	28	other	\N	4	{}
415	\N	\N	2020-10-19 19:33:22.821635	2020-10-19 19:33:22.821635	\N	14	29	other	\N	4	{}
417	\N	\N	2020-10-19 19:33:22.826188	2020-10-19 19:33:22.826188	\N	14	31	other	\N	4	{}
418	\N	\N	2020-10-19 19:33:22.82788	2020-10-19 19:33:22.82788	\N	14	32	other	\N	4	{}
419	\N	\N	2020-10-19 19:33:22.829536	2020-10-19 19:33:22.829536	\N	14	33	other	\N	4	{}
420	\N	\N	2020-10-19 19:33:22.831183	2020-10-19 19:33:22.831183	\N	14	34	other	\N	4	{}
421	\N	\N	2020-10-19 19:33:22.832852	2020-10-19 19:33:22.832852	\N	14	35	other	\N	4	{}
423	\N	\N	2020-10-19 19:33:22.836217	2020-10-19 19:33:22.836217	\N	14	37	other	\N	4	{}
424	\N	\N	2020-10-19 19:33:22.837923	2020-10-19 19:33:22.837923	\N	14	38	other	\N	4	{}
425	\N	\N	2020-10-19 19:33:22.841119	2020-10-19 19:33:22.841119	\N	14	39	other	\N	4	{}
426	\N	\N	2020-10-19 19:33:22.842991	2020-10-19 19:33:22.842991	\N	14	40	other	\N	4	{}
427	\N	\N	2020-10-19 19:33:22.844714	2020-10-19 19:33:22.844714	\N	14	41	other	\N	4	{}
428	\N	\N	2020-10-19 19:33:22.846318	2020-10-19 19:33:22.846318	\N	14	42	other	\N	4	{}
429	\N	\N	2020-10-19 19:33:22.847986	2020-10-19 19:33:22.847986	\N	14	43	other	\N	4	{}
430	\N	\N	2020-10-19 19:33:22.849799	2020-10-19 19:33:22.849799	\N	14	44	other	\N	4	{}
431	\N	\N	2020-10-19 19:33:22.851596	2020-10-19 19:33:22.851596	\N	14	45	other	\N	4	{}
432	\N	\N	2020-10-19 19:33:22.853854	2020-10-19 19:33:22.853854	\N	14	46	other	\N	4	{}
433	\N	\N	2020-10-19 19:33:22.856767	2020-10-19 19:33:22.856767	\N	14	47	other	\N	4	{}
434	\N	\N	2020-10-19 19:33:22.859067	2020-10-19 19:33:22.859067	\N	14	48	other	\N	4	{}
435	\N	\N	2020-10-19 19:33:22.860899	2020-10-19 19:33:22.860899	\N	14	49	other	\N	4	{}
436	\N	\N	2020-10-19 19:33:22.862817	2020-10-19 19:33:22.862817	\N	14	50	other	\N	4	{}
437	\N	\N	2020-10-19 19:34:08.080002	2020-10-19 19:34:08.080002	\N	13	1	other	\N	4	{}
438	\N	\N	2020-10-19 19:34:08.083591	2020-10-19 19:34:08.083591	\N	13	2	other	\N	4	{}
439	\N	\N	2020-10-19 19:34:08.086629	2020-10-19 19:34:08.086629	\N	13	3	other	\N	4	{}
441	\N	\N	2020-10-19 19:34:08.091842	2020-10-19 19:34:08.091842	\N	13	5	other	\N	4	{}
442	\N	\N	2020-10-19 19:34:08.094175	2020-10-19 19:34:08.094175	\N	13	6	other	\N	4	{}
443	\N	\N	2020-10-19 19:34:08.096548	2020-10-19 19:34:08.096548	\N	13	7	other	\N	4	{}
447	\N	\N	2020-10-19 19:34:08.104463	2020-10-19 19:34:08.104463	\N	13	11	other	\N	4	{}
448	\N	\N	2020-10-19 19:34:08.106358	2020-10-19 19:34:08.106358	\N	13	12	other	\N	4	{}
451	\N	\N	2020-10-19 19:34:08.111663	2020-10-19 19:34:08.111663	\N	13	15	other	\N	4	{}
452	\N	\N	2020-10-19 19:34:08.118834	2020-10-19 19:34:08.118834	\N	13	16	other	\N	4	{}
453	\N	\N	2020-10-19 19:34:08.120945	2020-10-19 19:34:08.120945	\N	13	17	other	\N	4	{}
454	\N	\N	2020-10-19 19:34:08.122809	2020-10-19 19:34:08.122809	\N	13	18	other	\N	4	{}
455	\N	\N	2020-10-19 19:34:08.124488	2020-10-19 19:34:08.124488	\N	13	19	other	\N	4	{}
456	\N	\N	2020-10-19 19:34:08.126153	2020-10-19 19:34:08.126153	\N	13	20	other	\N	4	{}
457	\N	\N	2020-10-19 19:34:08.127988	2020-10-19 19:34:08.127988	\N	13	21	other	\N	4	{}
458	\N	\N	2020-10-19 19:34:08.12968	2020-10-19 19:34:08.12968	\N	13	22	other	\N	4	{}
459	\N	\N	2020-10-19 19:34:08.131461	2020-10-19 19:34:08.131461	\N	13	23	other	\N	4	{}
460	\N	\N	2020-10-19 19:34:08.134265	2020-10-19 19:34:08.134265	\N	13	24	other	\N	4	{}
461	\N	\N	2020-10-19 19:34:08.136925	2020-10-19 19:34:08.136925	\N	13	25	other	\N	4	{}
462	\N	\N	2020-10-19 19:34:08.139444	2020-10-19 19:34:08.139444	\N	13	26	other	\N	4	{}
463	\N	\N	2020-10-19 19:34:08.14149	2020-10-19 19:34:08.14149	\N	13	27	other	\N	4	{}
464	\N	\N	2020-10-19 19:34:08.143476	2020-10-19 19:34:08.143476	\N	13	28	other	\N	4	{}
467	\N	\N	2020-10-19 19:34:08.151111	2020-10-19 19:34:08.151111	\N	13	31	other	\N	4	{}
468	\N	\N	2020-10-19 19:34:08.153166	2020-10-19 19:34:08.153166	\N	13	32	other	\N	4	{}
469	\N	\N	2020-10-19 19:34:08.154921	2020-10-19 19:34:08.154921	\N	13	33	other	\N	4	{}
470	\N	\N	2020-10-19 19:34:08.156569	2020-10-19 19:34:08.156569	\N	13	34	other	\N	4	{}
471	\N	\N	2020-10-19 19:34:08.15826	2020-10-19 19:34:08.15826	\N	13	35	other	\N	4	{}
472	\N	\N	2020-10-19 19:34:08.159887	2020-10-19 19:34:08.159887	\N	13	36	other	\N	4	{}
473	\N	\N	2020-10-19 19:34:08.161455	2020-10-19 19:34:08.161455	\N	13	37	other	\N	4	{}
474	\N	\N	2020-10-19 19:34:08.163102	2020-10-19 19:34:08.163102	\N	13	38	other	\N	4	{}
480	\N	\N	2020-10-19 19:34:08.175456	2020-10-19 19:34:08.175456	\N	13	44	other	\N	4	{}
481	\N	\N	2020-10-19 19:34:08.177106	2020-10-19 19:34:08.177106	\N	13	45	other	\N	4	{}
482	\N	\N	2020-10-19 19:34:08.179001	2020-10-19 19:34:08.179001	\N	13	46	other	\N	4	{}
483	\N	\N	2020-10-19 19:34:08.180996	2020-10-19 19:34:08.180996	\N	13	47	other	\N	4	{}
484	\N	\N	2020-10-19 19:34:08.18634	2020-10-19 19:34:08.18634	\N	13	48	other	\N	4	{}
445			2020-10-19 19:34:08.10057	2020-10-20 08:50:11.579897	0101000020E61000007C2C7DE8821A054076ED3D2247394840	13	9	other	\N	4	{}
444			2020-10-19 19:34:08.098579	2020-10-20 08:50:11.583347	0101000020E6100000E9EE5B29DB1A05403157D49A45394840	13	8	other	\N	4	{}
440			2020-10-19 19:34:08.08933	2020-10-20 08:50:11.58612	0101000020E61000005B91B9AE6F1A0540D51EC40840394840	13	4	other	\N	4	{}
411			2020-10-19 19:33:22.813396	2020-10-20 08:50:11.5887	0101000020E6100000B87857C1981A05402511AF2543394840	14	25	other	\N	4	{}
422			2020-10-19 19:33:22.834548	2020-10-20 08:50:11.59338	0101000020E61000000A8828AAA71C0540F6DE4A3C41394840	14	36	other	\N	4	{}
466			2020-10-19 19:34:08.148258	2020-10-20 08:50:11.595717	0101000020E61000000A8828AAA71C0540F6DE4A3C41394840	13	30	other	\N	4	{}
478			2020-10-19 19:34:08.171975	2020-10-20 08:50:11.598026	0101000020E6100000CD237F30F01C05405E409A773D394840	13	42	other	\N	4	{}
476			2020-10-19 19:34:08.168	2020-10-20 08:50:11.603125	0101000020E6100000B1389CF9D51C05406DA08E0138394840	13	40	other	\N	4	{}
475			2020-10-19 19:34:08.164936	2020-10-20 08:50:11.605588	0101000020E610000022C32ADEC81C05405510D1223A394840	13	39	other	\N	4	{}
450	La Fissure Morin	4c	2020-10-19 19:34:08.1098	2020-10-20 08:50:11.572555	0101000020E610000062D9AB13C01A054045D8F0F44A394840	13	14	wall	\N	4	{}
485	\N	\N	2020-10-19 19:34:28.283868	2020-10-19 19:34:28.283868	\N	15	1	other	\N	4	{}
486	\N	\N	2020-10-19 19:34:28.286907	2020-10-19 19:34:28.286907	\N	15	2	other	\N	4	{}
487	\N	\N	2020-10-19 19:34:28.289642	2020-10-19 19:34:28.289642	\N	15	3	other	\N	4	{}
488	\N	\N	2020-10-19 19:34:28.291808	2020-10-19 19:34:28.291808	\N	15	4	other	\N	4	{}
491	\N	\N	2020-10-19 19:34:28.297932	2020-10-19 19:34:28.297932	\N	15	7	other	\N	4	{}
492	\N	\N	2020-10-19 19:34:28.299811	2020-10-19 19:34:28.299811	\N	15	8	other	\N	4	{}
493	\N	\N	2020-10-19 19:34:28.301558	2020-10-19 19:34:28.301558	\N	15	9	other	\N	4	{}
494	\N	\N	2020-10-19 19:34:28.303312	2020-10-19 19:34:28.303312	\N	15	10	other	\N	4	{}
495	\N	\N	2020-10-19 19:34:28.305115	2020-10-19 19:34:28.305115	\N	15	11	other	\N	4	{}
498	\N	\N	2020-10-19 19:34:28.310516	2020-10-19 19:34:28.310516	\N	15	14	other	\N	4	{}
499	\N	\N	2020-10-19 19:34:28.31247	2020-10-19 19:34:28.31247	\N	15	15	other	\N	4	{}
500	\N	\N	2020-10-19 19:34:28.314682	2020-10-19 19:34:28.314682	\N	15	16	other	\N	4	{}
501	\N	\N	2020-10-19 19:34:28.322068	2020-10-19 19:34:28.322068	\N	15	17	other	\N	4	{}
502	\N	\N	2020-10-19 19:34:28.324075	2020-10-19 19:34:28.324075	\N	15	18	other	\N	4	{}
503	\N	\N	2020-10-19 19:34:28.325849	2020-10-19 19:34:28.325849	\N	15	19	other	\N	4	{}
504	\N	\N	2020-10-19 19:34:28.327543	2020-10-19 19:34:28.327543	\N	15	20	other	\N	4	{}
505	\N	\N	2020-10-19 19:34:28.32928	2020-10-19 19:34:28.32928	\N	15	21	other	\N	4	{}
507	\N	\N	2020-10-19 19:34:28.333593	2020-10-19 19:34:28.333593	\N	15	23	other	\N	4	{}
508	\N	\N	2020-10-19 19:34:28.33573	2020-10-19 19:34:28.33573	\N	15	24	other	\N	4	{}
509	\N	\N	2020-10-19 19:34:28.338394	2020-10-19 19:34:28.338394	\N	15	25	other	\N	4	{}
510	\N	\N	2020-10-19 19:34:28.340644	2020-10-19 19:34:28.340644	\N	15	26	other	\N	4	{}
511	\N	\N	2020-10-19 19:34:28.342371	2020-10-19 19:34:28.342371	\N	15	27	other	\N	4	{}
512	\N	\N	2020-10-19 19:34:28.344069	2020-10-19 19:34:28.344069	\N	15	28	other	\N	4	{}
513	\N	\N	2020-10-19 19:34:28.345664	2020-10-19 19:34:28.345664	\N	15	29	other	\N	4	{}
514	\N	\N	2020-10-19 19:34:28.347323	2020-10-19 19:34:28.347323	\N	15	30	other	\N	4	{}
515	\N	\N	2020-10-19 19:34:28.349563	2020-10-19 19:34:28.349563	\N	15	31	other	\N	4	{}
516	\N	\N	2020-10-19 19:34:28.352221	2020-10-19 19:34:28.352221	\N	15	32	other	\N	4	{}
517	\N	\N	2020-10-19 19:34:28.3543	2020-10-19 19:34:28.3543	\N	15	33	other	\N	4	{}
518	\N	\N	2020-10-19 19:34:28.356619	2020-10-19 19:34:28.356619	\N	15	34	other	\N	4	{}
519	\N	\N	2020-10-19 19:34:28.358919	2020-10-19 19:34:28.358919	\N	15	35	other	\N	4	{}
520	\N	\N	2020-10-19 19:34:28.360786	2020-10-19 19:34:28.360786	\N	15	36	other	\N	4	{}
521	\N	\N	2020-10-19 19:34:28.362649	2020-10-19 19:34:28.362649	\N	15	37	other	\N	4	{}
522	\N	\N	2020-10-19 19:34:28.364328	2020-10-19 19:34:28.364328	\N	15	38	other	\N	4	{}
523	\N	\N	2020-10-19 19:34:28.366363	2020-10-19 19:34:28.366363	\N	15	39	other	\N	4	{}
524	\N	\N	2020-10-19 19:34:28.368284	2020-10-19 19:34:28.368284	\N	15	40	other	\N	4	{}
525	\N	\N	2020-10-19 19:34:28.370067	2020-10-19 19:34:28.370067	\N	15	41	other	\N	4	{}
526	\N	\N	2020-10-19 19:34:28.371829	2020-10-19 19:34:28.371829	\N	15	42	other	\N	4	{}
446			2020-10-19 19:34:08.102599	2020-10-20 08:50:11.576281	0101000020E6100000D1CB28965B1A05403B92CB7F48394840	13	10	other	\N	4	{}
465			2020-10-19 19:34:08.145539	2020-10-20 08:50:11.591073	0101000020E61000003B16FCB28B1C0540FE0E45813E394840	13	29	other	\N	4	{}
479			2020-10-19 19:34:08.173717	2020-10-20 08:50:11.600491	0101000020E61000003B38F9A9011D05400D640B7B39394840	13	43	other	\N	4	{}
416	La Fissure des Enfants	3a+	2020-10-19 19:33:22.824233	2020-10-20 08:50:11.608043	0101000020E61000005EEFFE78AF1A05406DDA5A994F394840	14	30	slab	\N	4	{}
449			2020-10-19 19:34:08.108094	2020-10-20 08:50:11.610391	0101000020E610000022DDF037B11A05408033639749394840	13	13	other	\N	4	{}
489			2020-10-19 19:34:28.293875	2020-10-20 08:50:11.612774	0101000020E61000009C8D748A7E1A0540084A3C6641394840	15	5	other	\N	4	{}
490			2020-10-19 19:34:28.296024	2020-10-20 08:50:11.615086	0101000020E6100000B87857C1981A05402511AF2543394840	15	6	other	\N	4	{}
497			2020-10-19 19:34:28.308693	2020-10-20 08:50:11.61739	0101000020E610000091EF73F87B1C05401AB52D9041394840	15	13	other	\N	4	{}
496			2020-10-19 19:34:28.306993	2020-10-20 08:50:11.619782	0101000020E610000006B64AB0381C0540F6DE4A3C41394840	15	12	other	\N	4	{}
477			2020-10-19 19:34:08.170092	2020-10-20 08:50:11.622154	0101000020E6100000D10D2CCB001D0540AB112CD43B394840	13	41	other	\N	4	{}
506			2020-10-19 19:34:28.331405	2020-10-20 08:50:11.62458	0101000020E61000003B38F9A9011D05400D640B7B39394840	15	22	other	\N	4	{}
162	Le Dé	5b	2020-04-16 20:19:03.447369	2020-10-23 09:36:37.28367	0101000020E610000087C5B12D754E0540C2DC377A3E3B4840	4	30	overhang	5	1	{risky}
26	\N	3a	2020-04-16 20:19:03.047543	2020-10-23 09:36:37.315461	0101000020E6100000E9CAB9A39B4E0540CDF9D5C1273B4840	1	24	wall	\N	1	{}
81	\N	3c	2020-04-16 20:19:03.213609	2020-10-23 09:36:37.348056	0101000020E6100000D69C11E63F500540BAC2DA4C2D3B4840	2	6	traverse	\N	1	{}
98	La Golgotha (gauche)	5b+	2020-04-16 20:19:03.26406	2020-10-23 09:36:37.353567	0101000020E610000034D9D471584F05404FF3C7EF153B4840	3	9	wall	4	1	{}
184	La Vieille	5c+	2020-04-16 20:19:03.511011	2020-10-23 09:36:37.369903	0101000020E6100000ABFC6FDAE74E0540A29C97F6283B4840	4	21	wall	6	1	{risky}
178	Le Fourre-Tout	6a+	2020-04-16 20:19:03.494721	2020-10-23 09:36:37.40125	0101000020E610000004F25653FF4E05400F5D42D92A3B4840	4	24	traverse	4	1	{}
192	Le Couloir	4b	2020-04-16 20:19:03.539036	2020-10-23 09:36:37.462034	0101000020E6100000288FE1BCAB4E0540132FBE6E273B4840	3	30	wall	\N	1	{}
85	\N	3a	2020-04-16 20:19:03.225198	2020-10-23 09:36:37.471259	0101000020E61000002F40B310CA500540983811A6363B4840	2	2	traverse	\N	1	{}
185	Styrax	5c	2020-04-16 20:19:03.513481	2020-10-23 09:36:37.501586	0101000020E6100000D54BCF5DD24E05401F35F238293B4840	4	22	wall	\N	1	{risky}
193	Les Petits Pieds	6a	2020-04-16 20:19:03.541645	2020-10-23 09:36:37.572063	0101000020E6100000B10E7ABDC74E054073C2DCA6263B4840	4	19	slab	4	1	{}
72	Tour d'Eiffel	3b	2020-04-16 20:19:03.188287	2020-10-23 09:36:37.640243	0101000020E61000002E481D40504F0540A9F671D02B3B4840	2	19	slab	6	1	{risky}
141	Bateau Ivre	4b+	2020-04-16 20:19:03.390152	2020-10-23 09:36:37.672125	0101000020E6100000F4EE9224734E05405BB5A8BB3F3B4840	5	24	wall	5	1	{risky}
69	Confiance	4a	2020-04-16 20:19:03.17155	2020-10-23 09:36:37.685411	0101000020E610000015DCC99BDF4E054088FDF51E293B4840	2	22	slab	6	1	{risky}
198	Bateau Pilote	6a	2020-04-16 20:19:03.556024	2020-10-23 09:36:37.712588	0101000020E6100000289B70C6F34E054007FB9EE1263B4840	4	18	wall	\N	1	{}
92	Le Bossu	6b	2020-04-16 20:19:03.246488	2020-10-23 09:36:37.740901	0101000020E6100000EBD588C90E4F05409BB84184203B4840	4	16	overhang	4	1	{}
93	Le Whist	5c	2020-04-16 20:19:03.249386	2020-10-23 09:36:37.744675	0101000020E6100000C2EE9C3A1E4F0540E844DEBA203B4840	4	17	wall	4	1	{}
179	La Goulotte	3c	2020-04-16 20:19:03.497705	2020-10-23 09:36:37.753692	0101000020E610000078AF7897164F0540892133BB293B4840	3	19	wall	3	1	{}
70	Le Bouchon	3b	2020-04-16 20:19:03.178619	2020-10-23 09:36:37.759872	0101000020E61000008B4B65FE1A4F054046639387293B4840	2	21	overhang	3	1	{risky}
191	SOS Glycogène	5c	2020-04-16 20:19:03.536171	2020-10-23 09:36:37.781908	0101000020E6100000F746DCE5C14E054005295F6D283B4840	4	23	overhang	\N	1	{}
84	La Folklorique	2a	2020-04-16 20:19:03.222079	2020-10-23 09:36:37.790667	0101000020E61000002F57E09FA25005400F3BC75B353B4840	2	3	traverse	\N	1	{}
71	\N	2a	2020-04-16 20:19:03.185163	2020-10-23 09:36:37.82427	0101000020E6100000C670E18D5A4F0540C5D21D342B3B4840	2	20	overhang	\N	1	{}
233	Expositions retrospectives	6c+	2020-04-16 20:19:03.656695	2020-10-23 09:36:37.880144	0101000020E61000006B76FB68CC4E05400F9DEA05293B4840	6	13	wall	\N	1	{risky}
32	\N	2a	2020-04-16 20:19:03.064545	2020-10-23 09:36:37.909527	0101000020E6100000892482B6274E0540694ACD9D2D3B4840	1	18	wall	\N	1	{risky}
186	La Dalle de Marbre	4c	2020-04-16 20:19:03.516731	2020-10-23 09:36:37.948984	0101000020E61000003EED09D4B14E054065AA8B5F253B4840	3	15	slab	\N	1	{}
231	Sledgehammer	7a	2020-04-16 20:19:03.651288	2020-10-23 10:10:11.832429	0101000020E61000002B1425BD414C05406C34C5003B3B4840	6	11	traverse	\N	1	{}
204	Gravitation	4a	2020-04-16 20:19:03.573668	2020-10-23 10:10:11.84927	0101000020E610000014ACAD74104C0540C5E5A1B03D3B4840	5	34	overhang	\N	1	{}
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
20200704211106
20200705193814
20201019194907
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: topos; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.topos (id, line, problem_id, created_at, updated_at, published, metadata) FROM stdin;
453	[{"x":0.5825,"y":0.8617},{"x":0.6162,"y":0.5883},{"x":0.6288,"y":0.3017},{"x":0.6338,"y":0.1567}]	19	2020-09-03 20:45:15.022446	2020-10-22 17:00:32.385972	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1106438711283575","GPSTimeStamp":"2020-09-01T15:38:53Z","GPSImgDirection":"344.81916816999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635049999999998","GPSLatitude":"48.461753329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.700000000000003","GPSHPositioningError":"15.999419279907086","DateCreated":"2020-09-01T17:38:52+02:00"}}}}
447	[{"x":0.5025,"y":0.81},{"x":0.5088,"y":0.4483},{"x":0.5062,"y":0.2583},{"x":0.5038,"y":0.1717}]	202	2020-09-03 20:45:14.008603	2020-10-22 16:19:39.337304	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.048246923828372153","GPSTimeStamp":"2020-09-01T14:10:26Z","GPSImgDirection":"204.28925318999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628450000000004","GPSLatitude":"48.462219999999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94","GPSHPositioningError":"15.634881682734443","DateCreated":"2020-09-01T16:10:26+02:00"}}}}
458	[{"x":0.4338,"y":0.8233},{"x":0.4562,"y":0.4883},{"x":0.4938,"y":0.1617},{"x":0.4988,"y":0.12}]	94	2020-09-03 20:45:15.607977	2020-10-22 16:24:52.848303	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.052530284983877067","GPSTimeStamp":"2020-09-01T14:24:43Z","GPSImgDirection":"36.325408940000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632633299999999","GPSLatitude":"48.46181167000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.900000000000006","GPSHPositioningError":"11.633081719724318","DateCreated":"2020-09-01T16:24:43+02:00"}}}}
339	[{"x":0.4188,"y":0.8283},{"x":0.4387,"y":0.4083},{"x":0.4975,"y":0.0983}]	100	2020-09-03 20:43:19.476015	2020-10-22 16:34:46.278475	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.35021072619488702","GPSTimeStamp":"2020-09-01T14:35:37Z","GPSImgDirection":"105.79767040999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633699999999996","GPSLatitude":"48.461604999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.099999999999994","GPSHPositioningError":"4.8485138563155123","DateCreated":"2020-09-01T16:35:36+02:00"}}}}
449	[{"x":0.17,"y":0.7183},{"x":0.2037,"y":0.6117},{"x":0.3375,"y":0.4783},{"x":0.4537,"y":0.4883},{"x":0.5687,"y":0.4767},{"x":0.6462,"y":0.4517},{"x":0.7662,"y":0.4633},{"x":0.825,"y":0.4617}]	236	2020-09-03 20:45:14.290367	2020-09-03 21:53:26.497233	t	\N
270	[{"x":0.5413,"y":0.8017},{"x":0.5375,"y":0.5083},{"x":0.5637,"y":0.3167},{"x":0.5425,"y":0.145}]	162	2020-09-03 20:43:09.53689	2020-09-04 19:56:07.109039	f	\N
91	[{"x":0.1195,"y":0.7212},{"x":0.0998,"y":0.5206},{"x":0.1107,"y":0.3257},{"x":0.1612,"y":0.2155}]	138	2020-04-18 20:36:58.806167	2020-07-05 19:48:04.184823	f	\N
113	[{"x":0.2393,"y":0.8684},{"x":0.25,"y":0.466},{"x":0.2796,"y":0.2862},{"x":0.3405,"y":0.1393}]	136	2020-04-18 20:36:59.740272	2020-07-05 19:48:04.188926	f	\N
56	[{"x":0.4161,"y":0.9156},{"x":0.4449,"y":0.682},{"x":0.5107,"y":0.3202},{"x":0.5781,"y":0.0658},{"x":0.5995,"y":0.0066}]	211	2020-04-18 20:36:57.358564	2020-07-05 19:48:04.244806	f	\N
27	[{"x":0.176,"y":0.739},{"x":0.1801,"y":0.4605},{"x":0.19,"y":0.318},{"x":0.2525,"y":0.0691}]	216	2020-04-18 20:36:56.219626	2020-07-05 19:48:04.255106	f	\N
6	[{"x":0.4178,"y":0.9134},{"x":0.3906,"y":0.7149},{"x":0.3577,"y":0.5219},{"x":0.3923,"y":0.3443}]	176	2020-04-18 20:36:55.470758	2020-04-21 13:38:05.098216	f	\N
457	[{"x":0.5313,"y":0.8117},{"x":0.5212,"y":0.3883},{"x":0.5238,"y":0.18}]	38	2020-09-03 20:45:15.514203	2020-10-22 08:21:43.134948	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.081233024563234627","GPSTimeStamp":"2020-09-01T13:02:46Z","GPSImgDirection":"225.5456847800001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6624783299999999","GPSLatitude":"48.463254999999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.099999999999994","GPSHPositioningError":"7.0482875004794234","DateCreated":"2020-09-01T15:02:45+02:00"}}}}
319	[{"x":0.5537,"y":0.8767},{"x":0.5125,"y":0.4633},{"x":0.5375,"y":0.185},{"x":0.5387,"y":0.105}]	32	2020-09-03 20:43:16.399836	2020-10-22 16:01:38.239353	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.011819472535612744","GPSTimeStamp":"2020-09-01T13:17:58Z","GPSImgDirection":"168.12536614000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630283300000004","GPSLatitude":"48.462486669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.799999999999997","GPSHPositioningError":"4.5180760833053411","DateCreated":"2020-09-01T15:17:58+02:00"}}}}
382	[{"x":0.6512,"y":0.9},{"x":0.64,"y":0.515},{"x":0.6038,"y":0.2217},{"x":0.5525,"y":0.125}]	203	2020-09-03 20:43:25.5381	2020-10-22 16:17:02.890656	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0060664257006283846","GPSTimeStamp":"2020-09-01T14:01:44Z","GPSImgDirection":"359.49194312999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621699999999997","GPSLatitude":"48.462820000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.599999999999994","GPSHPositioningError":"4.7787745294353225","DateCreated":"2020-09-01T16:01:43+02:00"}}}}
367	[{"x":0.4675,"y":0.855},{"x":0.4562,"y":0.4117},{"x":0.45,"y":0.08}]	98	2020-09-03 20:43:23.511853	2020-10-22 16:56:04.3342	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.064254559638774952","GPSTimeStamp":"2020-09-01T15:30:13Z","GPSImgDirection":"167.03183736","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637033299999997","GPSLatitude":"48.461599999999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.099999999999994","GPSHPositioningError":"12.107642659881465","DateCreated":"2020-09-01T17:30:13+02:00"}}}}
357	[{"x":0.4612,"y":0.865},{"x":0.4437,"y":0.37},{"x":0.43,"y":0.14}]	93	2020-09-03 20:43:22.085541	2020-10-22 16:23:49.087303	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.040701046591008247","GPSTimeStamp":"2020-09-01T14:21:53Z","GPSImgDirection":"203.73458103000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.461871670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.400000000000006","GPSHPositioningError":"9.1684611933602511","DateCreated":"2020-09-01T16:21:53+02:00"}}}}
407	[{"x":0.5225,"y":0.7783},{"x":0.535,"y":0.6083},{"x":0.585,"y":0.39},{"x":0.615,"y":0.2417}]	134	2020-09-03 20:43:29.191382	2020-10-22 08:19:35.543234	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.013611908072682895","GPSTimeStamp":"2020-09-01T12:50:46Z","GPSImgDirection":"0.55075072999999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632299999999995","GPSLatitude":"48.463203329999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.700000000000003","GPSHPositioningError":"8.1844470827679778","DateCreated":"2020-09-01T14:50:45+02:00"}}}}
350	[{"x":0.5125,"y":0.8183},{"x":0.5012,"y":0.55},{"x":0.5437,"y":0.2883},{"x":0.5563,"y":0.1233}]	78	2020-09-03 20:43:21.193527	2020-10-22 17:15:16.004178	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0051283696704260461","GPSTimeStamp":"2020-09-01T16:14:25Z","GPSImgDirection":"21.453704850000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635283300000006","GPSLatitude":"48.462396669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.799999999999997","GPSHPositioningError":"8.5835013748854259","DateCreated":"2020-09-01T18:14:25+02:00"}}}}
396	[{"x":0.5012,"y":0.82},{"x":0.4913,"y":0.43},{"x":0.505,"y":0.21}]	9	2020-09-03 20:43:27.823918	2020-10-22 16:44:22.273674	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.47145718333251924","GPSTimeStamp":"2020-09-01T14:55:10Z","GPSImgDirection":"132.78739165000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66310833","GPSLatitude":"48.461291670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.5","GPSHPositioningError":"16.282317006654303","DateCreated":"2020-09-01T16:55:10+02:00"}}}}
172	[{"x":0.5765,"y":0.9671},{"x":0.5518,"y":0.5614},{"x":0.5411,"y":0.3662},{"x":0.5115,"y":0.1173}]	155	2020-04-18 20:37:02.015801	2020-07-05 19:48:04.192297	f	\N
29	[{"x":0.5995,"y":0.9759},{"x":0.6012,"y":0.6272},{"x":0.6127,"y":0.477},{"x":0.5913,"y":0.3235},{"x":0.5313,"y":0.1798},{"x":0.5148,"y":0.0713}]	160	2020-04-18 20:36:56.293222	2020-07-05 19:48:04.203956	f	\N
185	[{"x":0.4827,"y":0.9145},{"x":0.4803,"y":0.5987},{"x":0.472,"y":0.398},{"x":0.4926,"y":0.2292},{"x":0.4712,"y":0.0932}]	151	2020-04-18 20:37:02.527586	2020-07-05 19:48:04.220702	f	\N
30	[{"x":0.4688,"y":0.852},{"x":0.449,"y":0.6042},{"x":0.4276,"y":0.4627},{"x":0.4482,"y":0.307},{"x":0.4877,"y":0.1974}]	174	2020-04-18 20:36:56.329741	2020-07-05 19:48:04.229037	f	\N
14	[{"x":0.5132,"y":0.8002},{"x":0.5164,"y":0.5173},{"x":0.511,"y":0.3676},{"x":0.5318,"y":0.2492},{"x":0.5603,"y":0.1678}]	177	2020-04-18 20:36:55.767721	2020-07-05 19:48:04.233744	f	\N
39	[{"x":0.3273,"y":0.8618},{"x":0.3495,"y":0.5987},{"x":0.3808,"y":0.4539},{"x":0.4161,"y":0.3443},{"x":0.4465,"y":0.1842}]	164	2020-04-18 20:36:56.676968	2020-07-05 19:48:04.235546	f	\N
38	[{"x":0.5502,"y":0.9594},{"x":0.5789,"y":0.6469},{"x":0.6094,"y":0.4693},{"x":0.5099,"y":0.1458}]	170	2020-04-18 20:36:56.636095	2020-07-05 19:48:04.240379	f	\N
42	[{"x":0.7344,"y":0.9145},{"x":0.6801,"y":0.6173},{"x":0.6398,"y":0.3893},{"x":0.5773,"y":0.1721}]	212	2020-04-18 20:36:56.812715	2020-07-05 19:48:04.241943	f	\N
148	[{"x":0.5699,"y":0.9452},{"x":0.5592,"y":0.5154},{"x":0.514,"y":0.33},{"x":0.4696,"y":0.1371},{"x":0.4786,"y":0.1294}]	208	2020-04-18 20:37:01.06601	2020-07-05 19:48:04.251173	f	\N
26	[{"x":0.3692,"y":0.7664},{"x":0.3495,"y":0.5395},{"x":0.315,"y":0.2851},{"x":0.3092,"y":0.1612},{"x":0.3224,"y":0.0998}]	217	2020-04-18 20:36:56.179514	2020-07-05 19:48:04.253773	f	\N
12	[{"x":0.5214,"y":0.8575},{"x":0.5016,"y":0.523},{"x":0.4984,"y":0.42},{"x":0.4934,"y":0.2752},{"x":0.514,"y":0.1765}]	215	2020-04-18 20:36:55.708032	2020-07-05 19:48:04.256694	f	\N
9	[{"x":0.2048,"y":0.9364},{"x":0.2122,"y":0.557},{"x":0.1719,"y":0.3849},{"x":0.1102,"y":0.2237},{"x":0.1209,"y":0.1173},{"x":0.1176,"y":0.0691},{"x":0.0921,"y":0.0307}]	214	2020-04-18 20:36:55.602905	2020-07-05 19:48:04.25843	f	\N
141	[{"x":0.5748,"y":0.9145},{"x":0.5485,"y":0.4726},{"x":0.5617,"y":0.2719},{"x":0.5304,"y":0.0548}]	143	2020-04-18 20:37:00.793299	2020-04-21 14:18:18.074817	f	\N
437	[{"x":0.5375,"y":0.8433},{"x":0.5337,"y":0.5133},{"x":0.5513,"y":0.2217},{"x":0.5587,"y":0.1083}]	188	2020-09-03 20:43:33.740351	2020-10-22 17:21:07.425274	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.075148299400840612","GPSTimeStamp":"2020-09-01T16:20:50Z","GPSImgDirection":"122.81607439000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.663675","GPSLatitude":"48.462478329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.900000000000006","GPSHPositioningError":"11.955097742736797","DateCreated":"2020-09-01T18:20:50+02:00"}}}}
421	[{"x":0.4825,"y":0.8017},{"x":0.4738,"y":0.485},{"x":0.49,"y":0.1683}]	67	2020-09-03 20:43:31.40184	2020-10-22 16:25:44.645413	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.32741749290638589","GPSTimeStamp":"2020-09-01T14:26:24Z","GPSImgDirection":"169.87709030000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635","GPSLatitude":"48.461741670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.700000000000003","GPSHPositioningError":"4.5322950068712782","DateCreated":"2020-09-01T16:26:23+02:00"}}}}
418	[{"x":0.4925,"y":0.6717},{"x":0.4988,"y":0.6133},{"x":0.5188,"y":0.5167},{"x":0.5463,"y":0.46},{"x":0.54,"y":0.3883},{"x":0.53,"y":0.225},{"x":0.5175,"y":0.1367}]	230	2020-09-03 20:43:30.803272	2020-10-22 16:10:27.786866	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12398778645701009","GPSTimeStamp":"2020-09-01T13:59:21Z","GPSImgDirection":"25.823577910000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621633299999994","GPSLatitude":"48.462761669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.700000000000003","GPSHPositioningError":"4.3725029560022399","DateCreated":"2020-09-01T15:59:20+02:00"}}}}
362	[{"x":0.4,"y":0.8217},{"x":0.41,"y":0.495},{"x":0.45,"y":0.2333},{"x":0.4662,"y":0.1367}]	65	2020-09-03 20:43:22.818346	2020-10-22 16:37:16.698758	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0030703884553975732","GPSTimeStamp":"2020-09-01T14:40:09Z","GPSImgDirection":"249.41641233999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632216699999995","GPSLatitude":"48.461546670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"10.639886420577918","DateCreated":"2020-09-01T16:40:09+02:00"}}}}
461	[{"x":0.415,"y":0.83},{"x":0.4375,"y":0.52},{"x":0.43,"y":0.1667}]	140	2020-09-03 20:47:10.675226	2020-10-22 08:09:05.188672	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.089978896077440806","GPSTimeStamp":"2020-09-01T11:26:59Z","GPSImgDirection":"298.95533769000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632366699999999","GPSLatitude":"48.462928329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.700000000000003","GPSHPositioningError":"4.3346900438321851","DateCreated":"2020-09-01T13:26:59+02:00"}}}}
426	[{"x":0.415,"y":0.8017},{"x":0.4425,"y":0.555},{"x":0.4637,"y":0.1633}]	59	2020-09-03 20:43:32.149391	2020-10-22 16:46:31.96468	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.052131209523100755","GPSTimeStamp":"2020-09-01T15:00:19Z","GPSImgDirection":"95.828354430000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633416700000003","GPSLatitude":"48.460913329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"102.2","GPSHPositioningError":"10.163006436955699","DateCreated":"2020-09-01T17:00:19+02:00"}}}}
414	[{"x":0.2475,"y":0.7783},{"x":0.3088,"y":0.4483},{"x":0.4188,"y":0.1967}]	135	2020-09-03 20:43:30.083597	2020-10-22 08:20:01.955218	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.03877437116285487","GPSTimeStamp":"2020-09-01T12:51:38Z","GPSImgDirection":"355.27539062000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.663195","GPSLatitude":"48.463203329999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.400000000000006","GPSHPositioningError":"5.4944794081925581","DateCreated":"2020-09-01T14:51:37+02:00"}}}}
71	[{"x":0.4309,"y":0.8893},{"x":0.4178,"y":0.5011},{"x":0.4112,"y":0.2654},{"x":0.4317,"y":0.068}]	129	2020-04-18 20:36:57.994555	2020-07-05 19:48:04.190697	f	\N
92	[{"x":0.591,"y":0.8783},{"x":0.5691,"y":0.5584},{"x":0.5592,"y":0.3799},{"x":0.534,"y":0.1209}]	139	2020-04-18 20:36:58.84357	2020-07-05 19:48:04.224448	f	\N
55	[{"x":0.19,"y":0.7489},{"x":0.1982,"y":0.5746},{"x":0.2023,"y":0.4232},{"x":0.2007,"y":0.2906},{"x":0.2155,"y":0.2193}]	173	2020-04-18 20:36:57.324444	2020-07-05 19:48:04.22753	f	\N
46	[{"x":0.6316,"y":0.8739},{"x":0.5888,"y":0.5768},{"x":0.5502,"y":0.4474},{"x":0.5502,"y":0.2895},{"x":0.5419,"y":0.0976}]	165	2020-04-18 20:36:56.963857	2020-07-05 19:48:04.237147	f	\N
61	[{"x":0.7196,"y":0.9485},{"x":0.7007,"y":0.58},{"x":0.6785,"y":0.2774},{"x":0.662,"y":0.1217}]	210	2020-04-18 20:36:57.55429	2020-07-05 19:48:04.252467	f	\N
47	[{"x":0.3158,"y":0.7807},{"x":0.3026,"y":0.4178},{"x":0.287,"y":0.2807},{"x":0.2993,"y":0.2083},{"x":0.3174,"y":0.1513}]	171	2020-04-18 20:36:57.006742	2020-04-21 13:46:56.983921	f	\N
268	[{"x":0.5288,"y":0.8833},{"x":0.5012,"y":0.3583},{"x":0.5138,"y":0.0667}]	119	2020-09-03 20:43:09.212717	2020-10-22 16:51:38.539376	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.039257347598406461","GPSTimeStamp":"2020-09-01T15:16:34Z","GPSImgDirection":"101.69729515000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635916700000002","GPSLatitude":"48.46125","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97","GPSHPositioningError":"15.882587631803933","DateCreated":"2020-09-01T17:16:33+02:00"}}}}
351	[{"x":0.4662,"y":0.8433},{"x":0.4487,"y":0.425},{"x":0.4525,"y":0.165}]	117	2020-09-03 20:43:21.278169	2020-10-22 16:54:41.194387	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10725206132304253","GPSTimeStamp":"2020-09-01T15:26:56Z","GPSImgDirection":"279.62318419999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637949999999999","GPSLatitude":"48.461288329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.299999999999997","GPSHPositioningError":"8.8690248855748539","DateCreated":"2020-09-01T17:26:55+02:00"}}}}
388	[{"x":0.5212,"y":0.79},{"x":0.5238,"y":0.3683},{"x":0.5025,"y":0.1983}]	95	2020-09-03 20:43:26.400934	2020-10-22 16:59:28.990029	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.98122650375939857","GPSTimeStamp":"2020-09-01T15:38:13Z","GPSImgDirection":"39.285827600000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635533300000001","GPSLatitude":"48.461761670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.299999999999997","GPSHPositioningError":"4.4926495810261189","DateCreated":"2020-09-01T17:38:12+02:00"}}}}
344	[{"x":0.5637,"y":0.8433},{"x":0.5513,"y":0.46},{"x":0.5225,"y":0.2367},{"x":0.5075,"y":0.15}]	164	2020-09-03 20:43:20.31303	2020-10-22 17:14:04.996761	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.070793956540058989","GPSTimeStamp":"2020-09-01T16:11:08Z","GPSImgDirection":"163.96342477000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636116700000003","GPSLatitude":"48.462336669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.700000000000003","GPSHPositioningError":"12.089865158764681","DateCreated":"2020-09-01T18:11:08+02:00"}}}}
398	[{"x":0.5012,"y":0.8467},{"x":0.4838,"y":0.515},{"x":0.4725,"y":0.285},{"x":0.4487,"y":0.1283}]	187	2020-09-03 20:43:28.045965	2020-10-22 17:16:31.441823	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.071196593343544876","GPSTimeStamp":"2020-09-01T16:18:36Z","GPSImgDirection":"22.909759509999994","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637216700000002","GPSLatitude":"48.462411670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.700000000000003","GPSHPositioningError":"5.227365200266914","DateCreated":"2020-09-01T18:18:35+02:00"}}}}
470	[{"x":0.5763,"y":0.9033},{"x":0.5825,"y":0.68},{"x":0.5375,"y":0.555},{"x":0.4213,"y":0.4983},{"x":0.355,"y":0.4417}]	57	2020-09-03 20:47:13.1449	2020-10-22 16:47:07.875852	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.025365725159983473","GPSTimeStamp":"2020-09-01T15:02:29Z","GPSImgDirection":"67.761962889999992","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638449999999998","GPSLatitude":"48.460819999999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"100.5","GPSHPositioningError":"6.7606173810460088","DateCreated":"2020-09-01T17:02:29+02:00"}}}}
338	[{"x":0.695,"y":0.76},{"x":0.7125,"y":0.5367},{"x":0.7538,"y":0.3833},{"x":0.7562,"y":0.275},{"x":0.7375,"y":0.2233}]	183	2020-09-03 20:43:19.370627	2020-09-03 22:16:09.183772	t	\N
166	[{"x":0.3109,"y":0.9452},{"x":0.3224,"y":0.5735},{"x":0.315,"y":0.4024},{"x":0.3454,"y":0.2204},{"x":0.3717,"y":0.0658},{"x":0.3783,"y":0.0296}]	140	2020-04-18 20:37:01.758745	2020-07-05 19:48:04.209448	f	\N
171	[{"x":0.5658,"y":0.9748},{"x":0.5592,"y":0.6184},{"x":0.5674,"y":0.466},{"x":0.5609,"y":0.2566},{"x":0.5362,"y":0.1349},{"x":0.5197,"y":0.0307}]	141	2020-04-18 20:37:01.957603	2020-07-05 19:48:04.211608	f	\N
142	[{"x":0.4408,"y":0.9287},{"x":0.4104,"y":0.5658},{"x":0.3717,"y":0.3542},{"x":0.3808,"y":0.0746}]	157	2020-04-18 20:37:00.833463	2020-07-05 19:48:04.214745	f	\N
150	[{"x":0.3487,"y":0.9334},{"x":0.3618,"y":0.6299},{"x":0.4923,"y":0.5526},{"x":0.4989,"y":0.384},{"x":0.4912,"y":0.1998},{"x":0.4112,"y":0.1168}]	142	2020-04-18 20:37:01.136938	2020-07-05 19:48:04.226055	f	\N
44	[{"x":0.2673,"y":0.8827},{"x":0.2788,"y":0.5384},{"x":0.389,"y":0.1184},{"x":0.4202,"y":0.0691}]	207	2020-04-18 20:36:56.891662	2020-07-05 19:48:04.249711	f	\N
23	[{"x":0.2622,"y":0.7071},{"x":0.2252,"y":0.4478},{"x":0.2477,"y":0.2989},{"x":0.2667,"y":0.1765}]	175	2020-04-18 20:36:56.077299	2020-07-05 19:48:04.259785	f	\N
127	[{"x":0.5814,"y":0.9496},{"x":0.5773,"y":0.6886},{"x":0.5921,"y":0.398},{"x":0.6283,"y":0.1107}]	119	2020-04-18 20:37:00.277291	2020-04-21 14:16:00.190411	f	\N
133	[{"x":0.3454,"y":0.773},{"x":0.3183,"y":0.568},{"x":0.2919,"y":0.4364},{"x":0.3117,"y":0.2906},{"x":0.3561,"y":0.1952}]	19	2020-04-18 20:37:00.508484	2020-04-21 14:17:01.895109	f	\N
424	[{"x":0.5363,"y":0.8567},{"x":0.5062,"y":0.5417},{"x":0.5513,"y":0.2167}]	13	2020-09-03 20:43:31.788177	2020-10-22 16:40:51.721532	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.47936356023447785","GPSTimeStamp":"2020-09-01T14:45:45Z","GPSImgDirection":"166.09360518999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628216700000005","GPSLatitude":"48.461466670000007","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"5.0614008717871632","DateCreated":"2020-09-01T16:45:45+02:00"}}}}
365	[{"x":0.595,"y":0.83},{"x":0.5825,"y":0.56},{"x":0.545,"y":0.365},{"x":0.47,"y":0.235},{"x":0.4512,"y":0.21}]	170	2020-09-03 20:43:23.236699	2020-10-22 17:20:45.345724	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.089205585404735194","GPSTimeStamp":"2020-09-01T16:20:19Z","GPSImgDirection":"185.87664042","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637383300000002","GPSLatitude":"48.462483329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.700000000000003","GPSHPositioningError":"6.8641019626241304","DateCreated":"2020-09-01T18:20:18+02:00"}}}}
301	[{"x":0.54,"y":0.8567},{"x":0.5225,"y":0.4867},{"x":0.52,"y":0.2633},{"x":0.5012,"y":0.1733}]	151	2020-09-03 20:43:13.81249	2020-10-22 17:27:23.020188	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.4483537677366029","GPSTimeStamp":"2020-09-01T16:29:12Z","GPSImgDirection":"267.02354437999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634199999999999","GPSLatitude":"48.462638329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"4.5039608003266638","DateCreated":"2020-09-01T18:29:11+02:00"}}}}
346	[{"x":0.4487,"y":0.7717},{"x":0.4813,"y":0.5317},{"x":0.5088,"y":0.3217},{"x":0.5288,"y":0.195}]	83	2020-09-03 20:43:20.568496	2020-10-22 17:31:24.221237	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.21388991171742394","GPSTimeStamp":"2020-09-01T16:50:22Z","GPSImgDirection":"318.30641184000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641549999999996","GPSLatitude":"48.462566670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.5","GPSHPositioningError":"4.2141081955843251","DateCreated":"2020-09-01T18:50:22+02:00"}}}}
494	[{"x":0.3787,"y":0.8467},{"x":0.3588,"y":0.4217},{"x":0.405,"y":0.1433}]	490	2020-10-19 21:46:13.361869	2020-10-19 21:46:35.436222	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.02714896761450029","GPSTimeStamp":"2020-10-18T14:53:19Z","GPSImgDirection":"331.02767920999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379866700000001","GPSLatitude":"48.447361669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.900000000000006","GPSHPositioningError":"16.497946963216425","DateCreated":"2020-10-18T16:53:19+02:00"}}}}
489	[{"x":0.5038,"y":0.7383},{"x":0.5112,"y":0.4967},{"x":0.56,"y":0.2267}]	445	2020-10-19 21:41:02.623598	2020-10-19 21:41:32.158154	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.043835189227862267","GPSTimeStamp":"2020-10-18T14:44:27Z","GPSImgDirection":"29.816284179999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379450000000002","GPSLatitude":"48.447483329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.099999999999994","GPSHPositioningError":"11.715366573352501","DateCreated":"2020-10-18T16:44:27+02:00"}}}}
485	[{"x":0.25,"y":0.685},{"x":0.2725,"y":0.3567},{"x":0.265,"y":0.185}]	416	2020-10-19 19:41:22.707557	2020-10-19 20:17:19.774829	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0086412159714206269","GPSTimeStamp":"2020-10-18T14:31:35Z","GPSImgDirection":"116.50459290000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6380299999999997","GPSLatitude":"48.447741670000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.799999999999997","GPSHPositioningError":"5.9820785597381345","DateCreated":"2020-10-18T16:31:34+02:00"}}}}
487	[{"x":0.48,"y":0.8533},{"x":0.4813,"y":0.375},{"x":0.48,"y":0.0867}]	446	2020-10-19 21:39:07.392707	2020-10-19 21:39:30.451457	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.31236854193361224","GPSTimeStamp":"2020-10-18T14:40:17Z","GPSImgDirection":"94.198529719999982","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6378699999999999","GPSLatitude":"48.447525000000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.900000000000006","GPSHPositioningError":"16.189856065798491","DateCreated":"2020-10-18T16:40:17+02:00"}}}}
493	[{"x":0.4363,"y":0.835},{"x":0.4225,"y":0.5217},{"x":0.4238,"y":0.2483}]	440	2020-10-19 21:45:00.842042	2020-10-19 21:45:18.28731	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.16031032803576961","GPSTimeStamp":"2020-10-18T14:51:22Z","GPSImgDirection":"245.73602305","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379083299999997","GPSLatitude":"48.447266670000012","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.799999999999997","GPSHPositioningError":"11.95904531304047","DateCreated":"2020-10-18T16:51:21+02:00"}}}}
219	[{"x":0.5329,"y":0.9452},{"x":0.5419,"y":0.5779},{"x":0.5543,"y":0.3476},{"x":0.6234,"y":0.08}]	153	2020-04-18 20:37:04.125333	2020-07-05 19:48:04.222687	f	\N
163	[{"x":0.5674,"y":0.8618},{"x":0.5469,"y":0.4879},{"x":0.4926,"y":0.2971},{"x":0.4679,"y":0.1886},{"x":0.4556,"y":0.0757}]	168	2020-04-18 20:37:01.633238	2020-07-05 19:48:04.238635	f	\N
60	[{"x":0.1916,"y":0.7961},{"x":0.1612,"y":0.6173},{"x":0.111,"y":0.5},{"x":0.1283,"y":0.3476},{"x":0.1735,"y":0.2423}]	204	2020-04-18 20:36:57.522941	2020-07-05 19:48:04.248263	f	\N
49	[{"x":0.528,"y":0.8114},{"x":0.5625,"y":0.5844},{"x":0.565,"y":0.4221},{"x":0.5732,"y":0.2456},{"x":0.5872,"y":0.1316},{"x":0.5674,"y":0.0954}]	70	2020-04-18 20:36:57.09079	2020-04-21 13:53:48.459033	f	\N
184	[{"x":0.3865,"y":0.9156},{"x":0.3405,"y":0.5987},{"x":0.3224,"y":0.3893},{"x":0.3503,"y":0.1261},{"x":0.3651,"y":0.0954}]	44	2020-04-18 20:37:02.476536	2020-04-21 14:26:06.387603	f	\N
471	[{"x":0.69,"y":0.7983},{"x":0.67,"y":0.52},{"x":0.6162,"y":0.195}]	49	2020-09-03 20:47:13.592136	2020-10-22 16:49:16.684642	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.14884082972188328","GPSTimeStamp":"2020-09-01T15:11:54Z","GPSImgDirection":"330.57759104000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.663875","GPSLatitude":"48.461028329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"4.3398308278547804","DateCreated":"2020-09-01T17:11:54+02:00"}}}}
298	[{"x":0.615,"y":0.8233},{"x":0.6162,"y":0.6333},{"x":0.57,"y":0.4617},{"x":0.5675,"y":0.22},{"x":0.58,"y":0.1283}]	71	2020-09-03 20:43:13.477945	2020-10-22 17:12:36.332735	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.054584782571077545","GPSTimeStamp":"2020-09-01T16:08:30Z","GPSImgDirection":"73.315856939999989","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635499999999999","GPSLatitude":"48.462313329999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.400000000000006","GPSHPositioningError":"7.2590746739762437","DateCreated":"2020-09-01T18:08:30+02:00"}}}}
129	[{"x":0.5378,"y":0.8717},{"x":0.4836,"y":0.602},{"x":0.4383,"y":0.4287},{"x":0.4539,"y":0.1272}]	130	2020-04-18 20:37:00.356404	2020-07-05 19:48:04.174192	f	\N
75	[{"x":0.8832,"y":0.8925},{"x":0.8569,"y":0.6436},{"x":0.8479,"y":0.4452},{"x":0.7903,"y":0.2862}]	128	2020-04-18 20:36:58.149081	2020-07-05 19:48:04.182182	f	\N
99	[{"x":0.6283,"y":0.9211},{"x":0.6439,"y":0.6491},{"x":0.7229,"y":0.4474},{"x":0.7878,"y":0.1842}]	134	2020-04-18 20:36:59.136377	2020-07-05 19:48:04.186949	f	\N
149	[{"x":0.6028,"y":0.8596},{"x":0.5789,"y":0.5636},{"x":0.5288,"y":0.4836},{"x":0.4778,"y":0.3772},{"x":0.3783,"y":0.3553},{"x":0.3503,"y":0.3202},{"x":0.3569,"y":0.2796}]	156	2020-04-18 20:37:01.10395	2020-07-05 19:48:04.193996	f	\N
198	[{"x":0.6456,"y":0.9101},{"x":0.6488,"y":0.6535},{"x":0.6809,"y":0.4024},{"x":0.6686,"y":0.0625}]	150	2020-04-18 20:37:03.056544	2020-07-05 19:48:04.196126	f	\N
45	[{"x":0.3059,"y":0.9529},{"x":0.3109,"y":0.5866},{"x":0.3512,"y":0.3958},{"x":0.3462,"y":0.0384}]	159	2020-04-18 20:36:56.929777	2020-07-05 19:48:04.199204	f	\N
40	[{"x":0.472,"y":0.9671},{"x":0.4992,"y":0.6305},{"x":0.5485,"y":0.4189},{"x":0.6291,"y":0.2752},{"x":0.6414,"y":0.1754},{"x":0.6209,"y":0.0493}]	158	2020-04-18 20:36:56.726179	2020-07-05 19:48:04.21796	f	\N
143	[{"x":0.4326,"y":0.9254},{"x":0.4309,"y":0.5779},{"x":0.44,"y":0.4989},{"x":0.56,"y":0.4803},{"x":0.6678,"y":0.4518},{"x":0.7212,"y":0.2774},{"x":0.7286,"y":0.17},{"x":0.69,"y":0.0877}]	209	2020-04-18 20:37:00.867425	2020-07-05 19:48:04.24344	f	\N
25	[{"x":0.3037,"y":0.8051},{"x":0.2906,"y":0.5387},{"x":0.2906,"y":0.3306},{"x":0.3454,"y":0.1538}]	203	2020-04-18 20:36:56.142631	2020-07-05 19:48:04.246732	f	\N
486	[{"x":0.555,"y":0.7967},{"x":0.53,"y":0.5167},{"x":0.5,"y":0.305},{"x":0.4412,"y":0.1617}]	450	2020-10-19 21:37:29.335152	2020-10-19 21:37:58.12259	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11804264036009811","GPSTimeStamp":"2020-10-18T14:36:53Z","GPSImgDirection":"86.80545042","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6380616699999999","GPSLatitude":"48.447600000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.599999999999994","GPSHPositioningError":"10.659548505186089","DateCreated":"2020-10-18T16:36:52+02:00"}}}}
492	[{"x":0.6325,"y":0.84},{"x":0.6225,"y":0.4967},{"x":0.605,"y":0.2083},{"x":0.5913,"y":0.15}]	489	2020-10-19 21:43:59.537526	2020-10-19 21:44:27.594295	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.18672539303847802","GPSTimeStamp":"2020-10-18T14:49:18Z","GPSImgDirection":"358.06005859000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379366700000002","GPSLatitude":"48.447308329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.700000000000003","GPSHPositioningError":"16.124053904375117","DateCreated":"2020-10-18T16:49:18+02:00"}}}}
488	[{"x":0.4988,"y":0.8433},{"x":0.5125,"y":0.445},{"x":0.5012,"y":0.16}]	449	2020-10-19 21:39:56.050058	2020-10-19 21:40:21.010965	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.066725932123620768","GPSTimeStamp":"2020-10-18T14:42:59Z","GPSImgDirection":"230.19692982000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6380333299999998","GPSLatitude":"48.447558329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.200000000000003","GPSHPositioningError":"7.6956644621558983","DateCreated":"2020-10-18T16:42:59+02:00"}}}}
490	[{"x":0.4825,"y":0.8417},{"x":0.47,"y":0.4967},{"x":0.4675,"y":0.2483}]	444	2020-10-19 21:41:48.18356	2020-10-19 21:42:06.028916	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.21622145167851542","GPSTimeStamp":"2020-10-18T14:46:31Z","GPSImgDirection":"357.22320550999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6381133299999999","GPSLatitude":"48.447436670000009","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.900000000000006","GPSHPositioningError":"34.771779141104297","DateCreated":"2020-10-18T16:46:30+02:00"}}}}
491	[{"x":0.3325,"y":0.855},{"x":0.4025,"y":0.515},{"x":0.42,"y":0.325}]	399	2020-10-19 21:43:14.095418	2020-10-19 21:43:41.863546	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.18672539303847802","GPSTimeStamp":"2020-10-18T14:49:18Z","GPSImgDirection":"358.06005859000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379366700000002","GPSLatitude":"48.447308329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.700000000000003","GPSHPositioningError":"16.124053904375117","DateCreated":"2020-10-18T16:49:18+02:00"}}}}
331	[{"x":0.1113,"y":0.4767},{"x":0.2525,"y":0.46},{"x":0.45,"y":0.5},{"x":0.5975,"y":0.5183},{"x":0.69,"y":0.4717},{"x":0.7113,"y":0.4183}]	46	2020-09-03 20:43:18.189322	2020-10-22 08:15:44.185803	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012963270768567561","GPSTimeStamp":"2020-09-01T11:47:40Z","GPSImgDirection":"171.12978369000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630500000000001","GPSLatitude":"48.463058329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.200000000000003","GPSHPositioningError":"4.1810475708502022","DateCreated":"2020-09-01T13:47:40+02:00"}}}}
4	[{"x":0.375,"y":0.9539},{"x":0.3808,"y":0.6776},{"x":0.4112,"y":0.42},{"x":0.3618,"y":0.1195}]	77	2020-04-18 20:36:55.36101	2020-04-21 13:35:44.876981	f	\N
10	[{"x":0.7785,"y":0.9178},{"x":0.7599,"y":0.5789},{"x":0.8213,"y":0.4309},{"x":0.8575,"y":0.259}]	200	2020-04-18 20:36:55.630165	2020-04-21 13:39:37.301329	f	\N
11	[{"x":0.3882,"y":0.9561},{"x":0.3906,"y":0.5614},{"x":0.4013,"y":0.3805},{"x":0.3931,"y":0.0724}]	201	2020-04-18 20:36:55.670284	2020-04-21 13:39:47.1239	f	\N
13	[{"x":0.6291,"y":0.9375},{"x":0.6735,"y":0.7632},{"x":0.7656,"y":0.6217},{"x":0.7845,"y":0.455},{"x":0.7837,"y":0.33},{"x":0.75,"y":0.3037}]	229	2020-04-18 20:36:55.734295	2020-04-21 13:40:19.956168	f	\N
16	[{"x":0.3339,"y":0.8542},{"x":0.3224,"y":0.6261},{"x":0.3026,"y":0.432},{"x":0.3051,"y":0.2083},{"x":0.3331,"y":0.0395}]	163	2020-04-18 20:36:55.834834	2020-04-21 13:41:03.797073	f	\N
19	[{"x":0.4572,"y":0.7807},{"x":0.4589,"y":0.4583},{"x":0.4285,"y":0.318},{"x":0.4202,"y":0.102}]	74	2020-04-18 20:36:55.933529	2020-04-21 13:41:50.114825	f	\N
24	[{"x":0.5351,"y":0.7813},{"x":0.5318,"y":0.5164},{"x":0.5143,"y":0.3405},{"x":0.5428,"y":0.1924},{"x":0.6294,"y":0.1209}]	161	2020-04-18 20:36:56.114268	2020-04-21 13:42:55.93633	f	\N
28	[{"x":0.375,"y":0.9474},{"x":0.3618,"y":0.7007},{"x":0.3396,"y":0.4287},{"x":0.3725,"y":0.1524}]	202	2020-04-18 20:36:56.250382	2020-04-21 13:43:49.882216	f	\N
33	[{"x":0.7122,"y":0.8235},{"x":0.7105,"y":0.5888},{"x":0.7418,"y":0.0779}]	61	2020-04-18 20:36:56.437838	2020-04-21 13:44:36.373651	f	\N
35	[{"x":0.2196,"y":0.8684},{"x":0.2097,"y":0.5998},{"x":0.2196,"y":0.4057},{"x":0.2311,"y":0.193}]	59	2020-04-18 20:36:56.514756	2020-04-21 13:44:56.257547	f	\N
37	[{"x":0.347,"y":0.92},{"x":0.3594,"y":0.648},{"x":0.4194,"y":0.1985},{"x":0.4688,"y":0.0307}]	65	2020-04-18 20:36:56.59497	2020-04-21 13:45:15.734954	f	\N
43	[{"x":0.3479,"y":0.9386},{"x":0.3405,"y":0.6491},{"x":0.3709,"y":0.3794},{"x":0.3166,"y":0.0493}]	213	2020-04-18 20:36:56.842231	2020-04-21 13:46:20.678616	f	\N
48	[{"x":0.4605,"y":0.8503},{"x":0.4693,"y":0.5403},{"x":0.5,"y":0.3734},{"x":0.6075,"y":0.1505}]	64	2020-04-18 20:36:57.044109	2020-04-21 13:47:17.608002	f	\N
51	[{"x":0.2385,"y":0.8904},{"x":0.2525,"y":0.614},{"x":0.2961,"y":0.3333},{"x":0.3594,"y":0.2204},{"x":0.4046,"y":0.0647}]	198	2020-04-18 20:36:57.165773	2020-04-21 13:54:23.394209	f	\N
53	[{"x":0.6423,"y":0.9627},{"x":0.653,"y":0.636},{"x":0.6752,"y":0.3498},{"x":0.6785,"y":0.0691}]	72	2020-04-18 20:36:57.24196	2020-04-21 13:54:42.252805	f	\N
58	[{"x":0.7459,"y":0.8476},{"x":0.7418,"y":0.534},{"x":0.7171,"y":0.4134},{"x":0.7459,"y":0.2763},{"x":0.7155,"y":0.2029}]	239	2020-04-18 20:36:57.438395	2020-04-21 13:57:10.082725	f	\N
64	[{"x":0.287,"y":0.8454},{"x":0.2969,"y":0.5614},{"x":0.3051,"y":0.3739},{"x":0.3742,"y":0.1239}]	98	2020-04-18 20:36:57.702249	2020-04-21 13:58:09.335409	f	\N
65	[{"x":0.403,"y":0.92},{"x":0.4095,"y":0.6908},{"x":0.4013,"y":0.1086},{"x":0.4063,"y":0.0581}]	73	2020-04-18 20:36:57.737684	2020-04-21 13:58:16.883117	f	\N
67	[{"x":0.4942,"y":0.9035},{"x":0.491,"y":0.6382},{"x":0.4893,"y":0.4079},{"x":0.5107,"y":0.1754}]	67	2020-04-18 20:36:57.823657	2020-04-21 13:58:30.694166	f	\N
70	[{"x":0.6554,"y":0.8136},{"x":0.6316,"y":0.4923},{"x":0.6135,"y":0.284},{"x":0.5905,"y":0.1042}]	28	2020-04-18 20:36:57.949455	2020-04-21 13:59:07.983045	f	\N
72	[{"x":0.6809,"y":0.8462},{"x":0.6305,"y":0.5641},{"x":0.6053,"y":0.3914},{"x":0.5735,"y":0.2253}]	115	2020-04-18 20:36:58.032896	2020-04-21 13:59:21.053191	f	\N
78	[{"x":0.5345,"y":0.9518},{"x":0.5058,"y":0.568},{"x":0.4589,"y":0.2796},{"x":0.4498,"y":0.0154}]	116	2020-04-18 20:36:58.267143	2020-04-21 14:07:20.936282	f	\N
81	[{"x":0.1897,"y":0.8865},{"x":0.2193,"y":0.5765},{"x":0.2719,"y":0.4063},{"x":0.3531,"y":0.2023}]	117	2020-04-18 20:36:58.382356	2020-04-21 14:07:44.578106	f	\N
86	[{"x":0.426,"y":0.9682},{"x":0.4054,"y":0.6458},{"x":0.4786,"y":0.4221},{"x":0.5329,"y":0.2357},{"x":0.5584,"y":0.0592}]	112	2020-04-18 20:36:58.589598	2020-04-21 14:08:26.92738	f	\N
90	[{"x":0.4811,"y":0.8805},{"x":0.491,"y":0.6305},{"x":0.5493,"y":0.2675}]	110	2020-04-18 20:36:58.761552	2020-04-21 14:09:04.451284	f	\N
93	[{"x":0.0748,"y":0.9178},{"x":0.0863,"y":0.7237},{"x":0.1299,"y":0.5493},{"x":0.2122,"y":0.2719},{"x":0.2113,"y":0.182}]	111	2020-04-18 20:36:58.889003	2020-04-21 14:09:24.585363	f	\N
96	[{"x":0.6785,"y":0.8871},{"x":0.6949,"y":0.6239},{"x":0.662,"y":0.4452},{"x":0.6094,"y":0.3366},{"x":0.5543,"y":0.1316}]	21	2020-04-18 20:36:59.010758	2020-04-21 14:10:09.307452	f	\N
102	[{"x":0.0702,"y":0.6867},{"x":0.1151,"y":0.5156},{"x":0.159,"y":0.4202},{"x":0.2478,"y":0.2673},{"x":0.2763,"y":0.2549}]	135	2020-04-18 20:36:59.257692	2020-04-21 14:11:02.064592	f	\N
103	[{"x":0.5471,"y":0.8544},{"x":0.5296,"y":0.6176},{"x":0.5011,"y":0.4753},{"x":0.5493,"y":0.148}]	121	2020-04-18 20:36:59.295566	2020-04-21 14:11:07.912406	f	\N
106	[{"x":0.3799,"y":0.8827},{"x":0.3956,"y":0.534},{"x":0.3873,"y":0.3048},{"x":0.4137,"y":0.1765}]	36	2020-04-18 20:36:59.424191	2020-04-21 14:11:28.731251	f	\N
109	[{"x":0.4235,"y":0.8454},{"x":0.4416,"y":0.5022},{"x":0.4408,"y":0.2697},{"x":0.4745,"y":0.0526}]	123	2020-04-18 20:36:59.583821	2020-04-21 14:12:05.382211	f	\N
111	[{"x":0.4046,"y":0.8076},{"x":0.2522,"y":0.4293},{"x":0.2599,"y":0.273},{"x":0.3257,"y":0.1661}]	240	2020-04-18 20:36:59.668278	2020-04-21 14:13:50.688338	f	\N
119	[{"x":0.2952,"y":0.9507},{"x":0.2722,"y":0.7259},{"x":0.4211,"y":0.5066},{"x":0.4186,"y":0.2895},{"x":0.3964,"y":0.1941},{"x":0.3339,"y":0.0241}]	245	2020-04-18 20:36:59.981833	2020-04-21 14:15:00.359853	f	\N
122	[{"x":0.8174,"y":0.8925},{"x":0.8092,"y":0.648},{"x":0.7278,"y":0.545},{"x":0.7015,"y":0.3816},{"x":0.6891,"y":0.1886},{"x":0.6801,"y":0.1086}]	32	2020-04-18 20:37:00.094688	2020-04-21 14:15:26.89932	f	\N
312	[{"x":0.075,"y":0.6583},{"x":0.2787,"y":0.4517},{"x":0.4387,"y":0.4367},{"x":0.5763,"y":0.4283},{"x":0.6512,"y":0.3283},{"x":0.6675,"y":0.25}]	1	2020-09-03 20:43:15.376475	2020-10-22 08:22:03.247392	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.026575228223800804","GPSTimeStamp":"2020-09-01T13:04:56Z","GPSImgDirection":"119.56403923000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6625749999999999","GPSLatitude":"48.463078329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91","GPSHPositioningError":"4.4266040809993017","DateCreated":"2020-09-01T15:04:56+02:00"}}}}
124	[{"x":0.5345,"y":0.9079},{"x":0.5419,"y":0.602},{"x":0.5724,"y":0.4507},{"x":0.6209,"y":0.2007}]	30	2020-04-18 20:37:00.175966	2020-04-21 14:15:39.112112	f	\N
3	[{"x":0.7451,"y":0.8531},{"x":0.7064,"y":0.625},{"x":0.7344,"y":0.4737},{"x":0.7311,"y":0.3805},{"x":0.7229,"y":0.3355}]	189	2020-04-18 20:36:55.332313	2020-04-21 13:35:23.860365	f	\N
132	[{"x":0.259,"y":0.7873},{"x":0.2706,"y":0.5493},{"x":0.264,"y":0.3015},{"x":0.2887,"y":0.1875}]	25	2020-04-18 20:37:00.470415	2020-04-21 14:16:54.233764	f	\N
5	[{"x":0.5584,"y":0.9254},{"x":0.5699,"y":0.5504},{"x":0.5905,"y":0.3191},{"x":0.5707,"y":0.0515}]	162	2020-04-18 20:36:55.415765	2020-04-21 13:37:51.669785	f	\N
136	[{"x":0.5584,"y":0.8443},{"x":0.5082,"y":0.5252},{"x":0.4581,"y":0.2884},{"x":0.4515,"y":0.0603}]	56	2020-04-18 20:37:00.616095	2020-04-21 14:17:31.761511	f	\N
138	[{"x":0.4465,"y":0.9627},{"x":0.4655,"y":0.6009},{"x":0.4951,"y":0.3805},{"x":0.5099,"y":0.2511},{"x":0.537,"y":0.102}]	194	2020-04-18 20:37:00.681426	2020-04-21 14:17:55.803696	f	\N
7	[{"x":0.5469,"y":0.9342},{"x":0.5107,"y":0.5888},{"x":0.4794,"y":0.3695},{"x":0.44,"y":0.0987}]	88	2020-04-18 20:36:55.537502	2020-04-21 13:38:18.631501	f	\N
151	[{"x":0.3791,"y":0.9024},{"x":0.398,"y":0.5647},{"x":0.4137,"y":0.2072},{"x":0.4334,"y":0.1711},{"x":0.5197,"y":0.1491}]	94	2020-04-18 20:37:01.170633	2020-04-21 14:20:08.23647	f	\N
153	[{"x":0.6908,"y":0.8224},{"x":0.6702,"y":0.5515},{"x":0.6719,"y":0.4254},{"x":0.6168,"y":0.2796},{"x":0.5617,"y":0.1382}]	181	2020-04-18 20:37:01.243795	2020-04-21 14:20:23.751017	f	\N
156	[{"x":0.6012,"y":0.83},{"x":0.5913,"y":0.58},{"x":0.5724,"y":0.3487},{"x":0.574,"y":0.2632}]	43	2020-04-18 20:37:01.362609	2020-04-21 14:20:45.906389	f	\N
158	[{"x":0.6143,"y":0.8816},{"x":0.5938,"y":0.4704},{"x":0.5896,"y":0.2708},{"x":0.5502,"y":0.0877}]	41	2020-04-18 20:37:01.442855	2020-04-21 14:21:10.477079	f	\N
160	[{"x":0.4161,"y":0.9331},{"x":0.4021,"y":0.5702},{"x":0.361,"y":0.3684},{"x":0.3462,"y":0.1711},{"x":0.3536,"y":0.0932}]	197	2020-04-18 20:37:01.521857	2020-04-21 14:21:27.404796	f	\N
15	[{"x":0.3035,"y":0.9518},{"x":0.2985,"y":0.6809},{"x":0.2969,"y":0.4989},{"x":0.2911,"y":0.4068},{"x":0.2656,"y":0.1864}]	89	2020-04-18 20:36:55.80428	2020-04-21 13:40:50.080939	f	\N
162	[{"x":0.648,"y":0.9885},{"x":0.5307,"y":0.5683},{"x":0.4901,"y":0.3956},{"x":0.4814,"y":0.1168}]	96	2020-04-18 20:37:01.58881	2020-04-21 14:21:51.610035	f	\N
165	[{"x":0.8158,"y":0.9419},{"x":0.8215,"y":0.614},{"x":0.7697,"y":0.5022},{"x":0.7278,"y":0.2961}]	154	2020-04-18 20:37:01.717044	2020-04-21 14:22:12.776146	f	\N
17	[{"x":0.5115,"y":0.932},{"x":0.5,"y":0.5998},{"x":0.4901,"y":0.3991},{"x":0.5313,"y":0.0428}]	188	2020-04-18 20:36:55.868135	2020-04-21 13:41:12.446243	f	\N
18	[{"x":0.5011,"y":0.8618},{"x":0.5208,"y":0.6094},{"x":0.5406,"y":0.3898},{"x":0.5,"y":0.1875}]	62	2020-04-18 20:36:55.907439	2020-04-21 13:41:40.533038	f	\N
173	[{"x":0.19,"y":0.9079},{"x":0.2179,"y":0.5877},{"x":0.241,"y":0.398},{"x":0.3191,"y":0.1864},{"x":0.4071,"y":0.1053}]	83	2020-04-18 20:37:02.053489	2020-04-21 14:24:12.165629	f	\N
177	[{"x":0.097,"y":0.6228},{"x":0.1003,"y":0.5768},{"x":0.1094,"y":0.4134},{"x":0.153,"y":0.2061}]	196	2020-04-18 20:37:02.203214	2020-04-21 14:24:58.328323	f	\N
20	[{"x":0.9375,"y":0.8772},{"x":0.9202,"y":0.6283},{"x":0.9104,"y":0.4167},{"x":0.8602,"y":0.1129}]	60	2020-04-18 20:36:55.965327	2020-04-21 13:41:59.934637	f	\N
178	[{"x":0.7917,"y":0.8396},{"x":0.7357,"y":0.5173},{"x":0.6382,"y":0.3882},{"x":0.6239,"y":0.2434}]	54	2020-04-18 20:37:02.240658	2020-04-21 14:25:19.176772	f	\N
181	[{"x":0.7393,"y":0.818},{"x":0.7229,"y":0.5186},{"x":0.7015,"y":0.3081},{"x":0.6414,"y":0.0241}]	186	2020-04-18 20:37:02.357726	2020-04-21 14:25:39.811476	f	\N
183	[{"x":0.4397,"y":0.9071},{"x":0.4287,"y":0.5411},{"x":0.4079,"y":0.4021},{"x":0.4364,"y":0.2747}]	50	2020-04-18 20:37:02.43824	2020-04-21 14:25:56.306132	f	\N
188	[{"x":0.5625,"y":0.8528},{"x":0.5395,"y":0.4868},{"x":0.5384,"y":0.3051},{"x":0.5318,"y":0.0831}]	87	2020-04-18 20:37:02.634556	2020-04-21 14:26:42.837949	f	\N
194	[{"x":0.4079,"y":0.9638},{"x":0.4359,"y":0.5274},{"x":0.5033,"y":0.3004},{"x":0.5337,"y":0.1327},{"x":0.5247,"y":0.0395}]	86	2020-04-18 20:37:02.863059	2020-04-21 14:27:52.029331	f	\N
197	[{"x":0.2928,"y":0.8421},{"x":0.3067,"y":0.5482},{"x":0.3799,"y":0.3958},{"x":0.3882,"y":0.2862},{"x":0.384,"y":0.2083},{"x":0.3775,"y":0.1228}]	144	2020-04-18 20:37:02.996215	2020-04-21 14:28:25.041611	f	\N
199	[{"x":0.5559,"y":0.9923},{"x":0.5773,"y":0.5669},{"x":0.5913,"y":0.3213},{"x":0.6324,"y":0.1009}]	3	2020-04-18 20:37:03.096536	2020-04-21 14:28:48.1651	f	\N
202	[{"x":0.5444,"y":0.8586},{"x":0.5263,"y":0.5987},{"x":0.5115,"y":0.3059},{"x":0.4548,"y":0.0789}]	193	2020-04-18 20:37:03.240685	2020-04-21 14:29:09.165992	f	\N
205	[{"x":0.5263,"y":0.8695},{"x":0.5296,"y":0.5691},{"x":0.5304,"y":0.3794},{"x":0.5699,"y":0.216}]	47	2020-04-18 20:37:03.3901	2020-04-21 14:29:29.618748	f	\N
210	[{"x":0.6176,"y":0.8936},{"x":0.5954,"y":0.5789},{"x":0.6209,"y":0.4112},{"x":0.5814,"y":0.2007}]	90	2020-04-18 20:37:03.70411	2020-04-21 14:30:54.515781	f	\N
212	[{"x":0.443,"y":0.8725},{"x":0.4715,"y":0.5658},{"x":0.5022,"y":0.4688},{"x":0.5954,"y":0.3495},{"x":0.6272,"y":0.2689},{"x":0.5768,"y":0.2286}]	224	2020-04-18 20:37:03.793979	2020-04-21 14:31:20.75183	f	\N
217	[{"x":0.5181,"y":0.7873},{"x":0.528,"y":0.5154},{"x":0.551,"y":0.33},{"x":0.5214,"y":0.1634}]	91	2020-04-18 20:37:04.016163	2020-04-21 14:32:18.099099	f	\N
221	[{"x":0.364,"y":0.8396},{"x":0.341,"y":0.5107},{"x":0.3618,"y":0.338},{"x":0.4342,"y":0.1719}]	52	2020-04-18 20:37:04.229757	2020-04-21 14:32:52.633474	f	\N
223	[{"x":0.3109,"y":0.9134},{"x":0.2648,"y":0.5625},{"x":0.2599,"y":0.3586},{"x":0.2459,"y":0.1831}]	190	2020-04-18 20:37:04.316844	2020-04-21 14:33:15.704427	f	\N
31	[{"x":0.5329,"y":0.9408},{"x":0.4298,"y":0.5995},{"x":0.3531,"y":0.44},{"x":0.3311,"y":0.2969},{"x":0.3607,"y":0.1867},{"x":0.4375,"y":0.0946},{"x":0.4912,"y":0.0724}]	148	2020-04-18 20:36:56.364656	2020-04-21 13:44:21.09593	f	\N
34	[{"x":0.5189,"y":0.943},{"x":0.4597,"y":0.6217},{"x":0.3512,"y":0.3882},{"x":0.2294,"y":0.0592}]	75	2020-04-18 20:36:56.477018	2020-04-21 13:44:45.791506	f	\N
36	[{"x":0.6678,"y":0.7675},{"x":0.662,"y":0.5658},{"x":0.6291,"y":0.3893},{"x":0.69,"y":0.2478},{"x":0.69,"y":0.0779}]	71	2020-04-18 20:36:56.548958	2020-04-21 13:45:06.832291	f	\N
41	[{"x":0.7064,"y":0.7752},{"x":0.6793,"y":0.5866},{"x":0.6817,"y":0.2675},{"x":0.6579,"y":0.0833}]	206	2020-04-18 20:36:56.762915	2020-04-21 13:46:03.259615	f	\N
50	[{"x":0.5,"y":0.8742},{"x":0.4814,"y":0.6217},{"x":0.341,"y":0.4992},{"x":0.3026,"y":0.4079},{"x":0.3509,"y":0.259},{"x":0.4715,"y":0.1875}]	8	2020-04-18 20:36:57.13078	2020-04-21 13:54:15.891098	f	\N
52	[{"x":0.6886,"y":0.9367},{"x":0.682,"y":0.5888},{"x":0.6195,"y":0.3964},{"x":0.6305,"y":0.2278},{"x":0.6612,"y":0.0773}]	66	2020-04-18 20:36:57.208816	2020-04-21 13:54:34.290804	f	\N
54	[{"x":0.2738,"y":0.852},{"x":0.2837,"y":0.6195},{"x":0.3002,"y":0.5088},{"x":0.4202,"y":0.5296},{"x":0.6497,"y":0.5395},{"x":0.7286,"y":0.4397},{"x":0.7401,"y":0.2325},{"x":0.7146,"y":0.1721}]	99	2020-04-18 20:36:57.278584	2020-04-21 13:54:59.756131	f	\N
59	[{"x":0.5633,"y":0.9496},{"x":0.5592,"y":0.5373},{"x":0.435,"y":0.3805},{"x":0.3742,"y":0.2401},{"x":0.3479,"y":0.0954},{"x":0.3372,"y":0.0318}]	238	2020-04-18 20:36:57.477727	2020-04-21 13:57:21.293261	f	\N
62	[{"x":0.6201,"y":0.8366},{"x":0.6143,"y":0.5779},{"x":0.616,"y":0.4792},{"x":0.6612,"y":0.2796},{"x":0.6554,"y":0.2138},{"x":0.625,"y":0.1952}]	172	2020-04-18 20:36:57.608789	2020-04-21 13:57:53.901354	f	\N
63	[{"x":0.4523,"y":0.9737},{"x":0.4433,"y":0.6086},{"x":0.4169,"y":0.4189},{"x":0.4178,"y":0.261},{"x":0.4934,"y":0.1075},{"x":0.5016,"y":0.0471}]	166	2020-04-18 20:36:57.645884	2020-04-21 13:58:02.516215	f	\N
66	[{"x":0.4613,"y":0.9342},{"x":0.4507,"y":0.6184},{"x":0.412,"y":0.4221},{"x":0.4194,"y":0.261},{"x":0.3775,"y":0.0669}]	199	2020-04-18 20:36:57.776354	2020-04-21 13:58:24.888369	f	\N
68	[{"x":0.4104,"y":0.9013},{"x":0.4219,"y":0.5592},{"x":0.44,"y":0.3344},{"x":0.4901,"y":0.0757}]	9	2020-04-18 20:36:57.869007	2020-04-21 13:58:49.147925	f	\N
69	[{"x":0.5439,"y":0.9375},{"x":0.5428,"y":0.56},{"x":0.443,"y":0.4581},{"x":0.3882,"y":0.3396},{"x":0.3925,"y":0.3076}]	14	2020-04-18 20:36:57.917624	2020-04-21 13:59:00.438455	f	\N
74	[{"x":0.3651,"y":0.909},{"x":0.3405,"y":0.5395},{"x":0.2549,"y":0.3706},{"x":0.2656,"y":0.2533},{"x":0.3363,"y":0.1338},{"x":0.3947,"y":0.0384}]	100	2020-04-18 20:36:58.1157	2020-04-21 13:59:37.918714	f	\N
76	[{"x":0.0781,"y":0.7873},{"x":0.1086,"y":0.5658},{"x":0.1579,"y":0.4397},{"x":0.2549,"y":0.3991},{"x":0.4301,"y":0.4035},{"x":0.6776,"y":0.3618},{"x":0.8487,"y":0.3333},{"x":0.8429,"y":0.2083}]	29	2020-04-18 20:36:58.189541	2020-04-21 13:59:56.095516	f	\N
79	[{"x":0.7681,"y":0.841},{"x":0.7887,"y":0.6678},{"x":0.8191,"y":0.568},{"x":0.8125,"y":0.5175},{"x":0.7418,"y":0.3421}]	102	2020-04-18 20:36:58.312885	2020-04-21 14:07:29.523718	f	\N
80	[{"x":0.7664,"y":0.9079},{"x":0.7459,"y":0.5548},{"x":0.6801,"y":0.2654},{"x":0.5715,"y":0.0307}]	103	2020-04-18 20:36:58.3403	2020-04-21 14:07:37.450912	f	\N
82	[{"x":0.0428,"y":0.5658},{"x":0.1217,"y":0.477},{"x":0.2286,"y":0.4868}]	16	2020-04-18 20:36:58.429653	2020-04-21 14:07:57.310638	f	\N
84	[{"x":0.5181,"y":0.8509},{"x":0.4901,"y":0.5395},{"x":0.4786,"y":0.4101},{"x":0.5296,"y":0.2522},{"x":0.5995,"y":0.1228}]	107	2020-04-18 20:36:58.512773	2020-04-21 14:08:12.238051	f	\N
85	[{"x":0.4967,"y":0.8465},{"x":0.5107,"y":0.5493},{"x":0.5419,"y":0.3914},{"x":0.5074,"y":0.1875},{"x":0.4778,"y":0.1239}]	106	2020-04-18 20:36:58.546359	2020-04-21 14:08:18.648392	f	\N
88	[{"x":0.8141,"y":0.932},{"x":0.7393,"y":0.6393},{"x":0.5526,"y":0.5022},{"x":0.3799,"y":0.3268},{"x":0.2977,"y":0.1502}]	11	2020-04-18 20:36:58.676284	2020-04-21 14:08:49.87644	f	\N
94	[{"x":0.4572,"y":0.9605},{"x":0.4781,"y":0.7393},{"x":0.5614,"y":0.4786},{"x":0.5691,"y":0.2368},{"x":0.4934,"y":0.1447}]	105	2020-04-18 20:36:58.933692	2020-04-21 14:09:31.670298	f	\N
95	[{"x":0.6118,"y":0.9452},{"x":0.6044,"y":0.6064},{"x":0.611,"y":0.3717},{"x":0.5806,"y":0.1261}]	38	2020-04-18 20:36:58.969379	2020-04-21 14:09:37.15947	f	\N
97	[{"x":0.4792,"y":0.9326},{"x":0.4605,"y":0.5518},{"x":0.477,"y":0.3166},{"x":0.4298,"y":0.0946}]	108	2020-04-18 20:36:59.048247	2020-04-21 14:10:15.547684	f	\N
100	[{"x":0.7771,"y":0.6787},{"x":0.7804,"y":0.4923},{"x":0.8281,"y":0.2467},{"x":0.838,"y":0.1656},{"x":0.8059,"y":0.1151}]	242	2020-04-18 20:36:59.180781	2020-04-21 14:10:46.673199	f	\N
101	[{"x":0.4523,"y":0.9836},{"x":0.4729,"y":0.83},{"x":0.5633,"y":0.5757},{"x":0.5781,"y":0.364},{"x":0.5691,"y":0.1908},{"x":0.5337,"y":0.0373}]	243	2020-04-18 20:36:59.221288	2020-04-21 14:10:54.777981	f	\N
104	[{"x":0.3594,"y":0.9397},{"x":0.352,"y":0.6162},{"x":0.3257,"y":0.386},{"x":0.3257,"y":0.1985},{"x":0.3536,"y":0.1469}]	109	2020-04-18 20:36:59.337064	2020-04-21 14:11:15.910804	f	\N
105	[{"x":0.5658,"y":0.9232},{"x":0.5411,"y":0.6689},{"x":0.5206,"y":0.3991},{"x":0.4803,"y":0.0581}]	20	2020-04-18 20:36:59.377541	2020-04-21 14:11:22.297359	f	\N
176	[{"x":0.5632,"y":0.1807},{"x":0.4645,"y":0.1842},{"x":0.4303,"y":0.486},{"x":0.2605,"y":0.5193},{"x":0.0039,"y":0.4702}]	68	2020-04-18 20:37:02.167926	2020-04-18 21:00:40.317518	f	\N
108	[{"x":0.6472,"y":0.7873},{"x":0.6645,"y":0.4441},{"x":0.6612,"y":0.3465},{"x":0.6316,"y":0.2544},{"x":0.5946,"y":0.1579}]	137	2020-04-18 20:36:59.511006	2020-04-21 14:11:59.803475	f	\N
110	[{"x":0.4079,"y":0.8109},{"x":0.2982,"y":0.4613},{"x":0.1316,"y":0.3692},{"x":0.1612,"y":0.3191},{"x":0.2171,"y":0.2607}]	241	2020-04-18 20:36:59.62738	2020-04-21 14:13:30.484403	f	\N
114	[{"x":0.3026,"y":0.9452},{"x":0.3018,"y":0.6075},{"x":0.2813,"y":0.3958},{"x":0.3224,"y":0.1502}]	23	2020-04-18 20:36:59.778806	2020-04-21 14:14:11.228392	f	\N
115	[{"x":0.4688,"y":0.9781},{"x":0.4581,"y":0.6195},{"x":0.5625,"y":0.4682},{"x":0.6028,"y":0.3015},{"x":0.5822,"y":0.17},{"x":0.5576,"y":0.0526}]	37	2020-04-18 20:36:59.827503	2020-04-21 14:14:21.075759	f	\N
117	[{"x":0.4161,"y":0.9178},{"x":0.384,"y":0.6601},{"x":0.3544,"y":0.3947},{"x":0.3495,"y":0.1908}]	126	2020-04-18 20:36:59.899503	2020-04-21 14:14:32.068886	f	\N
118	[{"x":0.6787,"y":0.8857},{"x":0.5757,"y":0.5115},{"x":0.3564,"y":0.4169},{"x":0.2599,"y":0.2796},{"x":0.2566,"y":0.1842},{"x":0.3059,"y":0.1538},{"x":0.3673,"y":0.1398}]	244	2020-04-18 20:36:59.937785	2020-04-21 14:14:52.284167	f	\N
120	[{"x":0.3117,"y":0.92},{"x":0.3306,"y":0.6009},{"x":0.3791,"y":0.3651},{"x":0.3931,"y":0.1732},{"x":0.3931,"y":0.0998}]	127	2020-04-18 20:37:00.023369	2020-04-21 14:15:07.080822	f	\N
121	[{"x":0.477,"y":0.8838},{"x":0.4975,"y":0.5252},{"x":0.5222,"y":0.3015},{"x":0.5123,"y":0.1842},{"x":0.4046,"y":0.1425},{"x":0.3939,"y":0.1118},{"x":0.4219,"y":0.0855}]	133	2020-04-18 20:37:00.059559	2020-04-21 14:15:17.253113	f	\N
123	[{"x":0.3429,"y":0.8607},{"x":0.3602,"y":0.6283},{"x":0.3923,"y":0.4463},{"x":0.4235,"y":0.1513}]	24	2020-04-18 20:37:00.141466	2020-04-21 14:15:33.05313	f	\N
125	[{"x":0.7577,"y":0.8306},{"x":0.6996,"y":0.509},{"x":0.6732,"y":0.3512},{"x":0.6107,"y":0.1571}]	125	2020-04-18 20:37:00.214023	2020-04-21 14:15:46.721659	f	\N
126	[{"x":0.7336,"y":0.8717},{"x":0.7508,"y":0.5976},{"x":0.7944,"y":0.4002},{"x":0.7821,"y":0.3081},{"x":0.7467,"y":0.1952}]	131	2020-04-18 20:37:00.242728	2020-04-21 14:15:54.966413	f	\N
130	[{"x":0.4926,"y":0.9276},{"x":0.4309,"y":0.7686},{"x":0.4383,"y":0.6184},{"x":0.4391,"y":0.3509},{"x":0.4622,"y":0.0307}]	124	2020-04-18 20:37:00.390445	2020-04-21 14:16:39.76611	f	\N
135	[{"x":0.5641,"y":0.9945},{"x":0.5115,"y":0.591},{"x":0.347,"y":0.5154},{"x":0.2229,"y":0.4715},{"x":0.1414,"y":0.3377}]	4	2020-04-18 20:37:00.574293	2020-04-21 14:17:24.043921	f	\N
137	[{"x":0.3734,"y":0.8564},{"x":0.3479,"y":0.58},{"x":0.3199,"y":0.4474},{"x":0.3298,"y":0.1886}]	180	2020-04-18 20:37:00.644319	2020-04-21 14:17:39.759349	f	\N
139	[{"x":0.5748,"y":0.8333},{"x":0.5584,"y":0.6919},{"x":0.5033,"y":0.3684}]	81	2020-04-18 20:37:00.724581	2020-04-21 14:18:03.044723	f	\N
140	[{"x":0.5008,"y":0.8618},{"x":0.5008,"y":0.5548},{"x":0.5099,"y":0.3607},{"x":0.4877,"y":0.1557}]	95	2020-04-18 20:37:00.75431	2020-04-21 14:18:10.383882	f	\N
144	[{"x":0.8904,"y":0.5214},{"x":0.7873,"y":0.5321},{"x":0.6458,"y":0.5025},{"x":0.4287,"y":0.4786},{"x":0.2621,"y":0.4342},{"x":0.136,"y":0.3758},{"x":0.1765,"y":0.2566},{"x":0.2588,"y":0.1184}]	235	2020-04-18 20:37:00.903547	2020-04-21 14:18:46.691454	f	\N
146	[{"x":0.7771,"y":0.7993},{"x":0.7722,"y":0.5768},{"x":0.7632,"y":0.4408},{"x":0.7755,"y":0.2917},{"x":0.7294,"y":0.182}]	220	2020-04-18 20:37:00.976245	2020-04-21 14:19:06.364658	f	\N
147	[{"x":0.4814,"y":0.8355},{"x":0.4792,"y":0.7459},{"x":0.4868,"y":0.6036},{"x":0.3629,"y":0.5},{"x":0.3191,"y":0.3586},{"x":0.3465,"y":0.2574},{"x":0.4419,"y":0.1604}]	234	2020-04-18 20:37:01.020426	2020-04-21 14:19:15.476912	f	\N
152	[{"x":0.8117,"y":0.7763},{"x":0.7615,"y":0.5822},{"x":0.69,"y":0.4167},{"x":0.6595,"y":0.2895},{"x":0.6176,"y":0.1634}]	195	2020-04-18 20:37:01.206705	2020-04-21 14:20:16.746208	f	\N
154	[{"x":0.7204,"y":0.9507},{"x":0.602,"y":0.6316},{"x":0.5088,"y":0.44},{"x":0.3991,"y":0.1891},{"x":0.3333,"y":0.0962}]	5	2020-04-18 20:37:01.28052	2020-04-21 14:20:31.018999	f	\N
155	[{"x":0.514,"y":0.9901},{"x":0.5,"y":0.8311},{"x":0.4704,"y":0.6612},{"x":0.301,"y":0.6107},{"x":0.1217,"y":0.5395},{"x":0.0732,"y":0.4046}]	57	2020-04-18 20:37:01.321264	2020-04-21 14:20:39.317409	f	\N
157	[{"x":0.6206,"y":0.9786},{"x":0.5932,"y":0.5699},{"x":0.6184,"y":0.4309},{"x":0.727,"y":0.3199},{"x":0.8103,"y":0.2714}]	7	2020-04-18 20:37:01.395994	2020-04-21 14:20:54.694699	f	\N
159	[{"x":0.3602,"y":0.8805},{"x":0.3059,"y":0.67},{"x":0.273,"y":0.5548},{"x":0.2081,"y":0.3925},{"x":0.1982,"y":0.148},{"x":0.2113,"y":0.0044}]	69	2020-04-18 20:37:01.480908	2020-04-21 14:21:20.724616	f	\N
161	[{"x":0.7607,"y":0.7061},{"x":0.7747,"y":0.5537},{"x":0.8281,"y":0.3651},{"x":0.8446,"y":0.1996},{"x":0.8026,"y":0.1447}]	183	2020-04-18 20:37:01.555363	2020-04-21 14:21:40.675913	f	\N
164	[{"x":0.259,"y":0.9561},{"x":0.2582,"y":0.7379},{"x":0.2681,"y":0.6075},{"x":0.3084,"y":0.4287},{"x":0.3824,"y":0.2971}]	82	2020-04-18 20:37:01.678052	2020-04-21 14:22:04.976207	f	\N
168	[{"x":0.0724,"y":0.6853},{"x":0.199,"y":0.5296},{"x":0.2829,"y":0.5044},{"x":0.3947,"y":0.5044},{"x":0.5058,"y":0.5175},{"x":0.6546,"y":0.511},{"x":0.7928,"y":0.5219},{"x":0.8923,"y":0.4934},{"x":0.9441,"y":0.5099},{"x":0.9605,"y":0.5329}]	236	2020-04-18 20:37:01.838319	2020-04-21 14:23:30.237815	f	\N
170	[{"x":0.6998,"y":0.9331},{"x":0.6891,"y":0.511},{"x":0.7023,"y":0.2785},{"x":0.7113,"y":0.1107},{"x":0.6867,"y":0.0614}]	223	2020-04-18 20:37:01.917484	2020-04-21 14:23:50.423655	f	\N
174	[{"x":0.4868,"y":0.9145},{"x":0.4803,"y":0.5471},{"x":0.491,"y":0.364},{"x":0.5715,"y":0.1173}]	97	2020-04-18 20:37:02.087672	2020-04-21 14:24:17.974863	f	\N
175	[{"x":0.4934,"y":0.6469},{"x":0.4942,"y":0.557},{"x":0.477,"y":0.4792},{"x":0.4671,"y":0.3421},{"x":0.4153,"y":0.1601},{"x":0.3988,"y":0.0844}]	182	2020-04-18 20:37:02.133861	2020-04-21 14:24:31.273464	f	\N
179	[{"x":0.5156,"y":0.9309},{"x":0.5099,"y":0.4583},{"x":0.4885,"y":0.2204},{"x":0.4811,"y":0.1217},{"x":0.5296,"y":0.0592}]	192	2020-04-18 20:37:02.279234	2020-04-21 14:25:26.643225	f	\N
211	[{"x":0.4829,"y":0.7614},{"x":0.4921,"y":0.7561},{"x":0.5276,"y":0.7263},{"x":0.5395,"y":0.6947},{"x":0.5447,"y":0.6509},{"x":0.5592,"y":0.6158},{"x":0.5961,"y":0.5579},{"x":0.6079,"y":0.5439},{"x":0.6237,"y":0.4561},{"x":0.6211,"y":0.3579},{"x":0.6079,"y":0.2667},{"x":0.5789,"y":0.1614},{"x":0.5645,"y":0.1053}]	230	2020-04-18 20:37:03.757978	2020-04-18 21:00:40.391042	f	\N
215	[{"x":0.8711,"y":0.507},{"x":0.7961,"y":0.5333},{"x":0.6026,"y":0.5246},{"x":0.4316,"y":0.4632},{"x":0.2763,"y":0.4807},{"x":0.1829,"y":0.4491},{"x":0.1658,"y":0.3018},{"x":0.1855,"y":0.1772},{"x":0.1974,"y":0.1316},{"x":0.2211,"y":0.1035}]	225	2020-04-18 20:37:03.924789	2020-04-18 21:00:40.401858	f	\N
216	[{"x":0.7961,"y":0.5053},{"x":0.7316,"y":0.4526},{"x":0.6711,"y":0.414},{"x":0.5737,"y":0.414},{"x":0.4474,"y":0.4123},{"x":0.3461,"y":0.4263},{"x":0.2671,"y":0.4719},{"x":0.1724,"y":0.4702},{"x":0.1395,"y":0.4193},{"x":0.1592,"y":0.4}]	231	2020-04-18 20:37:03.972043	2020-04-18 21:00:40.404725	f	\N
1	[{"x":0.0222,"y":0.7818},{"x":0.0781,"y":0.5855},{"x":0.1793,"y":0.4605},{"x":0.2508,"y":0.4101},{"x":0.352,"y":0.4287},{"x":0.5016,"y":0.4309},{"x":0.5896,"y":0.2686},{"x":0.5699,"y":0.1601}]	1	2020-04-18 19:51:17.374644	2020-04-21 13:33:46.367889	f	\N
2	[{"x":0.491,"y":0.8805},{"x":0.4901,"y":0.6502},{"x":0.4696,"y":0.4079},{"x":0.4819,"y":0.0877}]	63	2020-04-18 20:36:55.239653	2020-04-21 13:34:27.027339	f	\N
8	[{"x":0.3651,"y":0.8761},{"x":0.3898,"y":0.5482},{"x":0.3577,"y":0.352},{"x":0.4227,"y":0.2796},{"x":0.4622,"y":0.1875},{"x":0.4671,"y":0.1096}]	228	2020-04-18 20:36:55.565201	2020-04-21 13:39:07.618489	f	\N
21	[{"x":0.0288,"y":0.7599},{"x":0.0535,"y":0.5844},{"x":0.1316,"y":0.5493},{"x":0.2492,"y":0.5208},{"x":0.3906,"y":0.5033},{"x":0.5214,"y":0.5186},{"x":0.6209,"y":0.4879},{"x":0.6414,"y":0.3355},{"x":0.6694,"y":0.1897}]	48	2020-04-18 20:36:56.005996	2020-04-21 13:42:23.230116	f	\N
22	[{"x":0.44,"y":0.9046},{"x":0.4161,"y":0.6458},{"x":0.2516,"y":0.659},{"x":0.1143,"y":0.6382},{"x":0.0419,"y":0.5274},{"x":0.0238,"y":0.3925},{"x":0.0855,"y":0.3114},{"x":0.1669,"y":0.216}]	149	2020-04-18 20:36:56.039619	2020-04-21 13:42:41.227811	f	\N
32	[{"x":0.625,"y":0.8465},{"x":0.5913,"y":0.568},{"x":0.5715,"y":0.3509},{"x":0.528,"y":0.0658}]	49	2020-04-18 20:36:56.409067	2020-04-21 13:44:29.35076	f	\N
57	[{"x":0.3569,"y":0.8553},{"x":0.3692,"y":0.7259},{"x":0.2878,"y":0.6853},{"x":0.2253,"y":0.5197},{"x":0.199,"y":0.3849},{"x":0.2039,"y":0.2697},{"x":0.2212,"y":0.205},{"x":0.2549,"y":0.1524}]	205	2020-04-18 20:36:57.40939	2020-04-21 13:56:29.971594	f	\N
182	[{"x":0.1678,"y":0.8169},{"x":0.213,"y":0.614},{"x":0.2706,"y":0.5461},{"x":0.4211,"y":0.5362},{"x":0.5222,"y":0.4298},{"x":0.6192,"y":0.1524}]	2	2020-04-18 20:37:02.392176	2020-04-21 14:25:50.476895	f	\N
187	[{"x":0.5411,"y":0.9243},{"x":0.5304,"y":0.5186},{"x":0.5016,"y":0.307},{"x":0.4934,"y":0.1217}]	93	2020-04-18 20:37:02.59408	2020-04-21 14:26:26.252653	f	\N
189	[{"x":0.6965,"y":0.818},{"x":0.7072,"y":0.5296},{"x":0.7664,"y":0.3607},{"x":0.7854,"y":0.2204},{"x":0.7541,"y":0.182}]	179	2020-04-18 20:37:02.66842	2020-04-21 14:26:50.542769	f	\N
190	[{"x":0.8838,"y":0.5},{"x":0.761,"y":0.5247},{"x":0.4496,"y":0.5263},{"x":0.3169,"y":0.4457},{"x":0.2884,"y":0.315},{"x":0.3553,"y":0.2253}]	227	2020-04-18 20:37:02.700822	2020-04-21 14:27:11.891713	f	\N
193	[{"x":0.7917,"y":0.9038},{"x":0.7368,"y":0.6192},{"x":0.6217,"y":0.4268},{"x":0.5943,"y":0.2714},{"x":0.5746,"y":0.1735},{"x":0.5713,"y":0.0518}]	226	2020-04-18 20:37:02.825696	2020-04-21 14:27:44.605272	f	\N
195	[{"x":0.2442,"y":0.9002},{"x":0.2401,"y":0.6886},{"x":0.2393,"y":0.5899},{"x":0.338,"y":0.4912},{"x":0.5189,"y":0.5044},{"x":0.7401,"y":0.5548},{"x":0.8717,"y":0.4726},{"x":0.8808,"y":0.3618},{"x":0.8413,"y":0.17}]	178	2020-04-18 20:37:02.900519	2020-04-21 14:28:09.272792	f	\N
196	[{"x":0.7023,"y":0.8706},{"x":0.6628,"y":0.5504},{"x":0.7007,"y":0.3882},{"x":0.7023,"y":0.3015},{"x":0.6513,"y":0.2292},{"x":0.6176,"y":0.1524},{"x":0.6135,"y":0.1075}]	92	2020-04-18 20:37:02.947674	2020-04-21 14:28:17.773065	f	\N
200	[{"x":0.3824,"y":0.9627},{"x":0.3503,"y":0.5581},{"x":0.4169,"y":0.3454},{"x":0.4613,"y":0.0329}]	51	2020-04-18 20:37:03.141585	2020-04-21 14:28:55.985865	f	\N
201	[{"x":0.4457,"y":0.9671},{"x":0.4038,"y":0.5866},{"x":0.3906,"y":0.3673},{"x":0.3183,"y":0.1557},{"x":0.3067,"y":0.0636}]	187	2020-04-18 20:37:03.190245	2020-04-21 14:29:03.092361	f	\N
203	[{"x":0.4334,"y":0.8838},{"x":0.4021,"y":0.5406},{"x":0.3289,"y":0.2577},{"x":0.3495,"y":0.1162},{"x":0.3742,"y":0.0296}]	185	2020-04-18 20:37:03.285476	2020-04-21 14:29:15.925628	f	\N
204	[{"x":0.4748,"y":0.9391},{"x":0.4496,"y":0.5543},{"x":0.511,"y":0.4021},{"x":0.5735,"y":0.2459},{"x":0.5987,"y":0.1464},{"x":0.5669,"y":0.0913}]	191	2020-04-18 20:37:03.340594	2020-04-21 14:29:23.914335	f	\N
206	[{"x":0.102,"y":0.8432},{"x":0.1694,"y":0.4868},{"x":0.3528,"y":0.5011},{"x":0.5666,"y":0.5143},{"x":0.7138,"y":0.4989},{"x":0.8322,"y":0.4518},{"x":0.9038,"y":0.4123}]	53	2020-04-18 20:37:03.438698	2020-04-21 14:29:53.73391	f	\N
209	[{"x":0.6382,"y":0.8246},{"x":0.6299,"y":0.5603},{"x":0.6488,"y":0.4693},{"x":0.759,"y":0.4485},{"x":0.8701,"y":0.4221},{"x":0.903,"y":0.318},{"x":0.9235,"y":0.3103}]	84	2020-04-18 20:37:03.659325	2020-04-21 14:30:48.856758	f	\N
213	[{"x":0.6349,"y":0.9112},{"x":0.6086,"y":0.5702},{"x":0.5724,"y":0.3838},{"x":0.5313,"y":0.1974},{"x":0.4663,"y":0.0537}]	218	2020-04-18 20:37:03.840809	2020-04-21 14:31:27.057385	f	\N
214	[{"x":0.3561,"y":0.9331},{"x":0.3676,"y":0.5526},{"x":0.2804,"y":0.3893},{"x":0.264,"y":0.2445},{"x":0.3035,"y":0.1897}]	219	2020-04-18 20:37:03.878065	2020-04-21 14:31:35.509429	f	\N
220	[{"x":0.4482,"y":0.9287},{"x":0.4564,"y":0.5208},{"x":0.4704,"y":0.3684},{"x":0.5329,"y":0.1217}]	147	2020-04-18 20:37:04.18197	2020-04-21 14:32:47.255802	f	\N
222	[{"x":0.2325,"y":0.9169},{"x":0.318,"y":0.5444},{"x":0.3607,"y":0.4589},{"x":0.489,"y":0.491},{"x":0.6634,"y":0.4416},{"x":0.7511,"y":0.3586},{"x":0.7204,"y":0.2845},{"x":0.659,"y":0.2245}]	46	2020-04-18 20:37:04.272266	2020-04-21 14:33:08.414593	f	\N
224	[{"x":0.443,"y":0.5765},{"x":0.4726,"y":0.5123},{"x":0.5439,"y":0.236},{"x":0.5384,"y":0.0757}]	184	2020-04-18 20:37:04.370683	2020-04-21 14:33:22.248228	f	\N
73	[{"x":0.4112,"y":0.9671},{"x":0.3832,"y":0.5417},{"x":0.3487,"y":0.3224},{"x":0.3668,"y":0.1754},{"x":0.3758,"y":0.1031}]	114	2020-04-18 20:36:58.06937	2020-04-21 13:59:28.574715	f	\N
77	[{"x":0.7664,"y":0.9496},{"x":0.7541,"y":0.6031},{"x":0.676,"y":0.1952}]	17	2020-04-18 20:36:58.231256	2020-04-21 14:00:09.212403	f	\N
83	[{"x":0.7179,"y":0.7971},{"x":0.6933,"y":0.6075},{"x":0.6299,"y":0.4364},{"x":0.5888,"y":0.2818},{"x":0.5995,"y":0.0866}]	113	2020-04-18 20:36:58.472796	2020-04-21 14:08:05.246821	f	\N
87	[{"x":0.5938,"y":0.8706},{"x":0.5707,"y":0.5998},{"x":0.5724,"y":0.3662},{"x":0.5189,"y":0.2237}]	13	2020-04-18 20:36:58.632095	2020-04-21 14:08:32.891521	f	\N
89	[{"x":0.5987,"y":0.9046},{"x":0.6162,"y":0.685},{"x":0.5987,"y":0.5313},{"x":0.5011,"y":0.4391},{"x":0.3684,"y":0.3692},{"x":0.3344,"y":0.2763},{"x":0.3366,"y":0.2196},{"x":0.3509,"y":0.1785}]	104	2020-04-18 20:36:58.719967	2020-04-21 14:08:59.329816	f	\N
98	[{"x":0.4071,"y":0.9189},{"x":0.3939,"y":0.6086},{"x":0.4063,"y":0.455},{"x":0.3183,"y":0.3268},{"x":0.3092,"y":0.1941}]	120	2020-04-18 20:36:59.095596	2020-04-21 14:10:33.239133	f	\N
107	[{"x":0.6571,"y":0.9002},{"x":0.5921,"y":0.5296},{"x":0.4893,"y":0.4123},{"x":0.4087,"y":0.2664},{"x":0.4087,"y":0.1623},{"x":0.426,"y":0.1261}]	22	2020-04-18 20:36:59.462889	2020-04-21 14:11:41.816482	f	\N
112	[{"x":0.2541,"y":0.9189},{"x":0.2467,"y":0.6151},{"x":0.2697,"y":0.4518},{"x":0.3207,"y":0.3333},{"x":0.3799,"y":0.205},{"x":0.4441,"y":0.1371},{"x":0.5288,"y":0.0921}]	122	2020-04-18 20:36:59.707148	2020-04-21 14:13:59.603559	f	\N
116	[{"x":0.3454,"y":0.9145},{"x":0.3339,"y":0.5219},{"x":0.3561,"y":0.2862},{"x":0.3832,"y":0.1228}]	132	2020-04-18 20:36:59.860067	2020-04-21 14:14:26.69707	f	\N
128	[{"x":0.4235,"y":0.9507},{"x":0.4227,"y":0.5998},{"x":0.4441,"y":0.3542},{"x":0.4482,"y":0.1393}]	118	2020-04-18 20:37:00.32277	2020-04-21 14:16:15.859574	f	\N
131	[{"x":0.3668,"y":0.9101},{"x":0.3618,"y":0.6985},{"x":0.278,"y":0.5515},{"x":0.25,"y":0.3772},{"x":0.2442,"y":0.2478},{"x":0.3035,"y":0.0417}]	31	2020-04-18 20:37:00.435148	2020-04-21 14:16:47.902917	f	\N
134	[{"x":0.6924,"y":0.7456},{"x":0.69,"y":0.4485},{"x":0.6308,"y":0.3169},{"x":0.5247,"y":0.261}]	42	2020-04-18 20:37:00.539647	2020-04-21 14:17:11.53666	f	\N
145	[{"x":0.4087,"y":0.9638},{"x":0.4408,"y":0.6557},{"x":0.5214,"y":0.5362},{"x":0.5321,"y":0.3629},{"x":0.4712,"y":0.2423},{"x":0.2673,"y":0.1283},{"x":0.2549,"y":0.0779},{"x":0.2673,"y":0.057}]	221	2020-04-18 20:37:00.939492	2020-04-21 14:18:59.706697	f	\N
167	[{"x":0.8972,"y":0.5011},{"x":0.838,"y":0.4748},{"x":0.7352,"y":0.4507},{"x":0.6612,"y":0.4627},{"x":0.5181,"y":0.4287},{"x":0.4301,"y":0.409},{"x":0.347,"y":0.3618},{"x":0.1933,"y":0.3586},{"x":0.1012,"y":0.3816},{"x":0.051,"y":0.3794}]	222	2020-04-18 20:37:01.793838	2020-04-21 14:22:52.009377	f	\N
169	[{"x":0.3465,"y":0.8446},{"x":0.3355,"y":0.6645},{"x":0.432,"y":0.537},{"x":0.4254,"y":0.4375},{"x":0.352,"y":0.3742},{"x":0.3125,"y":0.2632},{"x":0.3465,"y":0.1785}]	237	2020-04-18 20:37:01.877461	2020-04-21 14:23:42.781271	f	\N
180	[{"x":0.4153,"y":0.8662},{"x":0.4095,"y":0.545},{"x":0.4013,"y":0.4057},{"x":0.3997,"y":0.2785},{"x":0.4276,"y":0.1809}]	78	2020-04-18 20:37:02.323557	2020-04-21 14:25:33.574261	f	\N
186	[{"x":0.5633,"y":0.8333},{"x":0.5559,"y":0.58},{"x":0.5206,"y":0.4035},{"x":0.5049,"y":0.25},{"x":0.5082,"y":0.17}]	145	2020-04-18 20:37:02.559485	2020-04-21 14:26:20.715785	f	\N
191	[{"x":0.5313,"y":0.9364},{"x":0.5748,"y":0.5768},{"x":0.6743,"y":0.4605},{"x":0.7204,"y":0.2818},{"x":0.7056,"y":0.1952}]	233	2020-04-18 20:37:02.742198	2020-04-21 14:27:22.589374	f	\N
192	[{"x":0.1689,"y":0.8766},{"x":0.1941,"y":0.7607},{"x":0.2412,"y":0.7056},{"x":0.4375,"y":0.6801},{"x":0.5735,"y":0.588},{"x":0.5318,"y":0.4589},{"x":0.3706,"y":0.3717},{"x":0.2478,"y":0.3059},{"x":0.2434,"y":0.2525},{"x":0.3279,"y":0.1842}]	232	2020-04-18 20:37:02.78092	2020-04-21 14:27:35.967984	f	\N
207	[{"x":0.9424,"y":0.545},{"x":0.8355,"y":0.5603},{"x":0.7245,"y":0.5296},{"x":0.5979,"y":0.5263},{"x":0.4737,"y":0.545},{"x":0.3865,"y":0.6031},{"x":0.2837,"y":0.5877},{"x":0.1711,"y":0.5362},{"x":0.0896,"y":0.5373},{"x":0.0559,"y":0.5504}]	146	2020-04-18 20:37:03.54561	2020-04-21 14:30:15.077179	f	\N
208	[{"x":0.3363,"y":0.9046},{"x":0.3692,"y":0.6634},{"x":0.4729,"y":0.5625},{"x":0.5411,"y":0.4474},{"x":0.5403,"y":0.1678},{"x":0.5321,"y":0.1305}]	152	2020-04-18 20:37:03.608045	2020-04-21 14:30:33.573556	f	\N
218	[{"x":0.7327,"y":0.9836},{"x":0.7007,"y":0.6502},{"x":0.5798,"y":0.5768},{"x":0.3906,"y":0.5055},{"x":0.3224,"y":0.3728},{"x":0.3051,"y":0.2412},{"x":0.3092,"y":0.1711},{"x":0.4219,"y":0.045}]	85	2020-04-18 20:37:04.067592	2020-04-21 14:32:35.398081	f	\N
238	[{"x":0.59,"y":0.9137},{"x":0.5133,"y":0.5275},{"x":0.3567,"y":0.3},{"x":0.41,"y":0.15}]	165	2020-07-05 20:00:23.336479	2020-07-05 20:48:35.483552	f	\N
236	[{"x":0.475,"y":0.7137},{"x":0.4367,"y":0.415},{"x":0.5367,"y":0.1613}]	177	2020-07-05 20:00:23.153873	2020-07-05 20:46:55.998953	f	\N
239	[{"x":0.555,"y":0.8013},{"x":0.49,"y":0.4525},{"x":0.315,"y":0.1963},{"x":0.285,"y":0.075}]	164	2020-07-05 20:00:23.41996	2020-07-05 20:47:51.248305	f	\N
235	[{"x":0.6267,"y":0.9637},{"x":0.5033,"y":0.5025},{"x":0.5283,"y":0.03}]	138	2020-07-05 20:00:23.089874	2020-07-05 20:56:51.930827	f	\N
234	[{"x":0.5717,"y":0.9263},{"x":0.5533,"y":0.4075},{"x":0.5267,"y":0.1212}]	128	2020-07-05 20:00:23.031964	2020-07-05 20:58:07.096604	f	\N
248	[{"x":0.5,"y":0.8862},{"x":0.4217,"y":0.5525},{"x":0.5317,"y":0.34},{"x":0.5333,"y":0.0425}]	136	2020-07-05 20:00:24.028446	2020-07-05 20:57:36.176498	f	\N
258	[{"x":0.52,"y":0.9175},{"x":0.4533,"y":0.6262},{"x":0.5667,"y":0.07}]	207	2020-07-05 20:00:24.821282	2020-07-05 20:59:45.697978	f	\N
264	[{"x":0.6517,"y":0.98},{"x":0.5933,"y":0.695},{"x":0.5083,"y":0.525},{"x":0.4917,"y":0.2762},{"x":0.5183,"y":0.0475}]	217	2020-07-05 20:00:25.199488	2020-07-05 20:50:02.765213	f	\N
241	[{"x":0.625,"y":0.85},{"x":0.68,"y":0.415},{"x":0.4483,"y":0.1537}]	170	2020-07-05 20:00:23.58865	2020-07-05 20:47:23.746741	f	\N
245	[{"x":0.6167,"y":0.9125},{"x":0.565,"y":0.545},{"x":0.4217,"y":0.09}]	203	2020-07-05 20:00:23.820682	2020-07-05 20:58:48.461421	f	\N
262	[{"x":0.5817,"y":0.9337},{"x":0.5467,"y":0.4487},{"x":0.4283,"y":0.0638}]	210	2020-07-05 20:00:25.072006	2020-07-05 21:01:05.681477	f	\N
251	[{"x":0.53,"y":0.9063},{"x":0.5267,"y":0.4462},{"x":0.5817,"y":0.0862}]	168	2020-07-05 20:00:24.277451	2020-07-05 20:49:08.967762	f	\N
246	[{"x":0.6117,"y":0.89},{"x":0.4833,"y":0.5387},{"x":0.4883,"y":0.4437},{"x":0.5483,"y":0.2},{"x":0.5733,"y":0.1212}]	169	2020-07-05 20:00:23.895763	2020-07-05 20:49:38.169032	f	\N
226	[{"x":0.6867,"y":0.895},{"x":0.5967,"y":0.53},{"x":0.415,"y":0.0725}]	212	2020-07-05 20:00:22.197966	2020-07-05 21:01:43.23582	f	\N
232	[{"x":0.595,"y":0.8962},{"x":0.52,"y":0.4288},{"x":0.535,"y":0.0712}]	215	2020-07-05 20:00:22.83111	2020-07-05 20:51:00.345056	f	\N
230	[{"x":0.4817,"y":0.805},{"x":0.52,"y":0.3538},{"x":0.4617,"y":0.1537}]	151	2020-07-05 20:00:22.674697	2020-07-05 20:53:01.832122	f	\N
253	[{"x":0.5467,"y":0.8975},{"x":0.4967,"y":0.3937},{"x":0.46,"y":0.0712}]	141	2020-07-05 20:00:24.405026	2020-07-05 20:55:22.041861	f	\N
260	[{"x":0.5683,"y":0.87},{"x":0.565,"y":0.46},{"x":0.53,"y":0.155}]	150	2020-07-05 20:00:24.949955	2020-07-05 20:53:52.404558	f	\N
240	[{"x":0.4867,"y":0.8575},{"x":0.4317,"y":0.4113},{"x":0.575,"y":0.1537}]	159	2020-07-05 20:00:23.512448	2020-07-05 20:44:12.466362	f	\N
254	[{"x":0.515,"y":0.8825},{"x":0.4717,"y":0.6312},{"x":0.555,"y":0.37},{"x":0.6317,"y":0.0988}]	216	2020-07-05 20:00:24.467166	2020-07-05 20:50:39.727558	f	\N
247	[{"x":0.5583,"y":0.845},{"x":0.48,"y":0.5425},{"x":0.6267,"y":0.2762},{"x":0.645,"y":0.1363}]	158	2020-07-05 20:00:23.973393	2020-07-05 20:45:45.703562	f	\N
263	[{"x":0.4567,"y":0.7638},{"x":0.51,"y":0.5313},{"x":0.6467,"y":0.41},{"x":0.755,"y":0.3362},{"x":0.7917,"y":0.2062}]	175	2020-07-05 20:00:25.130154	2020-07-05 20:39:26.079322	f	\N
225	[{"x":0.52,"y":0.8712},{"x":0.475,"y":0.6225},{"x":0.4467,"y":0.4662},{"x":0.5617,"y":0.3725},{"x":0.575,"y":0.1963}]	174	2020-07-05 19:59:51.026596	2020-07-05 20:41:35.67124	f	\N
233	[{"x":0.3767,"y":0.8475},{"x":0.4067,"y":0.5363},{"x":0.4233,"y":0.1313}]	173	2020-07-05 20:00:22.940122	2020-07-05 20:42:56.896923	f	\N
237	[{"x":0.5967,"y":0.8488},{"x":0.63,"y":0.4425},{"x":0.5083,"y":0.265},{"x":0.4617,"y":0.0638}]	160	2020-07-05 20:00:23.240223	2020-07-05 20:43:35.314439	f	\N
250	[{"x":0.5633,"y":0.8125},{"x":0.5733,"y":0.5112},{"x":0.4417,"y":0.195}]	157	2020-07-05 20:00:24.200784	2020-07-05 20:46:26.696137	f	\N
261	[{"x":0.5133,"y":0.8688},{"x":0.5083,"y":0.5075},{"x":0.475,"y":0.15}]	155	2020-07-05 20:00:25.013763	2020-07-05 20:52:07.44383	f	\N
227	[{"x":0.525,"y":0.9087},{"x":0.5783,"y":0.415},{"x":0.5033,"y":0.1837},{"x":0.5633,"y":0.085}]	214	2020-07-05 20:00:22.395586	2020-07-05 20:51:30.282205	f	\N
256	[{"x":0.605,"y":0.8413},{"x":0.6733,"y":0.5925},{"x":0.5917,"y":0.395},{"x":0.4317,"y":0.28},{"x":0.275,"y":0.1837}]	156	2020-07-05 20:00:24.600909	2020-07-05 20:52:39.119319	f	\N
229	[{"x":0.5067,"y":0.93},{"x":0.4033,"y":0.4738},{"x":0.555,"y":0.1087}]	153	2020-07-05 20:00:22.587219	2020-07-05 20:53:33.457952	f	\N
257	[{"x":0.4883,"y":0.9675},{"x":0.4417,"y":0.4763},{"x":0.53,"y":0.2687},{"x":0.4667,"y":0.07}]	140	2020-07-05 20:00:24.674593	2020-07-05 20:54:43.695953	f	\N
244	[{"x":0.4233,"y":0.9475},{"x":0.4633,"y":0.675},{"x":0.64,"y":0.3825},{"x":0.675,"y":0.055}]	142	2020-07-05 20:00:23.757752	2020-07-05 20:56:08.651943	f	\N
242	[{"x":0.6017,"y":0.9337},{"x":0.555,"y":0.2637},{"x":0.5333,"y":0.0425}]	139	2020-07-05 20:00:23.641112	2020-07-05 20:56:28.026397	f	\N
249	[{"x":0.435,"y":0.965},{"x":0.4867,"y":0.6188},{"x":0.6833,"y":0.37},{"x":0.7133,"y":0.12}]	134	2020-07-05 20:00:24.076408	2020-07-05 20:57:13.173349	f	\N
243	[{"x":0.56,"y":0.88},{"x":0.5233,"y":0.37},{"x":0.5033,"y":0.0612}]	129	2020-07-05 20:00:23.705781	2020-07-05 20:57:52.819884	f	\N
252	[{"x":0.57,"y":0.8475},{"x":0.5883,"y":0.6238},{"x":0.4417,"y":0.4075},{"x":0.43,"y":0.1812}]	130	2020-07-05 20:00:24.343704	2020-07-05 20:58:27.140479	f	\N
259	[{"x":0.5733,"y":0.8688},{"x":0.34,"y":0.4288},{"x":0.4483,"y":0.1225}]	204	2020-07-05 20:00:24.8884	2020-07-05 20:59:22.910444	f	\N
231	[{"x":0.5733,"y":0.9163},{"x":0.5617,"y":0.3688},{"x":0.4667,"y":0.0825}]	208	2020-07-05 20:00:22.774222	2020-07-05 20:59:59.497821	f	\N
228	[{"x":0.1713,"y":0.9617},{"x":0.2537,"y":0.5},{"x":0.5475,"y":0.3883},{"x":0.7087,"y":0.3717},{"x":0.805,"y":0.16}]	209	2020-07-05 20:00:22.460859	2020-07-05 21:00:38.433076	f	\N
255	[{"x":0.52,"y":0.9525},{"x":0.545,"y":0.5138},{"x":0.64,"y":0.0013}]	211	2020-07-05 20:00:24.524308	2020-07-05 21:01:25.976397	f	\N
318	[{"x":0.7125,"y":0.7933},{"x":0.6875,"y":0.4333},{"x":0.65,"y":0.26}]	128	2020-09-03 20:43:16.256737	2020-10-22 08:22:39.577703	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.018706090746503663","GPSTimeStamp":"2020-09-01T13:05:40Z","GPSImgDirection":"111.61694153000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6625549999999998","GPSLatitude":"48.463046670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.799999999999997","GPSHPositioningError":"10.033350703491402","DateCreated":"2020-09-01T15:05:39+02:00"}}}}
324	[{"x":0.6038,"y":0.78},{"x":0.58,"y":0.405},{"x":0.58,"y":0.1767}]	28	2020-09-03 20:43:17.160889	2020-10-22 16:20:54.073055	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.039670463620696907","GPSTimeStamp":"2020-09-01T14:15:29Z","GPSImgDirection":"180.45736698000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631916699999998","GPSLatitude":"48.462161670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.200000000000003","GPSHPositioningError":"8.0463432609355348","DateCreated":"2020-09-01T16:15:28+02:00"}}}}
326	[{"x":0.6925,"y":0.9},{"x":0.6913,"y":0.4867},{"x":0.6875,"y":0.2133}]	194	2020-09-03 20:43:17.350891	2020-10-22 17:06:49.187211	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.058897156270842896","GPSTimeStamp":"2020-09-01T15:53:24Z","GPSImgDirection":"80.443298340000013","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634783299999998","GPSLatitude":"48.462125","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.400000000000006","GPSHPositioningError":"5.645715267044479","DateCreated":"2020-09-01T17:53:23+02:00"}}}}
314	[{"x":0.5925,"y":0.7917},{"x":0.595,"y":0.51},{"x":0.5775,"y":0.31},{"x":0.5687,"y":0.2133}]	154	2020-09-03 20:43:15.577919	2020-10-22 17:28:14.99357	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010091121308486545","GPSTimeStamp":"2020-09-01T16:30:23Z","GPSImgDirection":"173.28211991000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635333299999995","GPSLatitude":"48.462630000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96","GPSHPositioningError":"7.9926532190500739","DateCreated":"2020-09-01T18:30:22+02:00"}}}}
293	[{"x":0.5687,"y":0.8383},{"x":0.575,"y":0.6417},{"x":0.4988,"y":0.3583},{"x":0.46,"y":0.24}]	55	2020-09-03 20:43:12.79275	2020-10-22 16:47:50.377763	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11071044208701972","GPSTimeStamp":"2020-09-01T15:05:00Z","GPSImgDirection":"317.51951600000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641866700000003","GPSLatitude":"48.460799999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.900000000000006","GPSHPositioningError":"5.3056777289084369","DateCreated":"2020-09-01T17:05:00+02:00"}}}}
495	[{"x":0.6863,"y":0.79},{"x":0.685,"y":0.52},{"x":0.5663,"y":0.1283}]	411	2020-10-19 21:46:52.965584	2020-10-19 21:47:14.804112	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.02714896761450029","GPSTimeStamp":"2020-10-18T14:53:19Z","GPSImgDirection":"331.02767920999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379866700000001","GPSLatitude":"48.447361669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.900000000000006","GPSHPositioningError":"16.497946963216425","DateCreated":"2020-10-18T16:53:19+02:00"}}}}
428	[{"x":0.4988,"y":0.8083},{"x":0.4888,"y":0.5733},{"x":0.4838,"y":0.29},{"x":0.5188,"y":0.1383}]	242	2020-09-03 20:43:32.382498	2020-10-22 16:49:34.452259	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.24529595667282642","GPSTimeStamp":"2020-09-01T15:14:12Z","GPSImgDirection":"137.74995039000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638700000000002","GPSLatitude":"48.461120000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.200000000000003","GPSHPositioningError":"7.4783245459871122","DateCreated":"2020-09-01T17:14:11+02:00"}}}}
315	[{"x":0.4925,"y":0.8283},{"x":0.475,"y":0.6917},{"x":0.4875,"y":0.3967},{"x":0.5088,"y":0.18}]	121	2020-09-03 20:43:15.704623	2020-10-22 16:52:15.18831	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.031640324750192163","GPSTimeStamp":"2020-09-01T15:17:56Z","GPSImgDirection":"184.72368624000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637116700000001","GPSLatitude":"48.461216670000013","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.200000000000003","GPSHPositioningError":"12.349507129868886","DateCreated":"2020-09-01T17:17:55+02:00"}}}}
496	[{"x":0.4387,"y":0.7767},{"x":0.4,"y":0.335},{"x":0.3987,"y":0.2467}]	497	2020-10-19 21:47:41.880387	2020-10-19 21:48:06.740141	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.088585607707087052","GPSTimeStamp":"2020-10-18T14:56:49Z","GPSImgDirection":"243.21298220999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.63890833","GPSLatitude":"48.44731333","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90","GPSHPositioningError":"14.503445706835537","DateCreated":"2020-10-18T16:56:49+02:00"}}}}
497	[{"x":0.5175,"y":0.8267},{"x":0.54,"y":0.4433},{"x":0.585,"y":0.0983}]	496	2020-10-19 21:48:23.901163	2020-10-19 21:48:43.174619	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.050244245685535205","GPSTimeStamp":"2020-10-18T14:58:16Z","GPSImgDirection":"13.988250729999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6387799999999997","GPSLatitude":"48.447303329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.299999999999997","GPSHPositioningError":"9.5861615117044288","DateCreated":"2020-10-18T16:58:16+02:00"}}}}
498	[{"x":0.3912,"y":0.825},{"x":0.4037,"y":0.4183},{"x":0.4025,"y":0.16}]	465	2020-10-19 21:49:06.810049	2020-10-19 21:49:35.967603	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.057265579715529924","GPSTimeStamp":"2020-10-18T15:00:02Z","GPSImgDirection":"310.31036384000009","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6389383299999998","GPSLatitude":"48.447220000000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.200000000000003","GPSHPositioningError":"10.528830806065443","DateCreated":"2020-10-18T17:00:02+02:00"}}}}
499	[{"x":0.3063,"y":0.93},{"x":0.3463,"y":0.63},{"x":0.4713,"y":0.355},{"x":0.625,"y":0.1067}]	422	2020-10-19 21:50:01.830685	2020-10-19 21:50:21.744742	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.015429579662481697","GPSTimeStamp":"2020-10-18T15:02:38Z","GPSImgDirection":"101.25133033","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6389916700000002","GPSLatitude":"48.447303329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.200000000000003","GPSHPositioningError":"5.0407586632457537","DateCreated":"2020-10-18T17:02:37+02:00"}}}}
439	[{"x":0.5687,"y":0.8083},{"x":0.575,"y":0.4867},{"x":0.565,"y":0.1917}]	20	2020-09-03 20:43:34.142284	2020-10-22 16:58:53.891305	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.061494074727580533","GPSTimeStamp":"2020-09-01T15:37:08Z","GPSImgDirection":"172.25637834000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637300000000002","GPSLatitude":"48.461741670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.200000000000003","GPSHPositioningError":"4.5619078311311636","DateCreated":"2020-09-01T17:37:07+02:00"}}}}
501	[{"x":0.425,"y":0.8117},{"x":0.4288,"y":0.4817},{"x":0.425,"y":0.1917},{"x":0.4175,"y":0.1417}]	478	2020-10-19 21:51:38.373555	2020-10-19 21:51:58.424568	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.091703087110289683","GPSTimeStamp":"2020-10-18T15:05:04Z","GPSImgDirection":"150.34474175","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6391300000000002","GPSLatitude":"48.447188330000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.299999999999997","GPSHPositioningError":"25.832432194821749","DateCreated":"2020-10-18T17:05:03+02:00"}}}}
500	[{"x":0.7937,"y":0.9767},{"x":0.8013,"y":0.5483},{"x":0.7612,"y":0.185},{"x":0.7375,"y":0.08}]	466	2020-10-19 21:50:58.540016	2020-10-19 21:51:22.724708	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.015429579662481697","GPSTimeStamp":"2020-10-18T15:02:38Z","GPSImgDirection":"101.25133033","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6389916700000002","GPSLatitude":"48.447303329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.200000000000003","GPSHPositioningError":"5.0407586632457537","DateCreated":"2020-10-18T17:02:37+02:00"}}}}
397	[{"x":0.3337,"y":0.7417},{"x":0.3862,"y":0.495},{"x":0.4037,"y":0.3233},{"x":0.4512,"y":0.2133},{"x":0.4975,"y":0.1283}]	122	2020-09-03 20:43:27.927183	2020-10-22 16:50:03.234472	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.31038084635577728","GPSTimeStamp":"2020-09-01T15:15:41Z","GPSImgDirection":"159.06182090999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636383299999999","GPSLatitude":"48.461220000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.099999999999994","GPSHPositioningError":"5.7552511083654334","DateCreated":"2020-09-01T17:15:40+02:00"}}}}
274	[{"x":0.64,"y":0.73},{"x":0.66,"y":0.46},{"x":0.6587,"y":0.2217}]	239	2020-09-03 20:43:10.026726	2020-10-22 16:53:57.76362	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.57298487404569243","GPSTimeStamp":"2020-09-01T15:24:04Z","GPSImgDirection":"213.46614835999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637549999999997","GPSLatitude":"48.461395000000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.299999999999997","GPSHPositioningError":"12.21033234191129","DateCreated":"2020-09-01T17:24:04+02:00"}}}}
335	[{"x":0.3312,"y":0.845},{"x":0.3875,"y":0.6267},{"x":0.4763,"y":0.3833},{"x":0.5138,"y":0.1683}]	118	2020-09-03 20:43:18.951922	2020-10-22 16:54:59.176466	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11432502427970219","GPSTimeStamp":"2020-09-01T15:27:34Z","GPSImgDirection":"257.41210937999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638500000000001","GPSLatitude":"48.461261670000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95","GPSHPositioningError":"12.363679961633762","DateCreated":"2020-09-01T17:27:33+02:00"}}}}
375	[{"x":0.5713,"y":0.805},{"x":0.5387,"y":0.4717},{"x":0.5387,"y":0.155}]	88	2020-09-03 20:43:24.598253	2020-10-22 17:02:27.798705	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11140376330885472","GPSTimeStamp":"2020-09-01T15:40:35Z","GPSImgDirection":"139.03238296000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637416700000007","GPSLatitude":"48.461913330000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.400000000000006","GPSHPositioningError":"8.7184142835527307","DateCreated":"2020-09-01T17:40:34+02:00"}}}}
406	[{"x":0.605,"y":0.8383},{"x":0.62,"y":0.4567},{"x":0.6262,"y":0.1667}]	191	2020-09-03 20:43:29.102152	2020-10-22 17:09:05.770729	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012782710601934298","GPSTimeStamp":"2020-09-01T15:59:35Z","GPSImgDirection":"179.78369906","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633749999999998","GPSLatitude":"48.462228330000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.099999999999994","GPSHPositioningError":"6.6366385484641093","DateCreated":"2020-09-01T17:59:34+02:00"}}}}
389	[{"x":0.55,"y":0.7983},{"x":0.5262,"y":0.5967},{"x":0.4813,"y":0.3517},{"x":0.485,"y":0.1483}]	185	2020-09-03 20:43:26.719561	2020-10-22 17:09:26.918801	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.019792985178228736","GPSTimeStamp":"2020-09-01T16:00:13Z","GPSImgDirection":"206.56737518","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634366699999998","GPSLatitude":"48.462216670000011","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"13.012424503882658","DateCreated":"2020-09-01T18:00:12+02:00"}}}}
323	[{"x":0.58,"y":0.8033},{"x":0.625,"y":0.5883},{"x":0.695,"y":0.485},{"x":0.7075,"y":0.3267},{"x":0.705,"y":0.2717}]	233	2020-09-03 20:43:17.048019	2020-10-22 17:09:46.716599	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.019792985178228736","GPSTimeStamp":"2020-09-01T16:00:13Z","GPSImgDirection":"206.56737518","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634366699999998","GPSLatitude":"48.462216670000011","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"13.012424503882658","DateCreated":"2020-09-01T18:00:12+02:00"}}}}
385	[{"x":0.4675,"y":0.7617},{"x":0.4525,"y":0.5233},{"x":0.48,"y":0.2}]	180	2020-09-03 20:43:26.048919	2020-10-22 17:10:59.024483	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.076863460223387275","GPSTimeStamp":"2020-09-01T16:04:09Z","GPSImgDirection":"17.764648440000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634116700000003","GPSLatitude":"48.462208329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97","GPSHPositioningError":"9.1920039980009989","DateCreated":"2020-09-01T18:04:09+02:00"}}}}
502	[{"x":0.48,"y":0.8383},{"x":0.4725,"y":0.5833},{"x":0.4825,"y":0.4283},{"x":0.5088,"y":0.245},{"x":0.5363,"y":0.115}]	477	2020-10-19 21:52:18.619209	2020-10-19 21:52:39.180495	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.028580306106596242","GPSTimeStamp":"2020-10-18T15:05:52Z","GPSImgDirection":"94.890315049999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6391616700000005","GPSLatitude":"48.447138329999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.299999999999997","GPSHPositioningError":"9.420692928334125","DateCreated":"2020-10-18T17:05:51+02:00"}}}}
352	[{"x":0.4037,"y":0.8533},{"x":0.4075,"y":0.605},{"x":0.4225,"y":0.4383},{"x":0.3412,"y":0.305},{"x":0.3538,"y":0.2083}]	120	2020-09-03 20:43:21.379969	2020-10-22 16:51:27.735615	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.039257347598406461","GPSTimeStamp":"2020-09-01T15:16:34Z","GPSImgDirection":"101.69729515000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635916700000002","GPSLatitude":"48.46125","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97","GPSHPositioningError":"15.882587631803933","DateCreated":"2020-09-01T17:16:33+02:00"}}}}
267	[{"x":0.365,"y":0.8783},{"x":0.3475,"y":0.7333},{"x":0.3862,"y":0.525},{"x":0.4363,"y":0.3767},{"x":0.5162,"y":0.215},{"x":0.5475,"y":0.1283}]	112	2020-09-03 20:43:09.066618	2020-10-22 16:52:53.04437	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.19659231592420842","GPSTimeStamp":"2020-09-01T15:19:25Z","GPSImgDirection":"50.09347537","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634283299999999","GPSLatitude":"48.461404999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.299999999999997","GPSHPositioningError":"5.0551461656814318","DateCreated":"2020-09-01T17:19:24+02:00"}}}}
333	[{"x":0.5813,"y":0.8},{"x":0.5575,"y":0.4133},{"x":0.5337,"y":0.1633}]	115	2020-09-03 20:43:18.426828	2020-10-22 16:55:23.898945	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.21003292482165725","GPSTimeStamp":"2020-09-01T15:28:26Z","GPSImgDirection":"231.92158515999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637999999999997","GPSLatitude":"48.461328330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"5.930072142766738","DateCreated":"2020-09-01T17:28:26+02:00"}}}}
287	[{"x":0.47,"y":0.7617},{"x":0.4825,"y":0.3467},{"x":0.4888,"y":0.155}]	123	2020-09-03 20:43:11.915017	2020-10-22 16:56:20.915135	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.15290364622798774","GPSTimeStamp":"2020-09-01T15:31:08Z","GPSImgDirection":"139.82210928000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638383299999999","GPSLatitude":"48.461638330000007","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.799999999999997","GPSHPositioningError":"6.3268458274398869","DateCreated":"2020-09-01T17:31:08+02:00"}}}}
306	[{"x":0.5925,"y":0.815},{"x":0.5188,"y":0.5933},{"x":0.4875,"y":0.4033},{"x":0.4425,"y":0.2633}]	21	2020-09-03 20:43:14.644759	2020-10-22 17:01:52.896252	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.17293882374329606","GPSTimeStamp":"2020-09-01T15:40:05Z","GPSImgDirection":"128.37382885999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637033299999997","GPSLatitude":"48.461886669999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.700000000000003","GPSHPositioningError":"3.9067762971363766","DateCreated":"2020-09-01T17:40:05+02:00"}}}}
451	[{"x":0.5038,"y":0.81},{"x":0.495,"y":0.4667},{"x":0.5038,"y":0.1233}]	89	2020-09-03 20:45:14.587615	2020-10-22 17:03:04.400209	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.45097115624393896","GPSTimeStamp":"2020-09-01T15:41:06Z","GPSImgDirection":"180.33879093000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637999999999997","GPSLatitude":"48.461916670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.299999999999997","GPSHPositioningError":"9.1801792828685258","DateCreated":"2020-09-01T17:41:06+02:00"}}}}
363	[{"x":0.5725,"y":0.7633},{"x":0.5913,"y":0.435},{"x":0.595,"y":0.1717}]	27	2020-09-03 20:43:22.909369	2020-10-22 17:08:46.338973	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11389227962858829","GPSTimeStamp":"2020-09-01T15:58:24Z","GPSImgDirection":"56.671112070000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632866700000006","GPSLatitude":"48.462186670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.700000000000003","GPSHPositioningError":"8.6110228716645487","DateCreated":"2020-09-01T17:58:23+02:00"}}}}
353	[{"x":0.5212,"y":0.8183},{"x":0.5212,"y":0.475},{"x":0.5,"y":0.2433},{"x":0.4838,"y":0.1433}]	166	2020-09-03 20:43:21.636651	2020-10-22 17:14:44.70424	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.077524565207362645","GPSTimeStamp":"2020-09-01T16:13:04Z","GPSImgDirection":"4.5338745099999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635783299999995","GPSLatitude":"48.462379999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.099999999999994","GPSHPositioningError":"9.1925255646288537","DateCreated":"2020-09-01T18:13:04+02:00"}}}}
503	[{"x":0.3837,"y":0.8667},{"x":0.3837,"y":0.4433},{"x":0.4113,"y":0.1583}]	506	2020-10-19 21:52:57.926932	2020-10-19 21:53:20.925375	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.059276506331989325","GPSTimeStamp":"2020-10-18T15:06:54Z","GPSImgDirection":"346.16073619999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6391633300000001","GPSLatitude":"48.447066670000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.799999999999997","GPSHPositioningError":"10.112441156691325","DateCreated":"2020-10-18T17:06:53+02:00"}}}}
316	[{"x":0.5837,"y":0.7933},{"x":0.5663,"y":0.6417},{"x":0.58,"y":0.48},{"x":0.5513,"y":0.38},{"x":0.5262,"y":0.29},{"x":0.5537,"y":0.1383}]	113	2020-09-03 20:43:15.883583	2020-10-22 16:52:36.188869	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.19659231592420842","GPSTimeStamp":"2020-09-01T15:19:25Z","GPSImgDirection":"50.09347537","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634283299999999","GPSLatitude":"48.461404999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.299999999999997","GPSHPositioningError":"5.0551461656814318","DateCreated":"2020-09-01T17:19:24+02:00"}}}}
442	[{"x":0.5062,"y":0.805},{"x":0.4963,"y":0.5167},{"x":0.5212,"y":0.265},{"x":0.5238,"y":0.1}]	86	2020-09-03 20:45:13.195164	2020-10-22 16:58:16.121294	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11092346161853146","GPSTimeStamp":"2020-09-01T15:35:27Z","GPSImgDirection":"251.26528926","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66393667","GPSLatitude":"48.461800000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.900000000000006","GPSHPositioningError":"4.8190930204131526","DateCreated":"2020-09-01T17:35:26+02:00"}}}}
504	[{"x":0.6763,"y":0.84},{"x":0.67,"y":0.5167},{"x":0.665,"y":0.3167},{"x":0.6512,"y":0.2533}]	479	2020-10-19 21:53:46.595686	2020-10-19 21:54:05.88851	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.059276506331989325","GPSTimeStamp":"2020-10-18T15:06:54Z","GPSImgDirection":"346.16073619999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6391633300000001","GPSLatitude":"48.447066670000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.799999999999997","GPSHPositioningError":"10.112441156691325","DateCreated":"2020-10-18T17:06:53+02:00"}}}}
506	[{"x":0.3987,"y":0.7817},{"x":0.4063,"y":0.4333},{"x":0.4225,"y":0.1133}]	475	2020-10-19 21:56:23.370699	2020-10-19 21:56:56.098254	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.023874064922212595","GPSTimeStamp":"2020-10-18T15:12:07Z","GPSImgDirection":"28.166076650000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6390549999999999","GPSLatitude":"48.447086670000012","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"88.700000000000003","GPSHPositioningError":"5.6419422941590431","DateCreated":"2020-10-18T17:12:06+02:00"}}}}
412	[{"x":0.4775,"y":0.885},{"x":0.4412,"y":0.5167},{"x":0.4475,"y":0.1817}]	193	2020-09-03 20:43:29.884973	2020-10-22 17:07:29.148664	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.018477449202454681","GPSTimeStamp":"2020-09-01T15:54:54Z","GPSImgDirection":"303.8252714699999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634049999999996","GPSLatitude":"48.462070000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98","GPSHPositioningError":"5.2221413957717662","DateCreated":"2020-09-01T17:54:54+02:00"}}}}
422	[{"x":0.6312,"y":0.8167},{"x":0.6338,"y":0.3267},{"x":0.6125,"y":0.1617}]	186	2020-09-03 20:43:31.523419	2020-10-22 17:07:46.697124	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.071529552318056619","GPSTimeStamp":"2020-09-01T15:56:13Z","GPSImgDirection":"144.82843792","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633699999999996","GPSLatitude":"48.462070000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.900000000000006","GPSHPositioningError":"4.8832338464760712","DateCreated":"2020-09-01T17:56:12+02:00"}}}}
273	[{"x":0.5537,"y":0.8283},{"x":0.5337,"y":0.55},{"x":0.5225,"y":0.2333}]	192	2020-09-03 20:43:09.91377	2020-10-22 17:08:13.92129	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.22566017508085809","GPSTimeStamp":"2020-09-01T15:57:08Z","GPSImgDirection":"76.837219250000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632666699999996","GPSLatitude":"48.46213667","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.099999999999994","GPSHPositioningError":"4.3336347197106688","DateCreated":"2020-09-01T17:57:07+02:00"}}}}
286	[{"x":0.5975,"y":0.245},{"x":0.6587,"y":0.3567},{"x":0.6512,"y":0.4867},{"x":0.5825,"y":0.605},{"x":0.46,"y":0.66},{"x":0.3613,"y":0.6717}]	26	2020-09-03 20:43:11.832075	2020-10-22 17:08:30.629165	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0049835224646217618","GPSTimeStamp":"2020-09-01T15:57:49Z","GPSImgDirection":"5.2379455600000009","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633049999999998","GPSLatitude":"48.462146670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"10.988661274472749","DateCreated":"2020-09-01T17:57:49+02:00"}}}}
505	[{"x":0.5425,"y":0.885},{"x":0.5587,"y":0.62},{"x":0.5,"y":0.3517},{"x":0.4525,"y":0.1483}]	476	2020-10-19 21:55:06.277444	2020-10-19 21:56:02.693855	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.041779741646286561","GPSTimeStamp":"2020-10-18T15:09:07Z","GPSImgDirection":"73.654449450000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6390800000000003","GPSLatitude":"48.447021670000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.299999999999997","GPSHPositioningError":"7.0256808854620072","DateCreated":"2020-10-18T17:09:06+02:00"}}}}
265	[{"x":0.6737,"y":0.7583},{"x":0.61,"y":0.5833},{"x":0.5275,"y":0.4083},{"x":0.4875,"y":0.2683},{"x":0.4338,"y":0.2367}]	195	2020-09-03 19:26:29.409872	2020-10-22 07:55:09.559066	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.019590001552799639","GPSTimeStamp":"2020-09-01T09:23:12Z","GPSImgDirection":"162.30752572","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6644083299999997","GPSLatitude":"48.462630000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.799999999999997","GPSHPositioningError":"4.7281319814401099","DateCreated":"2020-09-01T11:23:11+02:00"}}}}
475	[{"x":0.4938,"y":0.68},{"x":0.515,"y":0.4283},{"x":0.495,"y":0.2717}]	175	2020-09-03 20:47:14.734561	2020-10-22 07:57:31.68864	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0035671633635930783","GPSTimeStamp":"2020-09-01T09:26:30Z","GPSImgDirection":"47.465637230000013","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66432","GPSLatitude":"48.462788329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.799999999999997","GPSHPositioningError":"10.566194262011752","DateCreated":"2020-09-01T11:26:30+02:00"}}}}
311	[{"x":0.4738,"y":0.735},{"x":0.48,"y":0.4917},{"x":0.5275,"y":0.31},{"x":0.5337,"y":0.245}]	172	2020-09-03 20:43:15.274958	2020-10-22 07:59:39.322364	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12778234475780956","GPSTimeStamp":"2020-09-01T09:50:16Z","GPSImgDirection":"232.56666565","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66431167","GPSLatitude":"48.462661670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93","GPSHPositioningError":"16.66792463002399","DateCreated":"2020-09-01T11:50:15+02:00"}}}}
300	[{"x":0.6188,"y":0.7183},{"x":0.6312,"y":0.3483},{"x":0.6038,"y":0.2433}]	220	2020-09-03 20:43:13.698263	2020-10-22 08:00:15.742448	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12778234475780956","GPSTimeStamp":"2020-09-01T09:50:16Z","GPSImgDirection":"232.56666565","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66431167","GPSLatitude":"48.462661670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93","GPSHPositioningError":"16.66792463002399","DateCreated":"2020-09-01T11:50:15+02:00"}}}}
275	[{"x":0.5913,"y":0.8033},{"x":0.5425,"y":0.455},{"x":0.5625,"y":0.2083}]	174	2020-09-03 20:43:10.117387	2020-10-22 08:00:42.1234	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.029905255883599581","GPSTimeStamp":"2020-09-01T09:53:09Z","GPSImgDirection":"270.81240839999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66431167","GPSLatitude":"48.462628329999987","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.900000000000006","GPSHPositioningError":"5.4790813458604353","DateCreated":"2020-09-01T11:53:08+02:00"}}}}
308	[{"x":0.2425,"y":0.8817},{"x":0.235,"y":0.355},{"x":0.2725,"y":0.1333}]	173	2020-09-03 20:43:14.81373	2020-10-22 08:01:04.775631	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.029905255883599581","GPSTimeStamp":"2020-09-01T09:53:09Z","GPSImgDirection":"270.81240839999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66431167","GPSLatitude":"48.462628329999987","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.900000000000006","GPSHPositioningError":"5.4790813458604353","DateCreated":"2020-09-01T11:53:08+02:00"}}}}
307	[{"x":0.6325,"y":0.8517},{"x":0.575,"y":0.5667},{"x":0.4238,"y":0.5067},{"x":0.3275,"y":0.4183},{"x":0.3638,"y":0.1917}]	85	2020-09-03 20:43:14.714869	2020-10-22 08:01:26.233271	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.035232372575315987","GPSTimeStamp":"2020-09-01T09:53:21Z","GPSImgDirection":"313.86953728000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6643300000000001","GPSLatitude":"48.462638329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92","GPSHPositioningError":"5.2180690443156781","DateCreated":"2020-09-01T11:53:21+02:00"}}}}
272	[{"x":0.6012,"y":0.715},{"x":0.5212,"y":0.5033},{"x":0.4875,"y":0.3583},{"x":0.51,"y":0.2867}]	176	2020-09-03 20:43:09.802016	2020-10-22 08:02:02.674842	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.024772532296343609","GPSTimeStamp":"2020-09-01T10:03:02Z","GPSImgDirection":"174.96537795999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641583299999998","GPSLatitude":"48.462630000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.299999999999997","GPSHPositioningError":"4.7580126056054715","DateCreated":"2020-09-01T12:03:01+02:00"}}}}
387	[{"x":0.4875,"y":0.8167},{"x":0.52,"y":0.455},{"x":0.6025,"y":0.1717}]	158	2020-09-03 20:43:26.290592	2020-10-22 08:03:38.354892	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0084827113958236","GPSTimeStamp":"2020-09-01T10:08:08Z","GPSImgDirection":"142.39834982999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638999999999999","GPSLatitude":"48.462738330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"4.2584955158318589","DateCreated":"2020-09-01T12:08:07+02:00"}}}}
347	[{"x":0.3625,"y":0.79},{"x":0.3713,"y":0.4183},{"x":0.3812,"y":0.215},{"x":0.4188,"y":0.165}]	159	2020-09-03 20:43:20.856688	2020-10-22 08:04:14.793489	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.011668536810832495","GPSTimeStamp":"2020-09-01T10:10:13Z","GPSImgDirection":"146.02148438","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6639250000000003","GPSLatitude":"48.462769999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.200000000000003","GPSHPositioningError":"9.2059849600744244","DateCreated":"2020-09-01T12:10:13+02:00"}}}}
465	[{"x":0.5075,"y":0.7717},{"x":0.5162,"y":0.6567},{"x":0.355,"y":0.6067},{"x":0.2162,"y":0.555},{"x":0.2087,"y":0.3767},{"x":0.2787,"y":0.2717}]	149	2020-09-03 20:47:11.515127	2020-10-22 08:06:46.068942	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.019751429571711988","GPSTimeStamp":"2020-09-01T11:05:06Z","GPSImgDirection":"338.11833171999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634783299999998","GPSLatitude":"48.462978329999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.599999999999994","GPSHPositioningError":"4.2553576272719056","DateCreated":"2020-09-01T13:05:06+02:00"}}}}
313	[{"x":0.495,"y":0.785},{"x":0.4988,"y":0.36},{"x":0.5313,"y":0.1767}]	147	2020-09-03 20:43:15.481285	2020-10-22 08:10:59.489228	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.054441388670619338","GPSTimeStamp":"2020-09-01T11:31:59Z","GPSImgDirection":"67.872406060000017","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632166700000006","GPSLatitude":"48.463055000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.200000000000003","GPSHPositioningError":"4.2494566693833198","DateCreated":"2020-09-01T13:31:58+02:00"}}}}
433	[{"x":0.5175,"y":0.795},{"x":0.5313,"y":0.4117},{"x":0.5062,"y":0.1533}]	143	2020-09-03 20:43:33.26214	2020-10-22 08:11:24.081154	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0018275622260678301","GPSTimeStamp":"2020-09-01T11:33:23Z","GPSImgDirection":"307.16761769000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634000000000002","GPSLatitude":"48.463013330000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.5","GPSHPositioningError":"4.2002902584966035","DateCreated":"2020-09-01T13:33:22+02:00"}}}}
380	[{"x":0.6112,"y":0.7567},{"x":0.61,"y":0.4783},{"x":0.6125,"y":0.22},{"x":0.585,"y":0.1583}]	223	2020-09-03 20:43:25.309849	2020-10-22 08:11:49.613422	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0018275622260678301","GPSTimeStamp":"2020-09-01T11:33:23Z","GPSImgDirection":"307.16761769000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634000000000002","GPSLatitude":"48.463013330000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.5","GPSHPositioningError":"4.2002902584966035","DateCreated":"2020-09-01T13:33:22+02:00"}}}}
472	[{"x":0.285,"y":0.7817},{"x":0.2925,"y":0.5517},{"x":0.3675,"y":0.3783},{"x":0.3762,"y":0.1783}]	144	2020-09-03 20:47:13.940905	2020-10-22 08:12:14.120328	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0031289604957932989","GPSTimeStamp":"2020-09-01T11:35:19Z","GPSImgDirection":"200.92263792000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633666700000003","GPSLatitude":"48.463108329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.400000000000006","GPSHPositioningError":"4.1334751063297475","DateCreated":"2020-09-01T13:35:19+02:00"}}}}
394	[{"x":0.5225,"y":0.755},{"x":0.535,"y":0.53},{"x":0.4587,"y":0.3283},{"x":0.4675,"y":0.21}]	145	2020-09-03 20:43:27.330896	2020-10-22 08:12:30.530359	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0031289604957932989","GPSTimeStamp":"2020-09-01T11:35:19Z","GPSImgDirection":"200.92263792000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633666700000003","GPSLatitude":"48.463108329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.400000000000006","GPSHPositioningError":"4.1334751063297475","DateCreated":"2020-09-01T13:35:19+02:00"}}}}
404	[{"x":0.8788,"y":0.5583},{"x":0.7638,"y":0.5667},{"x":0.6512,"y":0.54},{"x":0.58,"y":0.5383},{"x":0.5088,"y":0.5083},{"x":0.39,"y":0.5417},{"x":0.2575,"y":0.5767},{"x":0.1537,"y":0.5517}]	146	2020-09-03 20:43:28.905181	2020-10-22 08:13:00.747519	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0031289604957932989","GPSTimeStamp":"2020-09-01T11:35:19Z","GPSImgDirection":"200.92263792000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633666700000003","GPSLatitude":"48.463108329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.400000000000006","GPSHPositioningError":"4.1334751063297475","DateCreated":"2020-09-01T13:35:19+02:00"}}}}
340	[{"x":0.5938,"y":0.83},{"x":0.5938,"y":0.47},{"x":0.5375,"y":0.315},{"x":0.505,"y":0.145}]	160	2020-09-03 20:43:19.627973	2020-10-22 08:04:46.011112	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0099056977778837277","GPSTimeStamp":"2020-09-01T10:12:20Z","GPSImgDirection":"179.54981242000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641166700000003","GPSLatitude":"48.462886670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.400000000000006","GPSHPositioningError":"4.0258050980803528","DateCreated":"2020-09-01T12:12:19+02:00"}}}}
466	[{"x":0.6575,"y":0.855},{"x":0.6837,"y":0.6767},{"x":0.6613,"y":0.4217},{"x":0.64,"y":0.12}]	150	2020-09-03 20:47:11.679263	2020-10-22 08:07:25.866359	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010556058027161955","GPSTimeStamp":"2020-09-01T11:11:30Z","GPSImgDirection":"332.34907530000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634166700000002","GPSLatitude":"48.462830000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92","GPSHPositioningError":"3.6244654984488975","DateCreated":"2020-09-01T13:11:30+02:00"}}}}
391	[{"x":0.4288,"y":0.78},{"x":0.3575,"y":0.4967},{"x":0.3713,"y":0.3033},{"x":0.4163,"y":0.15}]	228	2020-09-03 20:43:26.959321	2020-10-22 08:14:20.501946	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.030921187244622738","GPSTimeStamp":"2020-09-01T11:44:05Z","GPSImgDirection":"214.16986062999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632083299999998","GPSLatitude":"48.463136670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.299999999999997","GPSHPositioningError":"15.748833138856476","DateCreated":"2020-09-01T13:44:05+02:00"}}}}
366	[{"x":0.5325,"y":0.835},{"x":0.5062,"y":0.265},{"x":0.5125,"y":0.1167}]	139	2020-09-03 20:43:23.413173	2020-10-22 08:16:16.70509	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.02121220528821836","GPSTimeStamp":"2020-09-01T11:54:34Z","GPSImgDirection":"345.12010221000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629833300000003","GPSLatitude":"48.462974999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.900000000000006","GPSHPositioningError":"4.7425863363363367","DateCreated":"2020-09-01T13:54:33+02:00"}}}}
321	[{"x":0.6338,"y":0.7483},{"x":0.6238,"y":0.4783},{"x":0.625,"y":0.3},{"x":0.62,"y":0.18}]	138	2020-09-03 20:43:16.69628	2020-10-22 08:16:30.051392	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.02121220528821836","GPSTimeStamp":"2020-09-01T11:54:34Z","GPSImgDirection":"345.12010221000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629833300000003","GPSLatitude":"48.462974999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.900000000000006","GPSHPositioningError":"4.7425863363363367","DateCreated":"2020-09-01T13:54:33+02:00"}}}}
454	[{"x":0.565,"y":0.7417},{"x":0.5587,"y":0.5117},{"x":0.5613,"y":0.3033}]	43	2020-09-03 20:45:15.13407	2020-10-22 08:17:46.844444	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0091818878396288956","GPSTimeStamp":"2020-09-01T12:39:39Z","GPSImgDirection":"62.884399409999993","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628583300000002","GPSLatitude":"48.463104999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.5","GPSHPositioningError":"7.0610638967579478","DateCreated":"2020-09-01T14:39:39+02:00"}}}}
305	[{"x":0.3675,"y":0.82},{"x":0.3362,"y":0.5433},{"x":0.3588,"y":0.3},{"x":0.3862,"y":0.1883}]	41	2020-09-03 20:43:14.551584	2020-10-22 08:20:42.736332	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.030074430637431617","GPSTimeStamp":"2020-09-01T12:57:44Z","GPSImgDirection":"165.05345912000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627416700000004","GPSLatitude":"48.463183329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.700000000000003","GPSHPositioningError":"5.5264409881061303","DateCreated":"2020-09-01T14:57:44+02:00"}}}}
401	[{"x":0.4938,"y":0.8267},{"x":0.4713,"y":0.49},{"x":0.5,"y":0.3033},{"x":0.5188,"y":0.2317}]	114	2020-09-03 20:43:28.448959	2020-10-22 16:53:38.816441	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.14174170796950686","GPSTimeStamp":"2020-09-01T15:23:31Z","GPSImgDirection":"225.3848418","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637549999999997","GPSLatitude":"48.46143","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.099999999999994","GPSHPositioningError":"4.8050290719625464","DateCreated":"2020-09-01T17:23:30+02:00"}}}}
395	[{"x":0.5012,"y":0.885},{"x":0.5075,"y":0.395},{"x":0.5112,"y":0.0917}]	116	2020-09-03 20:43:27.602234	2020-10-22 16:54:25.680844	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.26531285026702717","GPSTimeStamp":"2020-09-01T15:24:55Z","GPSImgDirection":"339.04374678000011","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638216700000004","GPSLatitude":"48.461333329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.5","GPSHPositioningError":"5.2347213770320788","DateCreated":"2020-09-01T17:24:54+02:00"}}}}
445	[{"x":0.455,"y":0.78},{"x":0.45,"y":0.65},{"x":0.5238,"y":0.4667},{"x":0.44,"y":0.2983},{"x":0.3225,"y":0.1933},{"x":0.3137,"y":0.11}]	221	2020-09-03 20:45:13.513872	2020-10-22 08:05:25.637031	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0099056977778837277","GPSTimeStamp":"2020-09-01T10:12:20Z","GPSImgDirection":"179.54981242000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641166700000003","GPSLatitude":"48.462886670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.400000000000006","GPSHPositioningError":"4.0258050980803528","DateCreated":"2020-09-01T12:12:19+02:00"}}}}
381	[{"x":0.435,"y":0.8367},{"x":0.485,"y":0.5117},{"x":0.4988,"y":0.175}]	142	2020-09-03 20:43:25.394459	2020-10-22 08:10:24.25469	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012022621926642482","GPSTimeStamp":"2020-09-01T11:30:13Z","GPSImgDirection":"100.13042160000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630783299999998","GPSLatitude":"48.46298333","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.5","GPSHPositioningError":"3.9709783531409166","DateCreated":"2020-09-01T13:30:12+02:00"}}}}
354	[{"x":0.5225,"y":0.8617},{"x":0.5537,"y":0.4617},{"x":0.5513,"y":0.235}]	47	2020-09-03 20:43:21.743311	2020-10-22 08:13:34.084079	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0045873536703514156","GPSTimeStamp":"2020-09-01T11:39:26Z","GPSImgDirection":"324.66569525","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631","GPSLatitude":"48.463055000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.700000000000003","GPSHPositioningError":"4.2499816189986026","DateCreated":"2020-09-01T13:39:25+02:00"}}}}
390	[{"x":0.4938,"y":0.8117},{"x":0.4988,"y":0.3817},{"x":0.52,"y":0.1933},{"x":0.555,"y":0.1167}]	136	2020-09-03 20:43:26.831756	2020-10-22 08:13:57.598283	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012210628944300387","GPSTimeStamp":"2020-09-01T11:43:02Z","GPSImgDirection":"233.02174380999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632166700000006","GPSLatitude":"48.463119999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.5","GPSHPositioningError":"5.1496754700089529","DateCreated":"2020-09-01T13:43:02+02:00"}}}}
358	[{"x":0.5938,"y":0.8233},{"x":0.5962,"y":0.495},{"x":0.5837,"y":0.3183},{"x":0.5062,"y":0.1467}]	137	2020-09-03 20:43:22.200856	2020-10-22 08:14:54.965787	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.017593206846225291","GPSTimeStamp":"2020-09-01T11:44:59Z","GPSImgDirection":"206.27898402","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631783299999996","GPSLatitude":"48.463111670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.5","GPSHPositioningError":"6.8583447645176037","DateCreated":"2020-09-01T13:44:59+02:00"}}}}
405	[{"x":0.605,"y":0.685},{"x":0.6312,"y":0.605},{"x":0.6825,"y":0.5067},{"x":0.7137,"y":0.3383}]	229	2020-09-03 20:43:29.002378	2020-10-22 08:15:23.309181	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.023445377130431617","GPSTimeStamp":"2020-09-01T11:45:49Z","GPSImgDirection":"209.18630982999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631833299999998","GPSLatitude":"48.463121670000007","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.900000000000006","GPSHPositioningError":"14.337570589691092","DateCreated":"2020-09-01T13:45:48+02:00"}}}}
432	[{"x":0.38,"y":0.8517},{"x":0.4075,"y":0.535},{"x":0.39,"y":0.3617},{"x":0.4313,"y":0.1683}]	39	2020-09-03 20:43:33.159751	2020-10-22 08:21:32.247863	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.072175562392837483","GPSTimeStamp":"2020-09-01T13:01:59Z","GPSImgDirection":"231.48693835000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6625383299999998","GPSLatitude":"48.463283329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.299999999999997","GPSHPositioningError":"10.078772979905942","DateCreated":"2020-09-01T15:01:58+02:00"}}}}
320	[{"x":0.4738,"y":0.8167},{"x":0.4725,"y":0.415},{"x":0.485,"y":0.1367}]	97	2020-09-03 20:43:16.555801	2020-10-22 16:55:49.955878	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.093045607219456941","GPSTimeStamp":"2020-09-01T15:29:30Z","GPSImgDirection":"217.86584481999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638083299999997","GPSLatitude":"48.461588329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94","GPSHPositioningError":"5.2690461199433338","DateCreated":"2020-09-01T17:29:30+02:00"}}}}
284	[{"x":0.72,"y":0.545},{"x":0.6425,"y":0.5867},{"x":0.4188,"y":0.5933},{"x":0.2637,"y":0.5133},{"x":0.2625,"y":0.3333},{"x":0.3075,"y":0.1433}]	235	2020-09-03 20:43:11.634621	2020-10-22 16:56:52.663439	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.03707556427870462","GPSTimeStamp":"2020-09-01T15:32:39Z","GPSImgDirection":"93.237563090000009","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638366699999998","GPSLatitude":"48.461608330000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.799999999999997","GPSHPositioningError":"4.652587607333488","DateCreated":"2020-09-01T17:32:39+02:00"}}}}
460	[{"x":0.4238,"y":0.81},{"x":0.4325,"y":0.4417},{"x":0.5088,"y":0.21}]	161	2020-09-03 20:47:10.534196	2020-10-22 08:05:57.950554	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0071893511313432376","GPSTimeStamp":"2020-09-01T11:00:06Z","GPSImgDirection":"231.00778209999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641116700000005","GPSLatitude":"48.462855000000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.400000000000006","GPSHPositioningError":"11.539567966280295","DateCreated":"2020-09-01T13:00:06+02:00"}}}}
448	[{"x":0.8,"y":0.4433},{"x":0.7288,"y":0.4567},{"x":0.6462,"y":0.46},{"x":0.5725,"y":0.4183},{"x":0.515,"y":0.3917},{"x":0.38,"y":0.3717},{"x":0.2925,"y":0.3733},{"x":0.215,"y":0.3683}]	222	2020-09-03 20:45:14.14531	2020-10-22 08:07:50.053285	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.029999323196318189","GPSTimeStamp":"2020-09-01T11:12:48Z","GPSImgDirection":"171.87188729000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634199999999999","GPSLatitude":"48.462903329999989","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.5","GPSHPositioningError":"3.9197500526574456","DateCreated":"2020-09-01T13:12:48+02:00"}}}}
370	[{"x":0.105,"y":0.6833},{"x":0.1225,"y":0.52},{"x":0.2313,"y":0.4933},{"x":0.3862,"y":0.475},{"x":0.5262,"y":0.4333},{"x":0.6138,"y":0.205}]	48	2020-09-03 20:43:23.833831	2020-10-22 08:08:07.540121	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.022397335632935857","GPSTimeStamp":"2020-09-01T11:18:11Z","GPSImgDirection":"242.42816167000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632866700000006","GPSLatitude":"48.46289500000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.900000000000006","GPSHPositioningError":"13.187570575899338","DateCreated":"2020-09-01T13:18:10+02:00"}}}}
441	[{"x":0.5162,"y":0.6983},{"x":0.5425,"y":0.4867},{"x":0.5863,"y":0.34},{"x":0.5913,"y":0.235},{"x":0.5675,"y":0.1767}]	133	2020-09-03 20:45:07.590769	2020-10-22 08:18:50.628031	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0063340207573066255","GPSTimeStamp":"2020-09-01T12:48:56Z","GPSImgDirection":"285.60658259000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632883299999994","GPSLatitude":"48.463178329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.900000000000006","GPSHPositioningError":"5.0866980938716946","DateCreated":"2020-09-01T14:48:55+02:00"}}}}
297	[{"x":0.5275,"y":0.8483},{"x":0.5175,"y":0.4167},{"x":0.5313,"y":0.2017},{"x":0.525,"y":0.12}]	87	2020-09-03 20:43:13.261344	2020-10-22 16:58:01.066577	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1315581947743468","GPSTimeStamp":"2020-09-01T15:34:12Z","GPSImgDirection":"318.01640339999994","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6639666700000002","GPSLatitude":"48.461728329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.200000000000003","GPSHPositioningError":"4.4015858208955221","DateCreated":"2020-09-01T17:34:11+02:00"}}}}
383	[{"x":0.3275,"y":0.8483},{"x":0.3538,"y":0.4867},{"x":0.4475,"y":0.275},{"x":0.4938,"y":0.125}]	198	2020-09-03 20:43:25.833561	2020-10-22 17:06:35.860098	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.058897156270842896","GPSTimeStamp":"2020-09-01T15:53:24Z","GPSImgDirection":"80.443298340000013","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634783299999998","GPSLatitude":"48.462125","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.400000000000006","GPSHPositioningError":"5.645715267044479","DateCreated":"2020-09-01T17:53:23+02:00"}}}}
325	\N	79	2020-09-03 20:43:17.259839	2020-10-22 17:14:27.879242	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.19029724598860948","GPSTimeStamp":"2020-09-01T16:12:10Z","GPSImgDirection":"296.25936884000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635633300000001","GPSLatitude":"48.462345000000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.099999999999994","GPSHPositioningError":"4.7999586691465179","DateCreated":"2020-09-01T18:12:09+02:00"}}}}
384	[{"x":0.5112,"y":0.8017},{"x":0.4338,"y":0.5467},{"x":0.4487,"y":0.4017},{"x":0.5,"y":0.2117},{"x":0.5262,"y":0.1267}]	169	2020-09-03 20:43:25.935033	2020-10-22 17:15:57.556056	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.15567186469868008","GPSTimeStamp":"2020-09-01T16:16:43Z","GPSImgDirection":"5.5561828600000016","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636383299999999","GPSLatitude":"48.462383329999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.299999999999997","GPSHPositioningError":"4.8707272117962468","DateCreated":"2020-09-01T18:16:42+02:00"}}}}
361	[{"x":0.6438,"y":0.42},{"x":0.5787,"y":0.3883},{"x":0.5025,"y":0.3667},{"x":0.4412,"y":0.3883},{"x":0.3875,"y":0.4333},{"x":0.3425,"y":0.485}]	80	2020-09-03 20:43:22.739605	2020-10-22 17:16:11.08826	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.014758470470195781","GPSTimeStamp":"2020-09-01T16:17:23Z","GPSImgDirection":"322.71452328000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636583299999996","GPSLatitude":"48.462375000000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.299999999999997","GPSHPositioningError":"12.651575931232092","DateCreated":"2020-09-01T18:17:22+02:00"}}}}
416	[{"x":0.5275,"y":0.805},{"x":0.5325,"y":0.5017},{"x":0.5325,"y":0.305},{"x":0.5413,"y":0.1433}]	141	2020-09-03 20:43:30.500046	2020-10-22 08:08:46.159935	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0071317264808258354","GPSTimeStamp":"2020-09-01T11:20:42Z","GPSImgDirection":"232.77038570999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632216699999995","GPSLatitude":"48.463004999999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.299999999999997","GPSHPositioningError":"4.2970234525425335","DateCreated":"2020-09-01T13:20:41+02:00"}}}}
477	[{"x":0.5375,"y":0.8033},{"x":0.5625,"y":0.5017},{"x":0.5713,"y":0.2533},{"x":0.555,"y":0.1817},{"x":0.5288,"y":0.1433}]	162	2020-09-04 19:56:30.839176	2020-10-22 08:09:54.497125	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0061442186150877107","GPSTimeStamp":"2020-09-01T11:27:44Z","GPSImgDirection":"295.48345936000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632199999999999","GPSLatitude":"48.462903329999989","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.900000000000006","GPSHPositioningError":"14.548550016291951","DateCreated":"2020-09-01T13:27:43+02:00"}}}}
291	[{"x":0.4525,"y":0.8283},{"x":0.4063,"y":0.5617},{"x":0.3962,"y":0.39},{"x":0.4363,"y":0.2217},{"x":0.455,"y":0.1667}]	44	2020-09-03 20:43:12.588162	2020-10-22 08:17:23.783188	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1242322624070001","GPSTimeStamp":"2020-09-01T11:58:36Z","GPSImgDirection":"320.36532593999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630050000000001","GPSLatitude":"48.463088329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92","GPSHPositioningError":"4.9442558684323759","DateCreated":"2020-09-01T13:58:36+02:00"}}}}
280	[{"x":0.6,"y":0.9717},{"x":0.64,"y":0.5883},{"x":0.6687,"y":0.34},{"x":0.6613,"y":0.1617}]	40	2020-09-03 20:43:10.839785	2020-10-22 08:21:15.455442	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.013482664708222406","GPSTimeStamp":"2020-09-01T13:00:41Z","GPSImgDirection":"91.921506610000023","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6626666699999997","GPSLatitude":"48.463330000000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"88.799999999999997","GPSHPositioningError":"13.005134544071502","DateCreated":"2020-09-01T15:00:40+02:00"}}}}
467	[{"x":0.6425,"y":0.785},{"x":0.5737,"y":0.68},{"x":0.5425,"y":0.5117},{"x":0.5525,"y":0.325},{"x":0.565,"y":0.21}]	69	2020-09-03 20:47:12.356262	2020-10-22 17:10:08.971484	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.25488775967135879","GPSTimeStamp":"2020-09-01T16:02:27Z","GPSImgDirection":"197.28914641","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634299999999995","GPSLatitude":"48.462199999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"6.5794280495462072","DateCreated":"2020-09-01T18:02:26+02:00"}}}}
349	[{"x":0.47,"y":0.78},{"x":0.4138,"y":0.6467},{"x":0.4412,"y":0.5467},{"x":0.4738,"y":0.4117},{"x":0.53,"y":0.1967}]	184	2020-09-03 20:43:21.114301	2020-10-22 17:10:25.620363	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.25488775967135879","GPSTimeStamp":"2020-09-01T16:02:27Z","GPSImgDirection":"197.28914641","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634299999999995","GPSLatitude":"48.462199999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"6.5794280495462072","DateCreated":"2020-09-01T18:02:26+02:00"}}}}
359	[{"x":0.5225,"y":0.81},{"x":0.5763,"y":0.65},{"x":0.58,"y":0.54},{"x":0.5363,"y":0.3467},{"x":0.5188,"y":0.2067}]	182	2020-09-03 20:43:22.532018	2020-10-22 17:10:43.934642	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.31042724828204366","GPSTimeStamp":"2020-09-01T16:03:39Z","GPSImgDirection":"242.93817133999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634783299999998","GPSLatitude":"48.462196670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.900000000000006","GPSHPositioningError":"11.824170704435334","DateCreated":"2020-09-01T18:03:38+02:00"}}}}
411	[{"x":0.6338,"y":0.8333},{"x":0.6462,"y":0.4467},{"x":0.655,"y":0.1933}]	179	2020-09-03 20:43:29.801718	2020-10-22 17:11:39.399357	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.17961595963371332","GPSTimeStamp":"2020-09-01T16:06:42Z","GPSImgDirection":"250.77439886999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635666700000002","GPSLatitude":"48.462229999999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.599999999999994","GPSHPositioningError":"10.598370170326676","DateCreated":"2020-09-01T18:06:41+02:00"}}}}
285	[{"x":0.4963,"y":0.8583},{"x":0.4738,"y":0.5117},{"x":0.4688,"y":0.2417},{"x":0.4863,"y":0.145}]	70	2020-09-03 20:43:11.752567	2020-10-22 17:11:49.412157	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.17961595963371332","GPSTimeStamp":"2020-09-01T16:06:42Z","GPSImgDirection":"250.77439886999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635666700000002","GPSLatitude":"48.462229999999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.599999999999994","GPSHPositioningError":"10.598370170326676","DateCreated":"2020-09-01T18:06:41+02:00"}}}}
292	[{"x":0.46,"y":0.9317},{"x":0.485,"y":0.5367},{"x":0.4913,"y":0.33},{"x":0.5175,"y":0.1083}]	45	2020-09-03 20:43:12.68985	2020-10-22 08:17:04.51096	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0038689440079819402","GPSTimeStamp":"2020-09-01T11:57:10Z","GPSImgDirection":"319.25639344000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629883299999997","GPSLatitude":"48.463038330000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.299999999999997","GPSHPositioningError":"4.6336432916171431","DateCreated":"2020-09-01T13:57:10+02:00"}}}}
438	[{"x":0.6775,"y":0.7283},{"x":0.6863,"y":0.395},{"x":0.6462,"y":0.235}]	42	2020-09-03 20:43:33.964429	2020-10-22 08:18:05.409068	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.036332234757256943","GPSTimeStamp":"2020-09-01T12:41:36Z","GPSImgDirection":"24.816314689999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628616700000003","GPSLatitude":"48.463178329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.099999999999994","GPSHPositioningError":"4.4668196923498575","DateCreated":"2020-09-01T14:41:35+02:00"}}}}
417	[{"x":0.4075,"y":0.775},{"x":0.4138,"y":0.49},{"x":0.4763,"y":0.27},{"x":0.5088,"y":0.16},{"x":0.4963,"y":0.1267}]	224	2020-09-03 20:43:30.656251	2020-10-22 08:19:10.904446	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.051333803684816881","GPSTimeStamp":"2020-09-01T12:49:51Z","GPSImgDirection":"310.08003234","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632799999999994","GPSLatitude":"48.463199999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.900000000000006","GPSHPositioningError":"12.01358438112087","DateCreated":"2020-09-01T14:49:51+02:00"}}}}
368	[{"x":0.3713,"y":0.7933},{"x":0.3613,"y":0.4633},{"x":0.3563,"y":0.14}]	129	2020-09-03 20:43:23.608932	2020-10-22 15:54:00.233582	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0041646277562044139","GPSTimeStamp":"2020-09-01T13:06:27Z","GPSImgDirection":"252.18344114000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.662525","GPSLatitude":"48.463046670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.5","GPSHPositioningError":"8.7534977643155916","DateCreated":"2020-09-01T15:06:27+02:00"}}}}
269	[{"x":0.3663,"y":0.8333},{"x":0.3937,"y":0.5683},{"x":0.5387,"y":0.4333},{"x":0.5487,"y":0.1417}]	37	2020-09-03 20:43:09.358572	2020-10-22 15:54:24.690398	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1563719362048718","GPSTimeStamp":"2020-09-01T13:07:17Z","GPSImgDirection":"110.83346550000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6623916700000003","GPSLatitude":"48.463111670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.200000000000003","GPSHPositioningError":"4.8593918918918915","DateCreated":"2020-09-01T15:07:16+02:00"}}}}
327	[{"x":0.7238,"y":0.795},{"x":0.7475,"y":0.53},{"x":0.7788,"y":0.3717},{"x":0.755,"y":0.2533}]	131	2020-09-03 20:43:17.528583	2020-10-22 15:56:26.21039	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.025889180599696006","GPSTimeStamp":"2020-09-01T13:09:06Z","GPSImgDirection":"193.95410156000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6626866700000003","GPSLatitude":"48.46289500000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.400000000000006","GPSHPositioningError":"4.1288800335570466","DateCreated":"2020-09-01T15:09:05+02:00"}}}}
415	[{"x":0.525,"y":0.8},{"x":0.4587,"y":0.4883},{"x":0.47,"y":0.1717}]	130	2020-09-03 20:43:30.370288	2020-10-22 15:57:13.654837	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010520919225947258","GPSTimeStamp":"2020-09-01T13:10:26Z","GPSImgDirection":"259.84294117999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627300000000003","GPSLatitude":"48.462821670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.700000000000003","GPSHPositioningError":"10.667075252812678","DateCreated":"2020-09-01T15:10:26+02:00"}}}}
423	[{"x":0.3212,"y":0.7817},{"x":0.2875,"y":0.5617},{"x":0.29,"y":0.3167},{"x":0.3175,"y":0.1867}]	132	2020-09-03 20:43:31.654505	2020-10-22 15:58:02.193219	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12640155858388044","GPSTimeStamp":"2020-09-01T13:11:36Z","GPSImgDirection":"73.582244849999981","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627049999999999","GPSLatitude":"48.462861670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.299999999999997","GPSHPositioningError":"4.5731531159719356","DateCreated":"2020-09-01T15:11:35+02:00"}}}}
336	[{"x":0.4288,"y":0.815},{"x":0.4363,"y":0.3767},{"x":0.4475,"y":0.1483}]	36	2020-09-03 20:43:19.101768	2020-10-22 15:59:14.397831	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010520919225947258","GPSTimeStamp":"2020-09-01T13:10:26Z","GPSImgDirection":"259.84294117999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627300000000003","GPSLatitude":"48.462821670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.700000000000003","GPSHPositioningError":"10.667075252812678","DateCreated":"2020-09-01T15:10:26+02:00"}}}}
403	[{"x":0.4412,"y":0.83},{"x":0.4437,"y":0.4183},{"x":0.4913,"y":0.1267}]	33	2020-09-03 20:43:28.804019	2020-10-22 15:59:57.11255	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10229159893503914","GPSTimeStamp":"2020-09-01T13:13:39Z","GPSImgDirection":"180.28170783000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66281167","GPSLatitude":"48.462604999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.200000000000003","GPSHPositioningError":"4.2414083321643989","DateCreated":"2020-09-01T15:13:38+02:00"}}}}
296	[{"x":0.4562,"y":0.8417},{"x":0.445,"y":0.7067},{"x":0.4188,"y":0.67},{"x":0.3725,"y":0.3433},{"x":0.3688,"y":0.1467}]	213	2020-09-03 20:43:13.070933	2020-10-22 16:07:59.468024	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.090889818959303703","GPSTimeStamp":"2020-09-01T13:50:22Z","GPSImgDirection":"77.46194457","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6617333300000001","GPSLatitude":"48.462379999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.400000000000006","GPSHPositioningError":"4.758561151079137","DateCreated":"2020-09-01T15:50:22+02:00"}}}}
430	[{"x":0.2512,"y":0.8117},{"x":0.2375,"y":0.6083},{"x":0.34,"y":0.4983},{"x":0.5225,"y":0.5167},{"x":0.6325,"y":0.4933},{"x":0.78,"y":0.5233},{"x":0.8275,"y":0.3867},{"x":0.8325,"y":0.305}]	178	2020-09-03 20:43:32.791996	2020-10-22 17:11:16.182256	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10621782389500921","GPSTimeStamp":"2020-09-01T16:05:21Z","GPSImgDirection":"113.00597569000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633916699999998","GPSLatitude":"48.462246669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.400000000000006","GPSHPositioningError":"10.590409150901891","DateCreated":"2020-09-01T18:05:20+02:00"}}}}
332	[{"x":0.5188,"y":0.8717},{"x":0.5188,"y":0.455},{"x":0.5212,"y":0.13}]	163	2020-09-03 20:43:18.332379	2020-10-22 17:12:15.677143	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.011793705633672973","GPSTimeStamp":"2020-09-01T16:08:05Z","GPSImgDirection":"41.145874020000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635466700000001","GPSLatitude":"48.462291669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.299999999999997","GPSHPositioningError":"4.6977336230984168","DateCreated":"2020-09-01T18:08:04+02:00"}}}}
476	[{"x":0.5,"y":0.8367},{"x":0.475,"y":0.51},{"x":0.4738,"y":0.2517},{"x":0.4838,"y":0.13}]	217	2020-09-03 20:47:14.826322	2020-10-22 17:21:27.242704	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012973314139226443","GPSTimeStamp":"2020-09-01T16:21:24Z","GPSImgDirection":"286.59422283000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636116700000003","GPSLatitude":"48.462466670000012","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.400000000000006","GPSHPositioningError":"8.1933486898934635","DateCreated":"2020-09-01T18:21:24+02:00"}}}}
455	[{"x":0.6625,"y":0.7983},{"x":0.6525,"y":0.5233},{"x":0.575,"y":0.3717},{"x":0.5125,"y":0.255},{"x":0.4938,"y":0.1417}]	218	2020-09-03 20:45:15.247934	2020-10-22 17:21:40.82751	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.27839294080899585","GPSTimeStamp":"2020-09-01T16:21:57Z","GPSImgDirection":"15.783966060000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.46245832999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.400000000000006","GPSHPositioningError":"5.2610764686576958","DateCreated":"2020-09-01T18:21:56+02:00"}}}}
402	\N	76	2020-09-03 20:43:28.703133	2020-10-22 17:24:48.9518	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.16996370256129506","GPSTimeStamp":"2020-09-01T16:26:07Z","GPSImgDirection":"83.989288310000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634383300000004","GPSLatitude":"48.462508330000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.900000000000006","GPSHPositioningError":"9.8710686204431735","DateCreated":"2020-09-01T18:26:06+02:00"}}}}
322	[{"x":0.545,"y":0.9183},{"x":0.4763,"y":0.6783},{"x":0.5175,"y":0.405},{"x":0.5787,"y":0.2383}]	177	2020-09-03 20:43:16.802821	2020-10-22 17:32:02.345351	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.049918767064557619","GPSTimeStamp":"2020-09-01T16:51:56Z","GPSImgDirection":"102.3353386","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6640666700000004","GPSLatitude":"48.462628329999987","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.700000000000003","GPSHPositioningError":"4.4832489857375881","DateCreated":"2020-09-01T18:51:55+02:00"}}}}
393	[{"x":0.3625,"y":0.4783},{"x":0.2437,"y":0.4733},{"x":0.1762,"y":0.4417},{"x":0.1688,"y":0.3733}]	34	2020-09-03 20:43:27.205109	2020-10-22 16:01:16.401049	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.022893533110281406","GPSTimeStamp":"2020-09-01T13:16:41Z","GPSImgDirection":"36.111968989999994","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628166700000002","GPSLatitude":"48.462708329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.599999999999994","GPSHPositioningError":"4.8140628433311363","DateCreated":"2020-09-01T15:16:41+02:00"}}}}
369	[{"x":0.4063,"y":0.845},{"x":0.3638,"y":0.585},{"x":0.335,"y":0.2933}]	31	2020-09-03 20:43:23.719149	2020-10-22 16:02:01.760827	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0055735092631202729","GPSTimeStamp":"2020-09-01T13:18:46Z","GPSImgDirection":"266.53277592000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629833300000003","GPSLatitude":"48.462428329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.299999999999997","GPSHPositioningError":"4.9489894516466704","DateCreated":"2020-09-01T15:18:46+02:00"}}}}
266	[{"x":0.545,"y":0.8517},{"x":0.5337,"y":0.4717},{"x":0.5075,"y":0.1367}]	199	2020-09-03 20:43:08.882963	2020-10-22 16:02:22.865535	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0055735092631202729","GPSTimeStamp":"2020-09-01T13:18:46Z","GPSImgDirection":"266.53277592000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629833300000003","GPSLatitude":"48.462428329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.299999999999997","GPSHPositioningError":"4.9489894516466704","DateCreated":"2020-09-01T15:18:46+02:00"}}}}
282	[{"x":0.3225,"y":0.8083},{"x":0.3862,"y":0.6433},{"x":0.6012,"y":0.5283},{"x":0.635,"y":0.24}]	209	2020-09-03 20:43:11.057285	2020-10-22 16:09:39.785799	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.018118841572369787","GPSTimeStamp":"2020-09-01T13:53:20Z","GPSImgDirection":"42.087738069999993","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6620866699999999","GPSLatitude":"48.46237167000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.099999999999994","GPSHPositioningError":"4.1252931411557006","DateCreated":"2020-09-01T15:53:19+02:00"}}}}
473	[{"x":0.6125,"y":0.8367},{"x":0.6188,"y":0.4017},{"x":0.5962,"y":0.225},{"x":0.5713,"y":0.1767}]	210	2020-09-03 20:47:14.033073	2020-10-22 16:09:57.297149	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.46515577986994078","GPSTimeStamp":"2020-09-01T13:53:59Z","GPSImgDirection":"342.09960937999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621633299999994","GPSLatitude":"48.462333329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.900000000000006","GPSHPositioningError":"15.237731622887395","DateCreated":"2020-09-01T15:53:59+02:00"}}}}
452	[{"x":0.4375,"y":0.745},{"x":0.4587,"y":0.6817},{"x":0.445,"y":0.6533},{"x":0.3575,"y":0.6117},{"x":0.3113,"y":0.4733},{"x":0.3137,"y":0.3583},{"x":0.34,"y":0.25},{"x":0.3675,"y":0.19}]	205	2020-09-03 20:45:14.702762	2020-10-22 16:10:55.877213	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.017648220063726686","GPSTimeStamp":"2020-09-01T14:00:07Z","GPSImgDirection":"35.495056179999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621716700000002","GPSLatitude":"48.462761669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.099999999999994","GPSHPositioningError":"9.9685219475002729","DateCreated":"2020-09-01T16:00:06+02:00"}}}}
342	[{"x":0.52,"y":0.8317},{"x":0.525,"y":0.4617},{"x":0.5175,"y":0.1483}]	165	2020-09-03 20:43:20.035905	2020-10-22 17:12:59.640748	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.085228353751850922","GPSTimeStamp":"2020-09-01T16:09:23Z","GPSImgDirection":"330.20085166999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.462336669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.200000000000003","GPSHPositioningError":"12.400949667616334","DateCreated":"2020-09-01T18:09:22+02:00"}}}}
413	[{"x":0.5513,"y":0.805},{"x":0.5537,"y":0.4767},{"x":0.575,"y":0.1717}]	168	2020-09-03 20:43:29.985013	2020-10-22 17:15:01.704713	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.15696150059588582","GPSTimeStamp":"2020-09-01T16:13:53Z","GPSImgDirection":"73.309326170000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635383300000002","GPSLatitude":"48.462403329999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.900000000000006","GPSHPositioningError":"8.4062557838238021","DateCreated":"2020-09-01T18:13:52+02:00"}}}}
386	[{"x":0.5313,"y":0.805},{"x":0.5138,"y":0.755},{"x":0.5225,"y":0.6067},{"x":0.5112,"y":0.135}]	190	2020-09-03 20:43:26.175029	2020-10-22 17:16:44.097617	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11150857813327229","GPSTimeStamp":"2020-09-01T16:19:15Z","GPSImgDirection":"259.85726949999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638283300000003","GPSLatitude":"48.462441670000011","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.200000000000003","GPSHPositioningError":"9.1217137390125771","DateCreated":"2020-09-01T18:19:14+02:00"}}}}
302	[{"x":0.4963,"y":0.8483},{"x":0.4888,"y":0.6117},{"x":0.4562,"y":0.565},{"x":0.4462,"y":0.36},{"x":0.47,"y":0.2017}]	208	2020-09-03 20:43:13.910241	2020-10-22 16:07:20.738991	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.009447998361583965","GPSTimeStamp":"2020-09-01T13:23:50Z","GPSImgDirection":"118.08135792","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6620116700000005","GPSLatitude":"48.462446670000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.900000000000006","GPSHPositioningError":"4.2855626816776633","DateCreated":"2020-09-01T15:23:49+02:00"}}}}
279	[{"x":0.6,"y":0.8667},{"x":0.5437,"y":0.455},{"x":0.5188,"y":0.1817}]	212	2020-09-03 20:43:10.714358	2020-10-22 16:09:00.079827	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.090715140154644894","GPSTimeStamp":"2020-09-01T13:51:04Z","GPSImgDirection":"61.645843499999991","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6617866700000001","GPSLatitude":"48.462366670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.200000000000003","GPSHPositioningError":"6.2448392469590672","DateCreated":"2020-09-01T15:51:03+02:00"}}}}
462	[{"x":0.7037,"y":0.8333},{"x":0.7225,"y":0.5267},{"x":0.6887,"y":0.3},{"x":0.6625,"y":0.1683}]	72	2020-09-03 20:47:10.775991	2020-10-22 17:13:43.299546	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.011102675453247897","GPSTimeStamp":"2020-09-01T16:10:04Z","GPSImgDirection":"125.30550775000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636216699999999","GPSLatitude":"48.462311669999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.5","GPSHPositioningError":"9.245792736935341","DateCreated":"2020-09-01T18:10:04+02:00"}}}}
337	[{"x":0.5487,"y":0.8033},{"x":0.5387,"y":0.5367},{"x":0.545,"y":0.265},{"x":0.5463,"y":0.1667}]	167	2020-09-03 20:43:19.240292	2020-10-22 17:15:34.478413	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.14673645808549451","GPSTimeStamp":"2020-09-01T16:15:29Z","GPSImgDirection":"79.12335204","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.462454999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.5","GPSHPositioningError":"5.9804199581392208","DateCreated":"2020-09-01T18:15:29+02:00"}}}}
474	[{"x":0.4012,"y":0.85},{"x":0.41,"y":0.595},{"x":0.3488,"y":0.4283},{"x":0.3475,"y":0.2517}]	219	2020-09-03 20:47:14.29126	2020-10-22 17:21:51.695384	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.27839294080899585","GPSTimeStamp":"2020-09-01T16:21:57Z","GPSImgDirection":"15.783966060000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.46245832999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.400000000000006","GPSHPositioningError":"5.2610764686576958","DateCreated":"2020-09-01T18:21:56+02:00"}}}}
304	[{"x":0.5325,"y":0.85},{"x":0.5313,"y":0.49},{"x":0.53,"y":0.1833}]	215	2020-09-03 20:43:14.469957	2020-10-22 17:22:42.167757	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.079740270975617963","GPSTimeStamp":"2020-09-01T16:24:23Z","GPSImgDirection":"179.29981993000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635749999999994","GPSLatitude":"48.462566670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.5","GPSHPositioningError":"10.728374297618593","DateCreated":"2020-09-01T18:24:22+02:00"}}}}
463	[{"x":0.5125,"y":0.74},{"x":0.4888,"y":0.4283},{"x":0.445,"y":0.2083}]	75	2020-09-03 20:47:11.263842	2020-10-22 17:26:45.582808	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.086901605133918078","GPSTimeStamp":"2020-09-01T16:27:41Z","GPSImgDirection":"127.51781472999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634700000000002","GPSLatitude":"48.462416670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.700000000000003","GPSHPositioningError":"4.6343133306484088","DateCreated":"2020-09-01T18:27:41+02:00"}}}}
440	[{"x":0.515,"y":0.7833},{"x":0.5162,"y":0.555},{"x":0.475,"y":0.4167},{"x":0.3912,"y":0.2983},{"x":0.3563,"y":0.1717}]	156	2020-09-03 20:43:34.241131	2020-10-22 17:27:57.724371	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010091121308486545","GPSTimeStamp":"2020-09-01T16:30:23Z","GPSImgDirection":"173.28211991000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635333299999995","GPSLatitude":"48.462630000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96","GPSHPositioningError":"7.9926532190500739","DateCreated":"2020-09-01T18:30:22+02:00"}}}}
392	[{"x":0.4863,"y":0.7167},{"x":0.4975,"y":0.4967},{"x":0.5062,"y":0.3667},{"x":0.4988,"y":0.25},{"x":0.51,"y":0.17}]	74	2020-09-03 20:43:27.084976	2020-10-22 17:28:57.542732	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.15585859133546603","GPSTimeStamp":"2020-09-01T16:32:29Z","GPSImgDirection":"251.03739931000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634450000000003","GPSLatitude":"48.462729999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95","GPSHPositioningError":"9.1245602165087956","DateCreated":"2020-09-01T18:32:29+02:00"}}}}
434	[{"x":0.5175,"y":0.8833},{"x":0.5787,"y":0.3483},{"x":0.6262,"y":0.0867}]	211	2020-09-03 20:43:33.363073	2020-10-22 16:09:19.958839	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.068873286247054341","GPSTimeStamp":"2020-09-01T13:52:14Z","GPSImgDirection":"264.64752199999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6619533300000002","GPSLatitude":"48.462330000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.700000000000003","GPSHPositioningError":"4.1534790427445012","DateCreated":"2020-09-01T15:52:14+02:00"}}}}
464	[{"x":0.4562,"y":0.835},{"x":0.4775,"y":0.45},{"x":0.475,"y":0.2317}]	204	2020-09-03 20:47:11.394255	2020-10-22 16:16:47.217519	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.16128106428957323","GPSTimeStamp":"2020-09-01T14:00:35Z","GPSImgDirection":"55.615539569999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621133299999995","GPSLatitude":"48.46280333","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.200000000000003","GPSHPositioningError":"6.3844057665260197","DateCreated":"2020-09-01T16:00:35+02:00"}}}}
378	[{"x":0.8287,"y":0.4983},{"x":0.6412,"y":0.4733},{"x":0.4825,"y":0.47},{"x":0.365,"y":0.5067},{"x":0.2587,"y":0.515},{"x":0.2437,"y":0.455}]	231	2020-09-03 20:43:25.090944	2020-10-22 16:17:37.923397	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.020953092724649416","GPSTimeStamp":"2020-09-01T14:03:08Z","GPSImgDirection":"32.445373540000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621416699999996","GPSLatitude":"48.462749999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.799999999999997","GPSHPositioningError":"4.458699391065867","DateCreated":"2020-09-01T16:03:08+02:00"}}}}
374	[{"x":0.3387,"y":0.69},{"x":0.35,"y":0.415},{"x":0.3638,"y":0.2333},{"x":0.4,"y":0.18}]	196	2020-09-03 20:43:24.492434	2020-10-22 16:17:58.708384	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.014216504063955585","GPSTimeStamp":"2020-09-01T14:03:50Z","GPSImgDirection":"81.985321099999993","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621866699999996","GPSLatitude":"48.462775000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.099999999999994","GPSHPositioningError":"6.9534042319921063","DateCreated":"2020-09-01T16:03:50+02:00"}}}}
317	[{"x":0.55,"y":0.8683},{"x":0.5587,"y":0.2633},{"x":0.55,"y":0.145}]	200	2020-09-03 20:43:16.113958	2020-10-22 16:18:39.885321	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.047838434575067465","GPSTimeStamp":"2020-09-01T14:07:45Z","GPSImgDirection":"167.97685242000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628366700000003","GPSLatitude":"48.462366670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.400000000000006","GPSHPositioningError":"4.4813729440638852","DateCreated":"2020-09-01T16:07:45+02:00"}}}}
364	[{"x":0.3387,"y":0.8},{"x":0.3412,"y":0.7217},{"x":0.5112,"y":0.6433},{"x":0.5825,"y":0.5883},{"x":0.5725,"y":0.4683},{"x":0.505,"y":0.3733},{"x":0.4088,"y":0.2983},{"x":0.4275,"y":0.1933}]	232	2020-09-03 20:43:23.037111	2020-10-22 16:18:57.433486	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012533367612629369","GPSTimeStamp":"2020-09-01T14:08:46Z","GPSImgDirection":"194.62842574999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628616700000003","GPSLatitude":"48.462336669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.599999999999994","GPSHPositioningError":"4.3634561374525029","DateCreated":"2020-09-01T16:08:45+02:00"}}}}
446	[{"x":0.4775,"y":0.89},{"x":0.4963,"y":0.355},{"x":0.4913,"y":0.1383}]	201	2020-09-03 20:45:13.638024	2020-10-22 16:19:21.518966	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.13172042369302064","GPSTimeStamp":"2020-09-01T14:09:56Z","GPSImgDirection":"42.406463640000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627716700000001","GPSLatitude":"48.462261669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.799999999999997","GPSHPositioningError":"16.394096138410774","DateCreated":"2020-09-01T16:09:56+02:00"}}}}
376	[{"x":0.4225,"y":0.78},{"x":0.44,"y":0.4583},{"x":0.5038,"y":0.1967}]	30	2020-09-03 20:43:24.715427	2020-10-22 16:20:07.642588	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.030352631611456668","GPSTimeStamp":"2020-09-01T14:13:14Z","GPSImgDirection":"164.81848144999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66309167","GPSLatitude":"48.462270000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"3.9424406497292797","DateCreated":"2020-09-01T16:13:14+02:00"}}}}
420	[{"x":0.8363,"y":0.3083},{"x":0.7462,"y":0.32},{"x":0.665,"y":0.535},{"x":0.5687,"y":0.5817},{"x":0.415,"y":0.5767},{"x":0.3237,"y":0.5733},{"x":0.2387,"y":0.5533},{"x":0.16,"y":0.5317},{"x":0.1037,"y":0.5183}]	29	2020-09-03 20:43:31.250204	2020-10-22 16:20:39.012489	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.071092158540919048","GPSTimeStamp":"2020-09-01T14:13:56Z","GPSImgDirection":"295.48509229000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630783299999998","GPSLatitude":"48.462128329999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"10.226248182258846","DateCreated":"2020-09-01T16:13:55+02:00"}}}}
309	[{"x":0.5188,"y":0.8267},{"x":0.515,"y":0.485},{"x":0.52,"y":0.2117}]	90	2020-09-03 20:43:14.936171	2020-10-22 16:21:41.234166	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.20150603348819809","GPSTimeStamp":"2020-09-01T14:16:47Z","GPSImgDirection":"193.86171719999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632199999999999","GPSLatitude":"48.462078329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"4.0509434282129959","DateCreated":"2020-09-01T16:16:46+02:00"}}}}
299	[{"x":0.405,"y":0.8},{"x":0.4063,"y":0.4517},{"x":0.3937,"y":0.2183}]	25	2020-09-03 20:43:13.583996	2020-10-22 16:21:59.887775	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1343562155188977","GPSTimeStamp":"2020-09-01T14:17:55Z","GPSImgDirection":"314.54125998000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632283299999999","GPSLatitude":"48.46194667000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.799999999999997","GPSHPositioningError":"4.6404626481522673","DateCreated":"2020-09-01T16:17:54+02:00"}}}}
429	[{"x":0.53,"y":0.7933},{"x":0.52,"y":0.4633},{"x":0.5437,"y":0.13}]	91	2020-09-03 20:43:32.666251	2020-10-22 16:22:24.463151	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.29765296011890024","GPSTimeStamp":"2020-09-01T14:18:28Z","GPSImgDirection":"235.08839405999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632383299999995","GPSLatitude":"48.46196667000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.200000000000003","GPSHPositioningError":"6.6014733840304185","DateCreated":"2020-09-01T16:18:28+02:00"}}}}
443	[{"x":0.5138,"y":0.8383},{"x":0.495,"y":0.4733},{"x":0.5012,"y":0.1617}]	24	2020-09-03 20:45:13.29638	2020-10-22 16:22:39.558109	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12668965756273398","GPSTimeStamp":"2020-09-01T14:19:07Z","GPSImgDirection":"13.262268069999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631299999999998","GPSLatitude":"48.461925000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"5.0025673463312996","DateCreated":"2020-09-01T16:19:07+02:00"}}}}
330	[{"x":0.6062,"y":0.8633},{"x":0.585,"y":0.5983},{"x":0.6012,"y":0.36},{"x":0.5363,"y":0.1167}]	92	2020-09-03 20:43:18.069393	2020-10-22 16:24:03.420276	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.026612449441876795","GPSTimeStamp":"2020-09-01T14:22:24Z","GPSImgDirection":"214.94202413000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635499999999999","GPSLatitude":"48.461874999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.299999999999997","GPSHPositioningError":"6.2291757932286123","DateCreated":"2020-09-01T16:22:23+02:00"}}}}
459	[{"x":0.6913,"y":0.3117},{"x":0.62,"y":0.3667},{"x":0.5763,"y":0.5483},{"x":0.4113,"y":0.5883},{"x":0.2162,"y":0.56}]	68	2020-09-03 20:47:10.23744	2020-10-22 16:24:30.213666	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.019292602315384245","GPSTimeStamp":"2020-09-01T14:23:22Z","GPSImgDirection":"338.06716929000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633866700000004","GPSLatitude":"48.461829999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.5","GPSHPositioningError":"4.3904853074411525","DateCreated":"2020-09-01T16:23:21+02:00"}}}}
289	[{"x":0.305,"y":0.5867},{"x":0.435,"y":0.495},{"x":0.575,"y":0.4617},{"x":0.64,"y":0.3633},{"x":0.6825,"y":0.285}]	18	2020-09-03 20:43:12.136503	2020-10-22 16:26:20.507029	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.020021224390474709","GPSTimeStamp":"2020-09-01T14:27:43Z","GPSImgDirection":"232.44625850000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635333299999995","GPSLatitude":"48.46172","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"18.1854688470296","DateCreated":"2020-09-01T16:27:43+02:00"}}}}
294	[{"x":0.5875,"y":0.855},{"x":0.5887,"y":0.43},{"x":0.575,"y":0.1683}]	17	2020-09-03 20:43:12.883136	2020-10-22 16:27:26.512014	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.029064768926759667","GPSTimeStamp":"2020-09-01T14:29:36Z","GPSImgDirection":"194.19494629000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635199999999997","GPSLatitude":"48.461608330000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.400000000000006","GPSHPositioningError":"4.8274354997885238","DateCreated":"2020-09-01T16:29:35+02:00"}}}}
348	[{"x":0.1737,"y":0.6167},{"x":0.365,"y":0.5633},{"x":0.56,"y":0.575},{"x":0.645,"y":0.4717},{"x":0.6725,"y":0.3367},{"x":0.6613,"y":0.2467}]	99	2020-09-03 20:43:20.999853	2020-10-22 16:28:21.174839	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.015027155171126844","GPSTimeStamp":"2020-09-01T14:30:50Z","GPSImgDirection":"259.79985062999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635133299999998","GPSLatitude":"48.461588329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.799999999999997","GPSHPositioningError":"8.8593898448221253","DateCreated":"2020-09-01T16:30:49+02:00"}}}}
450	[{"x":0.4625,"y":0.8583},{"x":0.4788,"y":0.415},{"x":0.4738,"y":0.1517}]	23	2020-09-03 20:45:14.444203	2020-10-22 16:22:55.346315	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.23120242348920308","GPSTimeStamp":"2020-09-01T14:20:05Z","GPSImgDirection":"85.31655889999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633616700000005","GPSLatitude":"48.461916670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95","GPSHPositioningError":"4.4636293113736727","DateCreated":"2020-09-01T16:20:04+02:00"}}}}
277	[{"x":0.6462,"y":0.755},{"x":0.6362,"y":0.5267},{"x":0.5125,"y":0.3783},{"x":0.465,"y":0.1833},{"x":0.4763,"y":0.14}]	22	2020-09-03 20:43:10.306558	2020-10-22 16:23:13.393318	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.061645239578892133","GPSTimeStamp":"2020-09-01T14:21:09Z","GPSImgDirection":"82.748077429999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634549999999999","GPSLatitude":"48.461961670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.200000000000003","GPSHPositioningError":"4.4070837308059208","DateCreated":"2020-09-01T16:21:08+02:00"}}}}
408	[{"x":0.5787,"y":0.88},{"x":0.4788,"y":0.6033},{"x":0.4625,"y":0.11}]	96	2020-09-03 20:43:29.496963	2020-10-22 16:26:41.502705	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10093744101671455","GPSTimeStamp":"2020-09-01T14:28:38Z","GPSImgDirection":"50.302886969999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634616700000002","GPSLatitude":"48.461675","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94","GPSHPositioningError":"4.4999842465106017","DateCreated":"2020-09-01T16:28:38+02:00"}}}}
425	[{"x":0.4575,"y":0.77},{"x":0.4825,"y":0.4267},{"x":0.4725,"y":0.1983}]	127	2020-09-03 20:43:31.940934	2020-10-22 16:27:50.483877	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12574183940830519","GPSTimeStamp":"2020-09-01T14:30:09Z","GPSImgDirection":"209.81430040999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.461620000000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.299999999999997","GPSHPositioningError":"7.3153970423760404","DateCreated":"2020-09-01T16:30:08+02:00"}}}}
356	[{"x":0.515,"y":0.8317},{"x":0.5188,"y":0.4333},{"x":0.5275,"y":0.195}]	15	2020-09-03 20:43:21.979379	2020-10-22 16:32:52.923348	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.31646496066079416","GPSTimeStamp":"2020-09-01T14:34:44Z","GPSImgDirection":"250.79682913000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633333299999995","GPSLatitude":"48.461521670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.900000000000006","GPSHPositioningError":"7.9008387144659693","DateCreated":"2020-09-01T16:34:44+02:00"}}}}
372	[{"x":0.5837,"y":0.8667},{"x":0.63,"y":0.665},{"x":0.5175,"y":0.5067},{"x":0.4587,"y":0.365},{"x":0.4325,"y":0.0817}]	104	2020-09-03 20:43:24.205189	2020-10-22 16:35:42.373215	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.22296205157897275","GPSTimeStamp":"2020-09-01T14:36:29Z","GPSImgDirection":"243.41471860999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66330833","GPSLatitude":"48.461553330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"4.6398571892242781","DateCreated":"2020-09-01T16:36:28+02:00"}}}}
399	[{"x":0.5713,"y":0.8483},{"x":0.5525,"y":0.6067},{"x":0.54,"y":0.4317},{"x":0.5463,"y":0.2067}]	189	2020-09-03 20:43:28.146374	2020-10-22 17:17:00.384751	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.65165263439740573","GPSTimeStamp":"2020-09-01T16:19:47Z","GPSImgDirection":"212.31250764000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637583299999994","GPSLatitude":"48.462508330000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99","GPSHPositioningError":"7.4254130788922508","DateCreated":"2020-09-01T18:19:47+02:00"}}}}
427	[{"x":0.435,"y":0.755},{"x":0.435,"y":0.58},{"x":0.4788,"y":0.3317},{"x":0.5487,"y":0.0817}]	216	2020-09-03 20:43:32.273362	2020-10-22 17:22:14.825986	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10051354762851661","GPSTimeStamp":"2020-09-01T16:23:56Z","GPSImgDirection":"159.05798342999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635700000000004","GPSLatitude":"48.462575000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.099999999999994","GPSHPositioningError":"4.8412249099330928","DateCreated":"2020-09-01T18:23:55+02:00"}}}}
271	[{"x":0.4338,"y":0.8183},{"x":0.4575,"y":0.4333},{"x":0.4475,"y":0.1167}]	77	2020-09-03 20:43:09.725049	2020-10-22 17:24:02.097733	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.035168167216557619","GPSTimeStamp":"2020-09-01T16:25:24Z","GPSImgDirection":"173.76921841999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635499999999999","GPSLatitude":"48.462555000000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.099999999999994","GPSHPositioningError":"11.467174641877476","DateCreated":"2020-09-01T18:25:24+02:00"}}}}
310	[{"x":0.5475,"y":0.8233},{"x":0.5513,"y":0.545},{"x":0.48,"y":0.4267},{"x":0.3862,"y":0.3433},{"x":0.3925,"y":0.1517}]	238	2020-09-03 20:43:15.05152	2020-10-22 16:32:03.373953	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.091560974690462274","GPSTimeStamp":"2020-09-01T14:32:05Z","GPSImgDirection":"300.69732669000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634783299999998","GPSLatitude":"48.461463330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.400000000000006","GPSHPositioningError":"4.1667193326170766","DateCreated":"2020-09-01T16:32:04+02:00"}}}}
329	[{"x":0.7462,"y":0.4783},{"x":0.47,"y":0.4},{"x":0.3688,"y":0.4167},{"x":0.1988,"y":0.6167}]	16	2020-09-03 20:43:17.944815	2020-10-22 16:32:22.275663	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1008271425289117","GPSTimeStamp":"2020-09-01T14:32:53Z","GPSImgDirection":"172.67701717","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633783299999996","GPSLatitude":"48.461505000000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.799999999999997","GPSHPositioningError":"5.2664652964738332","DateCreated":"2020-09-01T16:32:53+02:00"}}}}
444	[{"x":0.3912,"y":0.7967},{"x":0.3775,"y":0.6383},{"x":0.445,"y":0.4917},{"x":0.4437,"y":0.35},{"x":0.3762,"y":0.2667},{"x":0.3862,"y":0.1017}]	237	2020-09-03 20:45:13.39879	2020-10-22 16:35:55.386607	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.22296205157897275","GPSTimeStamp":"2020-09-01T14:36:29Z","GPSImgDirection":"243.41471860999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66330833","GPSLatitude":"48.461553330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"4.6398571892242781","DateCreated":"2020-09-01T16:36:28+02:00"}}}}
281	[{"x":0.6012,"y":0.8633},{"x":0.6262,"y":0.46},{"x":0.6,"y":0.2533}]	214	2020-09-03 20:43:10.945796	2020-10-22 17:23:24.689877	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.087108738726668897","GPSTimeStamp":"2020-09-01T16:24:56Z","GPSImgDirection":"169.97811900000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635450000000001","GPSLatitude":"48.46255","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.200000000000003","GPSHPositioningError":"13.832619371016612","DateCreated":"2020-09-01T18:24:55+02:00"}}}}
469	[{"x":0.5138,"y":0.845},{"x":0.4913,"y":0.4717},{"x":0.48,"y":0.145}]	155	2020-09-03 20:47:13.029937	2020-10-22 17:27:42.535474	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.16096992799661161","GPSTimeStamp":"2020-09-01T16:29:58Z","GPSImgDirection":"77.008636479999979","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66349167","GPSLatitude":"48.462661670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"5.0168562564632886","DateCreated":"2020-09-01T18:29:57+02:00"}}}}
360	[{"x":0.61,"y":0.855},{"x":0.6512,"y":0.61},{"x":0.6062,"y":0.4217},{"x":0.5487,"y":0.2633},{"x":0.5525,"y":0.185}]	101	2020-09-03 20:43:22.635688	2020-10-22 16:35:22.493372	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.22296205157897275","GPSTimeStamp":"2020-09-01T14:36:29Z","GPSImgDirection":"243.41471860999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66330833","GPSLatitude":"48.461553330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"4.6398571892242781","DateCreated":"2020-09-01T16:36:28+02:00"}}}}
377	[{"x":0.5375,"y":0.865},{"x":0.5363,"y":0.5967},{"x":0.5088,"y":0.4433},{"x":0.5325,"y":0.215},{"x":0.5463,"y":0.11}]	66	2020-09-03 20:43:24.916022	2020-10-22 16:36:15.565985	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12581816322356312","GPSTimeStamp":"2020-09-01T14:38:09Z","GPSImgDirection":"301.29003905999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633133299999998","GPSLatitude":"48.461536670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96","GPSHPositioningError":"7.0036695075757578","DateCreated":"2020-09-01T16:38:09+02:00"}}}}
371	[{"x":0.49,"y":0.8833},{"x":0.52,"y":0.6233},{"x":0.425,"y":0.5083},{"x":0.395,"y":0.4167},{"x":0.435,"y":0.2717}]	14	2020-09-03 20:43:24.021995	2020-10-22 16:36:32.12613	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12581816322356312","GPSTimeStamp":"2020-09-01T14:38:09Z","GPSImgDirection":"301.29003905999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633133299999998","GPSLatitude":"48.461536670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96","GPSHPositioningError":"7.0036695075757578","DateCreated":"2020-09-01T16:38:09+02:00"}}}}
379	[{"x":0.655,"y":0.7917},{"x":0.6787,"y":0.58},{"x":0.6863,"y":0.5133},{"x":0.6375,"y":0.3817},{"x":0.605,"y":0.285},{"x":0.5913,"y":0.2467}]	102	2020-09-03 20:43:25.196881	2020-10-22 16:36:48.902107	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.21534779653336356","GPSTimeStamp":"2020-09-01T14:39:26Z","GPSImgDirection":"184.82858289999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632716700000003","GPSLatitude":"48.461620000000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.299999999999997","GPSHPositioningError":"4.6159732766474342","DateCreated":"2020-09-01T16:39:25+02:00"}}}}
419	[{"x":0.6062,"y":0.84},{"x":0.61,"y":0.5217},{"x":0.5813,"y":0.3167},{"x":0.5325,"y":0.1183}]	103	2020-09-03 20:43:30.944575	2020-10-22 16:37:36.179688	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.26825070377339227","GPSTimeStamp":"2020-09-01T14:40:52Z","GPSImgDirection":"328.42602539000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632166700000006","GPSLatitude":"48.461508330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96","GPSHPositioningError":"13.146074914490699","DateCreated":"2020-09-01T16:40:52+02:00"}}}}
468	[{"x":0.405,"y":0.84},{"x":0.4213,"y":0.4183},{"x":0.4325,"y":0.1867}]	109	2020-09-03 20:47:12.887322	2020-10-22 16:37:56.017223	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11717549704133012","GPSTimeStamp":"2020-09-01T14:41:27Z","GPSImgDirection":"356.34841954000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631833299999998","GPSLatitude":"48.461505000000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.200000000000003","GPSHPositioningError":"5.7452584685956243","DateCreated":"2020-09-01T16:41:27+02:00"}}}}
400	[{"x":0.5337,"y":0.8367},{"x":0.5275,"y":0.6683},{"x":0.555,"y":0.2767}]	10	2020-09-03 20:43:28.255468	2020-10-22 16:38:37.570344	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.05346066501711691","GPSTimeStamp":"2020-09-01T14:42:36Z","GPSImgDirection":"163.01194766","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630700000000003","GPSLatitude":"48.46142167","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97","GPSHPositioningError":"4.4484508656325463","DateCreated":"2020-09-01T16:42:36+02:00"}}}}
345	[{"x":0.7538,"y":0.5933},{"x":0.6188,"y":0.5683},{"x":0.5112,"y":0.535},{"x":0.4325,"y":0.4133},{"x":0.3663,"y":0.3083}]	11	2020-09-03 20:43:20.418341	2020-10-22 16:38:55.124631	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.13987381758072476","GPSTimeStamp":"2020-09-01T14:43:11Z","GPSImgDirection":"49.400268549999993","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629550000000002","GPSLatitude":"48.46143","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97","GPSHPositioningError":"8.1016579308483117","DateCreated":"2020-09-01T16:43:10+02:00"}}}}
343	[{"x":0.2162,"y":0.4917},{"x":0.5725,"y":0.46},{"x":0.8612,"y":0.45}]	12	2020-09-03 20:43:20.186461	2020-10-22 16:40:00.772624	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.21919184918214585","GPSTimeStamp":"2020-09-01T14:44:34Z","GPSImgDirection":"18.120239259999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628716700000004","GPSLatitude":"48.461411669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.599999999999994","GPSHPositioningError":"5.518480148694354","DateCreated":"2020-09-01T16:44:33+02:00"}}}}
295	[{"x":0.5012,"y":0.7717},{"x":0.57,"y":0.4583},{"x":0.5313,"y":0.3033},{"x":0.445,"y":0.2017}]	106	2020-09-03 20:43:12.969104	2020-10-22 16:40:28.189438	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.042608253616156014","GPSTimeStamp":"2020-09-01T14:45:05Z","GPSImgDirection":"265.78387458000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.662855","GPSLatitude":"48.461400000000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.900000000000006","GPSHPositioningError":"6.4285719043495639","DateCreated":"2020-09-01T16:45:04+02:00"}}}}
328	[{"x":0.5537,"y":0.79},{"x":0.5487,"y":0.4933},{"x":0.5212,"y":0.23},{"x":0.505,"y":0.1467}]	60	2020-09-03 20:43:17.676112	2020-10-22 16:46:13.547484	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.043312981706750867","GPSTimeStamp":"2020-09-01T14:59:43Z","GPSImgDirection":"73.87155147","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633583299999999","GPSLatitude":"48.460841670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"101.2","GPSHPositioningError":"4.2884836117842111","DateCreated":"2020-09-01T16:59:42+02:00"}}}}
431	[{"x":0.61,"y":0.1717},{"x":0.5725,"y":0.3233},{"x":0.49,"y":0.47},{"x":0.405,"y":0.6433},{"x":0.3513,"y":0.8417}]	152	2020-09-03 20:43:33.058935	2020-10-22 17:28:35.271468	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.069582052533674582","GPSTimeStamp":"2020-09-01T16:31:44Z","GPSImgDirection":"221.24232488999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634499999999997","GPSLatitude":"48.462666670000011","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"5.6906091500589167","DateCreated":"2020-09-01T18:31:44+02:00"}}}}
290	[{"x":0.4188,"y":0.7767},{"x":0.41,"y":0.4983},{"x":0.4575,"y":0.2483},{"x":0.5,"y":0.13}]	107	2020-09-03 20:43:12.257348	2020-10-22 16:41:18.489436	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.020565554500085466","GPSTimeStamp":"2020-09-01T14:46:22Z","GPSImgDirection":"94.113431420000012","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627866700000005","GPSLatitude":"48.461463330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.200000000000003","GPSHPositioningError":"13.626882776686314","DateCreated":"2020-09-01T16:46:22+02:00"}}}}
334	[{"x":0.5288,"y":0.655},{"x":0.5713,"y":0.4917},{"x":0.6225,"y":0.335}]	7	2020-09-03 20:43:18.548004	2020-10-22 16:44:40.865956	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.035522412543916013","GPSTimeStamp":"2020-09-01T14:56:05Z","GPSImgDirection":"173.90283203000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630799999999999","GPSLatitude":"48.461208329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99","GPSHPositioningError":"5.5893990441118859","DateCreated":"2020-09-01T16:56:04+02:00"}}}}
355	[{"x":0.5363,"y":0.8367},{"x":0.5325,"y":0.5233},{"x":0.53,"y":0.2467},{"x":0.5487,"y":0.17}]	61	2020-09-03 20:43:21.869664	2020-10-22 16:45:37.962503	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10681958498582089","GPSTimeStamp":"2020-09-01T14:57:48Z","GPSImgDirection":"215.42632293000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631166700000004","GPSLatitude":"48.461016670000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.400000000000006","GPSHPositioningError":"4.5235042229529911","DateCreated":"2020-09-01T16:57:47+02:00"}}}}
456	[{"x":0.3613,"y":0.8333},{"x":0.3875,"y":0.4417},{"x":0.3862,"y":0.2083}]	126	2020-09-03 20:45:15.401371	2020-10-22 16:48:43.847299	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.14884082972188328","GPSTimeStamp":"2020-09-01T15:11:54Z","GPSImgDirection":"330.57759104000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.663875","GPSLatitude":"48.461028329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"4.3398308278547804","DateCreated":"2020-09-01T17:11:54+02:00"}}}}
283	[{"x":0.51,"y":0.8917},{"x":0.485,"y":0.6083},{"x":0.5,"y":0.3783},{"x":0.5225,"y":0.15}]	153	2020-09-03 20:43:11.273067	2020-10-22 17:29:15.730234	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.060316365249100674","GPSTimeStamp":"2020-09-01T16:33:43Z","GPSImgDirection":"82.054931639999992","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632716700000003","GPSLatitude":"48.462628329999987","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.5","GPSHPositioningError":"4.6488346818017146","DateCreated":"2020-09-01T18:33:43+02:00"}}}}
436	[{"x":0.5487,"y":0.8967},{"x":0.5775,"y":0.4517},{"x":0.5975,"y":0.18}]	3	2020-09-03 20:43:33.62075	2020-10-22 16:41:57.555298	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.031011726724588143","GPSTimeStamp":"2020-09-01T14:48:34Z","GPSImgDirection":"278.58912656000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6625666699999999","GPSLatitude":"48.461229999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.900000000000006","GPSHPositioningError":"5.4118173429154668","DateCreated":"2020-09-01T16:48:33+02:00"}}}}
435	[{"x":0.5687,"y":0.8217},{"x":0.5825,"y":0.7667},{"x":0.5813,"y":0.4283},{"x":0.5487,"y":0.2167}]	110	2020-09-03 20:43:33.516038	2020-10-22 16:43:51.39197	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.042961738981795394","GPSTimeStamp":"2020-09-01T14:53:02Z","GPSImgDirection":"71.878082280000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628833299999997","GPSLatitude":"48.461196670000007","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"101","GPSHPositioningError":"5.3392727512703759","DateCreated":"2020-09-01T16:53:01+02:00"}}}}
278	[{"x":0.5887,"y":0.815},{"x":0.5737,"y":0.5933},{"x":0.5275,"y":0.4833},{"x":0.4637,"y":0.4067},{"x":0.435,"y":0.2717},{"x":0.4363,"y":0.1917}]	244	2020-09-03 20:43:10.468419	2020-10-22 16:47:29.201522	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.018974101162771845","GPSTimeStamp":"2020-09-01T15:03:36Z","GPSImgDirection":"67.032745360000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6640299999999995","GPSLatitude":"48.460761669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"100.3","GPSHPositioningError":"4.4114744081843673","DateCreated":"2020-09-01T17:03:35+02:00"}}}}
288	[{"x":0.5787,"y":0.8133},{"x":0.5525,"y":0.4733},{"x":0.5463,"y":0.185}]	125	2020-09-03 20:43:12.022253	2020-10-22 16:48:10.037288	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.027648534610559928","GPSTimeStamp":"2020-09-01T15:06:44Z","GPSImgDirection":"122.43084721","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6642049999999999","GPSLatitude":"48.460888330000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.599999999999994","GPSHPositioningError":"4.5238286103651451","DateCreated":"2020-09-01T17:06:44+02:00"}}}}
410	[{"x":0.575,"y":0.8367},{"x":0.5188,"y":0.69},{"x":0.5337,"y":0.3617}]	81	2020-09-03 20:43:29.696855	2020-10-22 17:29:40.976382	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.01135986951145721","GPSTimeStamp":"2020-09-01T16:47:58Z","GPSImgDirection":"107.79288285","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6639333299999999","GPSLatitude":"48.462405000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.900000000000006","GPSHPositioningError":"4.1697055051178227","DateCreated":"2020-09-01T18:47:57+02:00"}}}}
303	[{"x":0.6088,"y":0.8933},{"x":0.6262,"y":0.2883},{"x":0.6288,"y":0.1683}]	2	2020-09-03 20:43:14.164997	2020-10-22 16:43:16.017233	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010111357085194724","GPSTimeStamp":"2020-09-01T14:50:14Z","GPSImgDirection":"44.531646729999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6625450000000002","GPSLatitude":"48.461166669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.700000000000003","GPSHPositioningError":"7.0968249168430599","DateCreated":"2020-09-01T16:50:14+02:00"}}}}
341	[{"x":0.5425,"y":0.8367},{"x":0.4562,"y":0.6317},{"x":0.4188,"y":0.3967},{"x":0.4275,"y":0.235}]	82	2020-09-03 20:43:19.88968	2020-10-22 17:30:23.684488	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.084289811534337983","GPSTimeStamp":"2020-09-01T16:48:48Z","GPSImgDirection":"224.77153024999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6640466700000003","GPSLatitude":"48.462354999999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.700000000000003","GPSHPositioningError":"7.7187549880287314","DateCreated":"2020-09-01T18:48:47+02:00"}}}}
409	[{"x":0.4888,"y":0.7233},{"x":0.505,"y":0.4767},{"x":0.5012,"y":0.24},{"x":0.49,"y":0.1617}]	157	2020-09-03 20:43:29.610172	2020-10-22 17:32:56.799315	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.055502265736116163","GPSTimeStamp":"2020-09-01T16:53:11Z","GPSImgDirection":"241.72735590000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638700000000002","GPSLatitude":"48.462671669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.5","GPSHPositioningError":"4.1091511267909855","DateCreated":"2020-09-01T18:53:11+02:00"}}}}
373	[{"x":0.205,"y":0.8417},{"x":0.2125,"y":0.6067},{"x":0.3337,"y":0.475},{"x":0.535,"y":0.4017},{"x":0.6825,"y":0.375},{"x":0.7238,"y":0.28}]	58	2020-09-03 20:43:24.357977	2020-10-22 16:46:52.498902	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.013690051621794794","GPSTimeStamp":"2020-09-01T15:01:38Z","GPSImgDirection":"27.990447999999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637300000000002","GPSLatitude":"48.460796670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"100.5","GPSHPositioningError":"3.9521587030716723","DateCreated":"2020-09-01T17:01:37+02:00"}}}}
276	[{"x":0.2062,"y":0.5567},{"x":0.3412,"y":0.4717},{"x":0.4975,"y":0.4033},{"x":0.6512,"y":0.3933},{"x":0.7662,"y":0.4167}]	84	2020-09-03 20:43:10.206095	2020-10-22 17:31:39.576444	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.20431724189632125","GPSTimeStamp":"2020-09-01T16:50:57Z","GPSImgDirection":"74.356201170000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641783299999995","GPSLatitude":"48.462575000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"10.324453134547232","DateCreated":"2020-09-01T18:50:56+02:00"}}}}
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 838, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 838, true);


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.areas_id_seq', 4, true);


--
-- Name: boulders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.boulders_id_seq', 399, true);


--
-- Name: circuits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.circuits_id_seq', 15, true);


--
-- Name: pois_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.pois_id_seq', 2, true);


--
-- Name: problems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.problems_id_seq', 526, true);


--
-- Name: topos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.topos_id_seq', 506, true);


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

