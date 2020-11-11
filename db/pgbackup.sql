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
-- Name: lines; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.lines (
    id bigint NOT NULL,
    coordinates json,
    problem_id bigint,
    topo_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.lines OWNER TO nicolas;

--
-- Name: lines_id_seq; Type: SEQUENCE; Schema: public; Owner: nicolas
--

CREATE SEQUENCE public.lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lines_id_seq OWNER TO nicolas;

--
-- Name: lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicolas
--

ALTER SEQUENCE public.lines_id_seq OWNED BY public.lines.id;


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
    tags character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    bleau_info_id character varying
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
-- Name: lines id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.lines ALTER COLUMN id SET DEFAULT nextval('public.lines_id_seq'::regclass);


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
841	photo	Topo	509	841	2020-10-27 10:13:03.234681
842	photo	Topo	510	842	2020-10-27 10:15:09.9353
851	photo	Topo	519	851	2020-10-27 10:27:56.079271
853	photo	Topo	521	853	2020-10-27 10:30:16.5122
855	photo	Topo	523	855	2020-10-27 10:32:37.71907
856	photo	Topo	524	856	2020-10-27 10:33:43.85032
857	photo	Topo	525	857	2020-10-27 10:39:21.335204
858	photo	Topo	526	858	2020-10-27 10:40:08.1789
859	photo	Topo	527	859	2020-10-27 10:41:28.863519
861	photo	Topo	529	861	2020-10-27 10:53:13.089174
866	photo	Topo	534	866	2020-10-27 10:58:37.085393
868	photo	Topo	536	868	2020-10-27 11:00:48.491251
875	photo	Topo	543	875	2020-10-27 11:09:16.035644
877	photo	Topo	545	877	2020-10-27 11:15:50.558644
878	photo	Topo	546	878	2020-10-27 11:16:49.422645
879	photo	Topo	547	879	2020-10-27 11:17:34.687031
880	photo	Topo	548	880	2020-10-27 11:18:25.166828
883	photo	Topo	551	883	2020-10-27 11:21:07.542604
884	photo	Topo	552	884	2020-10-27 11:22:11.364826
886	photo	Topo	554	886	2020-10-27 11:24:43.030201
887	photo	Topo	555	887	2020-10-27 11:26:29.531406
890	photo	Topo	558	890	2020-10-27 11:28:48.426109
891	photo	Topo	559	891	2020-11-01 14:02:20.952555
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
839	photo	Topo	507	839	2020-10-27 10:07:49.619423
844	photo	Topo	512	844	2020-10-27 10:18:52.37728
847	photo	Topo	515	847	2020-10-27 10:23:41.880701
848	photo	Topo	516	848	2020-10-27 10:25:02.615169
850	photo	Topo	518	850	2020-10-27 10:27:04.562888
852	photo	Topo	520	852	2020-10-27 10:29:11.968915
854	photo	Topo	522	854	2020-10-27 10:31:40.198428
860	photo	Topo	528	860	2020-10-27 10:52:14.275322
862	photo	Topo	530	862	2020-10-27 10:54:08.203082
863	photo	Topo	531	863	2020-10-27 10:55:15.254806
864	photo	Topo	532	864	2020-10-27 10:56:10.236998
865	photo	Topo	533	865	2020-10-27 10:57:11.145929
867	photo	Topo	535	867	2020-10-27 10:59:47.423685
869	photo	Topo	537	869	2020-10-27 11:03:21.004333
870	photo	Topo	538	870	2020-10-27 11:04:40.671174
871	photo	Topo	539	871	2020-10-27 11:05:42.506845
872	photo	Topo	540	872	2020-10-27 11:06:55.370334
873	photo	Topo	541	873	2020-10-27 11:07:43.220877
874	photo	Topo	542	874	2020-10-27 11:08:29.351858
876	photo	Topo	544	876	2020-10-27 11:14:31.608207
881	photo	Topo	549	881	2020-10-27 11:19:06.935272
882	photo	Topo	550	882	2020-10-27 11:19:55.435939
885	photo	Topo	553	885	2020-10-27 11:23:14.43159
888	photo	Topo	556	888	2020-10-27 11:27:08.042394
889	photo	Topo	557	889	2020-10-27 11:27:50.317583
892	photo	Topo	560	892	2020-11-01 14:02:46.826051
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
840	photo	Topo	508	840	2020-10-27 10:10:54.161387
843	photo	Topo	511	843	2020-10-27 10:16:59.007886
845	photo	Topo	513	845	2020-10-27 10:20:19.900054
846	photo	Topo	514	846	2020-10-27 10:22:14.178047
849	photo	Topo	517	849	2020-10-27 10:26:02.621596
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
860	xafk8wsuencymj2pqkqci532s60u	IMG_0983.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13167485	XJG910/F4F8CyiNclTnO5Q==	2020-10-27 10:52:14.273128
863	ab7bvdrzcqbdpnm2jfjy8n80rmwn	IMG_0989.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12370867	qbCHFAlFz2KCF+/aoo8pmg==	2020-10-27 10:55:15.253
864	bw9ahp831qhtphww6jphbl1xh8uo	IMG_0991.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12606943	Gd6N0sT4F/glu7okSxkc+w==	2020-10-27 10:56:10.235223
869	g0fnfi55zvqyzrarni4ede2vqbts	IMG_1002.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13188628	EQDADyg6g5M3jRtWAG4YJw==	2020-10-27 11:03:21.002591
871	cyt9c0y62soaqoh4cg92qwe37xsz	IMG_1002.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13188628	EQDADyg6g5M3jRtWAG4YJw==	2020-10-27 11:05:42.504614
872	fzfm1miprphao0t3xz54kc3htgsb	IMG_1004.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12194921	FfKgAcj26RtKxHwGsLyyIA==	2020-10-27 11:06:55.368526
876	uzhqakq63thhapd7m8v2myn5c4yc	IMG_1010.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13229466	XH7T0i+rXdqgkHQl1C79Cg==	2020-10-27 11:14:31.60673
881	i9ysfr1dynlf0vnz75irgs2oglhj	IMG_1018.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13995555	WllURgP6Z6hxVAIO5d2EBQ==	2020-10-27 11:19:06.933686
883	rmaz1f7slk2as0r75ijztamuya32	IMG_1022.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12756726	4TcJqgW9DqtX0bQiWNeRxA==	2020-10-27 11:21:07.540441
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
861	9a0k007mqki0l512g75xbno80xb1	IMG_0985.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13315951	rhtxguc7SIwJxb+5tJm3Rw==	2020-10-27 10:53:13.086845
868	ufb97dgn7hr4yicz9qlzfofxskuv	IMG_0999.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13834998	Z5yYaWI7R1P8WVzzyTn9hw==	2020-10-27 11:00:48.48852
875	vfpom2cagmrepakx0hzx28x6aai9	IMG_1008.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13762305	1XjVsjnJHDCF7T7z18VouQ==	2020-10-27 11:09:16.033638
877	oafxizdd6k1x5svp8l5gvew37d9r	IMG_1010.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13229466	XH7T0i+rXdqgkHQl1C79Cg==	2020-10-27 11:15:50.556958
878	4jtfrngsjjwfum1etbq4307r0slo	IMG_1012.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13303324	UdkmUYsPWsT4PxY6XUbgiQ==	2020-10-27 11:16:49.420981
879	hsuhfop6jbhs3lyodsslk68n8ew6	IMG_1014.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14923140	TGFxAzKpGq0/1T3Q0b2/ig==	2020-10-27 11:17:34.685092
880	unc4i28wjz5yfbpivrp8w2faqz01	IMG_1016.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14295725	ymNLNZuM9HqC5CWyox5gsA==	2020-10-27 11:18:25.165208
884	mzy6mcu08501mqylg4hphqfpj4rd	IMG_1025.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9676404	fcC/Aebf6aQ5GUcRUD1EdQ==	2020-10-27 11:22:11.363323
886	0ia6452kci1hhpv0g1n5njp5icm1	IMG_1027.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9727024	AUrKnNoh1yzhRtm1WWzdyg==	2020-10-27 11:24:43.028235
887	uzjzm1axx89w483zvhxqgf1t9ftt	IMG_1029.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10189311	ljrk7AYjpo+pMG4YdVZkJw==	2020-10-27 11:26:29.529345
890	qg6jtac2tbghzy14vlijpp4kgz91	IMG_1035.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9673223	/UsveMtz3GVFGjsYJuaYPg==	2020-10-27 11:28:48.424322
446	gr9h5hzo9g7zhudhyo2g36e1lvyk	photo.jpg	image/jpeg	{"identified":true}	12287076	x0qXVG+Wt1zREiQmXXS/tw==	2020-09-03 20:43:28.947692
447	q3ysoxc62350f4t81k4plaxc1yqx	photo.jpg	image/jpeg	{"identified":true}	10984727	zbShp9JgSF2Ab2su+ZnK3w==	2020-09-03 20:43:29.046729
604	oe48clrmumli71vsoc3b073054v4	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13789824	B10XM2CF/nc3/mb4y/F2kg==	2020-09-03 20:46:44.042287
811	3sioprnpalduj205s7vgktyesckk	orange-1.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12709511	Iv9dymVkhOUL8HBQ+7BWWQ==	2020-10-15 13:24:49.711501
626	bevlzsgvko05maru4wdhyt3yxe4u	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12627287	81RxfXZKQLVpuQFDmQgptw==	2020-09-03 20:46:47.487918
631	6uuk4e7ke0sgaf7blgkokx62u4id	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10878374	VCpWAKvC83y3oqRt02VFYg==	2020-09-03 20:46:48.384628
862	9j4ie8a3w8vz31ixjqmnn5myfjxo	IMG_0987.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12884071	Sy+E4AWn7kNWKw39TEcRuw==	2020-10-27 10:54:08.200062
865	8je8ft5doe82e11bqiu2tvhny03i	IMG_0993.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12357357	rW89TzJIY0sQGC8VnR7Auw==	2020-10-27 10:57:11.143392
866	tkyuvty708zp2a7qxdhzeas1j3nr	IMG_0995.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10979965	ILQfh/4Cg1rbbxxGaLrXXQ==	2020-10-27 10:58:37.083716
870	3jby8nnyhxn2nj1izucxxq8zu89l	IMG_1002.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13188628	EQDADyg6g5M3jRtWAG4YJw==	2020-10-27 11:04:40.669624
873	zw0owzqz0xfa9772t3dqjrkxbigy	IMG_1004.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12194921	FfKgAcj26RtKxHwGsLyyIA==	2020-10-27 11:07:43.218401
888	3h59pg8ytr47j3ijkas324ldv1r7	IMG_1031.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	8843050	XFHHXLiXPQZfaVXUsyR57g==	2020-10-27 11:27:08.040643
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
867	oqcrl67ef438h2udjm6zky6e9rs8	IMG_0997.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12987778	btlDfzJ0F0M1kC0qI7Pfsw==	2020-10-27 10:59:47.421681
874	rnouwfie9urxl2faq1d9f4ad5xdr	IMG_1006.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13872926	APK5QBSxuEm9cIdFg3KElA==	2020-10-27 11:08:29.349964
882	ti2ji4y4xchuqfgpz08uabgvq6xm	IMG_1020.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14034475	MYjUU/33Y/9i3S6t6nrZ4A==	2020-10-27 11:19:55.433822
885	7a1snti00d291lf0hqwsmjissgzn	IMG_1025.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9676404	fcC/Aebf6aQ5GUcRUD1EdQ==	2020-10-27 11:23:14.429668
688	pcrm1fnfe4mzqklqvwshcrk100km	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10248534	+QXHnpMUlebeDVyZLzXVbg==	2020-09-03 20:46:57.958508
889	bxkt19typp88l7tuhqhv09djxxlz	IMG_1033.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9321905	9uzu93eCEHGH9n9B8MENJQ==	2020-10-27 11:27:50.314338
720	8y0ly5gc60v07aey39mlph4t8o1h	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12143601	WNLc6g2yVXl87erMlSVvAA==	2020-09-03 20:47:02.930447
725	xdu5wm07hh50ap2q9x77e1hntbt1	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12023608	pxX/fCbzQ6pq7cflPyH2ng==	2020-09-03 20:47:03.802462
817	uel9pzuxd8zh1i0gyywvsle4o6oj	IMG_0893.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13262020	8/PtqOu4+18GTjcT2Zr5eA==	2020-10-19 19:41:22.711328
839	y0bqm165v89yko135ku6pszlbnu1	IMG_0937.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11677487	jVuYPac8uOuvXquyvFmM3Q==	2020-10-27 10:07:49.613961
844	xgixg14y9srdz3r4w4mdf2hu385c	IMG_0946.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11559217	6G9lJ6qZ7JaXStVoRM7/4A==	2020-10-27 10:18:52.375609
847	gycayzqg8if7b4qfor76en45lhft	IMG_0953.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12225658	XzuKcyIsDeiyjZSPDFQIOQ==	2020-10-27 10:23:41.87898
849	x19z8k6im39e8ghbbh5sk1bfqykj	IMG_0957.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12830166	b3PElizZGxWf6/2JHr468Q==	2020-10-27 10:26:02.619536
850	oqdm579r27bcv75sgd48wz7jbvdv	IMG_0959.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14065798	j1EK1/JUnonv9yCWkHMwxQ==	2020-10-27 10:27:04.560099
852	fz0oftjo6sllfqrjmxuy7hhftud5	IMG_0963.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14431837	w48KBjPvdTStecVeItU8Xg==	2020-10-27 10:29:11.967378
891	6wfmuwr4r8y63gv26hkucxm37zvg	IMG_0937.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11677487	jVuYPac8uOuvXquyvFmM3Q==	2020-11-01 14:02:20.947625
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
840	hetbbwqd9d4c0k14bv4ovn6vtnar	IMG_0939.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10854920	SibVQZOFG/DzM4Z/l+D+bQ==	2020-10-27 10:10:54.15835
689	oxdofogka0ic9jwkcrqbe5eusc60	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11958581	pkOgyObKiui73AMzQRWo/w==	2020-09-03 20:46:58.070987
699	gg0y5xaxsekgm36f3tsj7wm2h02w	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12400237	RSD77HVeiC+0lmy/7fdoIQ==	2020-09-03 20:46:59.683107
704	naohqe2ewnx35mjab0yxbxakjvmk	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13781506	0uME1tDp1C8c87ja7WSulw==	2020-09-03 20:47:00.503712
708	70apgn1gi044iqh4nmmhnlbhv8vj	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13109470	7tudk8tiyxTjiqDoSFaMUQ==	2020-09-03 20:47:01.238003
717	ebctc12uw0jzc1ady3w6y7jid66k	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	8836833	rgABtL0QQXzp0nwFgl1a1A==	2020-09-03 20:47:02.461521
843	nvckfthot7u9c90i5ggljz2xay3j	IMG_0944.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10561300	HPPTQHUzBYzp60ebxq23Bw==	2020-10-27 10:16:59.006177
845	2mk7nz4cqr7asuac32hmgfdlh56e	IMG_0948.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11754315	zQhMm4UIJGh1IltcrvTSug==	2020-10-27 10:20:19.897495
846	glffuivwd3dh8ol9432nqj8xnex3	IMG_0950.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12731999	zxeFrXBTwEcb1bJ4n6C1rw==	2020-10-27 10:22:14.176341
848	jkczfj642as47aivozrf80c1h0zb	IMG_0955.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	15174496	Y5+kpLmD3n5ZTpEg/HhHCA==	2020-10-27 10:25:02.613567
856	avlyfhu73z8pbetbg3v8zpbrax6s	IMG_0974.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13810767	fcCmZj5e1Vd6DPyA5Mgiag==	2020-10-27 10:33:43.847379
859	srt7zfkp9a5b5czf9sihnn7fr7c5	IMG_0981.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13261469	3LKQUOSnpT5rKvCf7onKZg==	2020-10-27 10:41:28.861824
892	khrjploh86ksjtwv01d8irl295pd	IMG_0937.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11677487	jVuYPac8uOuvXquyvFmM3Q==	2020-11-01 14:02:46.822801
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
841	may4coie899zn3uheh7ezq6g8q8a	IMG_0941.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9676687	5UXGs1j3nebjHRZ466OShw==	2020-10-27 10:13:03.232242
842	w9awhlhm6ofyadc7tcu4se3wlc33	IMG_0941.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9676687	5UXGs1j3nebjHRZ466OShw==	2020-10-27 10:15:09.9325
851	7qz6771e5jqkjapjngrbh8z3babf	IMG_0961.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14110541	cAaJGqywbGd8KGohMhxyhw==	2020-10-27 10:27:56.0767
853	k2zc0mqc3774nojpn58g6ul21q2j	IMG_0965.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	15245120	UyEuw6SSFreW1r+gFz0VKA==	2020-10-27 10:30:16.508958
854	hfdf49sa5g5ks6lv55zt0lr7wxwq	IMG_0970.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14040221	BvuJAZ6Cjc6HFDYnhfG2Sw==	2020-10-27 10:31:40.196822
855	fumnvgjchlkbk10f2i3thjbz863v	IMG_0972.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12868325	Pmy8lI9G+HFa0kdsTiqbKg==	2020-10-27 10:32:37.717288
857	1xi3xjr3cyh411fyl0weoukvfxeb	IMG_0977.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12737358	WZ/87kSR/yDc6HvPeg7kIA==	2020-10-27 10:39:21.332727
858	9o76vc023z1ay8go055ki3xo906d	IMG_0979.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12542906	LbNjlsCOjzFYI+nD46rdqA==	2020-10-27 10:40:08.177272
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
470	0103000020E610000001000000120000009E6A8E04E81C05409E36F69439394840215B7CA4E61C0540C3B8B88E39394840F9BA7DA4E61C054088737D803939484085702C58E61C0540A9336677393948401C1A6D86E51C054001DA6E74393948403ED5AD38E41C05404C19DD7139394840C9762624E31C0540944D7262393948400E2AA82DE31C0540C1FCB43B393948400E2AA82DE31C05404D78CEF237394840FF33F923E51C05408DC7D8E537394840FA0833F2E71C054081DDBCE737394840C465B51B0B1D0540674AD32338394840BC2AFB660E1D0540CB96C13B38394840CA35AF470F1D0540351EA8643839484079D7DC2B091D0540DBCEB96C393948405275D0C2071D05407C4AE392393948402A610726051D05400307959A393948409E6A8E04E81C05409E36F69439394840	2020-10-25 21:58:15.285326	2020-10-31 09:24:01.703728	4
455	0103000020E6100000010000000F0000004AE455C8FD1C0540B895891B3A394840B92D3DB40B1D05405E738DF1393948408EFB497F1B1D0540E40917D5393948409C5789AF2B1D0540B1E6C9C6393948400BD75ADC2D1D05405D5204DB393948408D32BFDD2E1D0540946F5D013A394840B4B32A5B301D054071DD23AC3A394840F9FD0A142D1D0540B4DC030B3B39484077CF20382A1D0540F1656E513B3948403878F1A0251D0540A31367603B39484045AAFA3B071D05400114F7303B39484058070145001D05400858C1033B39484084CC5C1AFD1C05404040E89D3A3948401BFB50FCFB1C054052A76D2E3A3948404AE455C8FD1C0540B895891B3A394840	2020-10-25 21:58:15.251107	2020-10-31 09:24:01.847624	4
236	0103000020E6100000010000000D000000F1CEE8B5C64F0540005A9FCE443B484011CFE8BFAD4F05401479E4CA443B4840E1E7E811A74F0540C3A652A9443B48405B09E9CBA14F054054801A75443B484064CBE803A64F0540B4DBF631443B484012FEE883BC4F0540BA7A5DE7433B4840ECEDE899C44F0540080272D8433B4840F5F8E8CDDB4F0540BA7A5DE7433B48409E1BE96DE14F054050EA1F14443B4840FCD4E83DE44F05405D6AFE5A443B4840490AE99DDE4F05404B96368F443B484023CBE8EFD74F0540C3A652A9443B4840F1CEE8B5C64F0540005A9FCE443B4840	2020-04-16 20:02:34.295603	2020-10-31 15:49:58.324386	1
217	0103000020E6100000010000001000000086E3E897304F0540F5FCC581323B48402F06E937364F0540D17AC3F7313B48405A0CE9C93A4F05408F6615BC313B4840B3FEE8B53F4F0540B8382284313B4840E7E0E8B74C4F0540B181433D313B484068DEE8E14F4F054096AB1FFA303B4840BED5E8794E4F0540539771BE303B4840B513E9414A4F054086A9DF9C303B484034CDE81B344F0540C9BD8DD8303B4840ABF3E881284F0540ECDE1232313B484080D3E8B71F4F0540A3855AB8313B4840A01CE9BD194F0540C92F62E1313B4840D38FF4CB1A4F0540455F0939323B48402BDCE81F214F05401ECFD249323B484001EBE819274F0540305A9576323B484086E3E897304F0540F5FCC581323B4840	2020-04-16 20:02:34.261134	2020-10-31 15:49:58.346394	1
229	0103000020E6100000010000000D0000005398F46AB74F05404353B5323B3B4840C15EF4DBAF4F05407FB084273B3B4840CD8AF460A34F0540F90998D33A3B48401160F4CBA14F054074B928B03A3B48409F9EF406A34F05404D1A21873A3B4840D16BF47CA54F0540A08B276B3A3B4840128FF48FB04F0540A08B276B3A3B48408084F4C4B74F0540EF68B98C3A3B4840C373F467BA4F05409CF7B2A83A3B4840847FF418BE4F0540B9B7D6EB3A3B4840C28DF49FBE4F0540F47523113B3B48407F9EF4FCBB4F05406B913F2B3B3B48405398F46AB74F05404353B5323B3B4840	2020-04-16 20:02:34.282899	2020-10-31 15:49:58.414459	1
230	0103000020E6100000010000000A0000005FD7E12B984F05409FAC96933A3B484017567AF69C4F0540FB7C28B03A3B4840425C7A88A14F054079E32CE73A3B4840424DEED9A24F054021485E203B3B484048237A6C9F4F05405946083C3B3B484068FD08A8994F054090A6B7363B3B484012EAC4CA914F05400DC89BF33A3B4840ED1B7AF48F4F05400CA7F4B23A3B4840894CFA61934F0540AC9F968E3A3B48405FD7E12B984F05409FAC96933A3B4840	2020-04-16 20:02:34.284758	2020-10-31 15:49:58.45823	1
213	0103000020E6100000010000000E0000006C75F5333D4C0540E625852C3B3B4840ACDBCC59364C0540A28BDCB83A3B4840FDE5B3402E4C054086B16A063A3B4840E72ED86E304C0540607C53C4393B4840BA96986A354C05407EECF99F393B4840840249A53B4C0540C311C292393B4840131BEECA474C05401BD795A6393B4840DCDAAEC64C4C05401A578BD1393B484099610B90544C0540C106983E3A3B48407AAE1FFD574C05403F7678BF3A3B48409065FBCE554C054017B641FE3A3B4840C2E67E83504C0540F9459B223B3B484032F861BE434C0540BEE558403B3B48406C75F5333D4C0540E625852C3B3B4840	2020-04-16 20:02:34.253725	2020-10-31 17:45:16.209214	1
239	0103000020E6100000010000000B000000A2EEE849434E054090A7CC374B3B48402DDDE86F594E054034ABD9FF4A3B48408EDAE88F754E0540AC30DF9E4A3B48408EDAE88F754E0540C4048B504A3B484032EDE84F6A4E0540F516CC38493B4840D519E947634E0540C2A3E029493B4840C8E4E8FB364E054007CC27B0493B4840F9CBE8A93D4E0540E698AE934A3B4840A3D4E8113F4E05403BA0BDE54A3B48407021E9D3404E05401897B01D4B3B4840A2EEE849434E054090A7CC374B3B4840	2020-04-16 20:02:34.300494	2020-10-31 17:45:16.2242	1
205	0103000020E6100000010000000B00000023CAE8F7D34B054081F8572E313B4840F3E2E849CD4B05405F6B55A4303B484020CFE8A3CD4B054058B4765D303B48406F19E98FD24B0540DE5FFECB2F3B48409F00E93DD94B0540D5149DB52F3B484025DFE883DE4B0540BF6CD5E92F3B48404D04E9F9E04B0540B2046F34303B4840CA20E907E24B0540183AA2C9303B4840760FE937DF4B05400BD23B14313B48404FD0E889D84B0540D8BFCD35313B484023CAE8F7D34B054081F8572E313B4840	2020-04-16 20:02:34.237974	2020-10-31 17:45:16.237139	1
227	0103000020E6100000010000000A000000941CE9312E4E05400C62AF37403B4840C403E9DF344E0540CCBBF6BD403B4840C7FEE8333B4E0540B6F4C29D413B484077CEE87F3A4E05402F5B5CE8413B48401AFBE877334E05408817D2EF413B484071D8E8D72D4E054086CC54BF413B4840C3D4E81B264E0540612BB9EA403B484019CCE8B3244E0540F0588655403B4840EFDAE8AD2A4E0540C7C47E2C403B4840941CE9312E4E05400C62AF37403B4840	2020-04-16 20:02:34.279527	2020-10-31 17:45:16.330884	1
206	0103000020E6100000010000000D000000D68FA3DC4F4C054026C4D594343B4840115482523B4C0540E7AE27B9343B4840FDB6926E364C05400B9866A4343B48404BC6333B344C054060001C73343B4840B5E59635354C05404020A13C343B4840AD72C4EB364C05409588560B343B4840A6341F583A4C0540597C6CE4333B4840D916FE1F444C05408BFBE2C7333B48402E4744A94D4C05407D65ABCF333B4840D7C4D092514C0540C707CDEE333B4840F4D492C0544C05400EA12A59343B48403D63EFA6534C05405D0D7C7D343B4840D68FA3DC4F4C054026C4D594343B4840	2020-04-16 20:02:34.240121	2020-10-31 17:45:16.404436	1
240	0103000020E610000001000000120000004EF623A07C4E05406094F87E4D3B4840E6D89214794E0540ED9AAD504D3B4840B04E002C714E0540699270B44C3B48407A86D071714E0540D9D7927A4C3B4840B5ACA4CE7E4E05409073850F4C3B48402E75872B894E05408F1971DB4B3B48407205BEB69E4E05402A4EE5984B3B484078A1FF2AA44E05401C2026AD4B3B48401A55E12AAA4E05409073850F4C3B48401BBCF187AB4E054066DE474C4C3B4840E225A113A94E0540AFE840834C3B48407205BEB69E4E054078ED39BA4C3B4840FCE188888D4E0540233CA0E54C3B4840C0E427B7894E05401630EB134D3B4840F7AC5771894E0540ED9AAD504D3B4840BE1607FD864E05406FEFC1844D3B4840B87AC588814E0540D26039934D3B48404EF623A07C4E05406094F87E4D3B4840	2020-04-16 20:02:34.302185	2020-10-31 17:45:16.407559	1
212	0103000020E6100000010000000F000000A7FEE829544E05408888F2034E3B48403A1EE980574E0540EFAE195C4D3B4840AAF9E87D5A4E05408E7DA9F34C3B48402F83F407584E0540F180A1CA4C3B484014DFE8D2504E05403481A8AE4C3B4840FC86F4CD464E05405232FBB74C3B4840CCDFE84F3D4E05405B0ABEE44C3B4840C31DE917394E05407F93E1274D3B4840C8E4E8FB364E05405595F0794D3B48409BF8E8A1364E05403EB644C84D3B4840A0D9E8BD384E0540BBFBDD124E3B48401C10E9033E4E0540AC1116474E3B484079E3E80B454E0540B83B775D4E3B4840A9CAE8B94B4E0540F2A346524E3B4840A7FEE829544E05408888F2034E3B4840	2020-04-16 20:02:34.251674	2020-10-31 17:45:16.44777	1
207	0103000020E610000001000000150000002B5ACAB8294C0540C51034063B3B48401ED1F482254C0540F09859023B3B48406153649D1E4C054071BB854B3B3B4840C796E141114C0540908748733C3B484040987CE50E4C05400162DBDB3C3B48404F157A1E0F4C05404EA4211E3D3B48400700FD6C134C05400BC7B1463D3B48407E167A041A4C0540B4152E323D3B484072497D2C104C0540E45EE8813D3B4840B853BAFC0E4C0540D815C1983D3B4840D267028D104C0540C106B1C53D3B484031D5B77D184C0540B7BBF4DF3D3B4840B223A06F214C0540889BB2EA3D3B484047288BB92A4C0540DD1497DF3D3B4840DD0CF0952E4C0540BED3B0B33D3B4840BAA3B701374C054055FE67103D3B4840D361CC1A3D4C0540B1478E573C3B48403BA225443E4C0540D058F0193C3B4840BFE575D03C4C0540412467DF3B3B48409EA0C09E394C0540554E07AB3B3B48402B5ACAB8294C0540C51034063B3B4840	2020-04-16 20:02:34.24215	2020-10-31 17:45:16.512645	1
241	0103000020E610000001000000110000005758FBEFC14E0540A73F7D21503B4840E0E99EBDB34E0540020106A3503B4840866740A1AE4E05401ECA25C1503B4840C350D2AAA84E05402BB435D0503B4840E705B46BA24E0540FE711FBB503B4840104C15729E4E0540878AEC8A503B48408D83554F9D4E0540D0F2AC4E503B4840104C15729E4E0540148F2AD34F3B4840C4290423A24E05404C7EF49F4F3B4840093000C4AF4E054041E66E214F3B4840D0FEBB87BE4E05408FD215CD4E3B4840896D2A7EC44E05408FD215CD4E3B4840567FC977C84E0540D6E84B004F3B4840CE4C5897CB4E0540B1AFD4814F3B48408894F805CB4E0540B67B17C14F3B4840567FC977C84E05404EBB50F74F3B48405758FBEFC14E0540A73F7D21503B4840	2020-04-16 20:02:34.303839	2020-11-02 13:40:45.857396	1
565	0103000020E6100000010000000B000000A7E2D1232B330440599CFE8240304840EF07D2A31433044066523CB93F3048404BC6D11F1133044049D1412B3F304840F0EDD16B103304403350CE953E3048409FD7D1EF133304409DC95A003E304840FCF3D1F32D3304400743E76A3D3048405DC2D14F3B3304409C5E034D3D30484009E0D143473304406D2744903D304840B7C9D1C74A330440891E96D13E3048405400D2173733044063A70C7440304840A7E2D1232B330440599CFE8240304840	2020-11-09 22:47:32.569156	2020-11-09 22:47:32.569156	2
566	0103000020E6100000010000000F000000F1EB68736E2F044075702152273048407719E9976F2F0440E2ED151A27304840251DE953772F04408DD8D94826304840251DE953772F04408D5063FA2530484024EEE88F682F0440A6AD1BF124304840F406E9E1612F044082257BCF24304840A0DBE8D95A2F0440FB2AF4D624304840CACCE8DF542F044094AD8607253048406DF9E8D74D2F04401FC3819525304840C3F0E86F4C2F04409F50F8E3253048404308E9D1532F0440EEDD366E26304840C9E6E817592F04403EE3FEA926304840F701E935682F044038F3644E27304840CC4C7AFD6B2F0440A2F9775B27304840F1EB68736E2F04407570215227304840	2020-11-09 22:47:32.572117	2020-11-09 22:47:32.572117	2
567	0103000020E61000000100000008000000A3E2D1894F300440B5E1E6C01E30484041E5D16933300440FBC0B36E1E30484097DCD10132300440F484B8E01D3048401BEFD1B73F3004404D591A781D30484002CBD11D61300440604EAF611D304840AA07D2F56A300440807FC6D11D3048405AD7D1416A300440FBC0B36E1E304840A3E2D1894F300440B5E1E6C01E304840	2020-11-09 22:47:32.574842	2020-11-09 22:47:32.574842	2
568	0103000020E6100000010000000C000000BC0FD25FA0360440FF61F654863048401AE3D167A7360440F0878B318530484074EAD1DFB636044054197D33843048402108D2D3C23604407221C4E883304840D7CDD1C7CE360440D1FDF53A843048402DF4D123DC360440A7DD59EC85304840DDC3D16FDB360440E885BD908630484081D6D12FD0360440BF045AF986304840CCF6D103C0360440AE5F2F2687304840CBC7D13FB1360440AE5F2F2687304840BF0AD2B3A636044054C50BC586304840BC0FD25FA0360440FF61F65486304840	2020-11-09 22:47:32.577728	2020-11-09 22:47:32.577728	2
569	0103000020E6100000010000000F000000950BE90982320440992A479348304840C8EDE80B8F320440C980D91948304840F4F3E89D93320440B35055DA473048404805E96D96320440E5A89B8F47304840CBE8E85F953204401701E24447304840C011E99B86320440D25ACE8D463048409AD2E8ED7F320440A9FE2D6C463048401013E98B7832044099E89882463048403EE5E8AD743204402E1E1DC246304840BB01E9BB7532044088E54C5B47304840E6D8E8896B32044076D398D647304840B9ECE82F6B32044002F30E25483048403FCBE875703204405AABD660483048400959F42E7B32044041E59D9C48304840950BE90982320440992A479348304840	2020-11-09 22:47:32.580516	2020-11-09 22:47:32.580516	2
570	0103000020E6100000010000000C0000007BDFD18FBF3204401585C5CB7730484029E3D14BC7320440DCF8CC4A7830484085D0D18BD232044034E077A478304840DBF6D1E7DF320440BA11869578304840E2ECD18FEC320440D8E245527830484039F9D1B3F53204400E59B7DA77304840E5E7D1E3F2320440CE0BBE4C773048408814D2DBEB3204408BA83DC676304840D715D2CBDD32044092D44BB77630484025E8D1F7C0320440847C2FD576304840CDF5D10BBC3204403D981A72773048407BDFD18FBF3204401585C5CB77304840	2020-11-09 22:47:32.583318	2020-11-09 22:47:32.583318	2
571	0103000020E6100000010000000E0000009410E90DB02D04401BF7307C17304840FAEEE849CE2D044035E14C5E17304840CB1CE927D22D044070B50B1B1730484027DBE8A3CE2D04407A8E203716304840A016E995CD2D0440851B339A15304840CEE8E8B7C92D04407E67AE5A153048409E01E909C32D04409951CA3C153048404AD6E801BC2D0440CFD9FF471530484047DBE8ADB52D0440E382927815304840C1FCE867B02D04406B3117B8153048406DEBE897AD2D04402868D1021630484018DAE8C7AA2D0440DA5D7BA31630484095F6E8D5AB2D04405417F2F1163048409410E90DB02D04401BF7307C17304840	2020-11-09 22:47:32.586696	2020-11-09 22:47:32.586696	2
573	0103000020E6100000010000000E0000009BF0E87355310440788536E72D304840DAD8E8FD7F31044045B2ABE12C304840560FE943853104406EBD5CAD2C3048400018E9AB86310440A9C8A2622C3048402EEAE8CD823104409B4B1E232C3048407B1FE92D7D310440C456CFEE2B30484028F4E8257631044007D412EB2B3048404A09E9BB67310440EFD3F6082C304840C7F6E8055A3104407D4B7B482C304840F1E7E80B5431044017C30D792C30484099DBE8E74A310440702FD3FB2C304840EFD2E87F4931044073A1494A2D30484016F8E8F54B310440389603952D3048409BF0E87355310440788536E72D304840	2020-11-09 22:47:32.592332	2020-11-09 22:47:32.592332	2
210	0103000020E61000000100000011000000EEA784EDBD500540F83DC892363B48403EB23063B3500540873486AD363B4840E0A8C3F0AB5005404291F4AF363B48404B57676EA2500540BCA29EC4363B484049B1CC7BA0500540B94AD1B4363B484078303D299D5005409805886F363B4840FB412FE19E500540CA5F8E42363B48401A014836A65005406477B3FF353B48401E580933B85005408CC951A3353B4840CD1C4925C550054054036C7C353B484083F9E06FC7500540E8ED7F82353B4840D1687E0AC9500540A7A2BB94353B484012596D1ACB5005407548B5C1353B484012596D1ACB500540589A0729363B48406BA11E4DCA500540AC2E5741363B4840502E3BDDC65005400C679764363B4840EEA784EDBD500540F83DC892363B4840	2020-04-16 20:02:34.247643	2020-10-31 15:49:58.338924	1
279	0103000020E6100000010000000F0000000B1FE9151B5005402491B1A62F3B4840090AE98910500540E1F9D773303B484060E7E8E90A5005405F6B55A4303B48405CECE89504500540183AA2C9303B484059F1E841FE4F0540372DCBAB303B484032CCE8CBFB4F05401C57A768303B4840FF18E98DFD4F0540CA40B9CF2F3B4840050FE9350A500540C46D83B02E3B4840B9D9E8D50F5005400254D5742E3B4840A691F4B01650054061E06B352E3B484041CDE8A71F5005402C1BE23C2E3B4840DE54F4CE25500540EE863C6F2E3B48403E01E917285005409C2FF9B72E3B4840670CE955265005407AB34D062F3B48400B1FE9151B5005402491B1A62F3B4840	2020-04-16 20:02:34.373905	2020-10-31 15:49:58.444951	1
228	0103000020E6100000010000000C00000032FEE88DA34F054008CDDBD0383B4840DFD2E8859C4F05401CEC20CD383B484082FFE87D954F054026CB04B3383B4840D8DCE8DD8F4F05407624A112383B4840D8DCE8DD8F4F054094C14CC4373B48402DEEE8AD924F0540F7FB2881373B48402E1DE971A14F05403259F875373B48405E04E91FA84F0540287A1490373B48408A0AE9B1AC4F054080A207C8373B48403413E919AE4F05405887F560383B48400DEEE8A3AB4F054026CB04B3383B484032FEE88DA34F054008CDDBD0383B4840	2020-04-16 20:02:34.281182	2020-10-31 15:49:58.464491	1
281	0103000020E6100000010000000D000000D1DD4E1E024F05401605B9EE343B484016E90C3B004F054051CA9CA0343B4840AB38AC0EF94E05403CBE8F7C343B4840BF65A481F14E0540D7AC8A6E343B4840487C20BBED4E0540BD1E8C72343B484054B54355EA4E054087A79284343B484099C00172E84E05401DAE9FA8343B484099C00172E84E05404CE2AED2343B484054B54355EA4E054094A4BCF8343B4840487C20BBED4E0540F9B5C106353B48403703536FF94E05405EC7C614353B48402E7E5AFC004F0540C6FFC004353B4840D1DD4E1E024F05401605B9EE343B4840	2020-04-16 20:02:34.377652	2020-10-31 17:45:16.419675	1
223	0103000020E61000000100000011000000931C93A6AE500540BDF73BD0393B4840930A4523A8500540C8DC53203A3B484086AF8D429B50054020BE04463A3B484081D2E60098500540D87474393A3B4840DD5D1A90935005404A54570A3A3B4840E7B78E289050054099CDF3C9393B484039E94D1F8F500540684C9089393B4840518C2B159250054028280C30393B4840F0832A2F9D50054038FA2780383B4840EF9578B2A3500540D56F5D15383B4840720DF394A8500540FD88ACEF373B484045C87AF1B2500540474F40E6373B48407AEBDC1EBC500540FB0BA905383B484015F4E673BD50054041E33528383B484028BA1D28BD500540D0BC544C383B4840C3624E92B450054062567F0D393B4840931C93A6AE500540BDF73BD0393B4840	2020-04-16 20:02:34.272674	2020-10-31 17:45:16.476765	1
274	0103000020E6100000010000000A00000065C4D173FA4E0540722A78F50C3B48405BEDD1AFEB4E05406DBE16DF0C3B484003E1D18BE24E0540D2BD2F6F0C3B4840B2CAD10FE64E054004B2FBD90B3B4840B8C0D1B7F24E0540F478D7960B3B484069EED18B0F4F0540F478D7960B3B48401BD3D163194F054038B248FF0B3B48406B03D2171A4F054005BE7C940C3B484015DDD1BB0C4F0540C3908CE60C3B484065C4D173FA4E0540722A78F50C3B4840	2020-04-16 20:02:34.364181	2020-10-31 18:56:44.314986	1
270	0103000020E61000000100000009000000A60AD285424F05407098B6DD0B3B4840B806D2B56C4F0540FFBF59660B3B48406905D2C57A4F0540FFBF59660B3B48406FFBD16D874F0540605F929A0B3B48401FCBD1B9864F05402E6BC62F0C3B48400EFED14D6B4F05404871AD9F0C3B484002F8D1C54D4F05403938895C0C3B4840C7577A04444F05404D94F82C0C3B4840A60AD285424F05407098B6DD0B3B4840	2020-04-16 20:02:34.357152	2020-10-31 18:56:44.334859	1
271	0103000020E6100000010000000B000000F90569C99C4F0540573F59960C3B484086E0E899974F054087C094240C3B4840FF1BE98B964F054035D43FD60B3B48405DD5E85B994F0540B9B4608F0B3B4840DEECE8BDA04F0540A034BA7C0B3B48405E04E91FA84F05404ECEA58B0B3B4840B7F6E80BAD4F05401B5499C30B3B4840BBD7E827AF4F05402B13FE630C3B4840DB20E92DA94F054036E0C0900C3B48406B677AC69F4F05401634CBAB0C3B4840F90569C99C4F0540573F59960C3B4840	2020-04-16 20:02:34.358813	2020-10-31 18:56:44.337847	1
266	0103000020E6100000010000000B00000004DBD18FB04F0540FDDB6CAC053B484072C4D1FFE54F054082F1B093063B4840C8EAD15BF34F0540875D12AA063B48407508D24FFF4F05404B7A0258063B4840CAFFD1E7FD4F05402A7B58BB053B4840CDCBD177F54F054065BA853C053B48400AD1D137BD4F0540B3FA5546043B484059D2D127AF4F0540B866B75C043B4840A607D287A94F0540AAD175EA043B484099C6D176AB4F054067BE5676053B484004DBD18FB04F0540FDDB6CAC053B4840	2020-04-16 20:02:34.350208	2020-10-31 18:56:44.410304	1
249	0103000020E6100000010000000C000000E8CF6860CA4E054006723EFC153B484097E2E8C5F34E0540E41DA6F6153B48401CDBE843FD4E0540DA570483153B48401BF5E87B014F05401AA215EA143B48401FD6E897034F05405BE12651143B48409DD8E86D004F054049BE020E143B4840E4CEE829DB4E0540208B7815143B484037CBE86DD34E05404F1F6424143B4840A910E9B7C54E0540F55BCD63143B4840D21BE9F5C34E05404D9B4156153B48400F17FA6BC64E0540004297E9153B4840E8CF6860CA4E054006723EFC153B4840	2020-04-16 20:02:34.318297	2020-10-31 18:56:44.413502	1
267	0103000020E6100000010000000C0000006C08E9F9644F05407FD90BF6073B484018F7E829624F0540F8CEC70E073B48406C08E9F9644F054055715ECF063B4840CE05E919814F054013BE2DC4063B48407E04E9298F4F0540B1AF35ED063B484031CFE8C9944F05404FA13D16073B4840AFEBE8D7954F0540A0989264073B48407E04E9298F4F0540280796EE073B484050E9E80B804F054009ACCE22083B48404612E947714F054079FEEA3C083B4840C5FAE8E5694F0540374BBA31083B48406C08E9F9644F05407FD90BF6073B4840	2020-04-16 20:02:34.351984	2020-10-31 18:56:44.480828	1
211	0103000020E6100000010000000D00000040BB3AB2EC4E05401E4AB4B8273B4840B577D606D84E054066AF9A19273B484028888315CD4E05407EAE9A98263B484080000246CC4E054064A89A42263B4840FE8AC8EBCF4E0540734134F5253B4840B577D606D84E0540777467DB253B48403C3D32D5E74E05409E74E7F0253B484047B74B6CF64E05400D42344B263B48409B4457E8FC4E054019AF9AEE263B48406F081850FD4E0540887CE748273B48409905D379FA4E0540F74934A3273B484018FD03F7F14E0540F21601BD273B484040BB3AB2EC4E05401E4AB4B8273B4840	2020-04-16 20:02:34.249541	2020-10-31 18:56:44.515141	1
273	0103000020E6100000010000000A000000C014D2E71C4F05403AEA0A770F3B48407BEAD1BB394F054029BCE6330F3B4840D806D2BF534F0540BC5AEBD20E3B4840860AD27B5B4F05401AF9A24C0E3B484087F0D143574F054023C5E4BE0D3B484086C1D17F484F054018F821920D3B484025C4D15F2C4F0540055F1DF30D3B4840C1FAD1AF184F05406AF4D6E10E3B48407F7EF4FB174F0540EDCB8B460F3B4840C014D2E71C4F05403AEA0A770F3B4840	2020-04-16 20:02:34.362342	2020-10-31 18:56:44.539294	1
215	0103000020E61000000100000008000000BB935DDE944E0540E6EE1F7D263B48408BAFCDC48B4E0540BF9EEA9E263B48405BCB3DAB824E0540D02E6F90263B4840F261C336824E05403BB4B634263B48401937EF09894E05400A4F21F1253B484007EE94C89A4E0540BDF9AEC5253B4840BC4AE2E09E4E054057A4931C263B4840BB935DDE944E0540E6EE1F7D263B4840	2020-04-16 20:02:34.257335	2020-10-31 18:56:44.548181	1
390	0103000020E61000000100000010000000A75A48A1AF4E0540B0311113273B484079DAA110D44E054056D91E8D283B4840D2121C62D74E0540E08BD1F3283B4840C5552054D44E0540AAFBC75F293B48407407D3DBCC4E05405E32FAA9293B48406FB10E52C24E054069C963C5293B4840348353D9AD4E0540C38CE19F293B484025479841924E0540BB2800EE283B48403FEDB66E824E05409B8B365B283B48402C5BB39F7E4E0540C83038F3273B484090501874804E0540053E128F273B484074A59510874E0540B1C7143D273B48403D95B2648F4E05409DC5ADFA263B4840C230287EA34E0540F1D879ED263B48404276D90DAD4E05404F83AFFB263B4840A75A48A1AF4E0540B0311113273B4840	2020-07-12 22:25:15.997272	2020-10-31 18:56:44.584659	1
574	0103000020E6100000010000001300000021E0E8F793320440FB06E41A3830484024DBE84B9A3204401D1D0EEE37304840FFCAE861A23204407A6A056F373048404FFBE815A33204402B40D5D536304840A4F2E8ADA1320440D80A1E4436304840A6D8E8759D320440042C5608363048404805E96D96320440C7AE9904363048406FFBE81F8A3204404758AAAE353048403F14E971833204406E1D6C2435304840BEFCE80F7C320440E917E52B353048408FFBE8297132044058633F9835304840881FE9B9683204406E1B3A2636304840DD16E95167320440ABE9E57F36304840DD16E951673204403C9C591537304840881FE9B968320440057013603730484063F5E8976C320440544954A3373048409AD2E8ED7F320440C489AE0F383048401EE5E8A38D3204406BF64E313830484021E0E8F793320440FB06E41A38304840	2020-11-09 22:47:32.595952	2020-11-09 22:47:32.595952	2
575	0103000020E6100000010000000C00000008D8D1FFD8300440765B70050930484051E3D147BE30044003A1FB6F08304840A3DFD18BB630044074076BF8073048404FCED1BBB33004400342F66207304840A2F9D1C3BA300440FC97ECE306304840B0CBD1DBCF300440CC6F360B0630484006F2D137DD3004407E28E7D60530484011C9D1FBEB300440851D6ECF05304840B905D2D3F53004401AB7853F06304840B905D2D3F53004407552E871073048400807D2C3E7300440E0CC58950830484008D8D1FFD8300440765B700509304840	2020-11-09 22:47:32.599024	2020-11-09 22:47:32.599024	2
576	0103000020E6100000010000000B0000000614D2B34F3304402F0B17417D304840B3E8D1AB48330440B0DE32167C304840AF07D28F463304402E91C7F27A304840B202D2E34C330440EC59CE647A3048406201D2F35A330440F385DC557A30484069F7D19B67330440DCE02A8A7A3048401CC2D13B6D330440161EFA517C30484018E1D11F6B33044055346CE77C30484016CCD1936033044023A8FA5E7D3048400BF5D1CF5133044026BE81577D3048400614D2B34F3304402F0B17417D304840	2020-11-09 22:47:32.602251	2020-11-09 22:47:32.602251	2
578	0103000020E6100000010000000B000000BDF5D1279C360440E25CFC928130484067CFD1CB8E360440047BCA408130484001F1D18F70360440943598E17F304840FD0FD2736E360440D32F264C7F30484059FDD1B379360440785E7BF27E304840BAFAD1D39536044008DD1ECD7E3048406BF9D1E3A3360440EF16E6087F3048406EF4D137AA360440B01C589E7F304840C4EBD1CFA83604406F01433B80304840C1F0D17BA2360440F1E09F6D81304840BDF5D1279C360440E25CFC9281304840	2020-11-09 22:47:32.608302	2020-11-09 22:47:32.608302	2
579	0103000020E61000000100000015000000E1627AFF75320440946FD7684E30484029337ABE7A3204407CC069444E304840162B7AC97E320440374172194E304840591A7A6C81320440F7CC01E74D304840AE2B7A3C843204402932FCCA4D3048402618FA4F87320440877280B54D304840BE18FAC28C3204404E004BAA4D304840C1627AF58E3204409D1F3AAB4D30484087357A8A90320440E833A2B34D304840282DFADB913204402E3D83C34D3048400022FA9D93320440C7E6F0E74D3048405052FA51943204404A6D8EFB4D3048405052FA51943204404EEE2B0F4E304840A649FAE992320440669D99334E30484087357A8A9032044072AA5B534E3048401C217A718B3204408B59C9774E3048406526FAD6873204408143BB864E30484098287AF381320440782DAD954E304840FC467A647A32044048479C964E3048402D63FAB8783204402D19458D4E304840E1627AFF75320440946FD7684E304840	2020-11-09 22:47:32.612385	2020-11-09 22:47:32.612385	2
580	0103000020E6100000010000000B000000690AD2DF353004402E7CE08E17304840C1CDD1072C30044030AC706B1630484017C5D19F2A300440B9CB874015304840660FD28B2F300440B8588CB214304840C6DDD1E73C30044067323D7E1430484025C6D17B4E30044018E7E46515304840CA07D2FF51300440135A59FB1530484020FFD1975030044081D2BF9F163048401D04D2434A3004400435BB2D1730484070E6D14F3E300440B476678717304840690AD2DF353004402E7CE08E17304840	2020-11-09 22:47:32.615489	2020-11-09 22:47:32.615489	2
581	0103000020E6100000010000000A000000AA15E9D1802F0440C4BDAB68253048400FF4E80D9F2F0440C4BDAB6825304840BEDDE891A22F044075B8E32C2530484069CCE8C19F2F0440B4FFC5F6233048400CF9E8B9982F0440907725D5233048400BCAE8F5892F04406B82FB012430484058FFE855842F0440408D4A36243048405BCBE8E57B2F0440CBA245C42430484001F3E8317B2F04400D3B765D25304840AA15E9D1802F0440C4BDAB6825304840	2020-11-09 22:47:32.618581	2020-11-09 22:47:32.618581	2
583	0103000020E6100000010000000C000000881CE9BBCF320440F5F32A5B493048408CCEE813C3320440F3E4C2FD48304840830CE9DBBE3204401F3D82BA4830484033DCE827BE320440D09AC86F483048402D15E943C03204407DED872C48304840B3F3E889C5320440202A39F847304840071FE991CC32044096192B0748304840BAE9E831D232044073D7793B48304840E409E9FBDA320440E1BFC5B6483048403EE2E8AFDB32044030627F0149304840B803E969D63204400915473D49304840881CE9BBCF320440F5F32A5B49304840	2020-11-09 22:47:32.624669	2020-11-09 22:47:32.624669	2
530	0103000020E6100000010000001200000059D4E8DF462E0440F261955D23304840BBD1E8FF622E04403926756E223048401012E993742E044054881A0222304840130DE9E77A2E0440894C65292130484042DFE809772E0440FEB3E0E920304840B805E96F6B2E04401316FF8420304840881EE9C1642E04402C0B1B6720304840B8D6E8AB5C2E04407588E55B20304840ADFFE8E74D2E0440E38D5072203048407D18E939472E04403D9E269F203048404D17E9533C2E044052C42F1E21304840A9D5E8CF382E04401ADA7061213048404FFDE81B382E044055F5A3B32130484026F2E8DD392E0440100BD70522304840F905E983392E044013C4C1E922304840250CE9153E2E04409E51462923304840C83AFA88432E0440B2871E642330484059D4E8DF462E0440F261955D23304840	2020-11-09 22:47:32.450351	2020-11-11 15:17:43.946414	2
618	0103000020E61000000100000010000000191E4B66793304403554E99E60304840440814DD76330440CF32173C60304840E39C7BB57733044026C9BEE65F3048408320EAC77C3304407A38629A5F3048405825288B833304400A657F5B5F30484012E101938B330440D84E162A5F3048401C670F07943304409EB8A0135F3048401C451D7B9C3304405A7B1A215F30484090DEC216A43304404C7B01575F304840AB053546AB330440DD3230066030484030623129A93304400470846460304840AB2727D2A2330440B327E5A760304840368E81369B330440A427CCDD60304840A8DE62318833044022FBC7E6603048409E5855BD7F330440A427CCDD60304840191E4B66793304403554E99E60304840	2020-11-11 15:17:43.97202	2020-11-11 15:17:43.97202	2
534	0103000020E6100000010000000F00000078CDE89DC32F0440EECD49D1253048407306E9B9C52F04402BC38F86253048407DDDE87DD42F0440FB2AF4D6243048404F0BE95BD82F0440709D6F97243048407B11E9EDDC2F04406B82FB012430484081D8E8D1DA2F0440E5F4FDBA233048403B2D292CD72F0440A3E44370233048401D0FE921C72F0440EF3B21C822304840EFF3E803B82F0440F53BA8C022304840131EE925B42F044080C92C00233048403EF5E8F3A92F04407D0A073A243048403A14E9D7A72F04403EA837D324304840C3EDE871B32F0440DC453E992530484099FCE86BB92F04407BC857C22530484078CDE89DC32F0440EECD49D125304840	2020-11-09 22:47:32.46414	2020-11-11 15:17:44.023665	2
610	0103000020E6100000010000000F0000008CCBE8152A330440AB9A282835304840DFC7E859223304406E1D6C2435304840DCCCE8051C3304400A2E0FFF34304840ACCBE81F1133044096D72D9A34304840F900E97F0B3304403E97EF0F34304840A9D0E8CB0A330440B435F2C833304840D1F5E8410D330440A9D9F48133304840A704E93B133304400362546033304840271CE99D1A330440036254603330484085EFE8A521330440AFD97B7A3330484088EAE8F92733044013C9D89F333048400DE3E87731330440FB19AC13343048403408E9ED33330440424F55B4343048400DE3E877313304400A2E0FFF343048408CCBE8152A330440AB9A282835304840	2020-11-09 22:47:32.709911	2020-11-11 15:17:44.039799	2
577	0103000020E6100000010000001600000061E6E807943104405F773B4830304840E4F8E8BDA13104407C82DE2230304840C1FDE85FB43104408A1BFDBD2F3048401DEBE89FBF310440D631D85C2F30484075F7E8C3C8310440325348E52E30484023E1E847CC310440675E07A22E3048407311E9FBCC3104409B9060BA2D3048404CECE885CA310440D09B1F772D30484087FFE8B8C431044091E5274C2D304840479CF475BC3104404272511F2D304840B562F4E6B43104404272511F2D304840EBEEE865AE310440C72922302D3048403AF0E855A0310440A41EF85C2D304840B6DDE89F9231044064132BAF2D30484087DCE8B9873104404F7A851B2E3048405BD6E8278331044058EC82622E304840A80BE9877D3104401B482C032F3048405314E9EF7E310440222119A02F304840D411E91982310440A58D8FEE2F3048405AF0E85F87310440F77C572A303048405DEBE8B38D310440DA71B44F3030484061E6E807943104405F773B4830304840	2020-11-09 22:47:32.605187	2020-11-11 15:17:44.044065	2
619	0103000020E61000000100000010000000E71BE9894C33044075E458A1553048408BE5E84D2E330440180FEBD1553048405BFEE89F27330440EDC84AB055304840B2DBE8FF21330440D3B9C67055304840B2DBE8FF213304400449941E5530484062DAE80F303304402BEA7276543048408919E9BD36330440C2261651543048408C14E9113D3304404F4DAB3A5430484097EBE8D54B330440DD7340245430484071DBE8EB53330440D868B92B5430484074D6E83F5A33044009BAE04554304840C320E92B5F330440A6D9EB7D5430484077D1E89360330440B7D261CC543048401DF9E8DF5F33044009541B17553048401FDFE8A75B33044060E05B5A55304840E71BE9894C33044075E458A155304840	2020-11-11 15:17:44.053458	2020-11-11 15:17:44.053458	2
620	0103000020E6100000010000000F000000A9F7E84BAB300440DD75C06F0C3048402C0AE901B93004400D3F713B0C3048405B0BE9E7C3300440245408DE0B3048400AF5E86BC7300440208A839E0B3048408711E979C830044023B585570B30484064CDE81FC8300440568B3588093048402E1FE98DC3300440985EF6FD083048405ED7E877BB3004404D42A982083048400104E96FB4300440E2263E6C0830484080ECE80DAD300440464D228A0830484054E6E87BA8300440CA1CA7C9083048402319E905A6300440F264516A09304840A11BE9DBA230044043C7A6460C304840860269D0A63004403E37E26D0C304840A9F7E84BAB300440DD75C06F0C304840	2020-11-11 15:17:44.067052	2020-11-11 15:17:44.067052	2
621	0103000020E6100000010000000C00000017CDE87F0E3004404BEF96A205304840E6FFE8090C300440D009995B053048400F0BE9470A300440EC48AD7704304840BBDFE83F03300440CC940C5604304840D7FEE82DE82F0440D24916D504304840ABF8E89BE32F044055249B14053048405120E9E7E22F04408D8C555F05304840D8E4E8F5E32F0440C5F40FAA0530484009CCE8A3EA2F044065A3B0CB05304840B9CAE8B3F82F044092415FDE0530484014D2E82B08300440A12B6DCF0530484017CDE87F0E3004404BEF96A205304840	2020-11-11 15:17:44.141844	2020-11-11 15:17:44.141844	2
582	0103000020E61000000100000012000000F30DE9D597320440E3684D893530484082DDE817B032044020E6098D3530484033DCE827BE32044031F19E76353048408902E983CB3204409B8F933E3530484013DCE81DD7320440E4BB6EDD3430484094D9E847DA32044016DD2D9A34304840EAD0E8DFD83204404EFE734F343048405F11E97DD1320440B5D9027333304840071FE991CC32044061F53A373330484033DCE827BE320440B07D8C2433304840D608E91FB7320440196D704233304840FB18E909AF3204402C0230A933304840A011E9919F320440504695A3333048404DE6E889983204403F3B00BA333048409620E9958C3204407514251B343048409A1BE9E992320440C854DCAC343048404AEBE835923204405207C94935304840F30DE9D597320440E3684D8935304840	2020-11-09 22:47:32.621637	2020-11-11 15:17:44.14508	2
547	0103000020E6100000010000000E0000001493009A3F2E04407D7C735F003048407471F9972A2E0440FDF9B6EBFF2F4840C5DC1F86212E04405258A690FF2F48409AFF67A01D2E0440AB98AEA4FE2F4840F466FA171E2E04406878A760FE2F4840D38EE51D232E044073E39136FE2F4840ACDC2EF8232E0440628321B9FD2F4840D97A67AC2D2E04407A79D45EFD2F484001EBEAEE372E0440607AD428FD2F48402BA93DB6422E04400512EB7DFD2F48404324DD7F492E04405F9507EBFD2F484056E1EAD7512E0440F9B067F9FF2F4840172F698C4B2E0440D5F9EF5F003048401493009A3F2E04407D7C735F00304840	2020-11-09 22:47:32.506056	2020-11-11 15:17:44.153118	2
572	0103000020E6100000010000000C0000006DE3E895E6320440CA9CFD00343048406DB4E8D1D7320440528EB6F7323048400EFBE801D53204404827B9B03230484040C8E877D73204403EC0BB6932304840BFF9E811E3320440520872A7313048409DE4E87BF1320440DD0D80983130484073F3E875F7320440FE7F99C13130484021DDE8F9FA320440CA69DA043230484076EEE8C9FD3204409F72F73A3330484078BAE859F5320440393B79C133304840A2ABE85FEF3204405AAD92EA333048406DE3E895E6320440CA9CFD0034304840	2020-11-09 22:47:32.589395	2020-11-11 15:17:44.158991	2
622	0103000020E6100000010000000C000000BECBE845D8360440A72706CB8130484060F8E83DD1360440F51D66A9813048408DE4E897D1360440F3B03710813048403CCEE81BD53604400F98F7CC803048403521E96FDB3604401E1C9BA780304840EDCCE82BE336044060A4DEA380304840E61FE97FE936044092B37EC580304840671DE9A9EC360440B53E7B0C81304840EA00E99BEB3604409320AD5E813048403C17E917E83604407839EDA1813048406508E91DE2360440637E3BD681304840BECBE845D8360440A72706CB81304840	2020-11-11 15:17:44.162186	2020-11-11 15:17:44.162186	2
202	0103000020E6100000010000000F000000C1D0E8CD544F054039A5F68C323B48407513E92D7C4F0540F2016FA9313B484023FDE8B17F4F0540AFEDC06D313B484023FDE8B17F4F0540D0746C1F313B4840CFEBE8E17C4F0540C9BD8DD8303B4840490DE99B774F05404B4C10A8303B48406FD4E8895C4F054096AB1FFA303B484062E8E839434F0540A419DD87313B48403201E98B3C4F05408F6615BC313B484006FBE8F9374F0540AA3C39FF313B484007E1E8C1334F0540EA28E29B323B4840DDEFE8BB394F054010D3E9C4323B4840DE1EE97F484F054010D3E9C4323B48400E06E92D4F4F05405F4FFEB5323B4840C1D0E8CD544F054039A5F68C323B4840	2020-04-16 20:02:34.232337	2020-10-31 15:49:58.278399	1
394	0103000020E6100000010000000E000000B0D5D63D3950054002A2ECC7353B4840FF85CF00335005409173B0A5353B484095BDE63430500540D7255082353B48408C8AF86B3050054043BBBC24353B4840839F46E53250054032FFEFFD343B4840A7E59AFB3650054081F1D4E4343B4840BAC512803B500540C910F9E5343B4840DD0B67963F500540619A86F2343B48402CC673D0425005404CFB012F353B48406A5D56FF43500540C669835B353B48401C60973E435005401841718B353B4840D420B50F42500540619CD79E353B4840A8A772303E50054059D416B9353B4840B0D5D63D3950054002A2ECC7353B4840	2020-09-04 20:16:25.935808	2020-10-31 15:49:58.281781	1
293	0103000020E610000001000000100000004CD3E82F3D500540C863C657FB3A484041FCE86B2E500540C4EC6441FB3A4840AB07E9BDFA4F0540B610DFE7FA3A4840A70CE969F44F05409A0ED7BEFA3A484057DCE8B5F34F0540B9D13C74FA3A484000FFE855F94F05409DCF344BFA3A484031E6E80300500540053F8E38FA3A484065F7E8C91B500540589AA229FA3A4840A4DFE853465005401D1431C1F93A4840F70AE95B4D5005405FD261CCF93A48407DE9E8A152500540A77E5504FA3A484027F2E809545005404A74205AFA3A48402311E9ED5150054063B5CAF6FA3A4840CEFFE81D4F5005405906AA3DFB3A4840F8F0E82349500540CBDA276EFB3A48404CD3E82F3D500540C863C657FB3A4840	2020-04-16 20:02:34.399994	2020-10-31 18:56:44.327448	1
286	0103000020E610000001000000080000009B8FD042914E054097460C8C293B4840B3AE12DF864E0540687E969E293B484032A5887A824E0540D14B6940293B48407B38967D874E05400597D6F1283B4840ADA5BEDD904E05406522BAE2283B48409EA6200D984E0540CEB3DE26293B48407AF408D4954E05402BC7026C293B48409B8FD042914E054097460C8C293B4840	2020-04-16 20:02:34.387062	2020-11-02 11:28:10.181631	1
199	0103000020E6100000010000000B00000025506FA69E4E0540E98DB831383B4840AAD112C0994E054023126363373B4840E817FAF2994E0540888F3B2D373B48400996F41C9D4E0540D5374211373B4840209A2547A54E0540680980F0363B4840F83A4E2DB94E0540137F50C9363B4840F990623FC24E05407C28C5EC363B48406F382D74C84E0540D6C85FB7373B4840833FAC1CC54E05400219AD1C383B4840259C154EA44E05403620FA61383B484025506FA69E4E0540E98DB831383B4840	2020-04-16 20:02:34.226872	2020-10-31 17:45:16.313819	1
203	0103000020E6100000010000000B000000641FE9CC864B05404E978DEE2D3B484024FCE8B97B4B0540DBF9F3A32D3B4840FFD1E8977F4B05409ADA45682D3B4840EEF8E866924B05405ECD9CCB2C3B48402B21E925974B0540D2FEB8E52C3B48400BD8E81F9D4B0540BC56F1192D3B48404505E98A9B4B0540E9565A592D3B48402DEDE8B58E4B05406D8AB6D02D3B4840DB61FAE58B4B0540F600D2EA2D3B4840F9263DA8894B05403E8802F62D3B4840641FE9CC864B05404E978DEE2D3B4840	2020-04-16 20:02:34.234216	2020-10-31 17:45:16.366951	1
197	0103000020E6100000010000000C0000003FD6E8A1EA4E05403A4BC7DF383B4840171C7ABDF44E05405619B49B383B48405CCFE892F94E0540339F6192383B48409FEDE8F90A4F05406B6835BE383B484076FCE8F3104F0540262C82E3383B48409D21E969134F05401CAE1B2E393B484025CCE83F104F0540396E3F71393B48409B0CE9DD084F054043AEA087393B4840101EE9B7F24E05406BEC2A80393B4840EADEE809EC4E05402F2EDE5A393B484068E1E8DFE84E0540126EBA17393B48403FD6E8A1EA4E05403A4BC7DF383B4840	2020-04-16 20:02:34.222987	2020-10-31 17:45:16.390165	1
284	0103000020E6100000010000000C0000009C61F310614E054079DB23233C3B48407088F2765D4E0540E6FDDA133C3B484010D78A24594E0540403D49F53B3B484060FE56FB564E05405FBFFAC93B3B48404D7413E7584E0540FE46AC9E3B3B484089D7AFFC624E0540EB63638F3B3B4840ACEB8E8C674E0540D76C38A13B3B4840917F07646B4E0540555356C23B3B484004BBB2CA6D4E05408FF130F03B3B48401F273AF3694E05406F6F7F1B3C3B4840BE92F4AA644E05402A273C283C3B48409C61F310614E054079DB23233C3B4840	2020-04-16 20:02:34.383122	2020-10-31 17:45:16.41114	1
198	0103000020E6100000010000000D000000CFBBA325EF4E0540FF0DFC0A383B484066FC7E41DE4E0540C8D8B9C3373B4840AC717F3CD74E0540ABBA9081373B4840AB1BFE02D94E0540092A5D2A373B48406B205CA6E14E0540C72E32F9363B4840AC597741EB4E0540681378E6363B4840373446CDF34E0540CD0B66EC363B4840A0F36AB1044F05408346A833373B484022F82E1C114F054073D459B3373B4840B6B609A3144F0540E5F53907383B4840FEBBA9660E4F0540FA9EB351383B484040C71B87054F0540E0C4AD58383B4840CFBBA325EF4E0540FF0DFC0A383B4840	2020-04-16 20:02:34.22517	2020-10-31 17:45:16.426552	1
292	0103000020E6100000010000000B000000E9145C26B14F0540AA8ADB8D013B48402A5EF468AA4F0540FCC781AC013B484076347947A04F0540AA8ADB8D013B48409CA3F4B29C4F054049A8634D013B4840F67BF4669D4F05406672F8C8003B4840D3D2170EA24F05401462228E003B4840AB5BF492AD4F05404DD8807C003B48400C2314CEBB4F05406D3BC1B8003B4840334FF464BD4F0540DA3B76F9003B48409687F40DBA4F0540A5E63A6B013B4840E9145C26B14F0540AA8ADB8D013B4840	2020-04-16 20:02:34.398146	2020-10-31 18:56:44.363933	1
287	0103000020E6100000010000000F000000B5CDE843D04E0540DF14C7441E3B48401BDEE841964E05402654BC911D3B48409AE0E817934E05407D2D53521D3B4840EA10E9CB934E05401159B9071D3B48401617E95D984E05400F7DFB791C3B484046FEE80B9F4E0540C57369581C3B48407419E929AE4E054088219A631C3B48405204E993BC4E0540D22A2C851C3B48408615E959D84E05400A0358F11C3B4840B21BE9EBDC4E05405B624B291D3B4840E3E8E861DF4E05404831E5731D3B48400CF4E89FDD4E0540B4057FBE1D3B4840B7E2E8CFDA4E0540B5F35D051E3B48400418E92FD54E05409B6C96391E3B4840B5CDE843D04E0540DF14C7441E3B4840	2020-04-16 20:02:34.388845	2020-10-31 18:56:44.390065	1
224	0103000020E61000000100000014000000E58BF4FB444F05405550F2D32E3B4840D16EF47A3E4F0540D7DE74A32E3B4840CF59F4EE334F054001A6816B2E3B4840D99FF4AB2B4F0540374172192E3B48403EA4F4E41F4F0540A83932BC2D3B4840949BF47C1E4F0540A5D8C2982D3B4840596EF411204F054069A306502D3B4840D5A4F457254F0540B6BEAB1D2D3B4840DD80F4C72D4F0540583557CF2C3B48401063F4C93A4F054088E6558A2C3B4840A597F4AC484F05407166A16A2C3B48405962F44C4E4F05409031B7A02C3B4840D893F4E6594F05408B1FB2012D3B4840F277F44B5E4F05408E580E792D3B4840C96CF40D604F054091916AF02D3B48406F94F4595F4F05404B60B7152E3B4840EC81F4A3514F0540886260B22E3B48406B6AF4414A4F05409FE214D22E3B4840BD80F4BD464F0540AD1768DB2E3B4840E58BF4FB444F05405550F2D32E3B4840	2020-04-16 20:02:34.274338	2020-10-31 15:49:58.244251	1
391	0103000020E6100000010000000B000000357336BA774E054076E7C2F8273B4840232DCE116E4E0540BB80E1E8273B48407A3868ED674E054003E63AAE273B484036613500694E054001F36B5B273B4840E04EBB03704E054075B9033A273B484089A41970764E0540403BF145273B48406DEE63387D4E054004C1D250273B4840E34566FB7E4E0540A8A79882273B48402F44C3E17F4E0540BECE0EAC273B48404E99138D7E4E05400E8D28D3273B4840357336BA774E054076E7C2F8273B4840	2020-07-12 22:25:17.501404	2020-10-31 18:56:44.34861	1
269	0103000020E6100000010000000C000000D5C2D16F3A4F054088F55A7B0A3B4840D806D2BF534F0540BCDE26E6093B48403A04D2DF6F4F054051672B85093B48404BD1D14B8B4F0540752E5467093B48409D16D28B964F0540310C64B9093B4840F30DD223954F0540D5EF0D560A3B4840EF12D2CF8E4F0540746756DC0A3B484043F5D1DB824F0540323A662E0B3B484042C6D117744F0540BC0C295B0B3B4840D6F1D133494F05406AA6146A0B3B4840D0FBD18B3C4F0540ACD304180B3B4840D5C2D16F3A4F054088F55A7B0A3B4840	2020-04-16 20:02:34.355397	2020-10-31 18:56:44.355391	1
392	0103000020E6100000010000000F000000040E41BB9B4E0540CD6691292A3B4840E6C7A6A4994E0540C16169132A3B484073464040984E054034154DFA293B4840E8639C1C984E054095B037BF293B4840105236339A4E05408BED03AC293B4840C907D1C49F4E054086FBACA1293B4840F8DAC732A54E0540146943BC293B48402412C928AC4E0540B3CD58F7293B4840C21DBF1BAE4E0540BF1F75102A3B4840D7E20663AE4E05404FCFFF2D2A3B48407826E845AD4E0540599233412A3B4840E75EE7CAA94E0540E6DE4F5A2A3B4840B98BF05CA44E0540E820445D2A3B484000D655CB9E4E05405E848A4B2A3B4840040E41BB9B4E0540CD6691292A3B4840	2020-07-12 22:25:17.522168	2020-11-02 11:28:09.921376	1
280	0103000020E6100000010000000E000000198EF4FEF54F0540D81244232D3B484051A6F4DDE94F0540C7546E4A2D3B4840A4A2F421E24F0540A500D6442D3B48406B5BF47EDF4F0540C4F3FE262D3B4840D274F443DE4F0540C1928F032D3B4840E877F48CE04F0540772880B12C3B48403D89F45CE34F054060A8CB912C3B48406D70F40AEA4F0540199F2B632C3B48401A74F4C6F14F054025730F492C3B48409B8BF428F94F05406E0532472C3B48400B67F425FC4F05407750935D2C3B48400A81F45D005005407D1272A42C3B4840CB72F4D6FF4F0540B5E6BEC92C3B4840198EF4FEF54F0540D81244232D3B4840	2020-04-16 20:02:34.3758	2020-10-31 15:49:58.329196	1
222	0103000020E6100000010000000B000000B69EF4510C500540BB8F8852373B4840802C7A88285005409C1F126E363B48407A85743C29500540BB3EA63C363B484060A174D724500540216EFBF2353B48408267F48E1A5005403C77ABDB353B48404D9FF4C41150054099899006363B4840DD94F40300500540F9BEDFB5363B4840B950F4A9FF4F054015EB8029373B48406459F41101500540E3CD124B373B48408A98F4BF07500540ED0D7461373B4840B69EF4510C500540BB8F8852373B4840	2020-04-16 20:02:34.270862	2020-10-31 15:49:58.351241	1
219	0103000020E6100000010000000F00000076FCE8F3104F0540C1F557B92F3B48407ADDE80F134F0540BA3E79722F3B4840B2607A80134F054092EDC5FF2E3B4840ABF96864114F05409F9068DB2E3B4840F3CFE805FF4E05400A9F368B2E3B48406910E9A3F74E05400A9F368B2E3B48406615E94FF14E0540C46D83B02E3B484067FBE817ED4E05405E49A7F32E3B4840621AE9FBEA4E0540D1E6403E2F3B48408F06E955EB4E05403065958C2F3B4840E8F8E841F04E0540DE5FFECB2F3B484019E0E8EFF64E0540972E4BF12F3B48401BF5E87B014F0540830F06F52F3B48404515E9450A4F0540972E4BF12F3B484076FCE8F3104F0540C1F557B92F3B4840	2020-04-16 20:02:34.264547	2020-10-31 15:49:58.363261	1
399	0103000020E61000000100000013000000D3950EE9BE4E0540A8E701613F3B4840E5D2516AB94E054051EE53783F3B4840A31A5637AE4E054064EB5C8E3F3B484022529999A94E0540F135258C3F3B48403A5DFA32A54E05408640FB7F3F3B4840271F5F6FA34E05405D672D5B3F3B484098E100BBA44E0540C2D92D203F3B4840C45AAD3CA14E0540FE1652EF3E3B4840DF35BDE19F4E0540CCE4F2C53E3B4840DB153A33A14E0540D06F1AAF3E3B484025E51375A64E0540C40661863E3B484077A6CD20AB4E054086FF65633E3B48403EEF039DBB4E05409FF118293E3B4840C2921662C14E0540557144233E3B48402951E6A5CC4E054023B8803D3E3B484031BF9AABCF4E05401B000F6F3E3B484073A4EB4BCE4E0540B3967DE93E3B4840DFFDE0FFCA4E0540ABDE0B1B3F3B4840D3950EE9BE4E0540A8E701613F3B4840	2020-09-04 21:35:07.650344	2020-11-02 11:28:10.073328	1
256	0103000020E6100000010000000D0000002CF4E8A9C44E0540EC111DD3193B4840CF20E9A1BD4E05407AD500B9193B4840C105E98D954E0540383733D9183B48409AE0E817934E0540383E5492183B4840ED0BE91F9A4E054069D58113183B484078CBE881A14E054098696D22183B4840A105E983AE4E0540AC819165183B4840ACDCE847BD4E054075902387183B4840AF20E997D64E05407AE3422B193B48408615E959D84E054066BDDC75193B4840E1D3E8D5D44E05407AD500B9193B4840B1ECE827CE4E0540C4DE92DA193B48402CF4E8A9C44E0540EC111DD3193B4840	2020-04-16 20:02:34.33054	2020-10-31 18:56:44.384507	1
282	0103000020E61000000100000009000000D8A5257BD24E054083DD58AE343B4840DCE02FB8CD4E0540EE6890B5343B4840DB798051CA4E0540C85A4A96343B484086F1BA73CB4E054054552D66343B48402828A5FCCF4E054092AD8650343B484028576DD4D84E0540A0F7B64B343B48407A409CBCD94E05400ED83B7E343B484078D9EC55D64E05402DC1E99F343B4840D8A5257BD24E054083DD58AE343B4840	2020-04-16 20:02:34.379603	2020-10-31 17:45:16.260998	1
226	0103000020E6100000010000000F000000EA13E9C92C4E0540B1907901443B48402716E98B5B4E05400C565B5D433B4840DAE0E82B614E0540E4C15334433B48400206E9A1634E0540D64175ED423B4840DAE0E82B614E05405DDBDBA2423B48402716E98B5B4E05406FAFA36E423B484054D3E8214D4E054029127363423B48404DDDE879404E0540C4CA1E15423B484073EDE863384E054012523306423B48409502E9F9294E05404F05802B423B484011F0E8431C4E054016F32D67423B4840EACAE8CD194E0540FB3482B5423B4840EACAE8CD194E0540E176D603433B4840ECDFE859244E054061BEE7DF433B4840EA13E9C92C4E0540B1907901443B4840	2020-04-16 20:02:34.277785	2020-10-31 17:45:16.345806	1
233	0103000020E6100000010000000B000000F5E4E891094F0540036C7777433B48401BF5E87B014F054077998754423B48409811E989024F0540FE32EE09423B48404810E999104F05402F5B5CE8413B484026FBE8031F4F0540C27FA1E4413B4840FC09E9FD244F05406B0EA90D423B4840AFD4E89D2A4F0540BC83C93B433B484056E2E8B1254F0540036C7777433B4840A9DEE8F51D4F0540685D4E95433B48409E07E9310F4F0540C119C49C433B4840F5E4E891094F0540036C7777433B4840	2020-04-16 20:02:34.290375	2020-10-31 17:45:16.363667	1
260	0103000020E6100000010000000F00000061E1B39C5C4F0540AB3394A81C3B4840ADC759CF704F0540567FE3821D3B4840A71CA533804F054076BB9BE71D3B4840C0F51DF8884F0540E59D98F41D3B484015799C87944F05404186115D1D3B4840720800E7964F0540C9B68BF91C3B4840B350CF418C4F054082632C431C3B48407A95D318854F0540E2A420FE1B3B4840E94611F4714F0540ED23D1A61B3B484083DE5144684F05408E0F8D871B3B484046D040155E4F05406D26688A1B3B4840FDB3DEE8554F0540563795BC1B3B48404FFC338D544F05400CCA461E1C3B48402D99DB21584F054001F07E7B1C3B484061E1B39C5C4F0540AB3394A81C3B4840	2020-04-16 20:02:34.338504	2020-10-31 18:56:44.431861	1
216	0103000020E610000001000000140000009F13E9F6E04E0540E913BAB52B3B4840B135E923E14E054042F842692B3B4840B516E93FE34E0540514AA91E2B3B4840B34AE9AFEB4E05407744D79F2A3B4840B940E957F84E0540C1F30C4A2A3B48404300E9B9FF4E05404DC2F02F2A3B4840C446E9DF154F054001CF5E0E2A3B4840F52DE98D1C4F0540EDAF19122A3B4840CB3CE987224F05407D4BDC3E2A3B48404E20E979214F05406EF975892A3B4840724AE99B1D4F05409CF9DEC82A3B4840C8F8E837094F054081D3942D2B3B48409E07E9310F4F0540258E9C562B3B48409940E94D114F0540973636A12B3B48404AF6E8610C4F05406D6F29D92B3B48400F38E9EFF64E05404AFE7D272C3B4840BB0CE9E7EF4E05400EA1AE322C3B48403BF5E885E84E0540F23608202C3B484038FAE831E24E0540CD8100F72B3B48409F13E9F6E04E0540E913BAB52B3B4840	2020-04-16 20:02:34.259246	2020-11-08 17:48:54.739277	1
247	0103000020E61000000100000010000000DD13E93D414D0540D4E3521C4A3B48400DCCE827394D0540FA2CDD144A3B484009D1E8D3324D0540F7EC5FE4493B484032DCE811314D05407B9CC699493B484031F6E849354D05405908A356493B4840B7D4E88F3A4D054095DA5BD0483B4840061FE97B3F4D0540F340388D483B4840E9D0E8C94B4D05403D88CF4D483B4840BFDFE8C3514D05400E55616F483B48403B16E909574D0540D82C0FAB483B48406DE3E87F594D0540D282A8F5483B484095EEE8BD574D0540A78FB747493B48406421E947554D05408FBB0B96493B484015D7E85B504D0540B24F2FD9493B484012DCE8074A4D05403595AC094A3B4840DD13E93D414D0540D4E3521C4A3B4840	2020-04-16 20:02:34.314637	2020-10-31 17:45:16.393417	1
265	0103000020E61000000100000009000000D94F16D9634D0540790FADC6093B48403D7A6DF2644D054099DD8D4A0A3B4840A1442B09714D05405A0A79A20A3B48408E34F903874D05409FE618880A3B48405FD10D34944D05409F7C42D8093B48406213B474914D0540F1A14BD9083B4840D3C9F011824D0540E48F355E083B4840CD657098664D0540F1A14BD9083B4840D94F16D9634D0540790FADC6093B4840	2020-04-16 20:02:34.348284	2020-10-31 18:56:44.466648	1
263	0103000020E61000000100000009000000B73DDE0BE64D05402AECFAD3083B48405989D7F3ED4D0540787BFE08093B48409DDBE059FD4D0540D9F85200093B4840394D1EDF014E0540107EB1CE083B48401F14E155004E05403669BE1F083B4840E991F775FB4D0540CC8B6C01083B4840490E3D4AEA4D05409B15520C083B48407453002BE64D054067D14B39083B4840B73DDE0BE64D05402AECFAD3083B4840	2020-04-16 20:02:34.344494	2020-10-31 18:56:44.490232	1
218	0103000020E6100000010000000A00000076FCE8F3104F0540FF69D55E313B4840011AE9DD354F0540C623B430303B4840B003E961394F0540972E4BF12F3B48405711E975344F0540C1F557B92F3B48402ED7E873274F05409300EF792F3B48404E20E979214F0540769648672F3B48408259FAB71F4F0540BE59AC6F2F3B48406E20E983084F0540AACA64F6303B48407201E99F0A4F05409D62FE40313B484076FCE8F3104F0540FF69D55E313B4840	2020-04-16 20:02:34.262859	2020-10-31 15:49:58.235084	1
232	0103000020E6100000010000000D0000008F17E99324500540124A1B8C3F3B484039F1E83717500540124A1B8C3F3B48408BEDE87B0F500540D696CE663F3B484060E7E8E90A5005407B84DB2E3F3B4840B5DEE88109500540041342E43E3B48400DEBE8A5125005409F6A70653E3B484010E6E8F918500540E3B123403E3B4840C1E4E80927500540BA1D1C173E3B484045F7E8BF34500540EC9B07263E3B4840CAD5E8053A500540328FB5613E3B48401B06E9B93A5005407A2E5EFE3E3B48409FCFE87335500540D44051363F3B48408F17E99324500540124A1B8C3F3B4840	2020-04-16 20:02:34.288708	2020-10-31 15:49:58.254704	1
225	0103000020E6100000010000000B0000004E6D0578E14D054069331EF4303B48408007B1A9E34D054011469965313B48402D22C867E64D054014133354323B4840BF9C9AEBE04D0540F03FC5C2323B4840B9486ADAD44D05405774F3BC323B4840BBF2D1D1CE4D054014133354323B4840895826A0CC4D05401F15CFDF313B48401829912CCD4D0540B61307F7303B48403420FF4DD44D05403E15BC9F303B48408C02EFB9DE4D0540897D31B1303B48404E6D0578E14D054069331EF4303B4840	2020-04-16 20:02:34.276065	2020-11-03 09:44:20.827442	1
255	0103000020E6100000010000000B000000230BDB60514E0540EDAFE44B143B484091771B1A714E0540F8760C50143B4840D55041CD754E0540D500900D143B48400578FE9A794E0540D55F197F133B4840F523E4B6794E0540C71DC46E133B484092A65E1F774E05406842D45C133B4840D093A900634E0540FDFA6418133B48408638AD8F5B4E0540D9FFCA3D133B4840C5543B764D4E05404CB985A1133B48405243F8114D4E05402CDFF0FC133B4840230BDB60514E0540EDAFE44B143B4840	2020-04-16 20:02:34.328909	2020-11-03 10:43:51.551899	1
231	0103000020E610000001000000100000003693F4B4D64F054000247AE93B3B4840F755F469C74F05407FC8FCB83B3B4840D890F4E8C04F0540E75848993B3B4840DE57F4CCBE4F0540CEEE93793B3B4840847FF418BE4F0540923047543B3B48408860F434C04F05400EE0D7303B3B48400497F47AC54F0540D7167DFE3A3B4840E06CF458C94F05405C066FF13A3B4840E09BF41CD84F054012744CF33A3B48408F85F4A0DB4F054030D3F2053B3B48402786F413E14F05402B3F7E433B3B48403D89F45CE34F05401D6BA86A3B3B4840A883F43DE44F0540440AB0933B3B4840BB8BF432E04F0540AC51F6D43B3B4840E95DF454DC4F0540DECFE1E33B3B48403693F4B4D64F054000247AE93B3B4840	2020-04-16 20:02:34.286963	2020-10-31 15:49:58.30506	1
246	0103000020E61000000100000010000000CFFBE827B24C054052306A23473B48402708E94BBB4C054007083FB7463B484006D9E87DC54C0540F647E33F463B48405CFFE8D9D24C05400291B0AA453B484035DAE863D04C054087351760453B48405CD0E815C44C05405B619206453B48407EE5E8ABB54C05406D355AD2443B4840FECDE849AE4C0540591615D6443B48404708E955A24C0540901FFB45453B48401721E9A79B4C054018FB72D7453B48401807E96F974C054020D1EA68463B48401DE8E88B994C054007083FB7463B48401A1CE9FBA14C054071841036473B48401D17E94FA84C0540D575E753473B48407BEAE857AF4C054023FDFB44473B4840CFFBE827B24C054052306A23473B4840	2020-04-16 20:02:34.312643	2020-10-31 17:45:16.24304	1
235	0103000020E6100000010000000800000038DFD935594F05408FCCC06A423B4840B2CA760D544F054039E3672E423B484043285F905A4F0540FED9E405423B48409375E09B614F05409BF7CF0C423B4840E7F74A23684F0540C454AD2A423B4840EA181589694F0540AE5CC275423B4840C1286E75624F05400B629684423B484038DFD935594F05408FCCC06A423B4840	2020-04-16 20:02:34.29394	2020-10-31 17:45:16.251426	1
237	0103000020E6100000010000000B000000B3EDE877064E0540685D4E95433B484096E8E8C1254E0540494BB95E443B48406816E99F294E05406AEADCA1443B484096E8E8C1254E05400B8F00E5443B4840800BE975F94D0540901FFB45453B48407FDCE8B1EA4D0540901FFB45453B48407CE1E85DE44D0540BF526924453B48404A14E9E7E14D0540B2D28ADD443B48407800E941E24D0540B871F192443B484053D6E81FE64D054004AE8853443B4840B3EDE877064E0540685D4E95433B4840	2020-04-16 20:02:34.297267	2020-10-31 17:45:16.256177	1
243	0103000020E6100000010000000D0000005010E98B204D05405B23BD8A3E3B48405606E9332D4D0540BF7511D93E3B4840DA18E9E93A4D0540D3EAD3053F3B4840DD13E93D414D0540183287E03E3B484068D3E89F484D0540E25BA60F3E3B484063F2E883464D05405F542E7E3D3B4840B10DE9AB3C4D05402C2A480E3D3B48405EE2E8A3354D054040498D0A3D3B4840010FE99B2E4D05405DA8331D3D3B48402B00E9A1284D05405EFEB04D3D3B4840FCFEE8BB1D4D054027F9D61A3E3B484051F6E8531C4D05409F6A70653E3B48405010E98B204D05405B23BD8A3E3B4840	2020-04-16 20:02:34.307485	2020-10-31 17:45:16.264324	1
585	0103000020E61000000100000007000000E105D2CFEC2E0440B64CCF8D4630484037FDD167EB2E04409BF75BF845304840EAC7D107F12E04407A97616A45304840E615D2AFFD2E0440CD4FA2AD4530484040EED163FE2E0440E8A4154346304840FF57F477F92E04409D598A9146304840E105D2CFEC2E0440B64CCF8D46304840	2020-11-09 22:47:32.634123	2020-11-09 22:47:32.634123	2
389	0103000020E6100000010000000D000000B6FCE807DF4E05409B545C5C453B48405A0FE9C7D34E0540D371AE20453B4840DED8E881CE4E0540644B76EC443B4840011DE9DBCE4E05406AEADCA1443B48403104E989D54E0540991D4B80443B48403CDBE84DE44E0540F2D9C087443B48409301E9A9F14E0540F5243EB8443B484096FCE8FDF74E0540C6F1CFD9443B4840BD21E973FA4E0540D371AE20453B4840EA0DE9CDFA4E05404DCD476B453B484014FFE8D3F44E0540E33C0A98453B48403714E969E64E054044E36385453B4840B6FCE807DF4E05409B545C5C453B4840	2020-07-12 21:39:51.924468	2020-10-31 17:45:16.336039	1
245	0103000020E610000001000000100000004F6D3836F44C05401511C811463B4840F644761AE84C05402B943DF7453B4840F7A9CD46E04C05403DADBCA9453B484079412B0FE14C0540CA029C6F453B48409D37D8EDE34C05408CBE8D40453B484096593C52ED4C05401ED20CF3443B48401013FE7EF74C054094F910CF443B4840E00FFA73FC4C05408194D5D1443B4840FADD81D80B4D054083E0911C453B48401FD42EB70E4D0540AEBF644E453B48401FD42EB70E4D0540A06F8588453B4840F4643D690D4D0540921FA6C2453B48407FBF687F094D0540F62D2BEC453B48402286F479054D0540F2591206463B48400A7F83C8FB4C0540EFD40810463B48404F6D3836F44C05401511C811463B4840	2020-04-16 20:02:34.310842	2020-11-08 17:48:54.81829	1
528	0103000020E61000000100000009000000C2D034FDED4E0540E033666D2D3B484015B0D19EE64E0540C3AFCA612D3B4840529BA0B2E14E0540E5EC3B2B2D3B4840B57471F3E54E054046606BED2C3B484043498E9DF34E054018FC09DD2C3B48406133F4BCF64E0540B51753F02C3B484084C51785F84E0540EFC15E2B2D3B4840A845A60AF54E0540CEC8AB532D3B4840C2D034FDED4E0540E033666D2D3B4840	2020-11-08 17:48:54.831087	2020-11-08 17:48:54.831087	1
261	0103000020E6100000010000000E00000009F3E84FA54F054083A7F6DA1C3B4840BB20E923C24F054062B8AC3F1D3B4840D0CEE8ABDF4F054076D7F13B1D3B484051E6E80DE74F0540039BD5211D3B4840A5F7E8DDE94F054083A7F6DA1C3B4840F70DE959E64F0540A910E4FE1B3B4840C80CE973DB4F0540F332B8921B3B48409AF1E855CC4F054022CEC45A1B3B484064FAE8C7B44F05405F20944F1B3B484009F3E84FA54F05401410E1741B3B48405DD5E85B994F05400740DCD51B3B4840D610E94D984F0540741476201C3B4840AC1FE9479E4F0540091579AA1C3B484009F3E84FA54F054083A7F6DA1C3B4840	2020-04-16 20:02:34.340493	2020-10-31 18:56:44.360817	1
398	0103000020E6100000010000000C0000009E52F43F894E054059C0E593113B4840D49EF48E854E0540F4B81C83113B48409B57F4EB824E0540B8E4DD6A113B48402F5DF40A824E054004EA9045113B4840846EF4DA844E05407E832F2F113B48403258F45E884E05403CD0FE23113B484097A5F4938F4E05403CD0FE23113B4840B750F4DC914E05406290F83F113B4840A3423DC9924E054000D4AC5F113B4840B750F4DC914E054001F96F8C113B48400867F4588E4E0540C4A6A097113B48409E52F43F894E054059C0E593113B4840	2020-09-04 21:35:07.631371	2020-10-31 18:56:44.376792	1
250	0103000020E6100000010000000A00000083C3D12DA94F0540B250BB47183B4840D0F8D18DA34F0540F6FF0C0C183B4840CEE3D101994F054077084F7E173B4840B0D1E89F914F0540D9C1C0FB163B4840220FD209A04F054054D0486A163B484082DDD165AD4F0540987F9A2E163B4840D903D2C1BA4F0540F0461036163B48408BE8D199C44F054071A7ED67173B4840E1C5D1F9BE4F05409E389704183B484083C3D12DA94F0540B250BB47183B4840	2020-04-16 20:02:34.320189	2020-10-31 18:56:44.406588	1
586	0103000020E61000000100000009000000DA15D223122E0440CD483B5AFC2F48401DE2D1C7D72D0440AF7F1F78FC2F48401801D2ABD52D04403E8323EAFB2F4840CBCBD14BDB2D0440CC86275CFB2F4840D3F0D1B7F62D0440A6E77A02FB2F48402917D213042E04408129D827FB2F4840BA1DE9F90E2E044033F27590FB2F484038CFD1F3142E044001F1EB25FC2F4840DA15D223122E0440CD483B5AFC2F4840	2020-11-09 22:47:32.637079	2020-11-09 22:47:32.637079	2
397	0103000020E6100000010000000A0000007E52F435A24E05403DCDAEA4113B4840CF68F4B19E4E0540075AD1A2113B4840CB87F4959C4E0540F4B81C83113B4840F873F4EF9C4E05407531AD5F113B48401F99F4659F4E05409803D641113B48408E8EF49AA64E0540B4F60C31113B4840FE69F497A94E0540BA576E47113B484077A5F489A84E054059C0E593113B4840D263F405A54E054073408CA6113B48407E52F435A24E05403DCDAEA4113B4840	2020-09-04 21:35:07.613082	2020-10-31 18:56:44.495429	1
257	0103000020E6100000010000000C000000F4FEE8C90D4F0540C49ECC831B3B4840B811E993E94E05402836472A1B3B4840B9F7E85BE54E0540000ADEEA1A3B484095CDE839E94E0540143765591A3B4840C1D3E8CBED4E0540EC0AFC191A3B4840E712E979F44E0540295DCB0E1A3B484022D1E8EB094F0540AFB82C251A3B48404C0BE9ED164F0540BD6FEF511A3B484027E1E8CB1A4F0540000ADEEA1A3B4840CD08E9171A4F0540ECE377351B3B484051D2E8D1144F05403D436B6D1B3B4840F4FEE8C90D4F0540C49ECC831B3B4840	2020-04-16 20:02:34.332263	2020-10-31 18:56:44.498291	1
262	0103000020E6100000010000000D000000AF1AE99BA44F0540E75807A21E3B484039F4E835B04F0540D427A1EC1E3B48408C1FE93DB74F0540EF9C47FF1E3B48406CD6E837BD4F054061EB84D21E3B48409215E9E5C34F0540C58DFF781E3B4840BB20E923C24F0540865F72F61D3B4840C1E7E807C04F05409990D8AB1D3B4840BDECE8B3B94F054077C5D0821D3B48403DD5E851B24F05400BDF157F1D3B48408CD6E841A44F0540057793AF1D3B48400BD9E817A14F0540F2452DFA1D3B48400BD9E817A14F05404BFB81481E3B4840AF1AE99BA44F0540E75807A21E3B4840	2020-04-16 20:02:34.342592	2020-10-31 18:56:44.551266	1
221	0103000020E61000000100000011000000BE77F4C37B500540081F88C7383B48403E8FF4258350054066AD7730383B48408098F4008A5005409F63E7DE363B4840C46DF46B88500540EFDFFBCF363B4840AD84F45A8A500540C3EA8483363B48406E76F4D3895005400827385E363B4840FE9AF4D68650054093001C44363B48403E8FF4258350054004D1C83A363B4840E2A1F4E5775005406BC2914B363B48407C6EF4E874500540AB75D063363B4840E172F42169500540B111229D373B48406075F4F765500540A1CC4186383B4840498CF4E667500540832F96D4383B48408C7BF4896A500540AFC38FF0383B4840A098F40A7150054083901305393B48400F8EF43F78500540088005F8383B4840BE77F4C37B500540081F88C7383B4840	2020-04-16 20:02:34.267898	2020-10-31 22:11:01.236449	1
220	0103000020E6100000010000000D000000DAF1E8699A4F05402777D233353B4840290DE991904F0540AF892EAB353B4840D01AE9A58B4F0540B8C98FC1353B484011F5E8BC834F05404D82578D353B48404C08E9EF7D4F0540BAFC9460353B484079F4E8497E4F0540C66FFB15353B484027F8E805864F05408DD9B38F343B4840D315E9F9914F0540EBF033D5333B4840D610E94D984F05409D08A2B3333B484060D0E8AF9F4F05403A6D48C6333B4840AF1AE99BA44F0540CACA0554343B4840DB20E92DA94F054079BA6E93343B4840DAF1E8699A4F05402777D233353B4840	2020-04-16 20:02:34.266242	2020-11-01 18:31:23.185997	1
238	0103000020E61000000100000015000000BD1CDBDEFD4D054044E9DF32463B4840D379CCEDFF4D0540560383FB453B4840A852F4FE064E05401A4D11C1453B4840D753F4E4114E05405D9FC49B453B4840990AD8AB1B4E0540F6E075AC453B4840325BF45C214E054064DF33BF453B4840414222392C4E0540F125F9B6453B4840ADFEBFB9374E0540ED3007C4453B48401DF8C15A404E0540FE8CE8F0453B484039117A52424E05402B96FD14463B48408D06F9C2424E054044480948463B48409E3156D73D4E0540EE2A9991463B4840636F1FBE374E05404DA72DC2463B48409D8A62A9294E05406C734B02473B4840A5C2B1F71B4E054070D87C4A473B4840A1AE0A7B094E054050D7994D473B484038CD9C9C034E054012C8EB3A473B4840F8BD2717004E054019981B09473B484058366D54FE4D05404A217689463B4840D325ABA1FC4D0540CAF54D65463B4840BD1CDBDEFD4D054044E9DF32463B4840	2020-04-16 20:02:34.298841	2020-11-02 13:40:45.649271	1
584	0103000020E6100000010000000A000000B8C3D1CB18340440EB2604F575304840BB07D21B32340440A6A2FC7575304840C3E3D18B3A340440601EF5F674304840BFE8D137343404401B9AED777430484063FBD1F72834044050E4D7077430484063CCD1331A34044061527BE273304840570FD2A70F340440301E184B74304840AAF1D1B303340440ADCE0A6775304840ADECD1070A340440EE3C8BED75304840B8C3D1CB18340440EB2604F575304840	2020-11-09 22:47:32.628257	2020-11-09 22:47:32.628257	2
587	0103000020E6100000010000000E00000025F9E8D16F310440E338B2574530484003E4E83B7E310440CF179675453048400313E9FF8C310440E843395045304840070EE95393310440BEE7982E4530484038DBE8C995310440713ADFE3443048400BEFE86F95310440A992AC9144304840E3C9E8F9923104405CE5F246443048405AF0E85F87310440E0D011E243304840FD1CE95780310440F0E6A6CB433048407D05E9F578310440E0D011E243304840A6F6E8FB72310440429FE70E443048409F1AE98B6A3104406C15F08D443048407CD6E8316A31044034BD22E04430484025F9E8D16F310440E338B25745304840	2020-11-09 22:47:32.640287	2020-11-09 22:47:32.640287	2
588	0103000020E6100000010000000B00000083D9E821132F0440C7AE99043630484069CFE8BF382F044052B4A7F5353048406308E9DB3A2F044037A0361935304840BCCBE803312F0440861FBA04343048405BFDE8A7232F044070B8AECC3330484008D2E89F1C2F04402830E4D73330484082F3E859172F04403E97EF0F34304840A8E9E80B0B2F04405D12D73A35304840AACFE8D3062F0440EEC44AD035304840F919E9BF0B2F0440C7AE99043630484083D9E821132F0440C7AE990436304840	2020-11-09 22:47:32.643163	2020-11-09 22:47:32.643163	2
204	0103000020E6100000010000000A000000F21357931D4C05401DA4C8C02D3B4840515A23CC144C05401DA4C8C02D3B4840F7E14B750C4C0540EFF3D7A42D3B484047CBA7E50C4C05408194B5472D3B48400B19C75B144C05402529D40F2D3B4840ACD2FA221D4C0540B20C2C0B2D3B4840064BD279254C054060C21C272D3B484092CD8A5A264C05404F1C3F842D3B48401F1D609C234C05409830A9AA2D3B4840F21357931D4C05401DA4C8C02D3B4840	2020-04-16 20:02:34.236166	2020-10-31 17:45:16.436109	1
209	0103000020E6100000010000000C0000008CFAE8C3AB4D05403F6FC0992B3B48402A17E9DB934D05409CB3EE8F2C3B484056D4E871854D0540C168F6B82C3B4840210CE9A77C4D05402B0B55452C3B48404BFDE8AD764D0540B3A0DCB32B3B48407918E9CB854D054048FF47082B3B484059CFE8C58B4D0540244A40DF2A3B4840B3F0E8759F4D05407744D79F2A3B484089FFE86FA54D05401BFFDEC82A3B4840109EF485AD4D0540CAB763222B3B48401F1AE91AAF4D0540EA30CD612B3B48408CFAE8C3AB4D05403F6FC0992B3B4840	2020-04-16 20:02:34.245774	2020-10-31 17:45:16.450952	1
388	0103000020E6100000010000000A00000035E8E8A3704E0540A0B77E14473B4840821DE9036B4E054084C2C186463B4840B8CBE8956F4E0540BCDF134B463B4840E205E9977C4E0540CCBEDB16463B484012EDE845834E0540B1AAB234463B4840E8FBE83F894E05404CA56FC2463B48408F09E953844E054095821DFE463B484069CAE8A57D4E0540664FAF1F473B4840DE0AE943764E0540ABECDF2A473B484035E8E8A3704E0540A0B77E14473B4840	2020-07-12 21:39:51.895464	2020-10-31 17:45:16.453856	1
244	0103000020E6100000010000000900000061D5D117584D0540E31CD78F3F3B48400AF8D1B75D4D0540036271653E3B484011D4D127664D0540F77515EE3D3B4840C2D2D137744D05408BF0D71A3E3B48406BF5D1D7794D0540A21195A83E3B4840C5CDD18B7A4D0540EAB03D453F3B484013E9D1B3704D0540D0530FC43F3B48400812D2EF614D05400C075CE93F3B484061D5D117584D0540E31CD78F3F3B4840	2020-04-16 20:02:34.309198	2020-10-31 17:45:16.459139	1
396	0103000020E61000000100000010000000038CF438BE4D0540EB19A3E2453B48401860F4BDB14D0540C1909BB9453B4840A884F4C0AE4D0540BB502C96453B48406A76F439AE4D05409EA6FA45453B4840538DF428B04D054097668B22453B48401399F4D9B34D0540439F070E453B48400091F4E4B74D0540EAE29106453B4840C95EF4CDBF4D05408C312A0C453B48401C8AF4D5C64D0540F022012A453B48401F85F429CD4D05404C2AF461453B4840F779F4EBCE4D05406689A881453B4840B86BF464CE4D054059AAD2A8453B4840E176F4A2CC4D05402A7764CA453B48405F79F478C94D0540218D80E4453B48409F6DF4C7C54D05407A49F6EB453B4840038CF438BE4D0540EB19A3E2453B4840	2020-09-04 20:16:26.522671	2020-10-31 17:45:16.485388	1
201	0103000020E6100000010000001000000066207A95F24E05404C1486D3333B4840F21EFE65FC4E0540F79D67E8333B484038C58F18064F0540D34393C5333B484076D455020E4F05402681C67F333B4840F2BD9ACB174F0540A896DF8E333B484081BC93A2204F0540C12FE3CE333B484062E68E2A274F0540FCEE5528343B4840AB14DF93234F054044082099343B48408865C550174F0540DDA6F699343B48404B5B6EF2094F0540D1E49C00353B484072EB1059034F05403C4CA1F3343B48403856A92A024F0540880EC2A5343B48406A5BFE4FFF4E054013860989343B4840EB6C802FF54E05402E77E936343B48405CFAC039F14E05409B98F50A343B484066207A95F24E05404C1486D3333B4840	2020-04-16 20:02:34.230549	2020-10-31 17:45:16.488547	1
283	0103000020E6100000010000000A0000008EE185E4B64E05408ABA417A3B3B484098A76027BB4E05401274D61F3B3B48402464ACBAC24E05407CF588DE3A3B4840058096B9CB4E05408D3E5FBB3A3B48405FCC16C6D34E054017CEA0F23A3B484022B44B3FD44E05409C0318573B3B4840B9E6D290CE4E0540934F83B13B3B484014E3B318C54E0540D6E4BEE33B3B484098A76027BB4E054010F0B8DE3B3B48408EE185E4B64E05408ABA417A3B3B4840	2020-04-16 20:02:34.381385	2020-10-31 17:45:16.495805	1
395	0103000020E6100000010000000D0000006C73DF8A3D4E0540C5E0A2BB273B484091A2CB0E284E0540AB4B313B273B4840E5B898DB264E05400AF73525273B484023C23283274E05406F136110273B4840C85458E9294E054045F423F1263B4840F72BD2172C4E05409A2D82EC263B48407C6A8690304E0540B0464BF2263B48406A22720D3A4E05405EBFA319273B4840D44D5311454E0540A4DF267D273B4840300C9B28464E0540F16BB49E273B484046574BDE434E054068C4E3C4273B48408D79FA77414E0540B5FDD5CB273B48406C73DF8A3D4E0540C5E0A2BB273B4840	2020-09-04 20:16:26.503178	2020-10-31 17:45:16.498779	1
248	0103000020E6100000010000000E000000620CE9BB4A4D0540C75A056A4F3B4840581BE9BF374D0540DE8401564E3B4840B4D9E83B344D0540F563AD074E3B4840AFF8E81F324D05400B4359B94D3B4840AFF8E81F324D05402222056B4D3B4840B4D9E83B344D054012B826244D3B484034F1E89D3B4D05404C20F6184D3B4840B803E953494D0540D05A73494D3B4840ECCBE81D524D0540AB91FFCB4D3B484040F7E825594D0540DE8401564E3B48401BCDE8035D4D05406C2979E74E3B48401BCDE8035D4D0540D644CD354F3B4840C2DAE817584D05400EED35754F3B4840620CE9BB4A4D0540C75A056A4F3B4840	2020-04-16 20:02:34.316481	2020-10-31 17:45:16.50676	1
234	0103000020E6100000010000001400000091D5E8E37B4E054016C461FB443B4840F3D2E803984E0540B871F192443B48408F74F462A24E0540BFB8816F443B484062F7E8FCAD4E0540BF105848443B48404E09E93FB64E05400D986C39443B48402518E939BC4E05405D6AFE5A443B484059E0E803C54E0540180FDF2B453B4840A910E9B7C54E0540926A7876453B48401F08E959AB4E054068CD04F9453B48403E3EFA4EA74E0540C2AF3404463B4840FB4EFAABA44E054020619CFE453B484032327AE4A04E0540E7F84503463B48406915FA1C9D4E05401B6CAA0B463B484096507A55994E0540C8EF2A2E463B48401402E9D18D4E0540A8C0CE4E463B4840C1D6E8C9864E05409D8B6D38463B48403BF8E883814E0540C1897A00463B484037FDE82F7B4E0540A689BD72453B48408DF4E8C7794E05402C2E2428453B484091D5E8E37B4E054016C461FB443B4840	2020-04-16 20:02:34.292004	2020-11-02 11:28:10.097357	1
529	0103000020E610000001000000090000009EF1D12718330440E5C9501F7F30484044D0D1770433044041A09E467E30484096E6D1F30033044000952CB17D304840EAF7D1C3033304403F84BA1B7D30484046E5D1030F330440E39188C97C3048409D0BD25F1C3304404CE7D6FD7C3048405105D2C330330440A4BEDE897E304840A7E2D1232B330440E5C9501F7F3048409EF1D12718330440E5C9501F7F304840	2020-11-09 22:47:32.443243	2020-11-09 22:47:32.443243	2
531	0103000020E6100000010000000B000000B8F8D18B59330440A96E87E25830484019C7D1E766330440C7D138AE583048406B0CD227723304408187144D5830484074CED15F76330440B3A82E2257304840C103D2BF703304408CB6BB8C563048400FD6D1EB533304408CB6BB8C563048405FD7D1DB45330440E84D83C8563048405AF6D1BF433304408F3AF65D5730484009E0D14347330440B62C69F3573048405C0BD24B4E330440672FEA7958304840B8F8D18B59330440A96E87E258304840	2020-11-09 22:47:32.453922	2020-11-09 22:47:32.453922	2
532	0103000020E6100000010000000E0000008C14E9113D330440A651711049304840E3F1E871373304400402778248304840E3F1E87137330440AA3A47E947304840BAE6E8333933044019104AA247304840600EE97F38330440FCC5D60C47304840361DE9793E330440DD7F44DC46304840C4D7E82F4C330440F1A060BE46304840F3D8E81557330440A111F03547304840F00CE9855F33044000E4A6C747304840C61BE97F65330440E4BBE4514830484076EBE8CB64330440AE5817A4483048401FDFE8A75B3304409C3B631F49304840E9E7E81944330440830FC044493048408C14E9113D330440A651711049304840	2020-11-09 22:47:32.457081	2020-11-09 22:47:32.457081	2
533	0103000020E6100000010000000B0000002BE9D19F2D2D0440047C849E0B30484027EED14B272D0440871507250C304840D1C7D1EF192D0440416DC16F0C30484070F9D1930C2D0440782BF9330C30484070CAD1CFFD2C0440F4F2F3260B3048406EE4D107022D044080437F910A304840C6F0D12B0B2D04406ABA67210A3048401D17D287182D0440FF9EFC0A0A304840CD15D297262D0440CDE04B3F0A304840D5F1D1072F2D04405D6FDCB60A3048402BE9D19F2D2D0440047C849E0B304840	2020-11-09 22:47:32.46052	2020-11-09 22:47:32.46052	2
535	0103000020E6100000010000001000000008E3E8DD5530044054FEFA47343048405B0EE9E55C300440F00E9E223430484013E9E86573300440FD61CD67333048409105E97374300440B67D131D33304840BFD7E89570300440E3934BE132304840DF20E99B6A30044011AA83A5323048405E09E93963300440EA37E38332304840B105E97D5B300440753DF174323048405DDAE87554300440ADBA268032304840ADDBE86546300440422732B832304840D7CCE86B40300440588E3DF032304840221CE9033F300440DCEFB33E33304840D105E9874230044066ADA0DB3330484080EFE80B46300440F00E9E223430484083EAE85F4C30044017813E443430484008E3E8DD5530044054FEFA4734304840	2020-11-09 22:47:32.468181	2020-11-09 22:47:32.468181	2
536	0103000020E6100000010000000B00000048E9D151E03104400A3481DB35304840EDE1D1D9D03104406E23DE00363048403DE3D1C9C23104407E2E73EA353048403BCED13DB83104404D60D5813530484036EDD121B6310440C2ADE8E4343048408EF9D145BF3104401CE5586D34304840EEC7D1A1CC3104403DFB8240343048409FC6D1B1DA310440B8F5FB47343048404BE4D1A5E631044080D4B59234304840A0F5D175E9310440908C29283530484048E9D151E03104400A3481DB35304840	2020-11-09 22:47:32.471357	2020-11-09 22:47:32.471357	2
537	0103000020E61000000100000008000000A005D2BB1E2F0440CE8BF09140304840E910D203042F0440A7FFE712403048409DC1D16B052F04408B7EED843F3048409A0FD213122F0440B5B525493F304840A5E6D1D7202F0440A59F905F3F304840A7FBD1632B2F0440E04CB5C03F3048404E09D277262F0440F8C2285640304840A005D2BB1E2F0440CE8BF09140304840	2020-11-09 22:47:32.474044	2020-11-09 22:47:32.474044	2
538	0103000020E6100000010000000B000000E1CDE8AD882D0440B9F5F4E50330484083FAE8A5812D044060991C0004304840FD1BE95F7C2D0440CED489CF0330484059DAE8DB782D044015874A4503304840DAD7E8057C2D04405624090203304840DDD2E859822D04407AEDABDC023048400412E907892D044089D7B9CD02304840DA20E9018F2D0440640E17F3023048408ED1E869902D04401C7CD13D03304840070DE95B8F2D04401072488C03304840E1CDE8AD882D0440B9F5F4E503304840	2020-11-09 22:47:32.477119	2020-11-09 22:47:32.477119	2
539	0103000020E6100000010000000D0000004AEAE83D8E2E044054881A0222304840CA01E99F952E04405A88A1FA213048404E14E955A32E0440C2FA0ECA2130484057D6E88DA72E0440B7678A8A213048407A1AE9E7A72E0440343C16F52030484052F5E871A52E0440F4205CAA20304840A9D2E8D19F2E04409F100D7620304840F9D3E8C1912E0440FC826C5420304840420EE9CD852E044067264EB92030484044F4E895812E04406957C24E213048409ECCE849822E044068EA389D21304840F2DDE819852E044030007AE0213048404AEAE83D8E2E044054881A0222304840	2020-11-09 22:47:32.480017	2020-11-09 22:47:32.480017	2
540	0103000020E6100000010000000C00000063D9E8172C2F04401DF6DB8B2A3048408C13E919392F04406EF0A3C72A304840F5ECE8A95D2F04407AF0B1B82A3048404818E9B1642F0440497303A62A304840A7D1E881672F04407F73C2622A3048407AE5E827672F044040798F102A3048401917E9CB592F0440017F5CBE2930484042D9E80D452F044081FCE56F29304840E505E9053E2F0440497FB06429304840861DE9712C2F044009FC59052A304840B8D0E8AF2A2F04404DF613502A30484063D9E8172C2F04401DF6DB8B2A304840	2020-11-09 22:47:32.483135	2020-11-09 22:47:32.483135	2
541	0103000020E6100000010000000B000000A007D2AB263704407E8FE0CA833048409401D2230937044083C6EEBB8330484096CDD1B300370440B689E73C8330484096CDD1B3003704406F7EEEAE823048403E0AD28B0A37044019EF5146823048409FD8D1E717370440A5576E2882304840F5FED14325370440A5576E2882304840A6FDD15333370440919CBC5C82304840AFBFD18B37370440D7A7B5EA8230484056CDD19F323704409C97278083304840A007D2AB263704407E8FE0CA83304840	2020-11-09 22:47:32.486427	2020-11-09 22:47:32.486427	2
542	0103000020E6100000010000000E0000001A00E991EE2E0440AF7FA7E5283048407BCEE8EDFB2E0440E57F66A22830484024F1E88D012F04404DFDD37128304840CFDFE8BDFE2E044002F3A59127304840CCE4E869F82E04406970136127304840EEF9E8FFE92E04402CF3565D27304840EBFEE8ABE32E0440CB75708627304840920CE9BFDE2E044057F8F4C52730484098D3E8A3DC2E0440D87A6B1428304840BB17E9FDDC2E044053FD5A6A2830484019D1E8CDDF2E044011FD8DBC2830484018EBE805E42E0440E1FC55F82830484048D2E8B3EA2E0440DBFCCEFF283048401A00E991EE2E0440AF7FA7E528304840	2020-11-09 22:47:32.489299	2020-11-09 22:47:32.489299	2
543	0103000020E61000000100000009000000FACCD131E62D044017D1E46C1D3048409FC5D1B9D62D04403DBB0E401D3048409308D22DCC2D04401D8AF7CF1C304840EEE0D1E1CC2D0440A33D0A331C3048404ACED121D82D0440710C5ED91B304840A0F4D17DE52D0440770CE5D11B30484052D9D155EF2D04401743FC411C3048404D12D271F12D0440178A70D71C304840FACCD131E62D044017D1E46C1D304840	2020-11-09 22:47:32.492374	2020-11-09 22:47:32.492374	2
544	0103000020E6100000010000000E00000030F4E817862F04406EBD5CAD2C304840341EE92F9B2F0440702FD3FB2C30484091F1E837A22F0440FC34E1EC2C304840BDF7E8C9A62F0440AB3A19B12C304840C1D8E8E5A82F0440A9C8A2622C3048403A14E9D7A72F04409FD92ECD2B30484068E6E8F9A32F04404EDF66912B304840BBE2E83D9C2F04401D62B87E2B3048400DDFE881942F04401D62B87E2B30484033EFE86B8C2F0440855C9C9C2B30484030F4E817862F04409FD92ECD2B304840AEF6E8ED822F044064CEE8172C30484031DAE8DF812F0440A9C8A2622C30484030F4E817862F04406EBD5CAD2C304840	2020-11-09 22:47:32.495986	2020-11-09 22:47:32.495986	2
496	0103000020E6100000010000000B000000C6D5E86B5E4D0540CEC274903A3B48403B16E909574D0540B063CE7D3A3B48403DFCE8D1524D054012A9AA3A3A3B4840BFDFE8C3514D05409C2C11F0393B48403B16E909574D0540572E63B4393B48406CFDE8B75D4D0540884BD192393B4840C9D0E8BF644D0540A6AA77A5393B4840F5D6E851694D0540D789E0E4393B4840181BE9AB694D0540432796493A3B4840C9D0E8BF644D05409C4489813A3B4840C6D5E86B5E4D0540CEC274903A3B4840	2020-10-31 18:56:44.350931	2020-10-31 18:56:44.350931	1
497	0103000020E6100000010000000E00000058E9E8FD8F4D05403DA73BA2473B48402D12E92F9A4D054047FB080D473B4840B3F0E8759F4D0540C4B58BDC463B4840E3D7E823A64D0540FE1D5BD1463B4840E6D2E877AC4D0540CFEAECF2463B48408B14E9FBAF4D054004A95532473B484091DBE8DFAD4D05405311FECE473B48400FDEE8B5AA4D05406186DC15483B484009E8E80D9E4D0540D4EC917A483B484088D0E8AB964D0540DF21F390483B4840A819E9B1904D05402274A66B483B484003D8E82D8D4D05406CBB3D2C483B4840A9FFE8798C4D05405E465FE5473B484058E9E8FD8F4D05403DA73BA2473B4840	2020-10-31 18:56:44.403593	2020-10-31 18:56:44.403593	1
498	0103000020E6100000010000000D000000F41FE94D7C4D0540A3774526363B48404802E959704D05408E25FB8A363B48409703E949624D054048E947B0363B4840671CE99B5B4D05408E25FB8A363B4840BD13E9335A4D0540189E6140363B4840EEE0E8A95C4D05402411C8F5353B48404507E9056A4D0540EC19033F353B4840F900E9697E4D0540A9A4D7D2343B4840FCFBE8BD844D054046097EE5343B4840D8D1E89B884D0540C66FFB15353B48402802E94F894D054092BE0A68353B48407EF9E8E7874D0540874BA4B2353B4840F41FE94D7C4D0540A3774526363B4840	2020-10-31 18:56:44.421539	2020-10-31 18:56:44.421539	1
499	0103000020E6100000010000000E0000001FA5AED9B64C0540392801604B3B48400FFD10BAAA4C0540C435BDFC4A3B484006ADE858A34C0540A254DAA84A3B4840034D263DA14C0540C16285764A3B484005617015A34C0540F95EE0034A3B48400A3D8C82A64C0540E8E8EED9493B48401F593696B64C0540DD9DF8BD493B48402DD1F2A7C14C054063C3F3CB493B4840376D934CC94C0540D5253A284A3B48403DC5080BCE4C05401704E48C4A3B48403EA971D5CE4C0540AD9FD0C44A3B48403A19CEABCB4C05400F8C25F74A3B4840B14E430EBC4C0540178566614B3B48401FA5AED9B64C0540392801604B3B4840	2020-10-31 18:56:44.443659	2020-10-31 18:56:44.443659	1
500	0103000020E61000000100000008000000DDE1E87B994D05403595AC094A3B484081F4E83B8E4D0540BC0FA76A4A3B4840FFF6E8118B4D0540865C3E2B4A3B48405BE4E851964D05403EF47974493B4840B4D6E83D9B4D05404ED34140493B4840B7D1E891A14D054033BF185E493B4840B3F0E8759F4D0540AE0FB2A8493B4840DDE1E87B994D05403595AC094A3B4840	2020-10-31 18:56:44.450704	2020-10-31 18:56:44.450704	1
289	0103000020E6100000010000000A000000B301E9B3D84E0540FF770378203B48400203E9A3CA4E054085E58547203B4840D6FCE811C64E0540C6AAD70B203B48402B0EE9E1C84E0540D7F85E7A1F3B4840011DE9DBCE4E0540201412551F3B4840B21BE9EBDC4E0540286A736B1F3B48403CDBE84DE44E0540678D00EE1F3B4840E6E3E8B5E54E0540D5569A38203B48408DF1E8C9E04E0540FF770378203B4840B301E9B3D84E0540FF770378203B4840	2020-04-16 20:02:34.392516	2020-10-31 18:56:44.46373	1
264	0103000020E6100000010000000E000000F018E934A44D054017F060270C3B4840BDE1E871B24D0540A4A01B930B3B484044D5E843C24D0540ECA82CFA0A3B48406B14E9F1C84D0540107055DC0A3B4840F5D3E853D04D05407B5610E00A3B484024D5E839DB4D05403E9581480B3B484050DBE8CBDF4D054020C0FAD90B3B484050DBE8CBDF4D0540DE920A2C0C3B48401F0EE955DD4D05404593A4760C3B484017E9E8E9C14D0540BCCC62040D3B48408CFAE8C3AB4D05400E3377F50C3B484062DAE8F9A24D0540F32C90850C3B484035EEE89FA24D0540119357510C3B4840F018E934A44D054017F060270C3B4840	2020-04-16 20:02:34.346331	2020-10-31 18:56:44.474734	1
276	0103000020E610000001000000090000001D15B592F54C0540E2C8D4F10D3B484079A260BAF94C0540994F1C180E3B484085768EFA014D0540834D91160E3B4840FB506F60044D0540EC057DF50D3B484059518419044D05403574679B0D3B4840532BE252004D054026C732800D3B4840C975C100F94C05405E3FC97D0D3B4840C1C30935F54C0540922032A60D3B48401D15B592F54C0540E2C8D4F10D3B4840	2020-04-16 20:02:34.367984	2020-10-31 18:56:44.511784	1
251	0103000020E6100000010000000900000080C8D1D9A24F054034F661FA153B4840DE13D2A1CB4F0540FF0015D5153B48403BE7D1A9D24F0540DAC5CC4E153B48403BE7D1A9D24F054006F198B9143B4840DFF9D169C74F054016A09D58143B4840D3F3D1E1A94F0540F4CD7476143B48407CE7D1BDA04F05406A7AD1ED143B48407706D2A19E4F05403E4F0583153B484080C8D1D9A24F054034F661FA153B4840	2020-04-16 20:02:34.32213	2020-10-31 18:56:44.522531	1
501	0103000020E6100000010000000C000000AB14E905974D054061E7B98C3A3B484088D0E8AB964D0540EA6A20423A3B4840DDE1E87B994D05406A4DA8B0393B48400407E9F19B4D054061ACC969393B48408AE5E837A14D0540614B4C39393B484060F4E831A74D05401C0F995E393B48408819E9A7A94D0540928B32A9393B484065D5E84DA94D05405746DB453A3B4840061CE97DA64D0540CEC274903A3B48400321E929A04D0540F5617CB93A3B4840B0F5E821994D0540E14237BD3A3B4840AB14E905974D054061E7B98C3A3B4840	2020-10-31 18:56:44.536042	2020-10-31 18:56:44.536042	1
502	0103000020E6100000010000000B0000003CCAE80FAB4D05402274A66B483B484011F3E841B54D0540D0CB809E473B4840641EE949BC4D054058BB6484473B4840BD10E935C14D054034BD57BC473B48409505E9F7C24D05402F13F106483B484017E9E8E9C14D0540AA638A51483B484069FFE865BE4D0540A5B9239C483B48403918E9B7B74D05407686B5BD483B4840B800E955B04D05403C1EE6C8483B4840D756F4E2AA4D054079D853A7483B48403CCAE80FAB4D05402274A66B483B4840	2020-10-31 18:56:44.542227	2020-10-31 18:56:44.542227	1
253	0103000020E6100000010000001000000051CB770CC84E054062BA6D82123B4840D1ADFA4CD44E05407CC52D7F123B4840B102FF81D94E0540FD2EAE5E123B4840C67689E0DC4E0540B0EB6E27123B48403D1CF32EDD4E054018B9AFE9113B48403D1CF32EDD4E05409991B0A8113B48408D98A5BBDA4E05408164F16A113B4840C0F8CDE9D44E0540CEB7F150113B484040164BA9C84E05404EEFB140113B48405A438B7DBB4E0540B5AC3154113B484003491DFAB54E05401A38F177113B48404A1DD086B34E05409881EFF9113B4840E0DEC333B74E054063CA2E31123B4840A4D69B05BD4E054096712E4B123B484098936F75C24E0540221AFE65123B484051CB770CC84E054062BA6D82123B4840	2020-04-16 20:02:34.32556	2020-10-31 18:56:44.554133	1
503	0103000020E610000001000000110000005A01FA71E44C0540AC5FBEB34C3B48404CD5B5A3D94C05401DD3E8CC4C3B48403DC5080BCE4C0540C7318AB64C3B484036D5A2C5C84C05403BEC939A4C3B4840329177DFC54C0540F4D10A6B4C3B484033296866C64C0540C36952304C3B48403851FC16CA4C05407A6BADBD4B3B48403C9527FDCC4C0540B356248E4B3B48404975F387D74C0540516ACF5B4B3B484051FD4954DD4C0540516ACF5B4B3B484059D11864E34C05403CB8FE664B3B48405B257C24ED4C054009F882A44B3B484062C96926F24C0540CCD02C094C3B484060998818F14C0540FE38E5434C3B48405DA1D575EE4C05405F253A764C3B48406289503EEA4C054056BE5F9D4C3B48405A01FA71E44C0540AC5FBEB34C3B4840	2020-10-31 18:56:44.565461	2020-10-31 18:56:44.565461	1
291	0103000020E6100000010000000C0000008AD5E8F16B500540D5F4C8591D3B484031E3E80567500540EA01ED9C1D3B48407DE9E8A152500540C0085CF01E3B4840CD19E95553500540AED7F53A1F3B48404F17E97F5650054043DF197E1F3B48400016E98F645005404A357B941F3B48408AD5E8F16B50054043DF197E1F3B484063DFE83F78500540C1F63A371F3B4840BCD1E82B7D5005407D2D53521D3B484036F3E8E577500540039BD5211D3B4840B6DBE88370500540D406EA121D3B48408AD5E8F16B500540D5F4C8591D3B4840	2020-04-16 20:02:34.396283	2020-10-31 18:56:44.568693	1
288	0103000020E6100000010000000C00000024E9E875AD4E05409BA68F851F3B484073EAE8659F4E054064BC42601F3B484070EFE811994E0540C1F63A371F3B484044E9E87F944E054018D0D1F71E3B4840C01FE9C5994E054015FF136A1E3B4840C31AE919A04E0540DF14C7441E3B484024E9E875AD4E0540BD379E621E3B4840FAF7E86FB34E0540E002A68B1E3B4840A9E1E8F3B64E054061EB84D21E3B4840A9E1E8F3B64E05404EBA1E1D1F3B4840FAF7E86FB34E0540D0A2FD631F3B484024E9E875AD4E05409BA68F851F3B4840	2020-04-16 20:02:34.390591	2020-10-31 18:56:44.576818	1
290	0103000020E6100000010000000A00000080EAE8F18A4F05409EF78DD31A3B48409D1EE96B7A4F0540A949899C1A3B4840CCF0E88D764F0540EC03DB601A3B484025E3E8797B4F05401B9FE7281A3B484002CEE8E3894F05401B9FE7281A3B4840290DE991904F0540A2FA483F1A3B484004E3E86F944F0540CA26B27E1A3B484099E8E88E934F0540179C2CBD1A3B4840C940FAB08F4F0540559625D91A3B484080EAE8F18A4F05409EF78DD31A3B4840	2020-04-16 20:02:34.394361	2020-10-31 18:56:44.595789	1
254	0103000020E61000000100000013000000B833A07B4C4E05401209EF8D153B48404668C29F584E054073F168B5153B4840618BA15F644E0540D9B7F6DE153B484071FBDCA5734E05404E2EC00E163B48401AFD5A5E774E054063BC0F17163B484037101C7B7B4E05404E2EC00E163B48403225B4478E4E0540CB97D870153B4840424F8A05914E05400421C253153B48408E9A68D3904E05409D5A342A153B4840615DD1F8894E05401E1D43F6143B48401AFD5A5E774E05403430B096143B484049EF1287664E0540C9800E6B143B48400F78874B554E0540592B4A71143B4840E0F904124D4E054090F72488143B48405DBEEBEF494E0540D8683BA5143B4840DB82D2CD464E0540A30057F8143B484072198F69464E054093930C26153B4840755A7AC8474E0540F9599A4F153B4840B833A07B4C4E05401209EF8D153B4840	2020-04-16 20:02:34.327228	2020-10-31 18:56:44.613106	1
487	0103000020E6100000010000000900000012847C5C894D054017D4C3720A3B4840C56C9A808A4D0540319095CF0A3B4840D84ACFD38F4D0540EE9BE7F30A3B48402C835C93984D0540DA40CCE70A3B48403F6191E69D4D05407B9B4CAF0A3B484061FC4FA99E4D0540D3AB684A0A3B48400AAF387A9A4D05401EB71F2A0A3B4840FAE58D96904D054032123B360A3B484012847C5C894D054017D4C3720A3B4840	2020-10-27 11:58:43.953691	2020-10-31 18:56:44.616479	1
268	0103000020E61000000100000011000000CF1DE9A3244F05401686AC09063B484006FBE8F9374F0540D7DA1D72063B48405C21E955454F0540B77F56A6063B4840E7E0E8B74C4F0540793887B1063B484067F8E819544F054075CC259B063B48401BF2E87D684F054010B68B50063B4840A2FFE8877C4F0540111A4BF3053B4840CE05E919814F0540EFB6E1B3053B4840CE05E919814F0540CFB73717053B48407513E92D7C4F0540842144DF043B484021E8E825754F0540BDFCB1BD043B4840C7E0E8AD654F0540F6D71F9C043B48406102E971474F0540BDFCB1BD043B4840DDEFE8BB394F054046DA74EA043B4840AA0DE9B92C4F0540C37BB547053B48407FEDE8EF234F0540F42243CA053B4840CF1DE9A3244F05401686AC09063B4840	2020-04-16 20:02:34.353716	2020-10-31 18:56:44.619738	1
275	0103000020E6100000010000000C000000E043B918724D05403E7F5CD90F3B4840C0FD17488B4D0540E3F1E7620F3B48404FB04D9E8D4D05404CF451310F3B4840E6F68F8A8B4D0540C64878F70E3B484071F73459864D0540FB49ADDE0E3B4840F814182F7B4D05407F81A3C80E3B4840F5315636754D05407F81A3C80E3B4840572590586B4D05407712B7F40E3B48408D5A1431674D0540EF9DCA200F3B48404237F33A684D05402BB9BC910F3B4840278418166B4D054092F213C60F3B4840E043B918724D05403E7F5CD90F3B4840	2020-04-16 20:02:34.366012	2020-10-31 18:56:44.624812	1
393	0103000020E6100000010000000D000000D97EFCDAAC4E05406476E1552A3B48402BF72580AF4E0540C895B4202A3B48400752F348B24E0540450CCC1A2A3B4840E4ACC011B54E05404ADDA8232A3B4840494E3C86B94E0540720AF2712A3B48405E1384CDB94E054002BA7C8F2A3B4840DF74D521B84E05400F0199A82A3B48408354AC7CB54E05401782D8B82A3B4840A7F9DEB3B24E054016615EB72A3B48405581B50EB04E054091488DAB2A3B4840373B1BF8AD4E05408664DF962A3B48404E9C58B7AC4E0540F8F6487C2A3B4840D97EFCDAAC4E05406476E1552A3B4840	2020-07-12 22:25:17.542236	2020-11-02 11:28:09.94492	1
252	0103000020E6100000010000000E0000001013D2D9754F0540056276EB153B48406FFBD16D874F0540CA0BC8AF153B484026143DFA8D4F054089939558153B4840251052408F4F05408F3C7E30153B48400A4A3DCD8D4F0540DFEA43FC143B4840E6C21168894F05405C4352C4143B48406DE6D1E17C4F0540C5398967143B4840BCE7D1D16E4F0540E1AA5033143B4840B210D20D604F0540103F3C42143B48400AD4D135564F05402F2423B2143B4840B1E1D149514F054003F95647153B484009EED16D5A4F0540A1D83DB7153B4840B9ECD17D684F0540056276EB153B48401013D2D9754F0540056276EB153B4840	2020-04-16 20:02:34.323883	2020-11-03 10:14:23.039518	1
272	0103000020E6100000010000000900000030949FACA44F05403777EB290F3B484040C859A89A4F05407EBF01950F3B48400BBFE60A8C4F0540EDB4AF730F3B48403584861A8B4F05407F6BF5DC0E3B4840E8492EE1984F05401BB99F1D0E3B4840358AF4ED9D4F05406AC85A0B0E3B4840E1518DDFAA4F0540D2FCD1500E3B4840CB28B3D5AE4F054052B464B40E3B484030949FACA44F05403777EB290F3B4840	2020-04-16 20:02:34.360475	2020-11-03 10:43:51.404839	1
513	0103000020E6100000010000000C0000004F737CAECF4F05406836AC9C013B4840A15F3562CD4F0540A1728B05013B4840FF4F84DFCD4F05405DB08BDE003B4840F1356BB1CF4F0540D0FAB9BC003B484045DE3E54D34F0540BEACBCC3003B4840739A8862D64F0540482BCFD4003B48403091DAC7D94F0540B5EA7C18013B4840B325E232DC4F05407C2A4891013B484091C9BDB4DA4F0540BAD404DE013B4840C5F0DB5BD74F05406C43DCEA013B484003FDC1BBD04F05408B7C74C7013B48404F737CAECF4F05406836AC9C013B4840	2020-11-03 11:49:07.866062	2020-11-03 11:49:07.866062	1
514	0103000020E6100000010000000D000000C76EF4BBC04F05404AB73487013B4840DE57F4CCBE4F054039008067013B484095A1F445BE4F054087EF3242013B4840C28DF49FBE4F0540D258B3CC003B48406C96F407C04F054056BB43A9003B48401B80F48BC34F05405E8F359C003B4840E06CF458C94F05407B863DC5003B4840B761F41ACB4F054041B6CFE6003B4840A078F409CD4F0540DA4A4733013B48408E56F4DCCC4F05400C619458013B48407853F493CA4F0540679F6B76013B4840CA69F40FC74F054014445785013B4840C76EF4BBC04F05404AB73487013B4840	2020-11-03 11:49:07.979507	2020-11-03 11:49:07.979507	1
208	0103000020E6100000010000000D0000005BE4E851964D0540A7C38C8F293B4840D505E90B914D0540FC0180C7293B48402507E9FB824D0540BD262E032A3B4840D1DBE8F37B4D054001CF5E0E2A3B484023F2E86F784D054068E83ACB293B4840A9D0E8B57D4D05405E4E7D3D293B484052F3E855834D05408A0A8A05293B484082DAE8038A4D0540E64F82DC283B484005EDE8B9974D0540EACD04AC283B484036D4E8679E4D0540EACD04AC283B48408AE5E837A14D05405A819EF6283B48408604E91B9F4D05403710F344293B48405BE4E851964D0540A7C38C8F293B4840	2020-04-16 20:02:34.243889	2020-10-31 17:45:16.283212	1
285	0103000020E6100000010000000D0000008F0CE9511D4E0540503E287A273B484015EBE897224E054039A160AE273B4840F4EAE88D3B4E054019089443283B484020F1E81F404E05406D51877B283B48401C10E9033E4E05405EFF20C6283B4840F6D0E855374E0540D2303DE0283B48406B11E9F32F4E0540A2A751D1283B4840BCF8E8AB1D4E0540F91F6B61283B4840BAE3E81F134E0540BD733FF5273B484065D2E84F104E054039A160AE273B4840B502E903114E0540C8EDC663273B4840E6E9E8B1174E054054BCAA49273B48408F0CE9511D4E0540503E287A273B4840	2020-04-16 20:02:34.384883	2020-10-31 17:45:16.349584	1
450	0103000020E6100000010000000C000000FAC7D1A2F11905406FA0901830394840B807D2C3FD1905407DE4114930394840CD24D244041A05408B72D514303948401187F4D6081A0540D73307A32F394840667EF46E071A0540C14D455A2F3948403C5EF4A4FE19054033722F082F394840D5B7D1B8F9190540D1A612EE2E394840CA6DF41BF1190540DD69CCF12E3948409E67F489EC190540C839C80D2F394840CB53F4E3EC190540AC1D41762F394840829DF45CEC190540A631BEC22F394840FAC7D1A2F11905406FA0901830394840	2020-10-25 21:58:15.240439	2020-10-30 22:05:34.019925	4
468	0103000020E6100000010000000F000000D7BAD183001B05402908AEE93D394840AD56F4A40C1B0540E3ADAA663E3948400463F4C8151B0540629027B33E3948401685F4F5151B0540264D86E53E39484098F5D1F8121B0540E97C83013F3948401556F431071B0540534D4C123F394840245DFA72021B054091F049203F394840905DF4B3FD1A054031605B1F3F394840B587F4D5F91A0540C4A05F033F3948403BD9D1F4F81A0540D03E56DA3E3948404F54F4D8F61A054047D6656A3E394840F09AF408F41A0540780632FE3D394840BAB1D1C1F51A05407D3DC5D73D3948407679F44EF91A0540E6DDB0CD3D394840D7BAD183001B05402908AEE93D394840	2020-10-25 21:58:15.281227	2020-10-30 22:05:34.023046	4
415	0103000020E610000001000000120000003286B7109A1A05405D05BB12533948401078F4139E1A05400D36A9D552394840D47EF418A81A054002B568BD523948406CE1A18EAB1A0540A7E0C7AB523948405D58F4B2B31A0540992619985239484063D9F8DCB71A0540AD696EF152394840EF91F441BB1A0540ECC88838533948401F79F4EFC11A05408D066256533948406268F492C41A0540B4A4CF9553394840FB4EF4CDC51A054088B66EE0533948400E57F4C2C11A0540E7036618543948404589F4D9B91A05400321933F543948403F79F4F9A81A0540AA79185454394840BF61F497A11A054046515D5054394840E090F465971A054024198432543948403EC6F460921A05402BDC1DFC53394840B48AF4D3921A05407CF5459D533948403286B7109A1A05405D05BB1253394840	2020-10-25 21:58:15.164992	2020-10-30 22:05:34.026026	4
471	0103000020E61000000100000017000000B1F3D1951B1B05407B9EAFD72E3948400678F454201B05404F8EB69F2E394840E167F46A281B05402B1A318B2E39484091F3D18B341B0540E5B2ED8E2E3948403E84F46E421B05404F8EB69F2E394840AD79F4A3491B0540419287F52E3948409E52F4CA4F1B05401756A8702F3948400271F43B481B0540ACAFD5972F394840495BF432511B05409E8F7DAA2F3948406C9FF48C511B0540C29597E02F3948402050F4F4521B0540FCEFDE3D3039484088DCD1924B1B0540BE4E059D303948408F9AF4EA3E1B054094865EEB30394840D9657A80381B0540DA0394DA30394840DED9510D331B0540110648A730394840434B7AD52E1B05407C35C76830394840213CFA21261B054091AF0DE82F394840972D7AE1221B05404C868EA92F394840C763FA6D251B0540A90C09952F394840D8A5F432241B0540093650832F394840189AF481201B0540ED630B872F3948409C63F43B1B1B0540FA5F3A312F394840B1F3D1951B1B05407B9EAFD72E394840	2020-10-25 21:58:15.289777	2020-10-30 22:05:34.030075	4
482	0103000020E6100000010000000C0000008724E9A7091B0540C0E118034D3948405DEAE8A5FC1A0540490B0C794C394840B3E1E83DFB1A0540E741801F4C394840273CE913F81A05404A58D6AB4B394840850FE91BFF1A054089CC23704B3948408DD1E853031B054088BABEF84A3948404A4D7A420D1B054061BF2BC94A3948408D1AE94F161B0540C06948F14A394840EEE8E8AB231B05401097E73B4B39484045F5E8CF2C1B0540BBC84E144C394840BD01E9FD1C1B0540CE76A09A4C3948408724E9A7091B0540C0E118034D394840	2020-10-25 21:58:15.310511	2020-10-30 22:05:34.032944	4
446	0103000020E6100000010000000F000000DA0FD211531C0540B12971E2383948406CFCE8BF591C054058D633AE383948409321E9355C1C054062F362583839484044CFD169731C0540B21C25C337394840EA69F4A4741C0540CB78A292373948401375F4E2721C05408824AF3E37394840267DF4D76E1C0540F66999EC36394840AA26FAF96A1C0540F59058D4363948404801E9616C1C05405EBFC4B236394840ECC2D1456A1C0540F84C2668363948409507E9FD571C05406B58887E36394840620BE9C3461C05402B378D403739484059F8D1AF4B1C054033A9B9E43739484093F2E8714D1C054085E1F9DA38394840DA0FD211531C0540B12971E238394840	2020-10-25 21:58:15.232236	2020-10-30 22:05:34.035761	4
423	0103000020E6100000010000001B000000A2F5D1B7901A0540C852A755433948407ECBD195941A05402FF7F67A43394840E952F49D9B1A0540D36B4984433948400F92F44BA21A0540087CBBA743394840C6CAD118A81A05400A3D6BFF43394840662BD280A91A054092D38DDB4439484000F8D183A61A0540FA495A4D4539484084C1D13DA11A0540FEBAEE6E45394840C027FAC79E1A0540B3590D7B45394840664FFA139E1A0540B7CAA19C453948408A99F4CD981A0540E7E69FAA453948407AD0D1418E1A054091D86F9F453948405DF1D188831A054055B85185453948404566F4DA7C1A0540629E8E3C4539484057FBD1E0761A0540D40E58EC443948400D347A46731A05403624B7A1443948400042FA13711A054008047D5F443948403C17D27B721A0540B5E610204439484077487A5F781A0540444A2DCB433948401D21FACC7B1A0540FF6F4BE543394840922C7AC47C1A0540ADB808DB43394840D48AF4DD791A054002610FB1433948407F93F4457B1A0540E312369343394840430DD2237F1A0540F7476D8243394840429AF44A851A05403DAFB07E43394840AE94F42B861A0540404EC85343394840A2F5D1B7901A0540C852A75543394840	2020-10-25 21:58:15.183027	2020-10-30 22:05:34.039344	4
434	0103000020E6100000010000000F0000008FE9A3C79E1A05401A6AFB952F394840C214A4C5BE1A054084AD62902F394840999AF4A9BC1A0540CF4974042F394840999AF4A9BC1A054016EA2CA72E39484059E6A374B51A0540DF740F2C2E3948406B7FF48BAD1A0540A4E05B512E3948400251F43AA41A0540CFD2F83A2E39484013B3A381991A05408AFE40372E394840F759FADE961A05406448E5492E3948407977F4A0981A0540812294A12E394840E0217AEF9C1A0540AC15D71A2F394840CCB8BEE99E1A0540EBED32272F3948404AA5F47E9C1A0540C1BBB0382F394840A09CF4169B1A054002940F6B2F3948408FE9A3C79E1A05401A6AFB952F394840	2020-10-25 21:58:15.208059	2020-10-30 22:05:34.043253	4
467	0103000020E610000001000000110000009426D29D141A054010AE9A632F3948404383F4101A1A0540B4BF818E2F3948401992F40A201A054011D8909B2F3948405B9BF4E5261A05400A5A79C62F394840787AF49E311A0540E67788D32F394840ECC3D1C8341A0540A07EB0B52F3948403D67F46B371A0540B39B584B2F394840ACCFD179381A0540656EABF32E394840787AF49E311A0540B91060352E3948400E66F4852C1A054040F7E2E82D3948404598F49C241A054056B97BEE2D394840DBF6D15C191A05406C9970422E394840177DF47E151A0540D67439532E394840C36BF4AE121A0540322ADD812E394840017AF435131A0540FAA97CCC2E39484025A4F4570F1A0540EC1BB9002F3948409426D29D141A054010AE9A632F394840	2020-10-25 21:58:15.278858	2020-10-30 22:05:34.046236	4
466	0103000020E61000000100000012000000B8F1A307041B0540B0908EB23B394840B015E9AD031B05402390F9F13B3948406AD6E8F5151B0540CAE924963C3948405635D2191F1B05405CE1EBC23C394840B308D221261B0540E90644B03C394840C4F7E8A5291B054073ECC17F3C394840323AD2BB311B054010884C783C394840CECEE869381B0540446567313C39484017D2D1D1391B0540922BBEBD3B3948406702D2853A1B05400A206C373B3948406DC9D169381B05403FC1CCEC3A394840E8D0D1EB2E1B05408EB8DD7C3A394840C4F7E8A5291B054019935B4C3A39484070CCE89D221B0540D13CE5443A39484069F0E82D1A1B0540C71FB69A3A3948400B1DE925131B0540C07E1B123B3948405E19E9690B1B0540605989513B394840B8F1A307041B0540B0908EB23B394840	2020-10-25 21:58:15.277062	2020-10-30 22:05:34.049236	4
461	0103000020E610000001000000070000009FD500E8E21D0540058166192D394840B6057D2BF41D0540310F90D12D394840CAF500B2EB1D05404A6E25762E3948400158F42EDA1D0540EB12A9152E3948400E99F43FD81D0540E41D16772D3948400291C881DD1D05403002344C2D3948409FD500E8E21D0540058166192D394840	2020-10-25 21:58:15.267219	2020-10-30 22:05:34.05214	4
419	0103000020E6100000010000000A000000BAD4D14BF91D05409056C804493948401CDAE84BF91D0540CDC4059A493948408426D2B9F41D0540F9F97C5D4B39484041E2D1550D1E0540E952904E4B394840D3CEE803141E0540F95A9C1C4A394840CE07E91F161E054004572A1B493948401DB8D133111E0540A546E4BD48394840F01CE9B5071E054030B3F6AE483948409810E991FE1D0540C054E3BD48394840BAD4D14BF91D05409056C80449394840	2020-10-25 21:58:15.172426	2020-10-30 22:05:34.054954	4
418	0103000020E6100000010000002000000039C4D168EE1A05404E7133FE3D394840C06AF45EDA1A0540BF5CA8053E394840E12A7AB6D51A0540B5A92F0C3E3948407F41FAEBD41A0540B825C42D3E394840CC277A6DD31A0540EAB9A12F3E394840F4327AABD11A054093BC3E193E394840CD5CFA13CB1A0540612861173E3948407550FAEFC11A0540E57381233E39484082D55193BC1A0540122E92303E394840E316FA60BA1A0540E8EF15453E39484053417A3CB91A0540572BA6823E3948406033FA6EBB1A0540FF79D1263F394840182E7A09BF1A0540936CDE413F39484096307ADFBB1A0540275FEB5C3F394840B063FA22BC1A0540E0BA7D8C3F39484070CD519EC01A0540F5D0E6F53F3948400E37FA2AC31A0540DCB5EB3A403948402C4B7A8AC51A0540CA6FE756403948402254FAABC91A0540FC03C558403948406A24FA6ACE1A0540C529C74A40394840B05D7A40D31A05408AFEA830403948401C587A21D41A05408782140F40394840E12A7AB6D51A05407D21480C403948408322FA07D71A0540DF7F772540394840E73A7A96E61A05405DD36EEE3F394840A7467A47EA1A0540553C2ED63F3948403AF3D12CFD1A05407E85AAC13F3948404C88F448FF1A0540207E68A93F3948407679F44EF91A05403E8BB30C3F3948403951F48FF41A0540E3ADAA663E3948408A67F40BF11A05405EB081233E39484039C4D168EE1A05404E7133FE3D394840	2020-10-25 21:58:15.170572	2020-10-30 22:05:34.058113	4
451	0103000020E6100000010000000E000000430CD2A0B41C05403B32CC6E2F394840B9DDD145C41C05402D1274812F3948402084F431C91C0540DE1F8A562F3948402084F431C91C0540FA5F3A312F394840DD257A18CC1C0540B708383F2F394840AF537AF6CF1C054081233A312F394840D268F409D31C0540ACF917332F3948400F91F4C8D71C05402C6283112F394840BCD8D199CA1C054065659B082E3948408D64F4DAC51C0540B92B798D2D3948405E63F4F4BA1C05409D5934912D394840706BF4E9B61C05407A9B6CE12D39484047EDD1BCB61C0540EC3005642E394840430CD2A0B41C05403B32CC6E2F394840	2020-10-25 21:58:15.242866	2020-10-30 22:05:34.061018	4
259	0103000020E61000000100000010000000D26469373A4E0540577F37C4223B48400396A8C8614E0540577F37C4223B4840694EE4D0634E05405E51FFB4223B4840A1378321654E054035AE8883223B4840029AB75E654E054011B7881B223B48409E537EEF634E054092749BEC213B4840656ADF9E624E0540B2D70BD7213B484034453B1C604E054039A4D3C7213B484068D0B475584E0540C1709BB8213B4840D17096F9444E0540C1709BB8213B48409AF1DB153D4E0540B2D70BD7213B4840FF3306EF3A4E054081AABAE3213B4840997BCAE6384E0540B8E6C0F6213B4840D2605AA1364E05409EDAF25A223B484069C828FD364E0540438F0594223B4840D26469373A4E0540577F37C4223B4840	2020-04-16 20:02:34.33576	2020-10-31 18:56:44.393062	1
277	0103000020E6100000010000000D00000024D8E837744D054088827640103B4840D4D6E847824D054088827640103B484036D4E8679E4D054085915587103B48400CE3E861A44D0540A5725DB0103B484089FFE86FA54D05408D6DF7FA103B4840B7D1E891A14D05401F961B3E113B48405AFEE8899A4D054091DD3758113B48407CE4E85B7D4D054068AAAD5F113B48401E11E953764D054062494C49113B4840A2DAE80D714D054093CE5811113B4840CBE5E84B6F4D05402BD9BEC6103B4840710DE9976E4D054043DE247C103B484024D8E837744D054088827640103B4840	2020-04-16 20:02:34.370104	2020-10-31 18:56:44.419244	1
258	0103000020E6100000010000000B00000088F5BE55314E054037D02501243B4840BAA01EAC604E0540992AC8E7233B484021CF6BE3664E0540E97D9C96233B48401EE7571B624E054067155E40233B4840870569FA594E0540B1966AFE223B48404DA2A9E4504E054019C3D4D5223B4840B4D088CF3C4E05404607C2D0223B48408415C9B9334E0540DEDA57F9223B4840822DB5F12E4E054006BBBB59233B4840517A13082D4E0540D31245C4233B484088F5BE55314E054037D02501243B4840	2020-04-16 20:02:34.333901	2020-10-31 18:56:44.434823	1
516	0103000020E6100000010000000C0000003CF72BF98E4E0540EA9D5F34FF3A484008D41D98814E05408FFBDB48FE3A48409D1F10C57F4E0540E7A18F0BFE3A4840B40AB254844E0540AFDA3094FD3A484093645472944E05406C174F40FD3A48407C588B13AD4E0540DAA93C06FD3A4840B77FDC3EB24E054012726733FD3A4840ED596328B34E0540669E2777FD3A48406ABAB3C5AC4E0540CC3C2E3FFE3A48409B47706DA94E0540C7C30676FE3A4840DBDCB2A9954E05403ECBEB2DFF3A48403CF72BF98E4E0540EA9D5F34FF3A4840	2020-11-03 11:49:08.036088	2020-11-03 11:49:08.036088	1
462	0103000020E61000000100000008000000E71ED260A91C0540B135DD933D39484034E5D1C7BA1C0540EE096DF33C3948401706D20EB01C05400C8523353C394840147EF4A9AB1C0540D46DFB523C394840FA99F444A71C0540016EC17F3C3948406299F4D1A11C0540ED32BD9B3C394840069BD1E59C1C054007601DCE3C394840E71ED260A91C0540B135DD933D394840	2020-10-25 21:58:15.269103	2020-10-30 22:05:34.063677	4
404	0103000020E6100000010000001900000061AFD1A5481A0540D06761E13F394840738DF4BD5D1A0540F2A025303F3948408F57F4EA5D1A054019222EF83E394840EBB7D103631A0540E0E542E93E3948402658F45D631A0540A76A09993E394840B29BF4445E1A05403114CD643E394840F5FDD1C05A1A05406433CC033E394840EE94F43F541A0540BB597FC23D3948405C5BF4B04C1A05400D5FB9953D3948407CA4F4B6461A05409374658C3D3948405665F408401A0540259DE6BC3D394840FD72F41C3B1A0540E6DDB0CD3D394840D252F452321A05400A2FB32E3E394840B48DF4D12B1A0540EEC07FA03E394840082CD2B22C1A05400FFE8BC93E394840F77CF4742E1A0540B27DDED23E3948406B687AD4301A0540AA94F1C33E394840A165FA44311A0540C49CAAD53E3948404013FA63301A0540315CA6F13E3948406B687AD4301A05403E3907163F394840ED16FA1F381A0540ACAA0B693F394840E31F7A413C1A0540A4C5D3873F39484049537A3E3F1A05400E093B823F3948400234FAA03E1A0540DEF0F1A13F39484061AFD1A5481A0540D06761E13F394840	2020-10-25 21:58:15.142924	2020-10-30 22:05:34.067244	4
449	0103000020E6100000010000000A0000001CAAD1F3701C0540BB8817772D394840A373F4E8991C054040654EC72D39484094D9D1209E1C05409E7790DF2D394840647FF4999D1C0540D65010102E3948406084F445971C054079EEBE672E394840F5FCD13D901C054049DBA8922E3948403369F427881C0540DD69CCF12E3948407F2BD298801C0540428CBA002F394840CF12D2506E1C05405E55EF112E3948401CAAD1F3701C0540BB8817772D394840	2020-10-25 21:58:15.238371	2020-10-30 22:05:34.070756	4
407	0103000020E6100000010000001C000000D9D2D10DA41A05405D3538A549394840016BF472A81A0540A39C7BA1493948408268F49CAB1A0540FD38F68C49394840AA8DF412AE1A0540C733846949394840C471F477B21A0540F9C7616B49394840895EF444B81A0540FB717940493948403367F4ACB91A054099F3D51149394840F077F409B71A054064987BC3483948406E7AF4DFB31A054070CED3B048394840C952F493B41A05408E4A308248394840CF9DF4FCA51A05401DE0D55547394840FA01D2DB991A05405A1DAA2E473948404890F4F2911A054011AA7D6847394840C878F4908A1A0540012BF6D047394840F564F4EA8A1A05404A48E92448394840B35BF40F841A0540A5E4631048394840FA9AF4C7711A0540C0DE0D84483948409CB6D113711A0540AB6190B448394840A4A3F42F731A0540CB87B31349394840416BF486761A0540F9C7616B493948402F63F4917A1A0540F9C7616B493948401960F448781A0540C5896C94493948403CA4F4A2781A05405FB799BB49394840C5F0D1157E1A0540A69D13244A3948401B75F4D4821A0540549EA6454A394840B275F447881A0540EA5A3F4B4A394840D054F400931A0540C6A6D10B4A394840D9D2D10DA41A05405D3538A549394840	2020-10-25 21:58:15.149312	2020-10-30 22:05:34.074247	4
443	0103000020E6100000010000000D00000010D0D1645B1B0540E921F75844394840F492F45E611B054035A4E64B44394840359CF439681B054040FDC1EC43394840AA58F4526D1B0540AA4029E743394840BF75F4D3731B054027CA94C543394840FC9DF492781B054078AC4BE5433948408404D23D821B0540D6DBF274443948409E02D2DA8A1B0540830300DD45394840ECD4D1066E1B05405169049F463948400881F41B591B0540E1CBF3B345394840C196F424501B0540FE75D3384539484082A2F4D5531B05409FB9CA924439484010D0D1645B1B0540E921F75844394840	2020-10-25 21:58:15.226119	2020-10-30 22:05:34.077662	4
413	0103000020E6100000010000000B0000008E9AD17C7E1C0540F70BED5C3F394840448BF454881C0540FFCB7D1D3F394840357EF4B3921C0540B5F972F43E394840499BF434991C054019222EF83E394840AADCD169A01C0540B46C11DE3E3948405BDBD179AE1C0540A04F180140394840286CF466A31C054068156D6B403948403706D218971C05407C2721A7403948402061F4328C1C05404030533540394840725DF476841C054045E7EDBD3F3948408E9AD17C7E1C0540F70BED5C3F394840	2020-10-25 21:58:15.160801	2020-10-30 22:05:34.080624	4
400	0103000020E6100000010000001300000005DF5182911A0540D03287FE4E394840B6DFE88F9A1A0540412C849D4E394840F98EF402A01A054014487D584E3948405447FA1EA21A0540F587832E4E39484033FA51A0A01A0540EC1CAE024E39484061CEE8BF971A05400FA588A34D394840D70EE95D901A0540D5EE99334D394840ED15D28B801A05407E2AACC34C39484065407A6A7C1A05407DE9CCC14C3948403029FAC1771A05406D6D54C84C394840B35B7A92721A05407C5F29024D394840B011FA5F701A054080F031394D394840675BFAD86F1A05406369D5674D3948408EDE5119731A05402C46139C4D394840A82F7A0D7F1A0540386D65144E39484024667A53841A05408FD5246B4E394840C0477AE28B1A0540DB2700EA4E39484003377A858E1A054065AE40024F39484005DF5182911A0540D03287FE4E394840	2020-10-25 21:58:15.129397	2020-10-30 22:05:34.083519	4
480	0103000020E61000000100000006000000E5F7D1139B1D0540FB15B95D4639484075ADD11DAF1D054097EDFD59463948405203E99BB81D05403E54BABE463948407FEFE8F5B81D05408DB4BE8047394840E5F7D1139B1D054025071ACF47394840E5F7D1139B1D0540FB15B95D46394840	2020-10-25 21:58:15.306826	2020-10-30 22:05:34.086141	4
438	0103000020E6100000010000001300000008DFD135B61C05406CCFA2F22C394840C662F481B51C0540F30E45212D3948406F85F421BB1C05407A481A5B2D394840CD58F429C21C054024D24B662D394840216AF4F9C41C054016205F572D3948403982F4CED11C054090F6A2752C394840A8EAD1DCD21C054060903A1A2C39484035A1F4B2CF1C054060D549AA2B3948400D7CF43CCD1C0540593309922B394840A09BF493D01C054044D4DB6A2B394840CD87F4EDD01C0540CC1DCAFC2A394840E08FF4E2CC1C05409BEC57D92A3948404DE3D164C31C05402B01E3D12A3948406E9FF459BF1C05403F37B4AA2A3948404607D2F4BA1C0540E40DD8A82A394840EA8CF4A3B11C05408559E8162B394840BAA5F4F5AA1C054067E5F5A02B394840BF86F411AD1C05400A8EA4F82B39484008DFD135B61C05406CCFA2F22C394840	2020-10-25 21:58:15.216263	2020-10-30 22:05:34.089108	4
402	0103000020E6100000010000000B000000C10BD278181D054089B3681A3939484036C8D1911D1D0540C0CFB761383948402F5FF410171D0540416173E8373948409678F4D5151D0540C6EF8ABD37394840C10BD278181D0540B7A53C983739484094CAD15D331D0540F664728737394840EBF0D1B9401D0540FBF92FEC3739484016F7D14B451D0540D109DF213939484047E6E8D92F1D05406E9972433939484016D0E8671A1D05407D4B5F5239394840C10BD278181D054089B3681A39394840	2020-10-25 21:58:15.13891	2020-10-30 22:05:34.091887	4
432	0103000020E6100000010000000A00000071E1D1C0491C05403E8A732C363948400C50F476571C05407FCA64A235394840611DD21B671C054085BB1A61353948408B81F410631C05406241BCB134394840E25EF4705D1C05400FA9472D34394840CBE8D138591C0540015FF90734394840D86DF4744A1C0540D2023B8134394840ADDAD1BB3F1C05405FC0002B3539484025A3F4D4441C05403874EE9A3539484071E1D1C0491C05403E8A732C36394840	2020-10-25 21:58:15.204348	2020-10-30 22:05:34.09463	4
465	0103000020E61000000100000014000000110BD2ED3B1B0540C3C9F52F3B3948403F6AF4363E1B054038B8937A3B394840951DD2A3491B054014AD52DF3B3948409B13D24B561B0540050666D03B3948407DDFD1D1661B0540AFFD02BA3B394840B112E9AF6A1B0540B9DD80893B394840DA1DE9ED681B05406CFD4C1D3B3948402D00E9F95C1B05400865DA1B3A3948405D78F4B3571B0540A31132093A3948404C56F486571B054053247BE9393948401BFCD1E94E1B0540CF83F08F393948402FEAD1A6461B0540F3F775A4393948403E84F46E421B05405EC83EB539394840508CF4633E1B0540BA59B9A039394840FD60F45B371B0540D8B292BE393948400AA2F46C351B0540B74C36ED393948400F83F488371B05403A555F303A3948401364F4A4391B0540519E8C573A3948406394F4583A1B05409F7EC0C33A394840110BD2ED3B1B0540C3C9F52F3B394840	2020-10-25 21:58:15.275007	2020-10-30 22:05:34.098121	4
476	0103000020E6100000010000000C000000112DD269AE1D054035B4B4992F394840055FF447B21D054011D8909B2F394840F170F48ABA1D0540BA3D99632F39484057A4F487BD1D0540C9EF85722F394840358FF4F1CB1D0540091227402F3948408C9BF415D51D0540D6EBB41C2F39484035FEE8E5D71D0540B31088F52E394840E09BD139DE1D0540FB98AFD72E394840AF1FE99FD21D0540A4E71F1D2E394840D5C4D175CF1D05405050B07C2D3948401AA6D1A59F1D054009034A602E394840112DD269AE1D054035B4B4992F394840	2020-10-25 21:58:15.299365	2020-10-30 22:05:34.101204	4
410	0103000020E6100000010000000A000000A0BCD1A97E1C054050FD5DF62C394840452DD2F1901C05407403782C2D3948405CA3F429951C054097C70CD12C39484064F2D172971C0540E666A4752C394840235CF486921C054082158D232C39484043A5F48C8C1C054018AEFCE52B39484095A1F4D0841C054018AEFCE52B394840FEA0F45D7F1C0540E6ABB3052C394840F1D2D1257B1C05400339E9712C394840A0BCD1A97E1C054050FD5DF62C394840	2020-10-25 21:58:15.155267	2020-10-30 22:05:34.104307	4
479	0103000020E6100000010000001100000028E3D1C0001A05408F4A81C9473948400CA6F4BA061A05401443770148394840EC5CF4B40C1A054088121F1448394840DCDCD124151A05401017FE1548394840736AF4BE201A0540786B3205483948409B8FF434231A05404266C0E1473948403376F46F241A05403FCDC64847394840C327D2831F1A05405684B095463948406893F4FA111A054087295B8C463948405857F4950D1A054091B59BA4463948404254F44C0B1A05402301A08846394840A291F4A1011A0540B9BD388E463948400A91F42EFC1905406EC8AAB146394840CD68F46FF7190540E608E7E5463948403963F450F81905403B5C3227473948402021D288FC190540E104D3714739484028E3D1C0001A05408F4A81C947394840	2020-10-25 21:58:15.305064	2020-10-30 22:05:34.107556	4
416	0103000020E61000000100000010000000F1C6D160A91C05406AD546FA39394840698FF479AE1C0540CF1B52A639394840C496F4F1BD1C05400BCD5E52393948405B97F464C31C0540C5FCD6DC38394840A3DAD1FCC11C054089B2C28A38394840198EF489BC1C054045F6304D383948401225D2F2AD1C0540008347C1373948403E6FF4AFA51C05409F001717383948404D96F4889F1C054088B7E9EF37394840FADDD159921C05404AF38C9B383948401B80F4168A1C0540E355B0FA383948404C67F4C4901C05405EC83EB5393948403398F4EB961C0540717D54073A394840B976F4319C1C05405017F8353A394840FB7FF40CA31C0540A498C62A3A394840F1C6D160A91C05406AD546FA39394840	2020-10-25 21:58:15.166933	2020-10-30 22:05:34.111179	4
424	0103000020E610000001000000110000003DEED180031B0540800797FD3A3948401175F415051B0540D79C5B2A3B394840FE6CF420091B0540F36EA0263B3948408660F4F2181B0540788EA68D3A3948400678F454201B054008C1812E3A394840AF27D205241B0540E6CC1DB7393948404DD5D124231B0540DCAE487D39394840895BF4461F1B0540BC663C5439394840F25AF4D3191B0540D0A1403839394840C5E1D152131B0540A70C4238393948409753F45B0A1B0540BBDFA73239394840E7F6D1E8041B05402FA9825039394840359FF437011B05405EC83EB5393948400C94F4F9021B0540ABA872213A394840FF52F4E8041B054083326A593A394840666CF4AD031B0540073B939C3A3948403DEED180031B0540800797FD3A394840	2020-10-25 21:58:15.184964	2020-10-30 22:05:34.114118	4
431	0103000020E6100000010000000C000000C517D20A581E0540209E4AF53C394840EB9AF4E3511E05400A0502983C394840B253F4404F1E0540FD6A983C3C39484076CDD11E531E0540649A09FF3B3948409E65F483571E05400693C7E63B394840A160F4D75D1E05400693C7E63B394840BFB2D169621E054010193B0A3C3948404F64F493651E0540ED32BD9B3C3948404A83F477631E05402BDA6FD73C3948404B69F43F5F1E05400A7413063D39484012AFD1AD5A1E054028358B0D3D394840C517D20A581E0540209E4AF53C394840	2020-10-25 21:58:15.20248	2020-10-30 22:05:34.117087	4
441	0103000020E6100000010000000B000000D510D26F7B1D054067D4C3DF3139484013CAD135971D0540B6449C583339484018DAD115A81D0540CD39D16932394840D005E971B51D0540BB864CD831394840AEF0E8DBC31D0540D589AA2C31394840FF06E957C01D0540546B81E930394840EC8FF46EB81D05406160ECC7303948401BD5D169AE1D05401CF9A8CB30394840B625D2F19E1D054080458D1231394840D53FD2338A1D05402A3D2AFC30394840D510D26F7B1D054067D4C3DF31394840	2020-10-25 21:58:15.221968	2020-10-30 22:05:34.119888	4
463	0103000020E610000001000000160000007CD9D108C71A054012E4B9AC4039484072A4F4F7C81A054080539A92403948405E87F476C21A0540EE2A1962403948406053F406BA1A05408886C93C40394840C0217AE5B51A0540EC5CD84940394840F15DF4D1B21A05409AA94A6D40394840ED5CFA1DB21A05403B75037F40394840BD267A91AF1A0540D74C487B403948409CD9D112AE1A0540DCBBC4D540394840C637FAA7AF1A0540F4AD12FB40394840B8457A75AD1A05402478641241394840052CFAF6AB1A054056E9BE6041394840FD1A7AE0AB1A0540DA115CB94139484055BA5175AD1A05407FEC34E5413948407421FA2BB31A0540A75AFB0342394840B0147A44C01A0540EEDBE52042394840281BFA8FC71A0540C924694342394840E126D23DCE1A0540FA5A0E7242394840F882F43DCE1A05401E1B67E241394840218EF47BCC1A0540EF48246941394840CC7CF4ABC91A0540FC737C56413948407CD9D108C71A054012E4B9AC40394840	2020-10-25 21:58:15.27099	2020-10-30 22:05:34.122867	4
405	0103000020E6100000010000000D000000F3FED1EBF01C0540DB59295732394840D7DFD1FD0B1D054017CD99F732394840DEBBD16D141D0540554E33DB33394840A80DD2DB0F1D0540E82C7270343948404DD7D19FF11C0540E58CB40B34394840ABE1E84BEB1C0540AA00BCD33339484027E9E8CDE11C05407F7C8AC8333948404459F492E01C0540DA508383333948403307FD81E21C05405C66292E333948400435FD5FE61C0540F70F5E243339484055FA2841E31C0540D7491E0C33394840D4ECE889E91C0540BD310A3D32394840F3FED1EBF01C0540DB59295732394840	2020-10-25 21:58:15.144825	2020-10-30 22:05:34.12633	4
485	0103000020E6100000010000000E000000EE20D2CD871C0540FD22F10632394840626AF40D931C0540FB0F95B8313948402103D2CF941C0540962B4F5B3139484046A0F4E0921C0540D45EBD1D31394840E367F437961C0540C61A3CED303948404E7CF4509B1C054004921F56303948407614D29F971C05409314162D3039484009EBD1FA871C054076B03C0F303948405C5AF42D821C05403626FD57303948405498F4F57D1C0540A2A6B6D83039484066A0F4EA791C0540F840AE10313948403E95F4AC7B1C05400E277059313948403E95F4AC7B1C0540095416E931394840EE20D2CD871C0540FD22F10632394840	2020-10-25 21:58:15.316542	2020-10-30 22:05:34.130017	4
472	0103000020E61000000100000012000000ACE3D1B50A1B0540B611B10640394840628BF491011B054053765719403948402168F47EF61A054014949E764039484019A6F446F21A05403B79B8AC4039484010B9D12AF01A0540821F4AEA40394840115B7A60EF1A0540BA34FD174139484026BCD173F21A05405F0FD643413948405C267A73FA1A0540CFD3126A413948407DE2D1CFFF1A05407F0FB89841394840D246FAF6051B0540A501EA95413948407F64FAEA111B0540FC21D05F41394840C7F6D1DE1D1B0540B62FBC0D41394840DBA0F4862A1B05405BC791CA403948402457F40D2B1B05407A38EE9B40394840C59DF43D281B0540BF12D081403948404967F4F7221B054046287C78403948405679F444121B05400E9C753340394840ACE3D1B50A1B0540B611B10640394840	2020-10-25 21:58:15.291617	2020-10-30 22:05:34.13297	4
460	0103000020E61000000100000012000000E33BD2C9D81A0540F8491F513C394840109BF412DB1A0540402DF76E3C3948409679F458E01A0540402DF76E3C39484009DDD1BAE71A05405C72DA543C3948403512D210FB1A0540536C88CE3B394840237DF40A011B05402F2153623B3948406371F459FD1A0540E6D436CB3A3948400F60F489FA1A0540788EA68D3A3948402E36D2A0F21A0540E1B217503A3948407464F4C2EE1A054065D9903B3A3948405A80F45DEA1A0540AD2F07433A394840BBA3F47ADC1A0540A71501DC3A394840685EF43AD11A054011C879443B39484002B8D14ECC1A0540F250507E3B3948402755F45FCA1A05400A27DFBB3B394840218EF47BCC1A054040BEE5003C3948404053F4FCD21A054074D957243C394840E33BD2C9D81A0540F8491F513C394840	2020-10-25 21:58:15.26545	2020-10-30 22:05:34.135906	4
425	0103000020E61000000100000013000000F6C3D187B21905402586AEAC49394840AD09E91BC41905405D66F2A849394840B6CBE853C81905401EF2A4E44939484036E3E8B5CF19054065481BEC493948400DF2E8AFD5190540C5FF41CE49394840FFFDD17FD81905408D02995A49394840BD81F4CBD71905406AB327BA4839484000E4D147D4190540D34CC82648394840E291F4B5CF1905407CDCC626483948405F3BD2D4CE190540381F9BFF47394840CF5AF4FCC41905401443770148394840DC9BF40DC31905407CDCC62648394840C698F4C4C0190540E61F2E21483948401A7BF4D0B41905402A22757E48394840EA93F422AE190540FEC5A8EA48394840EB79F4EAA9190540A89AC220493948402988F471AA190540A1D5FE5449394840129FF460AC1905400354A28349394840F6C3D187B21905402586AEAC49394840	2020-10-25 21:58:15.186911	2020-10-30 22:05:34.139203	4
474	0103000020E6100000010000000D000000C9D5D1271D1E05408F48ECA03D39484006FED1E6211E0540B135DD933D394840D054AAD2241E0540E2A1D4713D3948405C82F4A5261E054054461E2F3D3948405C82F4A5261E054088F27EE43C394840C481F432211E05401B3383C83C3948400095F4651B1E0540D46DFB523C3948406C75F40E181E05400A0502983C3948409961F468181E05403805C8C43C394840EB77F4E4141E05401B3383C83C394840716CAA3E131E0540DE9EAB2E3D3948409580F44C161E05404387AE6C3D394840C9D5D1271D1E05408F48ECA03D394840	2020-10-25 21:58:15.295337	2020-10-30 22:05:34.142885	4
481	0103000020E6100000010000000C000000662DD2FB771C05408BC1199F2B39484048F9D181881C05408C24857D2B3948402061F4328C1C05408C98BD502B3948407472F4028F1C05403F66DDED2A394840946DFC79901C05405282C39E2A3948403183F45F8C1C054032E8327A2A3948404786F4A88E1C0540CA4679F929394840CA69F49A8D1C05407C43C2D929394840B085F435891C0540981507D629394840809EF487821C05407BE056FB29394840F842FCEE751C0540B77B555F2A394840662DD2FB771C05408BC1199F2B394840	2020-10-25 21:58:15.308685	2020-10-30 22:05:34.145741	4
430	0103000020E61000000100000006000000C5CCD193761C05404B0C83C129394840EB98F468831C0540DB60EA3E29394840C7E1D11F811C054000A0791B293948406A0ED2177A1C05406B7575372939484000FAD1FE741C0540CDD7597E29394840C5CCD193761C05404B0C83C129394840	2020-10-25 21:58:15.200723	2020-10-30 22:05:34.148501	4
444	0103000020E61000000100000014000000ADEFD17ADC1A05406FBC8BDF36394840FE92F41DDF1A05407A661CA036394840AF77F4F5E81A0540735670A936394840B0A6F4B9F71A05402C00FAA136394840B968F4F1FB1A0540735670A9363948403B66F41BFF1A05402D878EC336394840D266F48E041B0540B523CFDB3639484092FFD150061B054072CAB422373948401556F431071B05408114034837394840A875F4880A1B0540CAF10D71373948406881F4390E1B0540CB78A292373948407AA3F4660E1B0540FF9314B637394840D561F4E20A1B054023089ACA3739484092FFD150061B0540810FDCE237394840BC63F445021B0540F90AFDE0373948405A80F45DEA1A05408BC51233383948408CC0D1ACE61A054093CFF13438394840724FF436E41A0540FC18262438394840D0A6F4C3DE1A0540829B976937394840ADEFD17ADC1A05406FBC8BDF36394840	2020-10-25 21:58:15.228142	2020-10-30 22:05:34.151383	4
421	0103000020E61000000100000013000000800FD2E5AD1A05407F43EED64F394840EC96F4EDB41A0540554C1EE24F3948405F6DF43EBE1A054060184725503948403496F470C81A0540389B7A9150394840609CF402CD1A054031CBB6C550394840FB0AD2A2D21A0540C450D6DF503948405470F47DD91A05406D76A535513948403F6DF434D71A054051E4486451394840D458F41BD21A0540B0F15771513948407B66F42FCD1A0540BB27B05E513948400C71F4FAC51A05403037409C513948401C7EF49BBB1A05406C9746E1513948409B66F439B41A0540359DD4BD5139484085F0D101B01A054097F8458051394840ED7CF4B5B01A05400EB47E53513948407AA6F464A71A0540E855F93E51394840E86CF4D59F1A0540A074B2E15039484081C6D1E99A1A0540B51E197B50394840800FD2E5AD1A05407F43EED64F394840	2020-10-25 21:58:15.176274	2020-10-30 22:05:34.154329	4
458	0103000020E6100000010000000F0000003D26D23EDD19054010298E40373948404360F411DD190540358B942A3639484009A6D17FD819054025034EEF34394840E477F47DCB1905401C72DACB34394840B403D2A8BE1905406C59C4F6343948402B9DF4FDB41905408ADC934C35394840C9D7D12DB21905408F6B84BC353948405DDDD14CB11905409492D6423639484008E6D1B4B2190540412A31913639484088FDD116BA190540B189EA1137394840878AF43DC0190540829B9769373948401F8BF4B0C51905403CCCB58337394840D16FF488CF190540DFB3A676373948406D51F417D71905406DD9FE63373948403D26D23EDD19054010298E4037394840	2020-10-25 21:58:15.257163	2020-10-30 22:05:34.157253	4
477	0103000020E6100000010000000900000030AAD1716C1B0540B6633CEF463948405EE7E8A7631B0540CFCD415646394840A5BBD14B561B05407DE853E64539484076BAD1654B1B054097EDFD5946394840CC02E9D9401B05401F06E1A0463948407BECE85D441B054092FDED2A47394840D7D9E89D4F1B05407D0DD271473948407DB0D10D581B05405DB6A3C74739484030AAD1716C1B0540B6633CEF46394840	2020-10-25 21:58:15.3012	2020-10-30 22:05:34.160541	4
452	0103000020E61000000100000010000000B01CD2908A1A0540DA9D3F3B5139484096567ADC911A0540EF8828E950394840A262FA46981A05407BE4F4EB50394840161FFA5F9D1A0540FA09690151394840C9387ADE9E1A0540D95C6039513948402608D26D9E1A0540C96CAF6C51394840EA18FACD981A0540F37ABAF65139484006327AD9941A0540ABBA144552394840D11AFA30901A054025C5DC635239484027617AA78A1A054025E5507952394840FB5A7A15861A0540890D0C7D5239484050FF5156811A0540596F2552523948407B437AB37E1A05400A7D3B2752394840FD267AA57D1A0540D87D01E55139484008E0D1B8801A0540703091C151394840B01CD2908A1A0540DA9D3F3B51394840	2020-10-25 21:58:15.244709	2020-10-30 22:05:34.163683	4
459	0103000020E61000000100000011000000A7BFD199271A0540873A60F84239484001547ABB2B1A0540616587CC42394840044F7A0F321A0540A63F69B24239484082DED1733E1A054061FF5D9742394840E512E9374D1A054006711AFC4239484062DED169571A05402FF7F67A43394840954D7A15591A0540E806AAA84339484017317A07581A0540A872E8CE4339484084117AB0541A0540952CE4EA43394840C0247AE34E1A054009FC8BFD4339484024437A54471A054043521E2D443948402959FA16411A0540D90EB73244394840A941FAB4391A054091B8402B44394840C8E85185341A05405FBE39F443394840252FFAFE2B1A054018F47E73433948403837FAF3271A054093D6E11A43394840A7BFD199271A0540873A60F842394840	2020-10-25 21:58:15.263084	2020-10-30 22:05:34.16681	4
429	0103000020E6100000010000000F00000079B8D1B7EA1A0540F3B5077C3C3948402D03E9F7F51A0540A5118E133C394840B3E1E83DFB1A05406AE66FF93B394840CD12D283001B054042AD180C3C394840B70BE955101B05403B3D38873C39484008D1D1F5151B0540FDB059023D39484010FEE841151B05403E97EF843D3948400D03E9ED0E1B0540A6C2D3CB3D394840A802D299081B0540363306D73D394840771BD2EB011B054040E2C9A23D39484033CAE8DBF31A0540AC6E6E543D394840D2FBE87FE61A05407E6EA8273D39484050FEE855E31A054009186CF33C394840FB06E9BDE41A0540B09374BB3C39484079B8D1B7EA1A0540F3B5077C3C394840	2020-10-25 21:58:15.198693	2020-10-30 22:05:34.169863	4
428	0103000020E6100000010000000800000073F6D14C541C05406C5A2EA72E394840B5B6D12B481C0540D00B6EE12D394840845CF4A4471C0540CFED11932D394840E092F4E0651C05406C43DBC52C3948403B0DD2316F1C0540259D552E2D394840E5E6D1D5611C0540578485B62D39484020FAD1085C1C0540C9E0A8922E39484073F6D14C541C05406C5A2EA72E394840	2020-10-25 21:58:15.196649	2020-10-30 22:05:34.176586	4
439	0103000020E61000000100000019000000E102D2BBC61C0540F346F60D3C394840B56FF418C41C0540A66D35263C394840B755F4E0BF1C0540E52C6B153C394840198EF489BC1C054001909EA33B3948404299F4C7BA1C0540D4FEE9E43B3948404565F457B21C054034B56A373B3948408078F48AAC1C05402CA418B13A3948402D09D257B21C0540C3593E323A394840A152F497BD1C0540717D54073A3948403853F40AC31C0540D93927E0393948400A81F4E8C61C054088C5DB9E39394840B3A3F488CC1C054054AA697B39394840504BFA47D11C054061831572393948401DF651D4D31C0540411AFB4939394840A12C7A1DD61C05406B5D4D53393948408132FAF5D71C05406183157239394840A877F403D91C05405631FE9C39394840918EF4F2DA1C0540B74C36ED39394840176DF438E01C0540E9E1B97E3A394840EA80F4DEDF1C05402CA418B13A394840ACE5D130D91C0540DB9811E93A394840B69EF4DCD21C05401A5FBA5C3B39484035A1F4B2CF1C0540548AD8763B3948405151F4A7CB1C0540B6A510C73B394840E102D2BBC61C0540F346F60D3C394840	2020-10-25 21:58:15.21807	2020-10-30 22:05:34.179704	4
483	0103000020E61000000100000017000000C6E9E832F71A05408DD123F8473948407A5AF46AFB1A0540A4292EFF483948406371F459FD1A054099F3D51149394840CA8AF41EFC1A05409D646A3349394840F009E9FCFF1A0540B81FD20B4A394840FA8BF404071B0540BA70791E4A394840ED79F4B7171B0540265EF8ED49394840428BF4871A1B0540D9A1EDC449394840D9CBE82A1D1B054067F232C1493948401213E9CD1F1B0540B81FD20B4A39484044A0F413251B0540EC0457204A394840440FE907311B0540287EE5FC493948407F5EF4853A1B0540C750E9E049394840D289F48D411B0540FB8EDEB749394840BBA0F47C431B054071089E9F49394840BBA0F47C431B0540AA613F6D49394840A46EF46F321B054041BCA80C48394840A554F4372E1B05409520128A47394840F850F47B261B05408579257B47394840B266F4841D1B054087233D5047394840FFC1E8DC101B05409ADF166E473948402297F442051B0540C50AD8B647394840C6E9E832F71A05408DD123F847394840	2020-10-25 21:58:15.312376	2020-10-30 22:05:34.182687	4
447	0103000020E6100000010000000D000000970BE94B291B054073250EDA4C39484042FAE87B261B0540D8F5FEAA4D394840C4F7E8A5291B0540B553F6E24D394840CFFDE82D471B05408BE1294F4E3948402C1AE931611B05405CB95DFF4C3948402C1AE931611B05408A91BEB44C394840ABD3E80B4B1B05408DF0ED5E4C394840F50DE9173F1B054081BA95714C3948401FFFE81D391B054029C8325B4C3948401FFFE81D391B054014BBB12A4C394840CBD3E815321B05401FF109184C3948401809E9752C1B05404034E3354C394840970BE94B291B054073250EDA4C394840	2020-10-25 21:58:15.234196	2020-10-30 22:05:34.185533	4
417	0103000020E6100000010000000C00000004B7D1986F1E05402E7214283C3948408C8CF4526A1E0540E52C6B153C394840E369F4B2641E054077E6DAD73B3948405D8BF46C5F1E05400EBBF6903B3948409B99F4F35F1E0540A90BA76B3B3948406086F4C0651E05401EF3D1313B394840E283F4EA681E0540E3C7B3173B3948407DF2D18A6E1E0540D0F44D1D3B394840B2BAD154771E0540A263995E3B394840BE88F48C7B1E05402B8D3B8D3B394840681ED2057B1E0540922BBEBD3B39484004B7D1986F1E05402E7214283C394840	2020-10-25 21:58:15.16878	2020-10-30 22:05:34.188342	4
435	0103000020E610000001000000140000006F5F4540CA1A05403D4013254F394840647DF41ECF1A0540AC5663004F3948403A8CF418D51A05406F4145E64E3948403A8CF418D51A0540CA92D7A64E39484039A6F450D91A0540939865834E394840D0A6F4C3DE1A0540B9F6EA974E39484005CD9F24E41A054099CAB3CD4E3948401F53F4F2EB1A054086F8DDEB4E39484030D0577CF71A05407063125B4F3948403685F4FFFC1A0540C0449DB14F394840B3A1F40DFE1A05404F3172EB4F394840A27FF4E0FD1A0540CA5BAE1F50394840E654F44BFC1A0540C9A6964A50394840CD56F4AEF31A05405378BF8D50394840AB96F4D9E61A0540A074B2E150394840FE92F41DDF1A05409AA4EE1551394840E06B0A63DC1A0540C8FDC5F950394840898DF408C71A054081C54FED4F394840C981F457C31A05408E65D7844F3948406F5F4540CA1A05403D4013254F394840	2020-10-25 21:58:15.209974	2020-10-30 22:05:34.191599	4
484	0103000020E6100000010000000C00000097B3D1F0351E05405ECC91523D3948408B83F48B311E05402B4981453D394840CB77F4DA2D1E05406171761C3D3948407666F40A2B1E054088F27EE43C3948406DA4F4D2261E05401B3383C83C394840C39BF46A251E054033029F813C39484052AFD1C1281E0540A3C8505C3C3948409D8BF4802D1E05407755EC453C394840BCDDD112321E0540C42EAD2D3C394840FE59F4DC3A1E0540AD5B04F93C394840469DD174391E054014FA86293D39484097B3D1F0351E05405ECC91523D394840	2020-10-25 21:58:15.314458	2020-10-30 22:05:34.194262	4
442	0103000020E610000001000000080000003A04D26A361C05409B6C14AA30394840CE96F4B03B1C0540458EA7CB30394840E621D25E421C0540E2C28AB1303948403D8CF4E5421C05402806A56A303948409CB8D18E3F1C05407642D1303039484094DCD11E371C05409314162D30394840A376F4E6321C05402806A56A303948403A04D26A361C05409B6C14AA30394840	2020-10-25 21:58:15.224078	2020-10-30 22:05:34.197046	4
478	0103000020E6100000010000000A000000ED9CD148941C0540F6319C9D3C3948402657F4DA981C05402CF2F28A3C394840B890F469A01C05403C99DF993C394840A2ABD138B31C0540922BBEBD3B39484084E6D1B7AC1C0540BCB949393B39484038ECD1E0921C05406ED915CD3A394840EE93F4BC891C05401A5FBA5C3B3948408011D2607C1C0540962EE7003C394840F755F4F48D1C0540E59B7C833C394840ED9CD148941C0540F6319C9D3C394840	2020-10-25 21:58:15.303336	2020-10-30 22:05:34.199784	4
436	0103000020E6100000010000000D00000016FDD147771C0540200D5C633D39484063C3D1AE881C0540CDA310223D3948402DC0D15B9F1C05406103C69C3E394840E152F4AB8B1C0540B5F972F43E3948405B74F465861C0540264D86E53E3948407CA3F4337C1C0540CD37A01B3F394840AEE3D182781C0540D9D596F23E3948408350F4DF751C054052E93AA43E3948402D59F447771C0540E3ADAA663E394840E688F488721C054069C3565D3E39484041D4D1156D1C05403FCA46EF3D394840379FF4046F1C0540DD4670B53D39484016FDD147771C0540200D5C633D394840	2020-10-25 21:58:15.212137	2020-10-30 22:05:34.203013	4
401	0103000020E61000000100000007000000770BD2A5CC1D0540EDC324704B3948403713E971E21D054069894A524B394840DECFD1A9E61D05402573AE684B3948402E00D25DE71D05400F1963054C3948408614E961D41D0540C59F77574C3948401C04D22DBD1D054053FE44EB4B394840770BD2A5CC1D0540EDC324704B394840	2020-10-25 21:58:15.136774	2020-10-30 22:05:34.206113	4
437	0103000020E610000001000000080000001D33D2F1CB1D05408131113B4D3948408104E981C31D0540EC5A4A0E4D394840BD1BD299AB1D0540F18F242C4D3948404812E99FA51D0540C3E87D7A4D394840226405D2B61D0540E7D220C34E394840FE20E98FC41D05406B9E50314E394840204CA90ACF1D05408CA35F804D3948401D33D2F1CB1D05408131113B4D394840	2020-10-25 21:58:15.214221	2020-10-30 22:05:34.283212	4
457	0103000020E61000000100000013000000A919D2A0E11C05406B83F40C31394840D778F4E9E31C0540C61A3CED3039484021D1D10DED1C05401C8B3DED303948405F6CF4BBF31C0540E7516F7B30394840BE54F44F051D0540C61A3CED303948407463F43F241D05405DB1BB9A313948405C94F4662A1D05404A9AE0F931394840C974F40F271D0540EF2C8F51323948406BA1F407201D0540AE54301F32394840828AF4181E1D0540B5F6703732394840F17FF44D251D05402863AD6B32394840E05DF420251D0540B0FFED83323948405E60F4F6211D0540A9EF418D32394840018DF4EE1A1D0540B70F9A7A323948409124D2CA111D05401490477132394840D900D24EE81C05402D9EA5C5313948409489F446E11C054088A35884313948407E86F4FDDE1C0540B17CCC2A31394840A919D2A0E11C05406B83F40C31394840	2020-10-25 21:58:15.255162	2020-10-30 22:05:34.209821	4
456	0103000020E6100000010000000E0000007FD9E2BFE51A054022807FA34E394840AB05E9CDF21A05402956A4184F394840EFB4F615091B0540CDE20C824F394840E770B593131B05407C8E5B334F394840F25AF4D3191B0540A73BB7094F39484037AAC6411D1B0540CAE9F0DE4E3948400297F4381E1B054014FD942D4E39484013F9E8951B1B05401EE245084E3948408FE6E8DF0D1B0540B7B2258D4D394840DA06E9B3FD1A05409F9E3FE54C394840B0E6E8E9F41A054067EFB5EC4C394840EBB8C30BEC1A0540321BAB674D394840F920E9F5E81A0540DAFC63224E3948407FD9E2BFE51A054022807FA34E394840	2020-10-25 21:58:15.252871	2020-10-30 22:05:34.212841	4
426	0103000020E61000000100000016000000250552894E1A0540671791D8403948408460FA8E501A054083A8F6D2403948409A147AF9561A0540D55F39DD40394840FF12FA4F621A05404E4A8DE6403948405A697AA66D1A0540C5B84CCE4039484047A5D1436E1A0540223DAFF24039484075337AD36D1A0540B085394C41394840851C52E16E1A054008A1F8B041394840E2137A7C6A1A054070CEF4BE41394840D140FA2D661A0540E47228BC413948405424FA1F651A054085908DC4413948401E277AAF641A05401EC9BAEB41394840784EFA41611A0540073D96FB41394840E614FAB2591A054075C61D0242394840F43BFA8B531A0540FCDBC9F841394840D6277A2C511A0540E1D310E741394840C835FAF94E1A0540B48553F141394840E21552E64B1A054022A9B1C241394840D22C7AD84A1A0540680C409141394840E9157AE9481A0540F2C0035D4139484028247A70491A0540D2C0210841394840250552894E1A0540671791D840394840	2020-10-25 21:58:15.189105	2020-10-30 22:05:34.216158	4
433	0103000020E610000001000000100000006EE3D16EAA1C0540DF35A3C03D394840D3A3F492B31C0540E741C23B3E394840437FF48FB61C0540DB7A7BBC3E3948409C71F47BBB1C0540CABB0BFA3E394840B755F4E0BF1C0540E8F161643F3948403CC1D137C31C0540F987817E3F3948402465F44DCB1C054055B15D803F394840B96AF46CCA1C0540F51CBA513F3948408A98F44ACE1C05403048D86B3F394840D9D1D18AD91C0540396A3A213F394840CF9CF479DB1C05403E8BB30C3F3948407C71F471D41C05400B93C49C3E3948402760F4A1D11C0540612C16453E39484022DDD1D2BE1C0540AAB61F2F3D394840437FF48FB61C054068F033813D3948406EE3D16EAA1C0540DF35A3C03D394840	2020-10-25 21:58:15.206107	2020-10-30 22:05:34.219183	4
408	0103000020E6100000010000000800000026DED1EF641D0540F35C310A4539484039E2E8FF721D05408B45A24F44394840850FD27F891D0540915217F64339484096FEE8038D1D0540449E25E1443948408AF0D19B8B1D05404A82F997453948407823D22F701D05405BCDDF3F46394840D813E9A3651D054005D9D1B54539484026DED1EF641D0540F35C310A45394840	2020-10-25 21:58:15.15147	2020-10-30 22:05:34.222188	4
427	0103000020E6100000010000000800000012E4D16D9B1D054025071ACF47394840B0E6D14D7F1D05409D47560348394840FF30D239841D05408D02995A49394840C2B3D1B99A1D0540B1B6069A49394840C714E975A21D054008C8BE3C49394840A4D0E81BA21D0540CC8A3BAB48394840C419E9219C1D054079E1073F4839484012E4D16D9B1D054025071ACF47394840	2020-10-25 21:58:15.19096	2020-10-30 22:05:34.22481	4
464	0103000020E6100000010000000B0000001202D2F3701C0540AD9F8E0735394840544FF4F96A1C054095EEC2F6343948401160F456681C05407061149F343948407498F4FF641C0540413D252F343948400C0CD24B641C054007567CBB33394840EC4FF46C701C05402517E81C33394840A98FF48D7C1C05408C1DFD9032394840B251F4C5801C05408C1DFD90323948401B0DD227881C0540D18F4C3333394840C72AD21B941C0540B976EEDE333948401202D2F3701C0540AD9F8E0735394840	2020-10-25 21:58:15.273049	2020-10-30 22:05:34.227539	4
412	0103000020E6100000010000000C000000ACCFD179381A0540BDF12AD4293948403DD6E85F431A05404914FB292A3948409FD3E87F5F1A0540AB0874922A3948401011D2E96D1A0540BAEC117C2A394840A7DEE8B3761A05402FD963A729394840F4C2D1377A1A0540F98FCD242939484051E7E81B781A054008B2B6D2283948401E05E9196B1A0540B501BF9A2839484064F3D1F5611A05408ADE67AD2839484032F7D1BB501A054086E44E5529394840380FE97B451A054094D2F56729394840ACCFD179381A0540BDF12AD429394840	2020-10-25 21:58:15.159054	2020-10-30 22:05:34.232861	4
445	0103000020E6100000010000000C000000BC30D258481C05404EBDC1B83E3948406203D2E3621C054002D333DC3E3948400D7FF43A661C054015CFA4DD3F39484000B1D102621C0540F88D09D240394840038EF43E531C05407DB482BD40394840D3A6F4904C1C054093761BC3403948401862F4C3461C05409D25DF8E40394840F0C9D15E421C0540BB09DA49403948409764F499431C054038BC95D03F394840BB8EF4BB3F1C05402A2D2C753F394840EC5BF431421C05409F37DAEE3E394840BC30D258481C05404EBDC1B83E394840	2020-10-25 21:58:15.230149	2020-10-30 22:05:34.235517	4
403	0103000020E6100000010000000600000057D7D15E6F1C054010193B0A3C394840702AD2BC5C1C05409B53ED673B3948409ECDD11A4A1C0540CB1C7C003D3948403302D2FD571C0540AFB948723D394840B191F4FA5A1C0540DF5EF3683D39484057D7D15E6F1C054010193B0A3C394840	2020-10-25 21:58:15.140714	2020-10-30 22:05:34.2384	4
414	0103000020E6100000010000001800000058E1D1A8721A05403255167E403948400658F4537C1A0540245E0E3940394840DF61F4A1881A0540D98B031040394840CD59F4AC8C1A05402B913DE33F394840B96BF4EF941A0540476382DF3F394840CD88F4709B1A05401E66E5F53F394840389DF489A01A0540CFDC3F444039484044CDD1EEA41A0540D1CB724F40394840FC89F456A61A05404B20A5BB4039484043E7D126A91A05405C93412241394840CF9DF4FCA51A05400E747AD3413948407D58F4BC9A1A05409705BBEB41394840DD95F411911A0540DF5B31F341394840338DF4A98F1A0540DCDF9CD141394840615FF4CB8B1A05402097FB03423948409C72F4FE851A05409466A316423948400572F48B801A0540CC152D0F42394840C282F4E87D1A0540DCBC191E423948402F63F4917A1A05406571DDE94139484041F8D197741A054064E47BD3413948402787F421721A054066B7E350413948409467F4CA6E1A0540F91A6BE8403948409467F4CA6E1A0540B2E777944039484058E1D1A8721A05403255167E40394840	2020-10-25 21:58:15.162914	2020-10-30 22:05:34.242026	4
440	0103000020E6100000010000000F0000005EE7D10BEE1D0540E7AC8CB23B3948409987F465EE1D054077E6DAD73B394840212CFADBF01D0540B489D8E53B394840199FF4C7F51D05403827A5E83B39484096AAD129FD1D0540464130E13B394840DDA5F4CCFF1D0540841133C53B3948409156F434011E05409CE04E7E3B3948407EDBD150031E0540FDF4134A3B3948403B5FF49C021E054034B56A373B394840255CF453001E05403BC5162E3B394840B580F456FD1D05405087AF333B39484010CCD1E3F71D0540A263995E3B394840755DF443F21D0540548AD8763B394840707CF427F01D0540C76480893B3948405EE7D10BEE1D0540E7AC8CB23B394840	2020-10-25 21:58:15.219999	2020-10-30 22:05:34.247648	4
473	0103000020E6100000010000000C000000BEF1D1A6381A0540C09D9C6F36394840F81ED211371A054010F818DE353948400254F4383D1A0540D44B339735394840ADFED13D471A054054AED18035394840C855F4914D1A0540BE899A9135394840F07AF407501A0540F2A40CB5353948407178F431531A0540422458F6353948400A5FF46C541A054021509046363948408861F442511A05404E5B567336394840F160F4CF4B1A0540474BAA7C36394840F1D3D1A8451A05403A1A859A36394840BEF1D1A6381A0540C09D9C6F36394840	2020-10-25 21:58:15.29344	2020-10-30 22:05:34.250436	4
422	0103000020E6100000010000000D000000650FD275A21D05405E30DD9E393948406768F42CA01D05407DA70665393948403A7CF4D29F1D05407389312B393948408E8DF4A2A21D0540F817490039394840D65DF461A71D0540CD9317F53839484012A0F458B01D054034CAFB3B39394840EC8FF46EB81D05404B132963393948407CA3D1C5BB1D0540A4FFBE8439394840588AF44FB91D05401F0909C639394840DC53F409B41D0540B74C36ED3939484048C1D1C3AE1D05407F97DFFF39394840CF23D28EA71D054043E52CC439394840650FD275A21D05405E30DD9E39394840	2020-10-25 21:58:15.180985	2020-10-30 22:05:34.253224	4
448	0103000020E61000000100000005000000431BD2631F1C054000BF97AD3539484068D6D18C321C0540CD7356B734394840C0E2D1B03B1C05405FC0002B3539484064F5D170301C05400B6F010936394840431BD2631F1C054000BF97AD35394840	2020-10-25 21:58:15.236441	2020-10-30 22:05:34.255811	4
454	0103000020E6100000010000000E000000C3BCD180D31D054039C8FD193A394840FC76F412D81D05405017F8353A3948402D5EF4C0DE1D0540E04A79663A394840D19FF444E21D05406B634EA03A39484002FAD1CBE21D0540995D47D83A3948406B6CF447DF1D0540EBD75F0E3B3948405188F4E2DA1D0540DF339C423B394840CF17D2C9D51D0540454B8A513B3948402668F418D21D0540664948393B394840FA61F486CD1D05407E1864F23A39484078F1D16DC81D05400093858F3A394840F29FF44EC91D05400A4816503A3948403D51F429D01D0540E357FC193A394840C3BCD180D31D054039C8FD193A394840	2020-10-25 21:58:15.249051	2020-10-30 22:05:34.258561	4
469	0103000020E61000000100000009000000FAEED197CB1D0540381F9BFF47394840DECFD1A9E61D05400170110748394840C1D2E8D3E91D0540544AFF76483948405BECD1B7E71D0540B9982FDD493948400812E98BD71D0540F5E907FB49394840E0ECE815D51D05405D66F2A84939484028C1D1B9C71D0540B1B6069A49394840B6CCE84BCC1D0540FC7401D848394840FAEED197CB1D0540381F9BFF47394840	2020-10-25 21:58:15.283405	2020-10-30 22:05:34.261228	4
406	0103000020E610000001000000120000000EC6D11A581D0540C4F68867333948408579F4A7521D0540338B3820343948403505D2C85E1D054070C9B28834394840CC92F4626A1D054014622ED534394840D7DCD1FF721D054043EEBB2E35394840BC65FA29761D05402CEB4327353948404FA5F418781D0540B2C007F334394840EB66FA0F811D05401C7D9866333948401B94FE237C1D0540CB4835503339484081F37CCC801D05407CED12523339484005F8D11D821D0540841E2A3533394840958FF40F811D054070B9237332394840BF80F4157B1D05408C8B686F32394840BD6BF489701D05403F3E6FB4323948403492F4EF641D054047E0AFCC32394840D98AF477551D054047E0AFCC32394840C2A1F466571D05403AD98022333948400EC6D11A581D0540C4F6886733394840	2020-10-25 21:58:15.147071	2020-10-30 22:05:34.264302	4
475	0103000020E6100000010000001100000014A3D140BD190540C101038D4039484008A2F49FC7190540B06BE37240394840A864F44AD119054046287C7840394840648FF4DFD2190540ACCCCB9D403948400E98F447D419054078BC597A40394840F3EBD132E9190540ED7A3498403948408598F4B0F21905405394622041394840C7E1E8BBF6190540580D619D41394840DB8FF448F119054056CAF0DA41394840A902E902EC1905409F4054F14139484056DBD1DFD2190540D5140C11423948409E00D25FBC1905402F5802E1413948409A23BDFDB8190540FE13C1C1413948405D6AF473B71905403400839B413948406E8CF4A0B719054031A7712D4139484057A3F48FB919054009E5DAAA4039484014A3D140BD190540C101038D40394840	2020-10-25 21:58:15.297356	2020-10-30 22:05:34.267297	4
409	0103000020E6100000010000000800000083987095531C0540005C93B92F39484049261647721C0540FEF7ECFC2F394840E854F4186A1C05408542DDBA303948401E791732681C054081331E81313948408B81F410631C0540BAC9CAA7313948407283F4735A1C0540E54DFCB231394840EA23A9274D1C05402DB0BF1C3139484083987095531C0540005C93B92F394840	2020-10-25 21:58:15.153206	2020-10-30 22:05:34.270089	4
420	0103000020E6100000010000001400000093158ADA631C05405B8BCDC926394840FC8BF4D1741C0540AC7E18B0263948405B15FDBD791C05407C89D989263948407801F4D07E1C0540D2568AA6263948404A52F438861C0540DF7561902639484012FCD0BC8C1C0540BDF5676F26394840F28EF410901C0540C569F35026394840235CF486921C05400E86401526394840235CF486921C0540093C6BDB25394840309DF497901C0540697DBC8325394840AF9FF46D8D1C05401C7A056425394840ABA4F419871C05400FBD185525394840D861F4AF781C054081052C46253948409177F4B86F1C054058D965192539484067B3F8D8691C0540625EF92D25394840A565F475671C0540DD283B5325394840CE70F4B3651C0540E81F51A525394840FB5CF40D661C05401596EC0B263948409DA3F43D631C0540910F3F922639484093158ADA631C05405B8BCDC926394840	2020-10-25 21:58:15.174284	2020-10-30 22:05:34.273142	4
411	0103000020E610000001000000160000005AF3D136E41A0540E58CB40B343948409974F4ACE61A054055E694F1333948404F54F4D8F61A0540F3446E0F343948408F77F4EB011B0540256BE032343948405CB3D1010A1B05408B146363343948406A67F4010A1B0540751AFB46353948405464F4B8071B0540C0102FB335394840A57AF434041B0540BA8717DE35394840C63A7A8CFF1A0540560DB0E33539484090EAD1C4FB1A05407AA9EBB63539484053647A3BF61A0540AE4D0AC335394840F727FA1CEF1A05406E0740B235394840D948FA63E41A05402C3AE17F35394840A8BF5180DE1A0540F60E2E5235394840DF5E7A26DE1A05408903533435394840C826FA36E41A054062EF0FBB343948407149FAD6E91A0540507E97C1343948405A60FAC5EB1A05401038CDB034394840011F7AFBEA1A0540BA2F6A9A34394840D5187A69E61A0540B6DE498E343948401857FAEAE41A0540070FF876343948405AF3D136E41A0540E58CB40B34394840	2020-10-25 21:58:15.157036	2020-10-30 22:05:34.276816	4
453	0103000020E6100000010000001A0000004D0DD2E2FC1905404EC3F45C3639484054E9D152051A05401F3D409E363948405BDFD1FA111A05409D4EE62D3739484077D8D1EB201A0540AD87675E373948404B1BD2552F1A05404EC3F45C3639484079EDD1772B1A054085BB1A61353948404A59FA20281A05403C24C55735394840EB507A72291A05407EA28631353948405C127A37281A05400CC8DE1E353948402234FAAA251A05403A0B9C1435394840422E7AD2231A05401729AB2135394840B258FAAD221A054042ADDC2C353948400850FA45211A05405E7F212935394840B258FAAD221A05400877BE12353948400C51F4F9211A0540249BAF0535394840F26CF4941D1A0540F206D20335394840568BF405161A05406CF1250D353948401482F42A0F1A05400950FF2A35394840FA9DF4C50A1A05405F586241353948400CA6F4BA061A0540FB2FA73D353948402956F4AF021A0540A527442735394840D8B2D10C001A0540BCD80F3835394840E09FF428021A05406881377B3539484068D7D10FFD19054073993FC0353948408D74F420FB190540B4FEFF08363948404D0DD2E2FC1905404EC3F45C36394840	2020-10-25 21:58:15.246943	2020-10-30 22:05:34.279991	4
486	0103000020E610000001000000120000003ABCD1F1ED1905405E029D8B2D3948408EE7D1F9F419054088B5F7D92D394840F101E985FF190540C1B964192E39484047A8D141071A0540EB0CDC202E394840B0F02597101A054084C7C9B22D394840EEFED151151A0540DED873482D394840F5DAD1C11D1A05406CCFA2F22C3948408EC626511A1A0540CCC9017F2C39484075563CA9191A0540836126002C394840043A85BB131A05408F7D50C62B3948406F1EE993001A05400A27FDE52B394840C200E99FF419054035AB2EF12B3948409219E9F1ED190540B471EC552C394840ECF1E8A5EE190540D004EFB62C3948400A42FAD2EE190540334DA5D62C3948406E40BD6AF1190540349B29F22C394840F278F459EF190540CF9ABF0C2D3948403ABCD1F1ED1905405E029D8B2D394840	2020-10-25 21:58:15.3184	2020-10-30 22:05:34.286227	4
505	0103000020E6100000010000000F00000003747E7C7E4E0540D51C292E513B48400C43B228764E05404C58AA48513B48401A33F2825B4E054007F6EA55513B48400F1A3DAB564E05402230F854513B48402302262F534E0540E27A3F44513B4840A7EA9BAF504E0540AC02E6EB503B4840528C2722514E05402C508475503B4840E373B8925A4E0540AA7AD335503B4840D51BF3BF6B4E0540A35B060F503B48401216567E744E0540A35B060F503B4840920618AC834E054062486303503B48407A9130FA8A4E05407E540B79503B4840C05AC7648B4E05401EAACFD5503B484070C9C765864E054059B9060D513B484003747E7C7E4E0540D51C292E513B4840	2020-11-02 15:13:09.653085	2020-11-02 15:13:09.653085	1
517	0103000020E6100000010000000E0000005985F44B8B4F0540ADD8CED1013B4840177CF470844F0540390F51A1013B48402984F465804F0540ADBA2C5E013B48401481F41C7E4F0540283AFA0D013B4840025FF4EF7D4F05408C3DF2E4003B48407F7BF4FD7E4F0540A4B9C7BD003B4840A7A0F473814F0540355CABA3003B484054A4F42F894F054056BB43A9003B4840F16BF4868C4F0540B9CD0CBA003B4840345BF4298F4F05409411E4D7003B48409A8EF426924F05407F1B414F013B4840B658F453924F054098B5B89B013B4840848BF4DD8F4F0540DEDF4ABD013B48405985F44B8B4F0540ADD8CED1013B4840	2020-11-03 11:49:08.057796	2020-11-03 11:49:08.057796	1
294	0103000020E6100000010000000A00000052D5D133385105409DDD471E023B484046CFD1AB1A510540C610D216023B4840ECF6D1F71951054029F6277A013B48409814D2EB255105409735A220013B48404913D2FB33510540BDF1CA02013B48400008D2B34E5105406E021828013B4840833EFAFC505105407AA8BE7F013B484005CFD1974C5105400C1DC2C4013B4840E77CF40548510540B6BB91FE013B484052D5D133385105409DDD471E023B4840	2020-04-16 20:02:34.401926	2020-11-03 11:49:08.090521	1
519	0103000020E6100000010000000A000000BFAB518F754D05406FC8A808303B484047E633B8894D054079A11434303B4840C3DF3435924D0540868605DA2F3B484064D3A26B934D0540699A24DF2E3B4840E8D9A1EE8A4D0540F77915852E3B48407F5D57CE7E4D05407512F3912E3B4840AFFFC387774D054025924EFF2E3B484017E10CAE724D0540D3A487792F3B484046AF5C87724D05404AE4CCD62F3B4840BFAB518F754D05406FC8A808303B4840	2020-11-03 11:49:08.183818	2020-11-03 11:49:08.183818	1
518	0103000020E6100000010000000C0000009E82236F394F0540860C80B60F3B48403B24FDEB364F05401DB820A60F3B48404225D724354F05409EB8DC670F3B48400D25C0BE354F05402E8408430F3B48407EE181E13B4F0540921B0F340F3B4840EF4F87B33C4F05402290003E0F3B48403B2AD8E63E4F05405E006D620F3B48401F4ABD31404F0540E1E3E18D0F3B4840BD9014ED3F4F05409418F4A60F3B4840641FBD9C3E4F0540F20FDAB00F3B48403CFABC263C4F0540A4933EB90F3B48409E82236F394F0540860C80B60F3B4840	2020-11-03 11:49:08.072061	2020-11-08 17:57:01.793542	1
545	0103000020E610000001000000120000008AEBE849603204400BE90D754D30484060FAE84366320440F3B16A9A4D3048403FCBE87570320440F39F4BFF4D304840375A7A977432044079C9B5154E304840650AE92377320440F7AAD2F74D30484040FAE8397F32044006DE867C4D3048407110E9AB9432044095F91B664D304840ABE8E855AE320440AD42DEDB4C3048405AD2E8D9B13204401B23E1944C30484029EBE82BAB32044072DE5F0E4C304840CEE3E8B39B3204407BF46DFF4B3048401609E933853204406DD3D8154C30484040FAE8397F320440478DBFEC4B304840C0E2E8D7773204403E77B1FB4B3048408FFBE82971320440DEB7432C4C3048400B03E9AB673204404A7F08AF4C3048405DFFE8EF5F320440B646CD314D3048408AEBE849603204400BE90D754D304840	2020-11-09 22:47:32.499613	2020-11-09 22:47:32.499613	2
546	0103000020E610000001000000100000002A1CE9F54E2E0440C8D96D432330484040CAE87D6C2E04407DA3B86A223048406609E92B732E04400F9E4D54223048406904E97F792E0440F0A8AA792230484044F4E895812E0440718282FA2330484074DBE843882E04407C9D7D882430484047EFE8E9872E04403EA837D32430484042DFE809772E04408140686C2530484091E0E8F9682E044093C873A425304840E3DCE83D612E044019C3FA9C253048408609E9355A2E044037C39D77253048400AD3E8EF542E044063B84E432530484089D5E8C5512E04405D3051FC2430484085DAE8714B2E04401505231C24304840AEE5E8AF492E044011EAAE86233048402A1CE9F54E2E0440C8D96D4323304840	2020-11-09 22:47:32.503149	2020-11-09 22:47:32.503149	2
548	0103000020E61000000100000009000000D5C6D17B64380440E3812F4089304840E2FBD1C790380440E3812F4089304840E8F1D16F9D3804407F9A76F5883048403908D2EB99380440F0FC92CA8730484037F3D15F8F38044095626F69873048402CEDD1D771380440187EF6618730484026F7D12F653804407E8636A587304840770DD2AB61380440C55AA83A88304840D5C6D17B64380440E3812F4089304840	2020-11-09 22:47:32.509149	2020-11-09 22:47:32.509149	2
549	0103000020E6100000010000000E000000771DE98D0C3304408985A7B231304840CFE0E8B502330440A229D43E31304840A3DAE823FE3204400BEF626230304840A3DAE823FE3204404505A91730304840CAFFE89900330440FF15EFCC2F3048404E12E94F0E330440599E4EAB2F304840DCCCE8051C330440539EC7B22F30484085EFE8A5213304402A9316E72F304840561DE9832533044034FA132E303048405BFEE89F27330440B7668A7C303048405BFEE89F27330440443AFE113130484003F2E87B1E330440A090C39431304840A61EE973173304408985A7B231304840771DE98D0C3304408985A7B231304840	2020-11-09 22:47:32.512209	2020-11-09 22:47:32.512209	2
550	0103000020E6100000010000000D0000009D13E93F0033044073D7793B483048402421E94914330440557E9E484730484059E9E8131D330440EC95D9C546304840A919E9C71D330440E1706377463048407FDFE8C51033044065678212463048401F11E96903330440CF31FED2453048401C16E915FD320440605CFB1946304840F2DBE813F0320440D36936EB4630484099E9E827EB320440AD3666844730484071DEE8E9EC32044076D398D6473048409DE4E87BF1320440CE8B601248304840CDCBE829F832044078E20034483048409D13E93F0033044073D7793B48304840	2020-11-09 22:47:32.515495	2020-11-09 22:47:32.515495	2
551	0103000020E6100000010000000F0000003EE8E8AB0D320440C04404FB55304840E014E9A3063204404D6B99E45530484087F3E8F3F2310440D7C44D6955304840AB1DE915EF31044080380D26553048405BEDE861EE310440B2C7DAD35430484088D9E8BBEE31044060462189543048405907E999F2310440C6319D4954304840BAD5E8F5FF310440E27EC71C543048400D01E9FD06320440DD734024543048409113E9B3143204403400816754304840EA05E99F193204400F9D48A354304840C014E9991F3204403AA5423155304840ED00E9F31F3204408C26FC7B5530484099EFE8231D3204402225F9C2553048403EE8E8AB0D320440C04404FB55304840	2020-11-09 22:47:32.522436	2020-11-09 22:47:32.522436	2
552	0103000020E6100000010000000B000000F7D0D1CF4E360440C8231210833048409FC4D1AB4536044078CB839882304840E1F3D18322360440E25CFC9281304840E1F3D183223604409F678AFD803048404406D22F4936044066B4AD5180304840F404D23F57360440541A837E80304840ADDFD1BF6D3604400065434881304840AA13D22F763604404DA74AC78130484006D2D1AB72360440919CBC5C82304840F404D23F57360440E62B59C582304840F7D0D1CF4E360440C823121083304840	2020-11-09 22:47:32.525795	2020-11-09 22:47:32.525795	2
553	0103000020E6100000010000000900000060749678D32E044025DB66E8263048406D4C8D3FCC2E0440DCC79D0D2730484021C99885C12E044095C6BFE3263048401766F8C2B12E044007755E8426304840A16B48A4B92E0440BC43DFDC2530484034B53327CB2E04405ABDF4C025304840855CF4BAD42E0440AD1B330B26304840F4C3AEEDD72E044040F78B4E2630484060749678D32E044025DB66E826304840	2020-11-09 22:47:32.529335	2020-11-09 22:47:32.529335	2
554	0103000020E6100000010000000C0000009209E9C1452F0440D8CAE8062F3048400FF7E80B382F0440AC745B482E304840DF0FE95D312F0440D80D1DBE2D3048408FDFE8A9302F0440D09B1F772D3048408918E9C5322F04400AA7652C2D304840B51EE957372F044039B29DF02C30484098D0E8A5432F044074BDE3A52C30484046D4E8614B2F044010A7EC242D304840C9E6E817592F0440EC638E9A2E30484048E9E8ED552F044075D08BE12E30484044EEE8994F2F0440D8CAE8062F3048409209E9C1452F0440D8CAE8062F304840	2020-11-09 22:47:32.533914	2020-11-09 22:47:32.533914	2
555	0103000020E6100000010000000E0000004AE5E8396033044035BBEB6A73304840EA16E9DD523304409A1F761C7330484067EAE8EF40330440181EB2997230484069D0E8B73C33044076562E5A723048403CE4E85D3C3304405CB5B80B723048403FDFE8B142330440A87F91F171304840400EE975513304406A0DD5ED713048404E0FE951753304404C56D8A6713048407FF6E8FF7B330440484051AE71304840D9CEE8B37C330440A5690AF97130484053F0E86D77330440516B242F7330484054D6E83573330440F332A86E7330484024EFE8876C330440244D4890733048404AE5E8396033044035BBEB6A73304840	2020-11-09 22:47:32.536931	2020-11-09 22:47:32.536931	2
556	0103000020E6100000010000000A0000001BCDD13BCD2D0440F33F5D371230484010F6D177BE2D0440082AF220123048400EE1D1EBB32D0440E6CC53B81130484064D8D183B22D0440753E661B1130484012C2D107B62D044076B56A8D10304840C3C0D117C42D04409F8994601030484019E7D173D12D0440F0BAE39410304840C7EAD12FD92D04407C33ED131130484021C3D1E3D92D0440F4C161A9113048401BCDD13BCD2D0440F33F5D3712304840	2020-11-09 22:47:32.539873	2020-11-09 22:47:32.539873	2
557	0103000020E6100000010000000B000000390AE98DA4310440C972E9134D304840EBEEE865AE3104408E0E6B464C304840BE02E90BAE31044080FFF4F74B3048403C05E9E1AA310440AC57B4B44B3048408F01E925A3310440B56DC2A54B3048403BD6E81D9C310440A74C2DBC4B304840E2E3E8319731044080FFF4F74B30484034FAE8AD933104401B23E1944C3048403214E9E597310440C05CDB224D30484090E7E8ED9E310440BB51542A4D304840390AE98DA4310440C972E9134D304840	2020-11-09 22:47:32.542916	2020-11-09 22:47:32.542916	2
558	0103000020E6100000010000000C00000039E8D175BC310440A18B611644304840BC14D263CE310440AB7C07AA433048406FDFD103D4310440070C86234330484016EDD117CF3104405B3B26F14130484013F2D1C3C8310440B8BFA46A4130484012C3D1FFB931044042D0B25B4130484007ECD13BAB3104409D9E01904130484001F6D1939E3104405985F6AB4230484057EDD12B9D310440F3EA694143304840B4C0D133A43104401761EBC74330484076E1D170B2310440B6B931274430484039E8D175BC310440A18B611644304840	2020-11-09 22:47:32.545992	2020-11-09 22:47:32.545992	2
559	0103000020E6100000010000000E000000C1FAE8611B3204408C245E1C5A3048401821E9BD28320440C68B93275A304840C81FE9CD36320440EEBBAC505A304840F906E97B3D320440EEBBAC505A304840240DE90D42320440CFACA1185A304840240DE90D4232044026CB2E8359304840A30FE9E33E320440AA6D02A35830484078EFE81936320440B3D7B627583048404808E96B2F320440C50ED30958304840F5DCE863283204403CF3C418583048404212E9C322320440D6FC485858304840C2E0E8291732044026CB2E83593048402EDBE80A1832044064F444F359304840C1FAE8611B3204408C245E1C5A304840	2020-11-09 22:47:32.549742	2020-11-09 22:47:32.549742	2
560	0103000020E6100000010000000D00000065D5E863363304404A6651ED5E3048403918E9CD443304403103271A5F304840C4D7E82F4C330440ADF29F215F3048401703E937533304403924350B5F3048401FDFE8A75B330440F9101F9B5E3048404AE5E83960330440493A250D5E304840C10BE99F54330440BE7DBDAF5D30484041F4E83D4D3304404699CBA05D304840BDE1E8873F33044066A8D6D85D304840071CE993333304402BCC73415E3048400DE3E87731330440BFA9E98F5E3048408AFFE88532330440D3815FDE5E30484065D5E863363304404A6651ED5E304840	2020-11-09 22:47:32.55269	2020-11-09 22:47:32.55269	2
561	0103000020E6100000010000000C0000003102D2BBB03304401B70B6BD5030484091D0D117BE330440C5D8757A5030484093E5D1A3C8330440826D51195030484096E0D1F7CE330440D73ED0924F30484092FFD1DBCC3304403110D6044F30484088DFD11BAB330440F8DEFDCA4D3048407D08D2579C330440EFC8EFD94D304840CAF4D1BB83330440E9992AAB4E3048401C0BD2378033044006AD16484F3048407612D2AF8F3304405C151955503048402DD8D1A39B330440B2AC5998503048403102D2BBB03304401B70B6BD50304840	2020-11-09 22:47:32.555629	2020-11-09 22:47:32.555629	2
562	0103000020E6100000010000000B0000007416F5BBB8300440B37E135E26304840AEC81C05B03004401583064826304840D9CCE135AA3004401A8676012630484042E4570AAB3004401F9242A9253048407416F5BBB8300440C795D34325304840E08EF4EAC8300440089B5D2925304840294AA58ECF3004402595B26225304840F1D09137D13004409E8EE6BA25304840C0322FBACE30044018881A132630484077777E16C83004405481D850263048407416F5BBB8300440B37E135E26304840	2020-11-09 22:47:32.558705	2020-11-09 22:47:32.558705	2
563	0103000020E6100000010000000E000000B00BE9798D2F0440BB6CD6A02330484013EFE861A52F04403D4CE903233048403EF5E8F3A92F0440EF3B21C822304840C0F2E81DAD2F0440A72BE084223048403D0FE92BAE2F0440E515263A2230484043D6E80FAC2F0440A3056CEF21304840900BE96FA62F04400C78D9BE213048403CE0E8679F2F044055F5A3B3213048405FF5E8FD902F044030007AE0213048408ACCE8CB862F04400F9E4D542230484031DAE8DF812F0440D0467EED2230484031DAE8DF812F044012573838233048400308E9BD852F04409DE4BC7723304840B00BE9798D2F0440BB6CD6A023304840	2020-11-09 22:47:32.562246	2020-11-09 22:47:32.562246	2
564	0103000020E610000001000000070000009AC6D117FF2E044083799FA0443048403AF8D1BBF12E0440B6C6E555443048408B0ED237EE2E04401761EBC74330484093EAD1A7F62E044069DA5B5043304840F5CDD18F0E2F0440EE1EB30344304840F2D2D13B082F0440928F348A443048409AC6D117FF2E044083799FA044304840	2020-11-09 22:47:32.565909	2020-11-09 22:47:32.565909	2
589	0103000020E6100000010000000A000000BDC4D173852E044067E8A3BD163048400DC6D163772E0440FBD738A7163048405600D26F6B2E0440DE8521371630484003D5D167642E04404F2318B815304840ACF7D1076A2E04404DBB1C2A153048400EF5D127862E044054B0A32215304840BEF3D137942E044040C60E39153048401600D25B9D2E0440D61D9FB0153048401BC7D13F9B2E0440D190134616304840BDC4D173852E044067E8A3BD16304840	2020-11-09 22:47:32.645941	2020-11-09 22:47:32.645941	2
590	0103000020E6100000010000000C000000A5D18AB83130044036F4AD392730484000DCF64637300440D4A6580C273048402A31D62144300440051EBACE26304840A7C169BC473004404B8722892630484070CF46234A300440B47BB2F4253048406A5502BC47300440ECB178AE25304840D951B02F4130044053BC2B88253048407F0F87DB393004401055A58C253048409F9DDE6B34300440BB8C7DBD253048402EAE876C2D30044091E6E2432630484051155AEC2B30044017D3CADC26304840A5D18AB83130044036F4AD3927304840	2020-11-09 22:47:32.64902	2020-11-09 22:47:32.64902	2
591	0103000020E610000001000000100000005CC446049B3104407B68A832333048404445E138A031044060C41E0233304840B1785476A6310440D5EFCD8332304840D54ADEEFA7310440E6877B3832304840BF47B745A4310440A97642FA31304840846555AB9D310440A2A66AD53130484043B44A2496310440DF7C49C3313048408FA80B3C8E31044008FFE4C931304840788B1A8E80310440463BD406323048406C9D27A47B310440FDACE14D32304840870A000C7B310440EEA51D9E32304840AD41A573813104402C69462D333048402506DDD28731044004E0CB5633304840AEB3D9EE8E3104402520A85A33304840690A8CBA953104404BB9D053333048405CC446049B3104407B68A83233304840	2020-11-09 22:47:32.652092	2020-11-09 22:47:32.652092	2
592	0103000020E61000000100000012000000CC19E929392E0440E05CDCDC1F30484059D4E8DF462E04409F4122921F3048400AD3E8EF542E0440FCB381701F304840E91BE9E1802E0440B9363E741F3048409A1AE9F18E2E044015A99D521F3048409EFBE80D912E0440180B27041F30484077D6E8978E2E044043B9633A1E304840F2DDE819852E04408CEFB9991D304840950AE9117E2E0440765C27691D304840E7D7E891672E0440DFC394381D304840CF14E97D3F2E04409C46513C1D3048404721E9AB2F2E0440B9D96A651D3048406FFDE8251F2E0440992B3C201E304840160BE9391A2E0440D1EFE5C01E304840F2E0E8171E2E044089AE8F611F304840450CE91F252E044097DF11E81F304840F60AE92F332E04404E6247F31F304840CC19E929392E0440E05CDCDC1F304840	2020-11-09 22:47:32.654982	2020-11-09 22:47:32.654982	2
593	0103000020E6100000010000000D000000DDE7E88D583204406046218954304840E3DDE835653204400DC5673E543048406ECCE85B7B3204403D7C548753304840F0C9E8857E320440D7EB9DF552304840BA1BE9F3793204403DD719B652304840860AE92D5E320440FE817C4D5230484005F3E8CB56320440FE817C4D5230484059D5E8D74A32044042E2A0AE52304840F720E9B341320440F410A92D5330484080CBE8893E320440CBA2E97053304840F720E9B3413204402D1D190A5430484081FAE84D4D3204403400816754304840DDE7E88D583204406046218954304840	2020-11-09 22:47:32.658227	2020-11-09 22:47:32.658227	2
594	0103000020E6100000010000000C00000065FCE8E3D630044013BD4FFF3030484073CEE8FBEB30044098C2D6F730304840EF04E941F13004407E5044C73030484024CDE80BFA300440599E4EAB2F3048409C08E9FDF830044092B494602F304840990DE9A9F230044030BA373B2F30484046E2E8A1EB300440F23C7B372F30484040ECE8F9DE300440EAA3E3942F304840B8F8E827CF3004405F773B4830304840E003E965CD30044063DEB19630304840E5E4E881CF300440EC4AAFDD3030484065FCE8E3D630044013BD4FFF30304840	2020-11-09 22:47:32.661429	2020-11-09 22:47:32.661429	2
595	0103000020E6100000010000000B000000E3BFD1131A360440FB537F23793048403DE1D1C32D360440178EAA037A30484043D7D16B3A360440F06F555D7A3048409AFDD1C747360440E0F6B1827A304840F7D0D1CF4E3604401BA431FC7930484050C3D1BB533604409F564DD178304840F7D0D1CF4E360440DF0E54437830484091F2D193303604406956E92C7830484090C3D1CF21360440DCF8CC4A78304840E3BFD1131A360440A36CD4C978304840E3BFD1131A360440FB537F2379304840	2020-11-09 22:47:32.664562	2020-11-09 22:47:32.664562	2
596	0103000020E61000000100000009000000ABFBE8997C2F0440257F869129304840400AE97FB42F0440AF7FA7E528304840C3EDE871B32F0440EB7FED9A2830484009FEE865922F0440FC7A95E727304840B6D2E85D8B2F0440087BA3D82730484085EBE8AF842F0440EA7A00FE27304840D5ECE89F762F04407F7F6F21293048407FF5E807782F0440437F296C29304840ABFBE8997C2F0440257F869129304840	2020-11-09 22:47:32.668084	2020-11-09 22:47:32.668084	2
597	0103000020E6100000010000000F000000E8CCE891073404404CD8EFAB783048400816E997013404406693287078304840ABF9E893E73304406BEFF9D67730484083D4E81DE53304408DD6408C7730484083D4E81DE53304402FB887417730484082EEE855E93304408CFB0302773048402E0CE949F5330440B1F8D1AF763048408CDFE851FC330440AEE24AB77630484067FEE82B13340440CF5E84887730484043D4E80917340440B18DC4CB77304840C0F0E817183404404D1E3A1A7830484016E8E8AF16340440AC31F3647830484017CEE877123404404CD8EFAB78304840E7E6E8C90B340440000317C678304840E8CCE891073404404CD8EFAB78304840	2020-11-09 22:47:32.671185	2020-11-09 22:47:32.671185	2
598	0103000020E6100000010000000F0000003419E92B6D340440B190A1FC73304840921BE9F782340440C614CCCF73304840F3E9E85390340440DEAE7D9B73304840C812E9859A3404405581AB27733048407516E941A2340440537AE7A47230484025E6E88DA134044076562E5A723048406F20E99995340440A1538300723048406EF1E8D586340440BD03BCC471304840EDD9E8737F34044003A286B971304840601FE9BD7134044063E1C6FC7130484011D5E8D16C3404400193C34372304840B21BE9016A3404405AA6F5957230484064D1E81565340440E5DA8B8C73304840311EE9D766340440807601DB733048403419E92B6D340440B190A1FC73304840	2020-11-09 22:47:32.67407	2020-11-09 22:47:32.67407	2
599	0103000020E6100000010000000B000000A011E9919F320440E6D0085B4B304840540BE9F5B332044096394F104B30484004DBE841B3320440BA821F774A3048402CE6E87FB1320440EBE5652C4A304840ACCEE81DAA3204403D843E124A304840740BE9FF9A320440EBE5652C4A304840F4F3E89D93320440DDC4D0424A304840EDFDE8F5863204401D46F5A34A304840E91CE9D9843204402A606BF24A3048404AEBE83592320440B774E1404B304840A011E9919F320440E6D0085B4B304840	2020-11-09 22:47:32.676843	2020-11-09 22:47:32.676843	2
600	0103000020E6100000010000000900000045FF0334AD330440360594CB77304840E648388E9A330440E92F24C277304840DCE34E90923304403266D70E773048407161F456943304402FC71A5276304840B0C4746FA33304402E72BCF3753048404F64ED31B533044015F20B1076304840E49E7CF6BE330440B11679B076304840C44B3169BB330440018BA5767730484045FF0334AD330440360594CB77304840	2020-11-09 22:47:32.679539	2020-11-09 22:47:32.679539	2
601	0103000020E6100000010000000A00000003E9D1A3362F0440388EF7C03B3048405AF5D1C73F2F04400A60899D3A30484062D1D137482F044061ADF9253A30484013D0D147562F0440F1BD8E0F3A304840BFEDD13B622F04403B8C485A3A3048406ED7D1BF652F0440CA1D35F73A304840B711D2CB592F044072461C223C3048400713D2BB4B2F04405225F24E3C3048405614D2AB3D2F044072461C223C30484003E9D1A3362F0440388EF7C03B304840	2020-11-09 22:47:32.682485	2020-11-09 22:47:32.682485	2
602	0103000020E6100000010000000C0000003CF1E8A5D8300440A451CD21233048400C0AE9F7D13004403D4CE90323304840B8F8E827CF300440F53BA8C02230484066E2E8ABD2300440F0A8AA7922304840BA0DE9B3D930044083A33F63223048401B0BE9D3F530044087363DAA223048401E06E927FC300440ACBEDDCB22304840A003E951FF300440314CDB122330484074FDE8BFFA300440795C1C562330484073CEE8FBEB300440E061007423304840E90EE999E4300440A3E44370233048403CF1E8A5D8300440A451CD2123304840	2020-11-09 22:47:32.685664	2020-11-09 22:47:32.685664	2
603	0103000020E6100000010000000B00000099D2D10F632D0440112C0454073048408DCCD187452D04400A377D5B0730484031DFD1473A2D044060BED00107304840D40BD23F332D044060094E7B0630484084DBD18B322D04406F3ED9E50530484030F9D17F3E2D0440EBCE4CE0043048408805D2A3472D0440D72F3570043048409901D2D3712D0440C945277F04304840F7D4D1DB782D0440CEFA30FE043048404DCCD173772D0440A0B10C380630484099D2D10F632D0440112C045407304840	2020-11-09 22:47:32.688448	2020-11-09 22:47:32.688448	2
604	0103000020E6100000010000000E000000E5F2E8C16F3204405A91285351304840BEFCE80F7C32044072ABAC9251304840EF12E981913204402202D4AC51304840CEE3E8B39B32044063A7364451304840CC17E923A4320440F0EAEAC850304840F903E97DA43204409F5E317E50304840220FE9BBA23204404ED2773350304840F608E9299E320440B6B2F3F34F30484075F1E8C796320440015145E14F3048406B1AE90388320440BFC801E54F304840EFE3E8BD823204405CF30C1D50304840C0E2E8D777320440DDBECEE650304840BCE7E8837132044046822B0C51304840E5F2E8C16F3204405A91285351304840	2020-11-09 22:47:32.691374	2020-11-09 22:47:32.691374	2
605	0103000020E6100000010000000D0000006F14D2C314310440B161AB350F304840BE15D2B306310440375C322E0F304840C2C7D10BFA3004407C0F78E30E30484006F2D137DD300440C19A3F840D3048405808D2B3D9300440CBFBCAEE0C30484062DFD177E8300440EECF6DC90C30484013DED187F6300440440144F60C30484074DBD1A712310440AF1CAF0C0D304840D1F7D1AB2C3104402CB6AA9A0D30484084C2D14B32310440294AA6280E3048407FFBD167343104401FE91ABE0E304840D3DDD17328310440C54B401F0F3048406F14D2C314310440B161AB350F304840	2020-11-09 22:47:32.694844	2020-11-09 22:47:32.694844	2
606	0103000020E6100000010000000B00000088E9E801242F0440CAB732DA2C3048405CE3E86F1F2F04403C40AE9A2C30484059E8E81B192F04406ACE6F102C304840810DE9911B2F0440E25672C92B304840571CE98B212F044042DF58A02B304840B4EFE893282F0440795C8EAB2B304840361CE9813A2F044052CE532E2C30484069CFE8BF382F044017C30D792C304840E3F0E879332F04406EBD5CAD2C304840E0F5E8252D2F04401435FDCE2C30484088E9E801242F0440CAB732DA2C304840	2020-11-09 22:47:32.698341	2020-11-09 22:47:32.698341	2
607	0103000020E6100000010000000B0000002617D2BBCF320440C9A46BDA7B30484025E8D1F7C0320440BCEEE3D47A30484077FED173BD3204407DCD713F7A3048402402D22FC5320440B5646AC079304840DBC7D123D13204405D7DBF66793048408BC6D133DF320440E3AECD5779304840E3D2D157E83204402F335CCF79304840E2ECD18FEC320440E0F6B1827A3048408814D2DBEB32044098E615277B30484034E9D1D3E4320440DD3396AD7B3048402617D2BBCF320440C9A46BDA7B304840	2020-11-09 22:47:32.70155	2020-11-09 22:47:32.70155	2
608	0103000020E6100000010000000A0000002C0DE9FF51300440A89869362230484005E8E8894F300440E682AFEB2130484087CBE87B4E30044063573B5621304840AFF0E8F1503004405EC43D0F21304840021CE9F957300440A241810B213048400517E94D5E300440C6C9212D21304840B400E9D161300440D15CA66C21304840B400E9D161300440100BD705223048400BDEE8315C300440E515263A223048402C0DE9FF51300440A898693622304840	2020-11-09 22:47:32.704304	2020-11-09 22:47:32.704304	2
609	0103000020E6100000010000000C000000F5E1D1CBE02F044051D4C21007304840A314D24BF72F044091DB86DA073048400AD9D14F11300440A66F9E4A083048401D04D2434A30044074076BF80730484020FFD197503004407552E871073048407410D26753300440038D73DC06304840D0CED1E34F30044012C2FE46063048401BEFD1B73F300440AF9B1A290630484055F9D12301300440AF9B1A290630484049F3D19BE32F044012C2FE4606304840F000D2AFDE2F0440038D73DC06304840F5E1D1CBE02F044051D4C21007304840	2020-11-09 22:47:32.707082	2020-11-09 22:47:32.707082	2
611	0103000020E6100000010000000D0000001D1DE961673104406D732D792A30484094CBE8073A310440FDFB4B142A3048405E1DE975353104402DFC83D8293048405E1DE9753531044069FCC98D293048400D07E9F9383104409FFC884A29304840C8DCE8CD55310440797FE82829304840D7DDE8A979310440497FB0642930484087DCE8B9873104405DFCBB9C29304840DCEDE8898A3104406479B9E32930484032E5E821893104405FF6A8392A30484033CBE8E98431044029F6E97C2A30484055E0E87F763104401DF6DB8B2A3048401D1DE961673104406D732D792A304840	2020-11-09 22:47:32.712763	2020-11-09 22:47:32.712763	2
612	0103000020E6100000010000000C000000E3FEE8B9D3300440F49EE0CA3230484077F8E8130131044041FDDCBD31304840A7DFE8C107310440AAF7C0DB3130484082CFE8D70F3104400BAAFCAC3230484000D2E8AD0C310440950BFAF332304840A4E4E86D013104408867DB58333048406D07E917EE30044076B835C533304840EDEFE8B5E630044070B8AECC333048406DD8E853DF30044002BE43B633304840BA0DE9B3D930044029D4F48133304840E8DFE8D5D5300440196D704233304840E3FEE8B9D3300440F49EE0CA32304840	2020-11-09 22:47:32.715793	2020-11-09 22:47:32.715793	2
613	0103000020E6100000010000000B000000D5DED1C3603004401C4280320530484074E1D1A34430044088A868C20430484018F4D16339300440E6194361043048401BEFD1B73F300440E859C0DA03304840CFE8D11B54300440420B91FA02304840250FD2776130044057EA25E40230484086DDD1D36E300440332183090330484092C9D1238830044029F77E9703304840E8C0D1BB8630044019CDF32C043048403115D2FF7E300440969276B304304840D5DED1C3603004401C42803205304840	2020-11-09 22:47:32.718692	2020-11-09 22:47:32.718692	2
614	0103000020E6100000010000000D00000033F0D1C71A360440B0DE32167C304840DF0DD2BB26360440DA1D0FB57B3048403DE1D1C32D36044091BA07367B304840E9FED1B739360440B5C2D5E37A30484049CDD11347360440B5C2D5E37A30484057E8D1276F36044070C8C0807B30484004ECD1E376360440361041077C304840A208D2FB5E36044066AD0FC27C30484048E7D14B4B36044086C63AA27D30484042F1D1A33E360440EAE47AE57D3048408FDDD1072636044033219E397D3048408801D2971D36044069C396BA7C30484033F0D1C71A360440B0DE32167C304840	2020-11-09 22:47:32.72253	2020-11-09 22:47:32.72253	2
615	0103000020E6100000010000000F0000004021E9B91F3004402C202C9B24304840F715E9713A30044005EAA0952330484058CAE89543300440A451CD21233048407B0EE9EF43300440624113D722304840A5FFE8F53D30044087363DAA2230484025E8E893363004401A31D293223048401A11E9CF27300440A72BE084223048409AF9E86D20300440A72BE08422304840ECF5E8B118300440D1B3079F2230484043D3E81113300440A6BE56D322304840BAF9E877073004402705B805243048403CF7E8A10A300440F00FF94824304840E519E94110300440C51A487D24304840E814E995163004406A9DE89E243048404021E9B91F3004402C202C9B24304840	2020-11-09 22:47:32.725663	2020-11-09 22:47:32.725663	2
616	0103000020E6100000010000000E0000007800E9576F33044005EF2DC0473048401C13E9176433044092FB5A4C4730484047EAE8E5593304405C6BDC7E463048409900E961563304400399ACE5453048404309E9C95733044035F1F29A453048404CCBE8015C3304401BABE76245304840A2F1E85D6933044034D78A3D45304840D2D8E80B703304406D49C048453048402BCBE8F774330440078ACB80453048405505E9F9813304401C0C693D473048405505E9F981330440E5A89B8F47304840ACE2E8597C33044005EF2DC0473048404E0FE951753304407BDE1FCF473048407800E9576F33044005EF2DC047304840	2020-11-09 22:47:32.729448	2020-11-09 22:47:32.729448	2
617	0103000020E61000000100000010000000AC11E91D8B330440E176BB327530484059E6E8158433044060967EA874304840D4EDE8977A330440566EAC347430484057D1E889793304402037C197733048407FF6E8FF7B330440018BC4507330484007EAE8D18B330440C11144CA7230484037D1E87F9233044006B00EBF72304840BAE3E835A0330440F5416BE4723048408C11E913A43304409709EF2373304840BEDEE889A6330440C614CCCF7330484012F0E859A93304405654E9BE743048400E0FE93DA7330440B472A209753048400B14E9E9A03304409BD8F03D75304840E4D4E83B9A330440CCF2905F753048405A15E9D992330440074FC66A75304840AC11E91D8B330440E176BB3275304840	2020-11-09 22:47:32.73285	2020-11-09 22:47:32.73285	2
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
-- Data for Name: lines; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.lines (id, coordinates, problem_id, topo_id, created_at, updated_at) FROM stdin;
2	[{"x":0.5025,"y":0.81},{"x":0.5088,"y":0.4483},{"x":0.5062,"y":0.2583},{"x":0.5038,"y":0.1717}]	202	447	2020-11-01 10:44:21.597867	2020-11-01 10:44:21.597867
3	[{"x":0.6225,"y":0.555},{"x":0.5375,"y":0.545},{"x":0.4425,"y":0.4783},{"x":0.3812,"y":0.3467},{"x":0.3475,"y":0.225}]	22	530	2020-11-01 10:44:21.601796	2020-11-01 10:44:21.601796
4	[{"x":0.5537,"y":0.9183},{"x":0.5125,"y":0.625},{"x":0.51,"y":0.3667},{"x":0.525,"y":0.1467}]	96	534	2020-11-01 10:44:21.610896	2020-11-01 10:44:21.610896
5	[{"x":0.655,"y":0.8717},{"x":0.7013,"y":0.675},{"x":0.6787,"y":0.4633},{"x":0.5825,"y":0.305},{"x":0.5475,"y":0.1667}]	101	538	2020-11-01 10:44:21.61397	2020-11-01 10:44:21.61397
7	[{"x":0.5413,"y":0.8017},{"x":0.5375,"y":0.5083},{"x":0.5637,"y":0.3167},{"x":0.5425,"y":0.145}]	162	270	2020-11-01 10:44:21.619984	2020-11-01 10:44:21.619984
8	[{"x":0.1195,"y":0.7212},{"x":0.0998,"y":0.5206},{"x":0.1107,"y":0.3257},{"x":0.1612,"y":0.2155}]	138	91	2020-11-01 10:44:21.623237	2020-11-01 10:44:21.623237
9	[{"x":0.2393,"y":0.8684},{"x":0.25,"y":0.466},{"x":0.2796,"y":0.2862},{"x":0.3405,"y":0.1393}]	136	113	2020-11-01 10:44:21.626211	2020-11-01 10:44:21.626211
10	[{"x":0.4161,"y":0.9156},{"x":0.4449,"y":0.682},{"x":0.5107,"y":0.3202},{"x":0.5781,"y":0.0658},{"x":0.5995,"y":0.0066}]	211	56	2020-11-01 10:44:21.629528	2020-11-01 10:44:21.629528
11	[{"x":0.176,"y":0.739},{"x":0.1801,"y":0.4605},{"x":0.19,"y":0.318},{"x":0.2525,"y":0.0691}]	216	27	2020-11-01 10:44:21.632952	2020-11-01 10:44:21.632952
12	[{"x":0.4178,"y":0.9134},{"x":0.3906,"y":0.7149},{"x":0.3577,"y":0.5219},{"x":0.3923,"y":0.3443}]	176	6	2020-11-01 10:44:21.636173	2020-11-01 10:44:21.636173
13	[{"x":0.5313,"y":0.8117},{"x":0.5212,"y":0.3883},{"x":0.5238,"y":0.18}]	38	457	2020-11-01 10:44:21.639472	2020-11-01 10:44:21.639472
14	[{"x":0.5537,"y":0.8767},{"x":0.5125,"y":0.4633},{"x":0.5375,"y":0.185},{"x":0.5387,"y":0.105}]	32	319	2020-11-01 10:44:21.642693	2020-11-01 10:44:21.642693
15	[{"x":0.4675,"y":0.855},{"x":0.4562,"y":0.4117},{"x":0.45,"y":0.08}]	98	367	2020-11-01 10:44:21.645488	2020-11-01 10:44:21.645488
18	[{"x":0.5125,"y":0.8183},{"x":0.5012,"y":0.55},{"x":0.5437,"y":0.2883},{"x":0.5563,"y":0.1233}]	78	350	2020-11-01 10:44:21.654957	2020-11-01 10:44:21.654957
19	[{"x":0.5012,"y":0.82},{"x":0.4913,"y":0.43},{"x":0.505,"y":0.21}]	9	396	2020-11-01 10:44:21.658088	2020-11-01 10:44:21.658088
20	[{"x":0.5765,"y":0.9671},{"x":0.5518,"y":0.5614},{"x":0.5411,"y":0.3662},{"x":0.5115,"y":0.1173}]	155	172	2020-11-01 10:44:21.66367	2020-11-01 10:44:21.66367
21	[{"x":0.5995,"y":0.9759},{"x":0.6012,"y":0.6272},{"x":0.6127,"y":0.477},{"x":0.5913,"y":0.3235},{"x":0.5313,"y":0.1798},{"x":0.5148,"y":0.0713}]	160	29	2020-11-01 10:44:21.666649	2020-11-01 10:44:21.666649
22	[{"x":0.4827,"y":0.9145},{"x":0.4803,"y":0.5987},{"x":0.472,"y":0.398},{"x":0.4926,"y":0.2292},{"x":0.4712,"y":0.0932}]	151	185	2020-11-01 10:44:21.669652	2020-11-01 10:44:21.669652
23	[{"x":0.4688,"y":0.852},{"x":0.449,"y":0.6042},{"x":0.4276,"y":0.4627},{"x":0.4482,"y":0.307},{"x":0.4877,"y":0.1974}]	174	30	2020-11-01 10:44:21.672783	2020-11-01 10:44:21.672783
24	[{"x":0.5132,"y":0.8002},{"x":0.5164,"y":0.5173},{"x":0.511,"y":0.3676},{"x":0.5318,"y":0.2492},{"x":0.5603,"y":0.1678}]	177	14	2020-11-01 10:44:21.67602	2020-11-01 10:44:21.67602
25	[{"x":0.3273,"y":0.8618},{"x":0.3495,"y":0.5987},{"x":0.3808,"y":0.4539},{"x":0.4161,"y":0.3443},{"x":0.4465,"y":0.1842}]	164	39	2020-11-01 10:44:21.679135	2020-11-01 10:44:21.679135
26	[{"x":0.5502,"y":0.9594},{"x":0.5789,"y":0.6469},{"x":0.6094,"y":0.4693},{"x":0.5099,"y":0.1458}]	170	38	2020-11-01 10:44:21.68232	2020-11-01 10:44:21.68232
27	[{"x":0.7344,"y":0.9145},{"x":0.6801,"y":0.6173},{"x":0.6398,"y":0.3893},{"x":0.5773,"y":0.1721}]	212	42	2020-11-01 10:44:21.685449	2020-11-01 10:44:21.685449
28	[{"x":0.5699,"y":0.9452},{"x":0.5592,"y":0.5154},{"x":0.514,"y":0.33},{"x":0.4696,"y":0.1371},{"x":0.4786,"y":0.1294}]	208	148	2020-11-01 10:44:21.68872	2020-11-01 10:44:21.68872
29	[{"x":0.3692,"y":0.7664},{"x":0.3495,"y":0.5395},{"x":0.315,"y":0.2851},{"x":0.3092,"y":0.1612},{"x":0.3224,"y":0.0998}]	217	26	2020-11-01 10:44:21.691795	2020-11-01 10:44:21.691795
30	[{"x":0.5214,"y":0.8575},{"x":0.5016,"y":0.523},{"x":0.4984,"y":0.42},{"x":0.4934,"y":0.2752},{"x":0.514,"y":0.1765}]	215	12	2020-11-01 10:44:21.694633	2020-11-01 10:44:21.694633
31	[{"x":0.2048,"y":0.9364},{"x":0.2122,"y":0.557},{"x":0.1719,"y":0.3849},{"x":0.1102,"y":0.2237},{"x":0.1209,"y":0.1173},{"x":0.1176,"y":0.0691},{"x":0.0921,"y":0.0307}]	214	9	2020-11-01 10:44:21.697485	2020-11-01 10:44:21.697485
32	[{"x":0.5748,"y":0.9145},{"x":0.5485,"y":0.4726},{"x":0.5617,"y":0.2719},{"x":0.5304,"y":0.0548}]	143	141	2020-11-01 10:44:21.700407	2020-11-01 10:44:21.700407
33	[{"x":0.5375,"y":0.8433},{"x":0.5337,"y":0.5133},{"x":0.5513,"y":0.2217},{"x":0.5587,"y":0.1083}]	188	437	2020-11-01 10:44:21.70335	2020-11-01 10:44:21.70335
35	[{"x":0.575,"y":0.7833},{"x":0.5938,"y":0.5583},{"x":0.5887,"y":0.3233},{"x":0.5587,"y":0.185},{"x":0.5025,"y":0.1017}]	62	551	2020-11-01 10:44:21.711508	2020-11-01 10:44:21.711508
36	[{"x":0.4,"y":0.8217},{"x":0.41,"y":0.495},{"x":0.45,"y":0.2333},{"x":0.4662,"y":0.1367}]	65	362	2020-11-01 10:44:21.71469	2020-11-01 10:44:21.71469
37	[{"x":0.415,"y":0.83},{"x":0.4375,"y":0.52},{"x":0.43,"y":0.1667}]	140	461	2020-11-01 10:44:21.717738	2020-11-01 10:44:21.717738
38	[{"x":0.415,"y":0.8017},{"x":0.4425,"y":0.555},{"x":0.4637,"y":0.1633}]	59	426	2020-11-01 10:44:21.720984	2020-11-01 10:44:21.720984
40	[{"x":0.4309,"y":0.8893},{"x":0.4178,"y":0.5011},{"x":0.4112,"y":0.2654},{"x":0.4317,"y":0.068}]	129	71	2020-11-01 10:44:21.727649	2020-11-01 10:44:21.727649
41	[{"x":0.591,"y":0.8783},{"x":0.5691,"y":0.5584},{"x":0.5592,"y":0.3799},{"x":0.534,"y":0.1209}]	139	92	2020-11-01 10:44:21.730939	2020-11-01 10:44:21.730939
42	[{"x":0.19,"y":0.7489},{"x":0.1982,"y":0.5746},{"x":0.2023,"y":0.4232},{"x":0.2007,"y":0.2906},{"x":0.2155,"y":0.2193}]	173	55	2020-11-01 10:44:21.734297	2020-11-01 10:44:21.734297
43	[{"x":0.6316,"y":0.8739},{"x":0.5888,"y":0.5768},{"x":0.5502,"y":0.4474},{"x":0.5502,"y":0.2895},{"x":0.5419,"y":0.0976}]	165	46	2020-11-01 10:44:21.738658	2020-11-01 10:44:21.738658
44	[{"x":0.7196,"y":0.9485},{"x":0.7007,"y":0.58},{"x":0.6785,"y":0.2774},{"x":0.662,"y":0.1217}]	210	61	2020-11-01 10:44:21.745656	2020-11-01 10:44:21.745656
46	[{"x":0.4662,"y":0.8433},{"x":0.4487,"y":0.425},{"x":0.4525,"y":0.165}]	117	351	2020-11-01 10:44:21.759363	2020-11-01 10:44:21.759363
47	[{"x":0.5212,"y":0.79},{"x":0.5238,"y":0.3683},{"x":0.5025,"y":0.1983}]	95	388	2020-11-01 10:44:21.765376	2020-11-01 10:44:21.765376
17	[{"x":0.6225,"y":0.845},{"x":0.6787,"y":0.5383},{"x":0.73,"y":0.3133},{"x":0.745,"y":0.2417}]	134	414	2020-11-01 10:44:21.651666	2020-11-03 13:00:37.650439
16	[{"x":0.41,"y":0.8933},{"x":0.3862,"y":0.5117},{"x":0.3688,"y":0.1733},{"x":0.355,"y":0.08}]	93	330	2020-11-01 10:44:21.648578	2020-11-03 13:38:26.782932
34	[{"x":0.5162,"y":0.795},{"x":0.5012,"y":0.5083},{"x":0.4888,"y":0.2833},{"x":0.4913,"y":0.2333}]	67	449	2020-11-01 10:44:21.70649	2020-11-03 13:39:53.882492
1	[{"x":0.2587,"y":0.7817},{"x":0.2562,"y":0.5633},{"x":0.255,"y":0.365}]	19	388	2020-11-01 10:44:21.59395	2020-11-03 13:40:53.578054
45	[{"x":0.5288,"y":0.8833},{"x":0.5012,"y":0.3583},{"x":0.5138,"y":0.0667}]	119	352	2020-11-01 10:44:21.752147	2020-11-03 13:51:46.665401
48	[{"x":0.5637,"y":0.8433},{"x":0.5513,"y":0.46},{"x":0.5225,"y":0.2367},{"x":0.5075,"y":0.15}]	164	344	2020-11-01 10:44:21.770008	2020-11-01 10:44:21.770008
49	[{"x":0.5012,"y":0.8467},{"x":0.4838,"y":0.515},{"x":0.4725,"y":0.285},{"x":0.4487,"y":0.1283}]	187	398	2020-11-01 10:44:21.776825	2020-11-01 10:44:21.776825
50	[{"x":0.2925,"y":0.8133},{"x":0.305,"y":0.5517},{"x":0.4725,"y":0.42},{"x":0.6275,"y":0.3583},{"x":0.6825,"y":0.28}]	58	558	2020-11-01 10:44:21.781771	2020-11-01 10:44:21.781771
52	[{"x":0.3109,"y":0.9452},{"x":0.3224,"y":0.5735},{"x":0.315,"y":0.4024},{"x":0.3454,"y":0.2204},{"x":0.3717,"y":0.0658},{"x":0.3783,"y":0.0296}]	140	166	2020-11-01 10:44:21.798236	2020-11-01 10:44:21.798236
53	[{"x":0.5658,"y":0.9748},{"x":0.5592,"y":0.6184},{"x":0.5674,"y":0.466},{"x":0.5609,"y":0.2566},{"x":0.5362,"y":0.1349},{"x":0.5197,"y":0.0307}]	141	171	2020-11-01 10:44:21.801159	2020-11-01 10:44:21.801159
54	[{"x":0.4408,"y":0.9287},{"x":0.4104,"y":0.5658},{"x":0.3717,"y":0.3542},{"x":0.3808,"y":0.0746}]	157	142	2020-11-01 10:44:21.804096	2020-11-01 10:44:21.804096
55	[{"x":0.3487,"y":0.9334},{"x":0.3618,"y":0.6299},{"x":0.4923,"y":0.5526},{"x":0.4989,"y":0.384},{"x":0.4912,"y":0.1998},{"x":0.4112,"y":0.1168}]	142	150	2020-11-01 10:44:21.807102	2020-11-01 10:44:21.807102
56	[{"x":0.2673,"y":0.8827},{"x":0.2788,"y":0.5384},{"x":0.389,"y":0.1184},{"x":0.4202,"y":0.0691}]	207	44	2020-11-01 10:44:21.810131	2020-11-01 10:44:21.810131
57	[{"x":0.2622,"y":0.7071},{"x":0.2252,"y":0.4478},{"x":0.2477,"y":0.2989},{"x":0.2667,"y":0.1765}]	175	23	2020-11-01 10:44:21.81311	2020-11-01 10:44:21.81311
58	[{"x":0.5814,"y":0.9496},{"x":0.5773,"y":0.6886},{"x":0.5921,"y":0.398},{"x":0.6283,"y":0.1107}]	119	127	2020-11-01 10:44:21.816051	2020-11-01 10:44:21.816051
59	[{"x":0.3454,"y":0.773},{"x":0.3183,"y":0.568},{"x":0.2919,"y":0.4364},{"x":0.3117,"y":0.2906},{"x":0.3561,"y":0.1952}]	19	133	2020-11-01 10:44:21.819019	2020-11-01 10:44:21.819019
60	[{"x":0.5363,"y":0.8567},{"x":0.5062,"y":0.5417},{"x":0.5513,"y":0.2167}]	13	424	2020-11-01 10:44:21.822226	2020-11-01 10:44:21.822226
61	[{"x":0.595,"y":0.83},{"x":0.5825,"y":0.56},{"x":0.545,"y":0.365},{"x":0.47,"y":0.235},{"x":0.4512,"y":0.21}]	170	365	2020-11-01 10:44:21.825386	2020-11-01 10:44:21.825386
62	[{"x":0.54,"y":0.8567},{"x":0.5225,"y":0.4867},{"x":0.52,"y":0.2633},{"x":0.5012,"y":0.1733}]	151	301	2020-11-01 10:44:21.828646	2020-11-01 10:44:21.828646
63	[{"x":0.4487,"y":0.7717},{"x":0.4813,"y":0.5317},{"x":0.5088,"y":0.3217},{"x":0.5288,"y":0.195}]	83	346	2020-11-01 10:44:21.831861	2020-11-01 10:44:21.831861
64	[{"x":0.3787,"y":0.8467},{"x":0.3588,"y":0.4217},{"x":0.405,"y":0.1433}]	490	494	2020-11-01 10:44:21.834996	2020-11-01 10:44:21.834996
65	[{"x":0.5038,"y":0.7383},{"x":0.5112,"y":0.4967},{"x":0.56,"y":0.2267}]	445	489	2020-11-01 10:44:21.838066	2020-11-01 10:44:21.838066
66	[{"x":0.25,"y":0.685},{"x":0.2725,"y":0.3567},{"x":0.265,"y":0.185}]	416	485	2020-11-01 10:44:21.841191	2020-11-01 10:44:21.841191
67	[{"x":0.48,"y":0.8533},{"x":0.4813,"y":0.375},{"x":0.48,"y":0.0867}]	446	487	2020-11-01 10:44:21.845527	2020-11-01 10:44:21.845527
68	[{"x":0.4363,"y":0.835},{"x":0.4225,"y":0.5217},{"x":0.4238,"y":0.2483}]	440	493	2020-11-01 10:44:21.848451	2020-11-01 10:44:21.848451
69	[{"x":0.5329,"y":0.9452},{"x":0.5419,"y":0.5779},{"x":0.5543,"y":0.3476},{"x":0.6234,"y":0.08}]	153	219	2020-11-01 10:44:21.851283	2020-11-01 10:44:21.851283
70	[{"x":0.5674,"y":0.8618},{"x":0.5469,"y":0.4879},{"x":0.4926,"y":0.2971},{"x":0.4679,"y":0.1886},{"x":0.4556,"y":0.0757}]	168	163	2020-11-01 10:44:21.854324	2020-11-01 10:44:21.854324
71	[{"x":0.1916,"y":0.7961},{"x":0.1612,"y":0.6173},{"x":0.111,"y":0.5},{"x":0.1283,"y":0.3476},{"x":0.1735,"y":0.2423}]	204	60	2020-11-01 10:44:21.857383	2020-11-01 10:44:21.857383
72	[{"x":0.528,"y":0.8114},{"x":0.5625,"y":0.5844},{"x":0.565,"y":0.4221},{"x":0.5732,"y":0.2456},{"x":0.5872,"y":0.1316},{"x":0.5674,"y":0.0954}]	70	49	2020-11-01 10:44:21.860194	2020-11-01 10:44:21.860194
73	[{"x":0.3865,"y":0.9156},{"x":0.3405,"y":0.5987},{"x":0.3224,"y":0.3893},{"x":0.3503,"y":0.1261},{"x":0.3651,"y":0.0954}]	44	184	2020-11-01 10:44:21.862971	2020-11-01 10:44:21.862971
75	[{"x":0.5378,"y":0.8717},{"x":0.4836,"y":0.602},{"x":0.4383,"y":0.4287},{"x":0.4539,"y":0.1272}]	130	129	2020-11-01 10:44:21.868594	2020-11-01 10:44:21.868594
76	[{"x":0.8832,"y":0.8925},{"x":0.8569,"y":0.6436},{"x":0.8479,"y":0.4452},{"x":0.7903,"y":0.2862}]	128	75	2020-11-01 10:44:21.871805	2020-11-01 10:44:21.871805
77	[{"x":0.6283,"y":0.9211},{"x":0.6439,"y":0.6491},{"x":0.7229,"y":0.4474},{"x":0.7878,"y":0.1842}]	134	99	2020-11-01 10:44:21.874944	2020-11-01 10:44:21.874944
78	[{"x":0.6028,"y":0.8596},{"x":0.5789,"y":0.5636},{"x":0.5288,"y":0.4836},{"x":0.4778,"y":0.3772},{"x":0.3783,"y":0.3553},{"x":0.3503,"y":0.3202},{"x":0.3569,"y":0.2796}]	156	149	2020-11-01 10:44:21.877896	2020-11-01 10:44:21.877896
79	[{"x":0.6456,"y":0.9101},{"x":0.6488,"y":0.6535},{"x":0.6809,"y":0.4024},{"x":0.6686,"y":0.0625}]	150	198	2020-11-01 10:44:21.880988	2020-11-01 10:44:21.880988
80	[{"x":0.3059,"y":0.9529},{"x":0.3109,"y":0.5866},{"x":0.3512,"y":0.3958},{"x":0.3462,"y":0.0384}]	159	45	2020-11-01 10:44:21.884097	2020-11-01 10:44:21.884097
81	[{"x":0.472,"y":0.9671},{"x":0.4992,"y":0.6305},{"x":0.5485,"y":0.4189},{"x":0.6291,"y":0.2752},{"x":0.6414,"y":0.1754},{"x":0.6209,"y":0.0493}]	158	40	2020-11-01 10:44:21.887144	2020-11-01 10:44:21.887144
82	[{"x":0.4326,"y":0.9254},{"x":0.4309,"y":0.5779},{"x":0.44,"y":0.4989},{"x":0.56,"y":0.4803},{"x":0.6678,"y":0.4518},{"x":0.7212,"y":0.2774},{"x":0.7286,"y":0.17},{"x":0.69,"y":0.0877}]	209	143	2020-11-01 10:44:21.890512	2020-11-01 10:44:21.890512
83	[{"x":0.3037,"y":0.8051},{"x":0.2906,"y":0.5387},{"x":0.2906,"y":0.3306},{"x":0.3454,"y":0.1538}]	203	25	2020-11-01 10:44:21.895134	2020-11-01 10:44:21.895134
84	[{"x":0.555,"y":0.7967},{"x":0.53,"y":0.5167},{"x":0.5,"y":0.305},{"x":0.4412,"y":0.1617}]	450	486	2020-11-01 10:44:21.89807	2020-11-01 10:44:21.89807
85	[{"x":0.6325,"y":0.84},{"x":0.6225,"y":0.4967},{"x":0.605,"y":0.2083},{"x":0.5913,"y":0.15}]	489	492	2020-11-01 10:44:21.900921	2020-11-01 10:44:21.900921
86	[{"x":0.4988,"y":0.8433},{"x":0.5125,"y":0.445},{"x":0.5012,"y":0.16}]	449	488	2020-11-01 10:44:21.903841	2020-11-01 10:44:21.903841
87	[{"x":0.4825,"y":0.8417},{"x":0.47,"y":0.4967},{"x":0.4675,"y":0.2483}]	444	490	2020-11-01 10:44:21.907081	2020-11-01 10:44:21.907081
88	[{"x":0.3325,"y":0.855},{"x":0.4025,"y":0.515},{"x":0.42,"y":0.325}]	399	491	2020-11-01 10:44:21.909998	2020-11-01 10:44:21.909998
89	[{"x":0.1113,"y":0.4767},{"x":0.2525,"y":0.46},{"x":0.45,"y":0.5},{"x":0.5975,"y":0.5183},{"x":0.69,"y":0.4717},{"x":0.7113,"y":0.4183}]	46	331	2020-11-01 10:44:21.913228	2020-11-01 10:44:21.913228
90	[{"x":0.375,"y":0.9539},{"x":0.3808,"y":0.6776},{"x":0.4112,"y":0.42},{"x":0.3618,"y":0.1195}]	77	4	2020-11-01 10:44:21.916197	2020-11-01 10:44:21.916197
91	[{"x":0.7785,"y":0.9178},{"x":0.7599,"y":0.5789},{"x":0.8213,"y":0.4309},{"x":0.8575,"y":0.259}]	200	10	2020-11-01 10:44:21.919043	2020-11-01 10:44:21.919043
92	[{"x":0.3882,"y":0.9561},{"x":0.3906,"y":0.5614},{"x":0.4013,"y":0.3805},{"x":0.3931,"y":0.0724}]	201	11	2020-11-01 10:44:21.922147	2020-11-01 10:44:21.922147
138	[{"x":0.5115,"y":0.932},{"x":0.5,"y":0.5998},{"x":0.4901,"y":0.3991},{"x":0.5313,"y":0.0428}]	188	17	2020-11-01 10:44:22.068884	2020-11-01 10:44:22.068884
93	[{"x":0.6291,"y":0.9375},{"x":0.6735,"y":0.7632},{"x":0.7656,"y":0.6217},{"x":0.7845,"y":0.455},{"x":0.7837,"y":0.33},{"x":0.75,"y":0.3037}]	229	13	2020-11-01 10:44:21.925207	2020-11-01 10:44:21.925207
94	[{"x":0.3339,"y":0.8542},{"x":0.3224,"y":0.6261},{"x":0.3026,"y":0.432},{"x":0.3051,"y":0.2083},{"x":0.3331,"y":0.0395}]	163	16	2020-11-01 10:44:21.928408	2020-11-01 10:44:21.928408
95	[{"x":0.4572,"y":0.7807},{"x":0.4589,"y":0.4583},{"x":0.4285,"y":0.318},{"x":0.4202,"y":0.102}]	74	19	2020-11-01 10:44:21.931545	2020-11-01 10:44:21.931545
96	[{"x":0.5351,"y":0.7813},{"x":0.5318,"y":0.5164},{"x":0.5143,"y":0.3405},{"x":0.5428,"y":0.1924},{"x":0.6294,"y":0.1209}]	161	24	2020-11-01 10:44:21.934611	2020-11-01 10:44:21.934611
97	[{"x":0.375,"y":0.9474},{"x":0.3618,"y":0.7007},{"x":0.3396,"y":0.4287},{"x":0.3725,"y":0.1524}]	202	28	2020-11-01 10:44:21.937678	2020-11-01 10:44:21.937678
98	[{"x":0.7122,"y":0.8235},{"x":0.7105,"y":0.5888},{"x":0.7418,"y":0.0779}]	61	33	2020-11-01 10:44:21.940873	2020-11-01 10:44:21.940873
99	[{"x":0.2196,"y":0.8684},{"x":0.2097,"y":0.5998},{"x":0.2196,"y":0.4057},{"x":0.2311,"y":0.193}]	59	35	2020-11-01 10:44:21.945851	2020-11-01 10:44:21.945851
100	[{"x":0.347,"y":0.92},{"x":0.3594,"y":0.648},{"x":0.4194,"y":0.1985},{"x":0.4688,"y":0.0307}]	65	37	2020-11-01 10:44:21.94954	2020-11-01 10:44:21.94954
101	[{"x":0.3479,"y":0.9386},{"x":0.3405,"y":0.6491},{"x":0.3709,"y":0.3794},{"x":0.3166,"y":0.0493}]	213	43	2020-11-01 10:44:21.952564	2020-11-01 10:44:21.952564
102	[{"x":0.4605,"y":0.8503},{"x":0.4693,"y":0.5403},{"x":0.5,"y":0.3734},{"x":0.6075,"y":0.1505}]	64	48	2020-11-01 10:44:21.955607	2020-11-01 10:44:21.955607
103	[{"x":0.2385,"y":0.8904},{"x":0.2525,"y":0.614},{"x":0.2961,"y":0.3333},{"x":0.3594,"y":0.2204},{"x":0.4046,"y":0.0647}]	198	51	2020-11-01 10:44:21.958683	2020-11-01 10:44:21.958683
104	[{"x":0.6423,"y":0.9627},{"x":0.653,"y":0.636},{"x":0.6752,"y":0.3498},{"x":0.6785,"y":0.0691}]	72	53	2020-11-01 10:44:21.961701	2020-11-01 10:44:21.961701
105	[{"x":0.7459,"y":0.8476},{"x":0.7418,"y":0.534},{"x":0.7171,"y":0.4134},{"x":0.7459,"y":0.2763},{"x":0.7155,"y":0.2029}]	239	58	2020-11-01 10:44:21.965532	2020-11-01 10:44:21.965532
106	[{"x":0.287,"y":0.8454},{"x":0.2969,"y":0.5614},{"x":0.3051,"y":0.3739},{"x":0.3742,"y":0.1239}]	98	64	2020-11-01 10:44:21.968736	2020-11-01 10:44:21.968736
107	[{"x":0.403,"y":0.92},{"x":0.4095,"y":0.6908},{"x":0.4013,"y":0.1086},{"x":0.4063,"y":0.0581}]	73	65	2020-11-01 10:44:21.971747	2020-11-01 10:44:21.971747
108	[{"x":0.4942,"y":0.9035},{"x":0.491,"y":0.6382},{"x":0.4893,"y":0.4079},{"x":0.5107,"y":0.1754}]	67	67	2020-11-01 10:44:21.974758	2020-11-01 10:44:21.974758
109	[{"x":0.6554,"y":0.8136},{"x":0.6316,"y":0.4923},{"x":0.6135,"y":0.284},{"x":0.5905,"y":0.1042}]	28	70	2020-11-01 10:44:21.977718	2020-11-01 10:44:21.977718
110	[{"x":0.6809,"y":0.8462},{"x":0.6305,"y":0.5641},{"x":0.6053,"y":0.3914},{"x":0.5735,"y":0.2253}]	115	72	2020-11-01 10:44:21.980798	2020-11-01 10:44:21.980798
111	[{"x":0.5345,"y":0.9518},{"x":0.5058,"y":0.568},{"x":0.4589,"y":0.2796},{"x":0.4498,"y":0.0154}]	116	78	2020-11-01 10:44:21.983887	2020-11-01 10:44:21.983887
112	[{"x":0.1897,"y":0.8865},{"x":0.2193,"y":0.5765},{"x":0.2719,"y":0.4063},{"x":0.3531,"y":0.2023}]	117	81	2020-11-01 10:44:21.986997	2020-11-01 10:44:21.986997
113	[{"x":0.426,"y":0.9682},{"x":0.4054,"y":0.6458},{"x":0.4786,"y":0.4221},{"x":0.5329,"y":0.2357},{"x":0.5584,"y":0.0592}]	112	86	2020-11-01 10:44:21.990151	2020-11-01 10:44:21.990151
114	[{"x":0.4811,"y":0.8805},{"x":0.491,"y":0.6305},{"x":0.5493,"y":0.2675}]	110	90	2020-11-01 10:44:21.993323	2020-11-01 10:44:21.993323
115	[{"x":0.0748,"y":0.9178},{"x":0.0863,"y":0.7237},{"x":0.1299,"y":0.5493},{"x":0.2122,"y":0.2719},{"x":0.2113,"y":0.182}]	111	93	2020-11-01 10:44:21.997572	2020-11-01 10:44:21.997572
116	[{"x":0.6785,"y":0.8871},{"x":0.6949,"y":0.6239},{"x":0.662,"y":0.4452},{"x":0.6094,"y":0.3366},{"x":0.5543,"y":0.1316}]	21	96	2020-11-01 10:44:22.000604	2020-11-01 10:44:22.000604
117	[{"x":0.0702,"y":0.6867},{"x":0.1151,"y":0.5156},{"x":0.159,"y":0.4202},{"x":0.2478,"y":0.2673},{"x":0.2763,"y":0.2549}]	135	102	2020-11-01 10:44:22.003504	2020-11-01 10:44:22.003504
118	[{"x":0.5471,"y":0.8544},{"x":0.5296,"y":0.6176},{"x":0.5011,"y":0.4753},{"x":0.5493,"y":0.148}]	121	103	2020-11-01 10:44:22.006615	2020-11-01 10:44:22.006615
119	[{"x":0.3799,"y":0.8827},{"x":0.3956,"y":0.534},{"x":0.3873,"y":0.3048},{"x":0.4137,"y":0.1765}]	36	106	2020-11-01 10:44:22.009552	2020-11-01 10:44:22.009552
120	[{"x":0.4235,"y":0.8454},{"x":0.4416,"y":0.5022},{"x":0.4408,"y":0.2697},{"x":0.4745,"y":0.0526}]	123	109	2020-11-01 10:44:22.012559	2020-11-01 10:44:22.012559
121	[{"x":0.2952,"y":0.9507},{"x":0.2722,"y":0.7259},{"x":0.4211,"y":0.5066},{"x":0.4186,"y":0.2895},{"x":0.3964,"y":0.1941},{"x":0.3339,"y":0.0241}]	245	119	2020-11-01 10:44:22.015537	2020-11-01 10:44:22.015537
122	[{"x":0.8174,"y":0.8925},{"x":0.8092,"y":0.648},{"x":0.7278,"y":0.545},{"x":0.7015,"y":0.3816},{"x":0.6891,"y":0.1886},{"x":0.6801,"y":0.1086}]	32	122	2020-11-01 10:44:22.018524	2020-11-01 10:44:22.018524
124	[{"x":0.5345,"y":0.9079},{"x":0.5419,"y":0.602},{"x":0.5724,"y":0.4507},{"x":0.6209,"y":0.2007}]	30	124	2020-11-01 10:44:22.025333	2020-11-01 10:44:22.025333
125	[{"x":0.7451,"y":0.8531},{"x":0.7064,"y":0.625},{"x":0.7344,"y":0.4737},{"x":0.7311,"y":0.3805},{"x":0.7229,"y":0.3355}]	189	3	2020-11-01 10:44:22.028353	2020-11-01 10:44:22.028353
126	[{"x":0.259,"y":0.7873},{"x":0.2706,"y":0.5493},{"x":0.264,"y":0.3015},{"x":0.2887,"y":0.1875}]	25	132	2020-11-01 10:44:22.031514	2020-11-01 10:44:22.031514
127	[{"x":0.5584,"y":0.9254},{"x":0.5699,"y":0.5504},{"x":0.5905,"y":0.3191},{"x":0.5707,"y":0.0515}]	162	5	2020-11-01 10:44:22.034684	2020-11-01 10:44:22.034684
128	[{"x":0.5584,"y":0.8443},{"x":0.5082,"y":0.5252},{"x":0.4581,"y":0.2884},{"x":0.4515,"y":0.0603}]	56	136	2020-11-01 10:44:22.037887	2020-11-01 10:44:22.037887
129	[{"x":0.4465,"y":0.9627},{"x":0.4655,"y":0.6009},{"x":0.4951,"y":0.3805},{"x":0.5099,"y":0.2511},{"x":0.537,"y":0.102}]	194	138	2020-11-01 10:44:22.041023	2020-11-01 10:44:22.041023
130	[{"x":0.5469,"y":0.9342},{"x":0.5107,"y":0.5888},{"x":0.4794,"y":0.3695},{"x":0.44,"y":0.0987}]	88	7	2020-11-01 10:44:22.045397	2020-11-01 10:44:22.045397
131	[{"x":0.3791,"y":0.9024},{"x":0.398,"y":0.5647},{"x":0.4137,"y":0.2072},{"x":0.4334,"y":0.1711},{"x":0.5197,"y":0.1491}]	94	151	2020-11-01 10:44:22.048302	2020-11-01 10:44:22.048302
132	[{"x":0.6012,"y":0.83},{"x":0.5913,"y":0.58},{"x":0.5724,"y":0.3487},{"x":0.574,"y":0.2632}]	43	156	2020-11-01 10:44:22.051281	2020-11-01 10:44:22.051281
133	[{"x":0.6143,"y":0.8816},{"x":0.5938,"y":0.4704},{"x":0.5896,"y":0.2708},{"x":0.5502,"y":0.0877}]	41	158	2020-11-01 10:44:22.054344	2020-11-01 10:44:22.054344
134	[{"x":0.4161,"y":0.9331},{"x":0.4021,"y":0.5702},{"x":0.361,"y":0.3684},{"x":0.3462,"y":0.1711},{"x":0.3536,"y":0.0932}]	197	160	2020-11-01 10:44:22.057264	2020-11-01 10:44:22.057264
135	[{"x":0.3035,"y":0.9518},{"x":0.2985,"y":0.6809},{"x":0.2969,"y":0.4989},{"x":0.2911,"y":0.4068},{"x":0.2656,"y":0.1864}]	89	15	2020-11-01 10:44:22.060092	2020-11-01 10:44:22.060092
136	[{"x":0.648,"y":0.9885},{"x":0.5307,"y":0.5683},{"x":0.4901,"y":0.3956},{"x":0.4814,"y":0.1168}]	96	162	2020-11-01 10:44:22.063068	2020-11-01 10:44:22.063068
137	[{"x":0.8158,"y":0.9419},{"x":0.8215,"y":0.614},{"x":0.7697,"y":0.5022},{"x":0.7278,"y":0.2961}]	154	165	2020-11-01 10:44:22.065884	2020-11-01 10:44:22.065884
139	[{"x":0.5011,"y":0.8618},{"x":0.5208,"y":0.6094},{"x":0.5406,"y":0.3898},{"x":0.5,"y":0.1875}]	62	18	2020-11-01 10:44:22.072202	2020-11-01 10:44:22.072202
140	[{"x":0.19,"y":0.9079},{"x":0.2179,"y":0.5877},{"x":0.241,"y":0.398},{"x":0.3191,"y":0.1864},{"x":0.4071,"y":0.1053}]	83	173	2020-11-01 10:44:22.075363	2020-11-01 10:44:22.075363
141	[{"x":0.097,"y":0.6228},{"x":0.1003,"y":0.5768},{"x":0.1094,"y":0.4134},{"x":0.153,"y":0.2061}]	196	177	2020-11-01 10:44:22.078538	2020-11-01 10:44:22.078538
142	[{"x":0.9375,"y":0.8772},{"x":0.9202,"y":0.6283},{"x":0.9104,"y":0.4167},{"x":0.8602,"y":0.1129}]	60	20	2020-11-01 10:44:22.081589	2020-11-01 10:44:22.081589
143	[{"x":0.7917,"y":0.8396},{"x":0.7357,"y":0.5173},{"x":0.6382,"y":0.3882},{"x":0.6239,"y":0.2434}]	54	178	2020-11-01 10:44:22.084514	2020-11-01 10:44:22.084514
144	[{"x":0.7393,"y":0.818},{"x":0.7229,"y":0.5186},{"x":0.7015,"y":0.3081},{"x":0.6414,"y":0.0241}]	186	181	2020-11-01 10:44:22.087526	2020-11-01 10:44:22.087526
145	[{"x":0.4397,"y":0.9071},{"x":0.4287,"y":0.5411},{"x":0.4079,"y":0.4021},{"x":0.4364,"y":0.2747}]	50	183	2020-11-01 10:44:22.091467	2020-11-01 10:44:22.091467
146	[{"x":0.5625,"y":0.8528},{"x":0.5395,"y":0.4868},{"x":0.5384,"y":0.3051},{"x":0.5318,"y":0.0831}]	87	188	2020-11-01 10:44:22.095896	2020-11-01 10:44:22.095896
147	[{"x":0.4079,"y":0.9638},{"x":0.4359,"y":0.5274},{"x":0.5033,"y":0.3004},{"x":0.5337,"y":0.1327},{"x":0.5247,"y":0.0395}]	86	194	2020-11-01 10:44:22.099142	2020-11-01 10:44:22.099142
148	[{"x":0.2928,"y":0.8421},{"x":0.3067,"y":0.5482},{"x":0.3799,"y":0.3958},{"x":0.3882,"y":0.2862},{"x":0.384,"y":0.2083},{"x":0.3775,"y":0.1228}]	144	197	2020-11-01 10:44:22.102463	2020-11-01 10:44:22.102463
149	[{"x":0.5559,"y":0.9923},{"x":0.5773,"y":0.5669},{"x":0.5913,"y":0.3213},{"x":0.6324,"y":0.1009}]	3	199	2020-11-01 10:44:22.105561	2020-11-01 10:44:22.105561
150	[{"x":0.5444,"y":0.8586},{"x":0.5263,"y":0.5987},{"x":0.5115,"y":0.3059},{"x":0.4548,"y":0.0789}]	193	202	2020-11-01 10:44:22.10881	2020-11-01 10:44:22.10881
151	[{"x":0.5263,"y":0.8695},{"x":0.5296,"y":0.5691},{"x":0.5304,"y":0.3794},{"x":0.5699,"y":0.216}]	47	205	2020-11-01 10:44:22.112505	2020-11-01 10:44:22.112505
152	[{"x":0.6176,"y":0.8936},{"x":0.5954,"y":0.5789},{"x":0.6209,"y":0.4112},{"x":0.5814,"y":0.2007}]	90	210	2020-11-01 10:44:22.115681	2020-11-01 10:44:22.115681
153	[{"x":0.443,"y":0.8725},{"x":0.4715,"y":0.5658},{"x":0.5022,"y":0.4688},{"x":0.5954,"y":0.3495},{"x":0.6272,"y":0.2689},{"x":0.5768,"y":0.2286}]	224	212	2020-11-01 10:44:22.118747	2020-11-01 10:44:22.118747
154	[{"x":0.5181,"y":0.7873},{"x":0.528,"y":0.5154},{"x":0.551,"y":0.33},{"x":0.5214,"y":0.1634}]	91	217	2020-11-01 10:44:22.122087	2020-11-01 10:44:22.122087
155	[{"x":0.364,"y":0.8396},{"x":0.341,"y":0.5107},{"x":0.3618,"y":0.338},{"x":0.4342,"y":0.1719}]	52	221	2020-11-01 10:44:22.125265	2020-11-01 10:44:22.125265
156	[{"x":0.3109,"y":0.9134},{"x":0.2648,"y":0.5625},{"x":0.2599,"y":0.3586},{"x":0.2459,"y":0.1831}]	190	223	2020-11-01 10:44:22.128482	2020-11-01 10:44:22.128482
157	[{"x":0.5329,"y":0.9408},{"x":0.4298,"y":0.5995},{"x":0.3531,"y":0.44},{"x":0.3311,"y":0.2969},{"x":0.3607,"y":0.1867},{"x":0.4375,"y":0.0946},{"x":0.4912,"y":0.0724}]	148	31	2020-11-01 10:44:22.131817	2020-11-01 10:44:22.131817
158	[{"x":0.5189,"y":0.943},{"x":0.4597,"y":0.6217},{"x":0.3512,"y":0.3882},{"x":0.2294,"y":0.0592}]	75	34	2020-11-01 10:44:22.135337	2020-11-01 10:44:22.135337
159	[{"x":0.6678,"y":0.7675},{"x":0.662,"y":0.5658},{"x":0.6291,"y":0.3893},{"x":0.69,"y":0.2478},{"x":0.69,"y":0.0779}]	71	36	2020-11-01 10:44:22.138649	2020-11-01 10:44:22.138649
160	[{"x":0.7064,"y":0.7752},{"x":0.6793,"y":0.5866},{"x":0.6817,"y":0.2675},{"x":0.6579,"y":0.0833}]	206	41	2020-11-01 10:44:22.141804	2020-11-01 10:44:22.141804
161	[{"x":0.5,"y":0.8742},{"x":0.4814,"y":0.6217},{"x":0.341,"y":0.4992},{"x":0.3026,"y":0.4079},{"x":0.3509,"y":0.259},{"x":0.4715,"y":0.1875}]	8	50	2020-11-01 10:44:22.146431	2020-11-01 10:44:22.146431
162	[{"x":0.6886,"y":0.9367},{"x":0.682,"y":0.5888},{"x":0.6195,"y":0.3964},{"x":0.6305,"y":0.2278},{"x":0.6612,"y":0.0773}]	66	52	2020-11-01 10:44:22.149611	2020-11-01 10:44:22.149611
163	[{"x":0.2738,"y":0.852},{"x":0.2837,"y":0.6195},{"x":0.3002,"y":0.5088},{"x":0.4202,"y":0.5296},{"x":0.6497,"y":0.5395},{"x":0.7286,"y":0.4397},{"x":0.7401,"y":0.2325},{"x":0.7146,"y":0.1721}]	99	54	2020-11-01 10:44:22.153023	2020-11-01 10:44:22.153023
164	[{"x":0.5633,"y":0.9496},{"x":0.5592,"y":0.5373},{"x":0.435,"y":0.3805},{"x":0.3742,"y":0.2401},{"x":0.3479,"y":0.0954},{"x":0.3372,"y":0.0318}]	238	59	2020-11-01 10:44:22.157572	2020-11-01 10:44:22.157572
165	[{"x":0.6201,"y":0.8366},{"x":0.6143,"y":0.5779},{"x":0.616,"y":0.4792},{"x":0.6612,"y":0.2796},{"x":0.6554,"y":0.2138},{"x":0.625,"y":0.1952}]	172	62	2020-11-01 10:44:22.161897	2020-11-01 10:44:22.161897
166	[{"x":0.4523,"y":0.9737},{"x":0.4433,"y":0.6086},{"x":0.4169,"y":0.4189},{"x":0.4178,"y":0.261},{"x":0.4934,"y":0.1075},{"x":0.5016,"y":0.0471}]	166	63	2020-11-01 10:44:22.166974	2020-11-01 10:44:22.166974
167	[{"x":0.4613,"y":0.9342},{"x":0.4507,"y":0.6184},{"x":0.412,"y":0.4221},{"x":0.4194,"y":0.261},{"x":0.3775,"y":0.0669}]	199	66	2020-11-01 10:44:22.171051	2020-11-01 10:44:22.171051
168	[{"x":0.4104,"y":0.9013},{"x":0.4219,"y":0.5592},{"x":0.44,"y":0.3344},{"x":0.4901,"y":0.0757}]	9	68	2020-11-01 10:44:22.174227	2020-11-01 10:44:22.174227
169	[{"x":0.5439,"y":0.9375},{"x":0.5428,"y":0.56},{"x":0.443,"y":0.4581},{"x":0.3882,"y":0.3396},{"x":0.3925,"y":0.3076}]	14	69	2020-11-01 10:44:22.177223	2020-11-01 10:44:22.177223
170	[{"x":0.3651,"y":0.909},{"x":0.3405,"y":0.5395},{"x":0.2549,"y":0.3706},{"x":0.2656,"y":0.2533},{"x":0.3363,"y":0.1338},{"x":0.3947,"y":0.0384}]	100	74	2020-11-01 10:44:22.180624	2020-11-01 10:44:22.180624
171	[{"x":0.0781,"y":0.7873},{"x":0.1086,"y":0.5658},{"x":0.1579,"y":0.4397},{"x":0.2549,"y":0.3991},{"x":0.4301,"y":0.4035},{"x":0.6776,"y":0.3618},{"x":0.8487,"y":0.3333},{"x":0.8429,"y":0.2083}]	29	76	2020-11-01 10:44:22.185105	2020-11-01 10:44:22.185105
172	[{"x":0.7681,"y":0.841},{"x":0.7887,"y":0.6678},{"x":0.8191,"y":0.568},{"x":0.8125,"y":0.5175},{"x":0.7418,"y":0.3421}]	102	79	2020-11-01 10:44:22.189831	2020-11-01 10:44:22.189831
173	[{"x":0.7664,"y":0.9079},{"x":0.7459,"y":0.5548},{"x":0.6801,"y":0.2654},{"x":0.5715,"y":0.0307}]	103	80	2020-11-01 10:44:22.193372	2020-11-01 10:44:22.193372
174	[{"x":0.0428,"y":0.5658},{"x":0.1217,"y":0.477},{"x":0.2286,"y":0.4868}]	16	82	2020-11-01 10:44:22.196629	2020-11-01 10:44:22.196629
175	[{"x":0.5181,"y":0.8509},{"x":0.4901,"y":0.5395},{"x":0.4786,"y":0.4101},{"x":0.5296,"y":0.2522},{"x":0.5995,"y":0.1228}]	107	84	2020-11-01 10:44:22.199841	2020-11-01 10:44:22.199841
176	[{"x":0.4967,"y":0.8465},{"x":0.5107,"y":0.5493},{"x":0.5419,"y":0.3914},{"x":0.5074,"y":0.1875},{"x":0.4778,"y":0.1239}]	106	85	2020-11-01 10:44:22.203449	2020-11-01 10:44:22.203449
177	[{"x":0.8141,"y":0.932},{"x":0.7393,"y":0.6393},{"x":0.5526,"y":0.5022},{"x":0.3799,"y":0.3268},{"x":0.2977,"y":0.1502}]	11	88	2020-11-01 10:44:22.209322	2020-11-01 10:44:22.209322
178	[{"x":0.4572,"y":0.9605},{"x":0.4781,"y":0.7393},{"x":0.5614,"y":0.4786},{"x":0.5691,"y":0.2368},{"x":0.4934,"y":0.1447}]	105	94	2020-11-01 10:44:22.212916	2020-11-01 10:44:22.212916
179	[{"x":0.6118,"y":0.9452},{"x":0.6044,"y":0.6064},{"x":0.611,"y":0.3717},{"x":0.5806,"y":0.1261}]	38	95	2020-11-01 10:44:22.216619	2020-11-01 10:44:22.216619
180	[{"x":0.4792,"y":0.9326},{"x":0.4605,"y":0.5518},{"x":0.477,"y":0.3166},{"x":0.4298,"y":0.0946}]	108	97	2020-11-01 10:44:22.220289	2020-11-01 10:44:22.220289
305	[{"x":0.52,"y":0.9525},{"x":0.545,"y":0.5138},{"x":0.64,"y":0.0013}]	211	255	2020-11-01 10:44:22.61618	2020-11-01 10:44:22.61618
181	[{"x":0.7771,"y":0.6787},{"x":0.7804,"y":0.4923},{"x":0.8281,"y":0.2467},{"x":0.838,"y":0.1656},{"x":0.8059,"y":0.1151}]	242	100	2020-11-01 10:44:22.223505	2020-11-01 10:44:22.223505
182	[{"x":0.4523,"y":0.9836},{"x":0.4729,"y":0.83},{"x":0.5633,"y":0.5757},{"x":0.5781,"y":0.364},{"x":0.5691,"y":0.1908},{"x":0.5337,"y":0.0373}]	243	101	2020-11-01 10:44:22.226535	2020-11-01 10:44:22.226535
183	[{"x":0.3594,"y":0.9397},{"x":0.352,"y":0.6162},{"x":0.3257,"y":0.386},{"x":0.3257,"y":0.1985},{"x":0.3536,"y":0.1469}]	109	104	2020-11-01 10:44:22.22958	2020-11-01 10:44:22.22958
184	[{"x":0.5658,"y":0.9232},{"x":0.5411,"y":0.6689},{"x":0.5206,"y":0.3991},{"x":0.4803,"y":0.0581}]	20	105	2020-11-01 10:44:22.232812	2020-11-01 10:44:22.232812
185	[{"x":0.5632,"y":0.1807},{"x":0.4645,"y":0.1842},{"x":0.4303,"y":0.486},{"x":0.2605,"y":0.5193},{"x":0.0039,"y":0.4702}]	68	176	2020-11-01 10:44:22.235817	2020-11-01 10:44:22.235817
186	[{"x":0.6472,"y":0.7873},{"x":0.6645,"y":0.4441},{"x":0.6612,"y":0.3465},{"x":0.6316,"y":0.2544},{"x":0.5946,"y":0.1579}]	137	108	2020-11-01 10:44:22.238941	2020-11-01 10:44:22.238941
187	[{"x":0.4079,"y":0.8109},{"x":0.2982,"y":0.4613},{"x":0.1316,"y":0.3692},{"x":0.1612,"y":0.3191},{"x":0.2171,"y":0.2607}]	241	110	2020-11-01 10:44:22.241939	2020-11-01 10:44:22.241939
188	[{"x":0.3026,"y":0.9452},{"x":0.3018,"y":0.6075},{"x":0.2813,"y":0.3958},{"x":0.3224,"y":0.1502}]	23	114	2020-11-01 10:44:22.244993	2020-11-01 10:44:22.244993
189	[{"x":0.4688,"y":0.9781},{"x":0.4581,"y":0.6195},{"x":0.5625,"y":0.4682},{"x":0.6028,"y":0.3015},{"x":0.5822,"y":0.17},{"x":0.5576,"y":0.0526}]	37	115	2020-11-01 10:44:22.248079	2020-11-01 10:44:22.248079
190	[{"x":0.4161,"y":0.9178},{"x":0.384,"y":0.6601},{"x":0.3544,"y":0.3947},{"x":0.3495,"y":0.1908}]	126	117	2020-11-01 10:44:22.251189	2020-11-01 10:44:22.251189
191	[{"x":0.6787,"y":0.8857},{"x":0.5757,"y":0.5115},{"x":0.3564,"y":0.4169},{"x":0.2599,"y":0.2796},{"x":0.2566,"y":0.1842},{"x":0.3059,"y":0.1538},{"x":0.3673,"y":0.1398}]	244	118	2020-11-01 10:44:22.254492	2020-11-01 10:44:22.254492
192	[{"x":0.3117,"y":0.92},{"x":0.3306,"y":0.6009},{"x":0.3791,"y":0.3651},{"x":0.3931,"y":0.1732},{"x":0.3931,"y":0.0998}]	127	120	2020-11-01 10:44:22.259146	2020-11-01 10:44:22.259146
193	[{"x":0.477,"y":0.8838},{"x":0.4975,"y":0.5252},{"x":0.5222,"y":0.3015},{"x":0.5123,"y":0.1842},{"x":0.4046,"y":0.1425},{"x":0.3939,"y":0.1118},{"x":0.4219,"y":0.0855}]	133	121	2020-11-01 10:44:22.262193	2020-11-01 10:44:22.262193
194	[{"x":0.3429,"y":0.8607},{"x":0.3602,"y":0.6283},{"x":0.3923,"y":0.4463},{"x":0.4235,"y":0.1513}]	24	123	2020-11-01 10:44:22.265198	2020-11-01 10:44:22.265198
195	[{"x":0.7577,"y":0.8306},{"x":0.6996,"y":0.509},{"x":0.6732,"y":0.3512},{"x":0.6107,"y":0.1571}]	125	125	2020-11-01 10:44:22.268128	2020-11-01 10:44:22.268128
196	[{"x":0.7336,"y":0.8717},{"x":0.7508,"y":0.5976},{"x":0.7944,"y":0.4002},{"x":0.7821,"y":0.3081},{"x":0.7467,"y":0.1952}]	131	126	2020-11-01 10:44:22.271235	2020-11-01 10:44:22.271235
197	[{"x":0.4926,"y":0.9276},{"x":0.4309,"y":0.7686},{"x":0.4383,"y":0.6184},{"x":0.4391,"y":0.3509},{"x":0.4622,"y":0.0307}]	124	130	2020-11-01 10:44:22.274406	2020-11-01 10:44:22.274406
198	[{"x":0.5641,"y":0.9945},{"x":0.5115,"y":0.591},{"x":0.347,"y":0.5154},{"x":0.2229,"y":0.4715},{"x":0.1414,"y":0.3377}]	4	135	2020-11-01 10:44:22.277782	2020-11-01 10:44:22.277782
199	[{"x":0.3734,"y":0.8564},{"x":0.3479,"y":0.58},{"x":0.3199,"y":0.4474},{"x":0.3298,"y":0.1886}]	180	137	2020-11-01 10:44:22.280947	2020-11-01 10:44:22.280947
200	[{"x":0.5748,"y":0.8333},{"x":0.5584,"y":0.6919},{"x":0.5033,"y":0.3684}]	81	139	2020-11-01 10:44:22.283967	2020-11-01 10:44:22.283967
201	[{"x":0.5008,"y":0.8618},{"x":0.5008,"y":0.5548},{"x":0.5099,"y":0.3607},{"x":0.4877,"y":0.1557}]	95	140	2020-11-01 10:44:22.286969	2020-11-01 10:44:22.286969
202	[{"x":0.8904,"y":0.5214},{"x":0.7873,"y":0.5321},{"x":0.6458,"y":0.5025},{"x":0.4287,"y":0.4786},{"x":0.2621,"y":0.4342},{"x":0.136,"y":0.3758},{"x":0.1765,"y":0.2566},{"x":0.2588,"y":0.1184}]	235	144	2020-11-01 10:44:22.290064	2020-11-01 10:44:22.290064
203	[{"x":0.7771,"y":0.7993},{"x":0.7722,"y":0.5768},{"x":0.7632,"y":0.4408},{"x":0.7755,"y":0.2917},{"x":0.7294,"y":0.182}]	220	146	2020-11-01 10:44:22.293214	2020-11-01 10:44:22.293214
204	[{"x":0.4814,"y":0.8355},{"x":0.4792,"y":0.7459},{"x":0.4868,"y":0.6036},{"x":0.3629,"y":0.5},{"x":0.3191,"y":0.3586},{"x":0.3465,"y":0.2574},{"x":0.4419,"y":0.1604}]	234	147	2020-11-01 10:44:22.296269	2020-11-01 10:44:22.296269
205	[{"x":0.8117,"y":0.7763},{"x":0.7615,"y":0.5822},{"x":0.69,"y":0.4167},{"x":0.6595,"y":0.2895},{"x":0.6176,"y":0.1634}]	195	152	2020-11-01 10:44:22.299325	2020-11-01 10:44:22.299325
206	[{"x":0.7204,"y":0.9507},{"x":0.602,"y":0.6316},{"x":0.5088,"y":0.44},{"x":0.3991,"y":0.1891},{"x":0.3333,"y":0.0962}]	5	154	2020-11-01 10:44:22.302304	2020-11-01 10:44:22.302304
207	[{"x":0.514,"y":0.9901},{"x":0.5,"y":0.8311},{"x":0.4704,"y":0.6612},{"x":0.301,"y":0.6107},{"x":0.1217,"y":0.5395},{"x":0.0732,"y":0.4046}]	57	155	2020-11-01 10:44:22.306792	2020-11-01 10:44:22.306792
208	[{"x":0.6206,"y":0.9786},{"x":0.5932,"y":0.5699},{"x":0.6184,"y":0.4309},{"x":0.727,"y":0.3199},{"x":0.8103,"y":0.2714}]	7	157	2020-11-01 10:44:22.310058	2020-11-01 10:44:22.310058
209	[{"x":0.3602,"y":0.8805},{"x":0.3059,"y":0.67},{"x":0.273,"y":0.5548},{"x":0.2081,"y":0.3925},{"x":0.1982,"y":0.148},{"x":0.2113,"y":0.0044}]	69	159	2020-11-01 10:44:22.31302	2020-11-01 10:44:22.31302
210	[{"x":0.7607,"y":0.7061},{"x":0.7747,"y":0.5537},{"x":0.8281,"y":0.3651},{"x":0.8446,"y":0.1996},{"x":0.8026,"y":0.1447}]	183	161	2020-11-01 10:44:22.316018	2020-11-01 10:44:22.316018
211	[{"x":0.259,"y":0.9561},{"x":0.2582,"y":0.7379},{"x":0.2681,"y":0.6075},{"x":0.3084,"y":0.4287},{"x":0.3824,"y":0.2971}]	82	164	2020-11-01 10:44:22.318952	2020-11-01 10:44:22.318952
212	[{"x":0.0724,"y":0.6853},{"x":0.199,"y":0.5296},{"x":0.2829,"y":0.5044},{"x":0.3947,"y":0.5044},{"x":0.5058,"y":0.5175},{"x":0.6546,"y":0.511},{"x":0.7928,"y":0.5219},{"x":0.8923,"y":0.4934},{"x":0.9441,"y":0.5099},{"x":0.9605,"y":0.5329}]	236	168	2020-11-01 10:44:22.322067	2020-11-01 10:44:22.322067
213	[{"x":0.6998,"y":0.9331},{"x":0.6891,"y":0.511},{"x":0.7023,"y":0.2785},{"x":0.7113,"y":0.1107},{"x":0.6867,"y":0.0614}]	223	170	2020-11-01 10:44:22.32533	2020-11-01 10:44:22.32533
214	[{"x":0.4868,"y":0.9145},{"x":0.4803,"y":0.5471},{"x":0.491,"y":0.364},{"x":0.5715,"y":0.1173}]	97	174	2020-11-01 10:44:22.328504	2020-11-01 10:44:22.328504
215	[{"x":0.4934,"y":0.6469},{"x":0.4942,"y":0.557},{"x":0.477,"y":0.4792},{"x":0.4671,"y":0.3421},{"x":0.4153,"y":0.1601},{"x":0.3988,"y":0.0844}]	182	175	2020-11-01 10:44:22.331532	2020-11-01 10:44:22.331532
216	[{"x":0.5156,"y":0.9309},{"x":0.5099,"y":0.4583},{"x":0.4885,"y":0.2204},{"x":0.4811,"y":0.1217},{"x":0.5296,"y":0.0592}]	192	179	2020-11-01 10:44:22.334574	2020-11-01 10:44:22.334574
217	[{"x":0.4829,"y":0.7614},{"x":0.4921,"y":0.7561},{"x":0.5276,"y":0.7263},{"x":0.5395,"y":0.6947},{"x":0.5447,"y":0.6509},{"x":0.5592,"y":0.6158},{"x":0.5961,"y":0.5579},{"x":0.6079,"y":0.5439},{"x":0.6237,"y":0.4561},{"x":0.6211,"y":0.3579},{"x":0.6079,"y":0.2667},{"x":0.5789,"y":0.1614},{"x":0.5645,"y":0.1053}]	230	211	2020-11-01 10:44:22.337592	2020-11-01 10:44:22.337592
218	[{"x":0.7961,"y":0.5053},{"x":0.7316,"y":0.4526},{"x":0.6711,"y":0.414},{"x":0.5737,"y":0.414},{"x":0.4474,"y":0.4123},{"x":0.3461,"y":0.4263},{"x":0.2671,"y":0.4719},{"x":0.1724,"y":0.4702},{"x":0.1395,"y":0.4193},{"x":0.1592,"y":0.4}]	231	216	2020-11-01 10:44:22.340815	2020-11-01 10:44:22.340815
304	[{"x":0.1713,"y":0.9617},{"x":0.2537,"y":0.5},{"x":0.5475,"y":0.3883},{"x":0.7087,"y":0.3717},{"x":0.805,"y":0.16}]	209	228	2020-11-01 10:44:22.613304	2020-11-01 10:44:22.613304
219	[{"x":0.0222,"y":0.7818},{"x":0.0781,"y":0.5855},{"x":0.1793,"y":0.4605},{"x":0.2508,"y":0.4101},{"x":0.352,"y":0.4287},{"x":0.5016,"y":0.4309},{"x":0.5896,"y":0.2686},{"x":0.5699,"y":0.1601}]	1	1	2020-11-01 10:44:22.343949	2020-11-01 10:44:22.343949
220	[{"x":0.491,"y":0.8805},{"x":0.4901,"y":0.6502},{"x":0.4696,"y":0.4079},{"x":0.4819,"y":0.0877}]	63	2	2020-11-01 10:44:22.347093	2020-11-01 10:44:22.347093
221	[{"x":0.3651,"y":0.8761},{"x":0.3898,"y":0.5482},{"x":0.3577,"y":0.352},{"x":0.4227,"y":0.2796},{"x":0.4622,"y":0.1875},{"x":0.4671,"y":0.1096}]	228	8	2020-11-01 10:44:22.350174	2020-11-01 10:44:22.350174
222	[{"x":0.0288,"y":0.7599},{"x":0.0535,"y":0.5844},{"x":0.1316,"y":0.5493},{"x":0.2492,"y":0.5208},{"x":0.3906,"y":0.5033},{"x":0.5214,"y":0.5186},{"x":0.6209,"y":0.4879},{"x":0.6414,"y":0.3355},{"x":0.6694,"y":0.1897}]	48	21	2020-11-01 10:44:22.354795	2020-11-01 10:44:22.354795
223	[{"x":0.44,"y":0.9046},{"x":0.4161,"y":0.6458},{"x":0.2516,"y":0.659},{"x":0.1143,"y":0.6382},{"x":0.0419,"y":0.5274},{"x":0.0238,"y":0.3925},{"x":0.0855,"y":0.3114},{"x":0.1669,"y":0.216}]	149	22	2020-11-01 10:44:22.358018	2020-11-01 10:44:22.358018
224	[{"x":0.625,"y":0.8465},{"x":0.5913,"y":0.568},{"x":0.5715,"y":0.3509},{"x":0.528,"y":0.0658}]	49	32	2020-11-01 10:44:22.361036	2020-11-01 10:44:22.361036
225	[{"x":0.3569,"y":0.8553},{"x":0.3692,"y":0.7259},{"x":0.2878,"y":0.6853},{"x":0.2253,"y":0.5197},{"x":0.199,"y":0.3849},{"x":0.2039,"y":0.2697},{"x":0.2212,"y":0.205},{"x":0.2549,"y":0.1524}]	205	57	2020-11-01 10:44:22.363854	2020-11-01 10:44:22.363854
226	[{"x":0.1678,"y":0.8169},{"x":0.213,"y":0.614},{"x":0.2706,"y":0.5461},{"x":0.4211,"y":0.5362},{"x":0.5222,"y":0.4298},{"x":0.6192,"y":0.1524}]	2	182	2020-11-01 10:44:22.366738	2020-11-01 10:44:22.366738
227	[{"x":0.5411,"y":0.9243},{"x":0.5304,"y":0.5186},{"x":0.5016,"y":0.307},{"x":0.4934,"y":0.1217}]	93	187	2020-11-01 10:44:22.369633	2020-11-01 10:44:22.369633
228	[{"x":0.6965,"y":0.818},{"x":0.7072,"y":0.5296},{"x":0.7664,"y":0.3607},{"x":0.7854,"y":0.2204},{"x":0.7541,"y":0.182}]	179	189	2020-11-01 10:44:22.373017	2020-11-01 10:44:22.373017
229	[{"x":0.8838,"y":0.5},{"x":0.761,"y":0.5247},{"x":0.4496,"y":0.5263},{"x":0.3169,"y":0.4457},{"x":0.2884,"y":0.315},{"x":0.3553,"y":0.2253}]	227	190	2020-11-01 10:44:22.376246	2020-11-01 10:44:22.376246
230	[{"x":0.7917,"y":0.9038},{"x":0.7368,"y":0.6192},{"x":0.6217,"y":0.4268},{"x":0.5943,"y":0.2714},{"x":0.5746,"y":0.1735},{"x":0.5713,"y":0.0518}]	226	193	2020-11-01 10:44:22.379428	2020-11-01 10:44:22.379428
231	[{"x":0.2442,"y":0.9002},{"x":0.2401,"y":0.6886},{"x":0.2393,"y":0.5899},{"x":0.338,"y":0.4912},{"x":0.5189,"y":0.5044},{"x":0.7401,"y":0.5548},{"x":0.8717,"y":0.4726},{"x":0.8808,"y":0.3618},{"x":0.8413,"y":0.17}]	178	195	2020-11-01 10:44:22.382511	2020-11-01 10:44:22.382511
232	[{"x":0.7023,"y":0.8706},{"x":0.6628,"y":0.5504},{"x":0.7007,"y":0.3882},{"x":0.7023,"y":0.3015},{"x":0.6513,"y":0.2292},{"x":0.6176,"y":0.1524},{"x":0.6135,"y":0.1075}]	92	196	2020-11-01 10:44:22.385632	2020-11-01 10:44:22.385632
233	[{"x":0.3824,"y":0.9627},{"x":0.3503,"y":0.5581},{"x":0.4169,"y":0.3454},{"x":0.4613,"y":0.0329}]	51	200	2020-11-01 10:44:22.388842	2020-11-01 10:44:22.388842
234	[{"x":0.4457,"y":0.9671},{"x":0.4038,"y":0.5866},{"x":0.3906,"y":0.3673},{"x":0.3183,"y":0.1557},{"x":0.3067,"y":0.0636}]	187	201	2020-11-01 10:44:22.392008	2020-11-01 10:44:22.392008
235	[{"x":0.4334,"y":0.8838},{"x":0.4021,"y":0.5406},{"x":0.3289,"y":0.2577},{"x":0.3495,"y":0.1162},{"x":0.3742,"y":0.0296}]	185	203	2020-11-01 10:44:22.395187	2020-11-01 10:44:22.395187
236	[{"x":0.4748,"y":0.9391},{"x":0.4496,"y":0.5543},{"x":0.511,"y":0.4021},{"x":0.5735,"y":0.2459},{"x":0.5987,"y":0.1464},{"x":0.5669,"y":0.0913}]	191	204	2020-11-01 10:44:22.39821	2020-11-01 10:44:22.39821
237	[{"x":0.102,"y":0.8432},{"x":0.1694,"y":0.4868},{"x":0.3528,"y":0.5011},{"x":0.5666,"y":0.5143},{"x":0.7138,"y":0.4989},{"x":0.8322,"y":0.4518},{"x":0.9038,"y":0.4123}]	53	206	2020-11-01 10:44:22.402506	2020-11-01 10:44:22.402506
238	[{"x":0.6382,"y":0.8246},{"x":0.6299,"y":0.5603},{"x":0.6488,"y":0.4693},{"x":0.759,"y":0.4485},{"x":0.8701,"y":0.4221},{"x":0.903,"y":0.318},{"x":0.9235,"y":0.3103}]	84	209	2020-11-01 10:44:22.405611	2020-11-01 10:44:22.405611
239	[{"x":0.6349,"y":0.9112},{"x":0.6086,"y":0.5702},{"x":0.5724,"y":0.3838},{"x":0.5313,"y":0.1974},{"x":0.4663,"y":0.0537}]	218	213	2020-11-01 10:44:22.408693	2020-11-01 10:44:22.408693
240	[{"x":0.3561,"y":0.9331},{"x":0.3676,"y":0.5526},{"x":0.2804,"y":0.3893},{"x":0.264,"y":0.2445},{"x":0.3035,"y":0.1897}]	219	214	2020-11-01 10:44:22.411541	2020-11-01 10:44:22.411541
241	[{"x":0.4482,"y":0.9287},{"x":0.4564,"y":0.5208},{"x":0.4704,"y":0.3684},{"x":0.5329,"y":0.1217}]	147	220	2020-11-01 10:44:22.414356	2020-11-01 10:44:22.414356
242	[{"x":0.2325,"y":0.9169},{"x":0.318,"y":0.5444},{"x":0.3607,"y":0.4589},{"x":0.489,"y":0.491},{"x":0.6634,"y":0.4416},{"x":0.7511,"y":0.3586},{"x":0.7204,"y":0.2845},{"x":0.659,"y":0.2245}]	46	222	2020-11-01 10:44:22.417232	2020-11-01 10:44:22.417232
243	[{"x":0.443,"y":0.5765},{"x":0.4726,"y":0.5123},{"x":0.5439,"y":0.236},{"x":0.5384,"y":0.0757}]	184	224	2020-11-01 10:44:22.420581	2020-11-01 10:44:22.420581
244	[{"x":0.4112,"y":0.9671},{"x":0.3832,"y":0.5417},{"x":0.3487,"y":0.3224},{"x":0.3668,"y":0.1754},{"x":0.3758,"y":0.1031}]	114	73	2020-11-01 10:44:22.423792	2020-11-01 10:44:22.423792
245	[{"x":0.7664,"y":0.9496},{"x":0.7541,"y":0.6031},{"x":0.676,"y":0.1952}]	17	77	2020-11-01 10:44:22.426896	2020-11-01 10:44:22.426896
246	[{"x":0.7179,"y":0.7971},{"x":0.6933,"y":0.6075},{"x":0.6299,"y":0.4364},{"x":0.5888,"y":0.2818},{"x":0.5995,"y":0.0866}]	113	83	2020-11-01 10:44:22.429977	2020-11-01 10:44:22.429977
247	[{"x":0.5938,"y":0.8706},{"x":0.5707,"y":0.5998},{"x":0.5724,"y":0.3662},{"x":0.5189,"y":0.2237}]	13	87	2020-11-01 10:44:22.432877	2020-11-01 10:44:22.432877
248	[{"x":0.5987,"y":0.9046},{"x":0.6162,"y":0.685},{"x":0.5987,"y":0.5313},{"x":0.5011,"y":0.4391},{"x":0.3684,"y":0.3692},{"x":0.3344,"y":0.2763},{"x":0.3366,"y":0.2196},{"x":0.3509,"y":0.1785}]	104	89	2020-11-01 10:44:22.43581	2020-11-01 10:44:22.43581
249	[{"x":0.4071,"y":0.9189},{"x":0.3939,"y":0.6086},{"x":0.4063,"y":0.455},{"x":0.3183,"y":0.3268},{"x":0.3092,"y":0.1941}]	120	98	2020-11-01 10:44:22.438964	2020-11-01 10:44:22.438964
250	[{"x":0.6571,"y":0.9002},{"x":0.5921,"y":0.5296},{"x":0.4893,"y":0.4123},{"x":0.4087,"y":0.2664},{"x":0.4087,"y":0.1623},{"x":0.426,"y":0.1261}]	22	107	2020-11-01 10:44:22.442162	2020-11-01 10:44:22.442162
251	[{"x":0.2541,"y":0.9189},{"x":0.2467,"y":0.6151},{"x":0.2697,"y":0.4518},{"x":0.3207,"y":0.3333},{"x":0.3799,"y":0.205},{"x":0.4441,"y":0.1371},{"x":0.5288,"y":0.0921}]	122	112	2020-11-01 10:44:22.445359	2020-11-01 10:44:22.445359
252	[{"x":0.3454,"y":0.9145},{"x":0.3339,"y":0.5219},{"x":0.3561,"y":0.2862},{"x":0.3832,"y":0.1228}]	132	116	2020-11-01 10:44:22.449775	2020-11-01 10:44:22.449775
253	[{"x":0.4235,"y":0.9507},{"x":0.4227,"y":0.5998},{"x":0.4441,"y":0.3542},{"x":0.4482,"y":0.1393}]	118	128	2020-11-01 10:44:22.452689	2020-11-01 10:44:22.452689
254	[{"x":0.3668,"y":0.9101},{"x":0.3618,"y":0.6985},{"x":0.278,"y":0.5515},{"x":0.25,"y":0.3772},{"x":0.2442,"y":0.2478},{"x":0.3035,"y":0.0417}]	31	131	2020-11-01 10:44:22.45585	2020-11-01 10:44:22.45585
255	[{"x":0.6924,"y":0.7456},{"x":0.69,"y":0.4485},{"x":0.6308,"y":0.3169},{"x":0.5247,"y":0.261}]	42	134	2020-11-01 10:44:22.458836	2020-11-01 10:44:22.458836
256	[{"x":0.4087,"y":0.9638},{"x":0.4408,"y":0.6557},{"x":0.5214,"y":0.5362},{"x":0.5321,"y":0.3629},{"x":0.4712,"y":0.2423},{"x":0.2673,"y":0.1283},{"x":0.2549,"y":0.0779},{"x":0.2673,"y":0.057}]	221	145	2020-11-01 10:44:22.461702	2020-11-01 10:44:22.461702
257	[{"x":0.8972,"y":0.5011},{"x":0.838,"y":0.4748},{"x":0.7352,"y":0.4507},{"x":0.6612,"y":0.4627},{"x":0.5181,"y":0.4287},{"x":0.4301,"y":0.409},{"x":0.347,"y":0.3618},{"x":0.1933,"y":0.3586},{"x":0.1012,"y":0.3816},{"x":0.051,"y":0.3794}]	222	167	2020-11-01 10:44:22.464614	2020-11-01 10:44:22.464614
258	[{"x":0.3465,"y":0.8446},{"x":0.3355,"y":0.6645},{"x":0.432,"y":0.537},{"x":0.4254,"y":0.4375},{"x":0.352,"y":0.3742},{"x":0.3125,"y":0.2632},{"x":0.3465,"y":0.1785}]	237	169	2020-11-01 10:44:22.46767	2020-11-01 10:44:22.46767
259	[{"x":0.4153,"y":0.8662},{"x":0.4095,"y":0.545},{"x":0.4013,"y":0.4057},{"x":0.3997,"y":0.2785},{"x":0.4276,"y":0.1809}]	78	180	2020-11-01 10:44:22.470965	2020-11-01 10:44:22.470965
260	[{"x":0.5633,"y":0.8333},{"x":0.5559,"y":0.58},{"x":0.5206,"y":0.4035},{"x":0.5049,"y":0.25},{"x":0.5082,"y":0.17}]	145	186	2020-11-01 10:44:22.474067	2020-11-01 10:44:22.474067
261	[{"x":0.5313,"y":0.9364},{"x":0.5748,"y":0.5768},{"x":0.6743,"y":0.4605},{"x":0.7204,"y":0.2818},{"x":0.7056,"y":0.1952}]	233	191	2020-11-01 10:44:22.477255	2020-11-01 10:44:22.477255
262	[{"x":0.1689,"y":0.8766},{"x":0.1941,"y":0.7607},{"x":0.2412,"y":0.7056},{"x":0.4375,"y":0.6801},{"x":0.5735,"y":0.588},{"x":0.5318,"y":0.4589},{"x":0.3706,"y":0.3717},{"x":0.2478,"y":0.3059},{"x":0.2434,"y":0.2525},{"x":0.3279,"y":0.1842}]	232	192	2020-11-01 10:44:22.480287	2020-11-01 10:44:22.480287
263	[{"x":0.9424,"y":0.545},{"x":0.8355,"y":0.5603},{"x":0.7245,"y":0.5296},{"x":0.5979,"y":0.5263},{"x":0.4737,"y":0.545},{"x":0.3865,"y":0.6031},{"x":0.2837,"y":0.5877},{"x":0.1711,"y":0.5362},{"x":0.0896,"y":0.5373},{"x":0.0559,"y":0.5504}]	146	207	2020-11-01 10:44:22.483405	2020-11-01 10:44:22.483405
264	[{"x":0.3363,"y":0.9046},{"x":0.3692,"y":0.6634},{"x":0.4729,"y":0.5625},{"x":0.5411,"y":0.4474},{"x":0.5403,"y":0.1678},{"x":0.5321,"y":0.1305}]	152	208	2020-11-01 10:44:22.48657	2020-11-01 10:44:22.48657
265	[{"x":0.7327,"y":0.9836},{"x":0.7007,"y":0.6502},{"x":0.5798,"y":0.5768},{"x":0.3906,"y":0.5055},{"x":0.3224,"y":0.3728},{"x":0.3051,"y":0.2412},{"x":0.3092,"y":0.1711},{"x":0.4219,"y":0.045}]	85	218	2020-11-01 10:44:22.48978	2020-11-01 10:44:22.48978
266	[{"x":0.59,"y":0.9137},{"x":0.5133,"y":0.5275},{"x":0.3567,"y":0.3},{"x":0.41,"y":0.15}]	165	238	2020-11-01 10:44:22.493097	2020-11-01 10:44:22.493097
267	[{"x":0.475,"y":0.7137},{"x":0.4367,"y":0.415},{"x":0.5367,"y":0.1613}]	177	236	2020-11-01 10:44:22.497392	2020-11-01 10:44:22.497392
268	[{"x":0.555,"y":0.8013},{"x":0.49,"y":0.4525},{"x":0.315,"y":0.1963},{"x":0.285,"y":0.075}]	164	239	2020-11-01 10:44:22.500373	2020-11-01 10:44:22.500373
269	[{"x":0.6267,"y":0.9637},{"x":0.5033,"y":0.5025},{"x":0.5283,"y":0.03}]	138	235	2020-11-01 10:44:22.503282	2020-11-01 10:44:22.503282
270	[{"x":0.5717,"y":0.9263},{"x":0.5533,"y":0.4075},{"x":0.5267,"y":0.1212}]	128	234	2020-11-01 10:44:22.506492	2020-11-01 10:44:22.506492
271	[{"x":0.5,"y":0.8862},{"x":0.4217,"y":0.5525},{"x":0.5317,"y":0.34},{"x":0.5333,"y":0.0425}]	136	248	2020-11-01 10:44:22.509376	2020-11-01 10:44:22.509376
272	[{"x":0.52,"y":0.9175},{"x":0.4533,"y":0.6262},{"x":0.5667,"y":0.07}]	207	258	2020-11-01 10:44:22.512201	2020-11-01 10:44:22.512201
273	[{"x":0.6517,"y":0.98},{"x":0.5933,"y":0.695},{"x":0.5083,"y":0.525},{"x":0.4917,"y":0.2762},{"x":0.5183,"y":0.0475}]	217	264	2020-11-01 10:44:22.515051	2020-11-01 10:44:22.515051
274	[{"x":0.625,"y":0.85},{"x":0.68,"y":0.415},{"x":0.4483,"y":0.1537}]	170	241	2020-11-01 10:44:22.517913	2020-11-01 10:44:22.517913
275	[{"x":0.6167,"y":0.9125},{"x":0.565,"y":0.545},{"x":0.4217,"y":0.09}]	203	245	2020-11-01 10:44:22.520901	2020-11-01 10:44:22.520901
276	[{"x":0.5817,"y":0.9337},{"x":0.5467,"y":0.4487},{"x":0.4283,"y":0.0638}]	210	262	2020-11-01 10:44:22.523964	2020-11-01 10:44:22.523964
277	[{"x":0.53,"y":0.9063},{"x":0.5267,"y":0.4462},{"x":0.5817,"y":0.0862}]	168	251	2020-11-01 10:44:22.527003	2020-11-01 10:44:22.527003
278	[{"x":0.6117,"y":0.89},{"x":0.4833,"y":0.5387},{"x":0.4883,"y":0.4437},{"x":0.5483,"y":0.2},{"x":0.5733,"y":0.1212}]	169	246	2020-11-01 10:44:22.529944	2020-11-01 10:44:22.529944
279	[{"x":0.6867,"y":0.895},{"x":0.5967,"y":0.53},{"x":0.415,"y":0.0725}]	212	226	2020-11-01 10:44:22.533028	2020-11-01 10:44:22.533028
280	[{"x":0.595,"y":0.8962},{"x":0.52,"y":0.4288},{"x":0.535,"y":0.0712}]	215	232	2020-11-01 10:44:22.536011	2020-11-01 10:44:22.536011
281	[{"x":0.4817,"y":0.805},{"x":0.52,"y":0.3538},{"x":0.4617,"y":0.1537}]	151	230	2020-11-01 10:44:22.53923	2020-11-01 10:44:22.53923
282	[{"x":0.5467,"y":0.8975},{"x":0.4967,"y":0.3937},{"x":0.46,"y":0.0712}]	141	253	2020-11-01 10:44:22.544339	2020-11-01 10:44:22.544339
283	[{"x":0.5683,"y":0.87},{"x":0.565,"y":0.46},{"x":0.53,"y":0.155}]	150	260	2020-11-01 10:44:22.547372	2020-11-01 10:44:22.547372
284	[{"x":0.4867,"y":0.8575},{"x":0.4317,"y":0.4113},{"x":0.575,"y":0.1537}]	159	240	2020-11-01 10:44:22.550205	2020-11-01 10:44:22.550205
285	[{"x":0.515,"y":0.8825},{"x":0.4717,"y":0.6312},{"x":0.555,"y":0.37},{"x":0.6317,"y":0.0988}]	216	254	2020-11-01 10:44:22.55302	2020-11-01 10:44:22.55302
286	[{"x":0.5583,"y":0.845},{"x":0.48,"y":0.5425},{"x":0.6267,"y":0.2762},{"x":0.645,"y":0.1363}]	158	247	2020-11-01 10:44:22.556049	2020-11-01 10:44:22.556049
287	[{"x":0.4567,"y":0.7638},{"x":0.51,"y":0.5313},{"x":0.6467,"y":0.41},{"x":0.755,"y":0.3362},{"x":0.7917,"y":0.2062}]	175	263	2020-11-01 10:44:22.558995	2020-11-01 10:44:22.558995
288	[{"x":0.52,"y":0.8712},{"x":0.475,"y":0.6225},{"x":0.4467,"y":0.4662},{"x":0.5617,"y":0.3725},{"x":0.575,"y":0.1963}]	174	225	2020-11-01 10:44:22.561934	2020-11-01 10:44:22.561934
289	[{"x":0.3767,"y":0.8475},{"x":0.4067,"y":0.5363},{"x":0.4233,"y":0.1313}]	173	233	2020-11-01 10:44:22.564968	2020-11-01 10:44:22.564968
290	[{"x":0.5967,"y":0.8488},{"x":0.63,"y":0.4425},{"x":0.5083,"y":0.265},{"x":0.4617,"y":0.0638}]	160	237	2020-11-01 10:44:22.568662	2020-11-01 10:44:22.568662
291	[{"x":0.5633,"y":0.8125},{"x":0.5733,"y":0.5112},{"x":0.4417,"y":0.195}]	157	250	2020-11-01 10:44:22.572244	2020-11-01 10:44:22.572244
292	[{"x":0.5133,"y":0.8688},{"x":0.5083,"y":0.5075},{"x":0.475,"y":0.15}]	155	261	2020-11-01 10:44:22.575623	2020-11-01 10:44:22.575623
293	[{"x":0.525,"y":0.9087},{"x":0.5783,"y":0.415},{"x":0.5033,"y":0.1837},{"x":0.5633,"y":0.085}]	214	227	2020-11-01 10:44:22.578584	2020-11-01 10:44:22.578584
294	[{"x":0.605,"y":0.8413},{"x":0.6733,"y":0.5925},{"x":0.5917,"y":0.395},{"x":0.4317,"y":0.28},{"x":0.275,"y":0.1837}]	156	256	2020-11-01 10:44:22.581798	2020-11-01 10:44:22.581798
295	[{"x":0.5067,"y":0.93},{"x":0.4033,"y":0.4738},{"x":0.555,"y":0.1087}]	153	229	2020-11-01 10:44:22.584966	2020-11-01 10:44:22.584966
296	[{"x":0.4883,"y":0.9675},{"x":0.4417,"y":0.4763},{"x":0.53,"y":0.2687},{"x":0.4667,"y":0.07}]	140	257	2020-11-01 10:44:22.588244	2020-11-01 10:44:22.588244
297	[{"x":0.4233,"y":0.9475},{"x":0.4633,"y":0.675},{"x":0.64,"y":0.3825},{"x":0.675,"y":0.055}]	142	244	2020-11-01 10:44:22.591547	2020-11-01 10:44:22.591547
298	[{"x":0.6017,"y":0.9337},{"x":0.555,"y":0.2637},{"x":0.5333,"y":0.0425}]	139	242	2020-11-01 10:44:22.595873	2020-11-01 10:44:22.595873
299	[{"x":0.435,"y":0.965},{"x":0.4867,"y":0.6188},{"x":0.6833,"y":0.37},{"x":0.7133,"y":0.12}]	134	249	2020-11-01 10:44:22.598941	2020-11-01 10:44:22.598941
300	[{"x":0.56,"y":0.88},{"x":0.5233,"y":0.37},{"x":0.5033,"y":0.0612}]	129	243	2020-11-01 10:44:22.601813	2020-11-01 10:44:22.601813
301	[{"x":0.57,"y":0.8475},{"x":0.5883,"y":0.6238},{"x":0.4417,"y":0.4075},{"x":0.43,"y":0.1812}]	130	252	2020-11-01 10:44:22.604833	2020-11-01 10:44:22.604833
302	[{"x":0.5733,"y":0.8688},{"x":0.34,"y":0.4288},{"x":0.4483,"y":0.1225}]	204	259	2020-11-01 10:44:22.607711	2020-11-01 10:44:22.607711
303	[{"x":0.5733,"y":0.9163},{"x":0.5617,"y":0.3688},{"x":0.4667,"y":0.0825}]	208	231	2020-11-01 10:44:22.610554	2020-11-01 10:44:22.610554
306	[{"x":0.7125,"y":0.7933},{"x":0.6875,"y":0.4333},{"x":0.65,"y":0.26}]	128	318	2020-11-01 10:44:22.619063	2020-11-01 10:44:22.619063
309	[{"x":0.5687,"y":0.8383},{"x":0.575,"y":0.6417},{"x":0.4988,"y":0.3583},{"x":0.46,"y":0.24}]	55	293	2020-11-01 10:44:22.628566	2020-11-01 10:44:22.628566
310	[{"x":0.6863,"y":0.79},{"x":0.685,"y":0.52},{"x":0.5663,"y":0.1283}]	411	495	2020-11-01 10:44:22.63159	2020-11-01 10:44:22.63159
311	[{"x":0.4988,"y":0.8083},{"x":0.4888,"y":0.5733},{"x":0.4838,"y":0.29},{"x":0.5188,"y":0.1383}]	242	428	2020-11-01 10:44:22.634584	2020-11-01 10:44:22.634584
312	[{"x":0.4925,"y":0.8283},{"x":0.475,"y":0.6917},{"x":0.4875,"y":0.3967},{"x":0.5088,"y":0.18}]	121	315	2020-11-01 10:44:22.637643	2020-11-01 10:44:22.637643
313	[{"x":0.4387,"y":0.7767},{"x":0.4,"y":0.335},{"x":0.3987,"y":0.2467}]	497	496	2020-11-01 10:44:22.642088	2020-11-01 10:44:22.642088
314	[{"x":0.5175,"y":0.8267},{"x":0.54,"y":0.4433},{"x":0.585,"y":0.0983}]	496	497	2020-11-01 10:44:22.645197	2020-11-01 10:44:22.645197
315	[{"x":0.3912,"y":0.825},{"x":0.4037,"y":0.4183},{"x":0.4025,"y":0.16}]	465	498	2020-11-01 10:44:22.648592	2020-11-01 10:44:22.648592
316	[{"x":0.3063,"y":0.93},{"x":0.3463,"y":0.63},{"x":0.4713,"y":0.355},{"x":0.625,"y":0.1067}]	422	499	2020-11-01 10:44:22.65256	2020-11-01 10:44:22.65256
317	[{"x":0.5687,"y":0.8083},{"x":0.575,"y":0.4867},{"x":0.565,"y":0.1917}]	20	439	2020-11-01 10:44:22.656193	2020-11-01 10:44:22.656193
318	[{"x":0.425,"y":0.8117},{"x":0.4288,"y":0.4817},{"x":0.425,"y":0.1917},{"x":0.4175,"y":0.1417}]	478	501	2020-11-01 10:44:22.659805	2020-11-01 10:44:22.659805
319	[{"x":0.7937,"y":0.9767},{"x":0.8013,"y":0.5483},{"x":0.7612,"y":0.185},{"x":0.7375,"y":0.08}]	466	500	2020-11-01 10:44:22.662876	2020-11-01 10:44:22.662876
320	[{"x":0.3337,"y":0.7417},{"x":0.3862,"y":0.495},{"x":0.4037,"y":0.3233},{"x":0.4512,"y":0.2133},{"x":0.4975,"y":0.1283}]	122	397	2020-11-01 10:44:22.667333	2020-11-01 10:44:22.667333
321	[{"x":0.64,"y":0.73},{"x":0.66,"y":0.46},{"x":0.6587,"y":0.2217}]	239	274	2020-11-01 10:44:22.670654	2020-11-01 10:44:22.670654
322	[{"x":0.3312,"y":0.845},{"x":0.3875,"y":0.6267},{"x":0.4763,"y":0.3833},{"x":0.5138,"y":0.1683}]	118	335	2020-11-01 10:44:22.674314	2020-11-01 10:44:22.674314
324	[{"x":0.605,"y":0.8383},{"x":0.62,"y":0.4567},{"x":0.6262,"y":0.1667}]	191	406	2020-11-01 10:44:22.681501	2020-11-01 10:44:22.681501
327	[{"x":0.4675,"y":0.7617},{"x":0.4525,"y":0.5233},{"x":0.48,"y":0.2}]	180	385	2020-11-01 10:44:22.692274	2020-11-01 10:44:22.692274
328	[{"x":0.48,"y":0.8383},{"x":0.4725,"y":0.5833},{"x":0.4825,"y":0.4283},{"x":0.5088,"y":0.245},{"x":0.5363,"y":0.115}]	477	502	2020-11-01 10:44:22.698676	2020-11-01 10:44:22.698676
329	[{"x":0.4037,"y":0.8533},{"x":0.4075,"y":0.605},{"x":0.4225,"y":0.4383},{"x":0.3412,"y":0.305},{"x":0.3538,"y":0.2083}]	120	352	2020-11-01 10:44:22.702425	2020-11-01 10:44:22.702425
331	[{"x":0.5813,"y":0.8},{"x":0.5575,"y":0.4133},{"x":0.5337,"y":0.1633}]	115	333	2020-11-01 10:44:22.709375	2020-11-01 10:44:22.709375
332	[{"x":0.47,"y":0.7617},{"x":0.4825,"y":0.3467},{"x":0.4888,"y":0.155}]	123	287	2020-11-01 10:44:22.712402	2020-11-01 10:44:22.712402
333	[{"x":0.5925,"y":0.815},{"x":0.5188,"y":0.5933},{"x":0.4875,"y":0.4033},{"x":0.4425,"y":0.2633}]	21	306	2020-11-01 10:44:22.716672	2020-11-01 10:44:22.716672
334	[{"x":0.5038,"y":0.81},{"x":0.495,"y":0.4667},{"x":0.5038,"y":0.1233}]	89	451	2020-11-01 10:44:22.720241	2020-11-01 10:44:22.720241
335	[{"x":0.5725,"y":0.7633},{"x":0.5913,"y":0.435},{"x":0.595,"y":0.1717}]	27	363	2020-11-01 10:44:22.724592	2020-11-01 10:44:22.724592
337	[{"x":0.3837,"y":0.8667},{"x":0.3837,"y":0.4433},{"x":0.4113,"y":0.1583}]	506	503	2020-11-01 10:44:22.732099	2020-11-01 10:44:22.732099
338	[{"x":0.5837,"y":0.7933},{"x":0.5663,"y":0.6417},{"x":0.58,"y":0.48},{"x":0.5513,"y":0.38},{"x":0.5262,"y":0.29},{"x":0.5537,"y":0.1383}]	113	316	2020-11-01 10:44:22.736264	2020-11-01 10:44:22.736264
339	[{"x":0.5062,"y":0.805},{"x":0.4963,"y":0.5167},{"x":0.5212,"y":0.265},{"x":0.5238,"y":0.1}]	86	442	2020-11-01 10:44:22.740227	2020-11-01 10:44:22.740227
340	[{"x":0.6763,"y":0.84},{"x":0.67,"y":0.5167},{"x":0.665,"y":0.3167},{"x":0.6512,"y":0.2533}]	479	504	2020-11-01 10:44:22.743624	2020-11-01 10:44:22.743624
341	[{"x":0.3987,"y":0.7817},{"x":0.4063,"y":0.4333},{"x":0.4225,"y":0.1133}]	475	506	2020-11-01 10:44:22.746728	2020-11-01 10:44:22.746728
343	[{"x":0.6312,"y":0.8167},{"x":0.6338,"y":0.3267},{"x":0.6125,"y":0.1617}]	186	422	2020-11-01 10:44:22.754152	2020-11-01 10:44:22.754152
344	[{"x":0.5537,"y":0.8283},{"x":0.5337,"y":0.55},{"x":0.5225,"y":0.2333}]	192	273	2020-11-01 10:44:22.758974	2020-11-01 10:44:22.758974
345	[{"x":0.5975,"y":0.245},{"x":0.6587,"y":0.3567},{"x":0.6512,"y":0.4867},{"x":0.5825,"y":0.605},{"x":0.46,"y":0.66},{"x":0.3613,"y":0.6717}]	26	286	2020-11-01 10:44:22.761955	2020-11-01 10:44:22.761955
346	[{"x":0.5425,"y":0.885},{"x":0.5587,"y":0.62},{"x":0.5,"y":0.3517},{"x":0.4525,"y":0.1483}]	476	505	2020-11-01 10:44:22.765661	2020-11-01 10:44:22.765661
347	[{"x":0.6737,"y":0.7583},{"x":0.61,"y":0.5833},{"x":0.5275,"y":0.4083},{"x":0.4875,"y":0.2683},{"x":0.4338,"y":0.2367}]	195	265	2020-11-01 10:44:22.768982	2020-11-01 10:44:22.768982
348	[{"x":0.4938,"y":0.68},{"x":0.515,"y":0.4283},{"x":0.495,"y":0.2717}]	175	475	2020-11-01 10:44:22.772078	2020-11-01 10:44:22.772078
349	[{"x":0.4738,"y":0.735},{"x":0.48,"y":0.4917},{"x":0.5275,"y":0.31},{"x":0.5337,"y":0.245}]	172	311	2020-11-01 10:44:22.775284	2020-11-01 10:44:22.775284
350	[{"x":0.6188,"y":0.7183},{"x":0.6312,"y":0.3483},{"x":0.6038,"y":0.2433}]	220	300	2020-11-01 10:44:22.778897	2020-11-01 10:44:22.778897
351	[{"x":0.5913,"y":0.8033},{"x":0.5425,"y":0.455},{"x":0.5625,"y":0.2083}]	174	275	2020-11-01 10:44:22.782589	2020-11-01 10:44:22.782589
353	[{"x":0.6325,"y":0.8517},{"x":0.575,"y":0.5667},{"x":0.4238,"y":0.5067},{"x":0.3275,"y":0.4183},{"x":0.3638,"y":0.1917}]	85	307	2020-11-01 10:44:22.789967	2020-11-01 10:44:22.789967
354	[{"x":0.6012,"y":0.715},{"x":0.5212,"y":0.5033},{"x":0.4875,"y":0.3583},{"x":0.51,"y":0.2867}]	176	272	2020-11-01 10:44:22.793408	2020-11-01 10:44:22.793408
355	[{"x":0.4875,"y":0.8167},{"x":0.52,"y":0.455},{"x":0.6025,"y":0.1717}]	158	387	2020-11-01 10:44:22.796825	2020-11-01 10:44:22.796825
356	[{"x":0.3625,"y":0.79},{"x":0.3713,"y":0.4183},{"x":0.3812,"y":0.215},{"x":0.4188,"y":0.165}]	159	347	2020-11-01 10:44:22.801402	2020-11-01 10:44:22.801402
342	[{"x":0.54,"y":0.8617},{"x":0.495,"y":0.5117},{"x":0.45,"y":0.1817}]	193	412	2020-11-01 10:44:22.75085	2020-11-02 09:09:40.704153
326	[{"x":0.7075,"y":0.8383},{"x":0.7075,"y":0.715},{"x":0.7963,"y":0.5633},{"x":0.82,"y":0.4433},{"x":0.8037,"y":0.3283}]	233	349	2020-11-01 10:44:22.688698	2020-11-03 13:35:12.855756
308	[{"x":0.7212,"y":0.8217},{"x":0.7425,"y":0.5683},{"x":0.725,"y":0.3783},{"x":0.7312,"y":0.295}]	154	314	2020-11-01 10:44:22.625495	2020-11-02 10:00:44.233578
352	[{"x":0.2425,"y":0.8817},{"x":0.235,"y":0.355},{"x":0.2725,"y":0.1333}]	173	275	2020-11-01 10:44:22.785917	2020-11-03 12:41:34.310889
307	[{"x":0.6925,"y":0.9},{"x":0.6913,"y":0.4867},{"x":0.6875,"y":0.2133}]	194	383	2020-11-01 10:44:22.622339	2020-11-03 13:29:39.946873
323	[{"x":0.405,"y":0.8067},{"x":0.3775,"y":0.59},{"x":0.3525,"y":0.3783},{"x":0.3538,"y":0.1917}]	88	306	2020-11-01 10:44:22.677414	2020-11-03 13:43:03.558802
330	[{"x":0.365,"y":0.8783},{"x":0.3475,"y":0.7333},{"x":0.3862,"y":0.525},{"x":0.4363,"y":0.3767},{"x":0.5162,"y":0.215},{"x":0.5475,"y":0.1283}]	112	316	2020-11-01 10:44:22.705944	2020-11-03 13:51:01.81742
357	[{"x":0.5075,"y":0.7717},{"x":0.5162,"y":0.6567},{"x":0.355,"y":0.6067},{"x":0.2162,"y":0.555},{"x":0.2087,"y":0.3767},{"x":0.2787,"y":0.2717}]	149	465	2020-11-01 10:44:22.805118	2020-11-01 10:44:22.805118
358	[{"x":0.495,"y":0.785},{"x":0.4988,"y":0.36},{"x":0.5313,"y":0.1767}]	147	313	2020-11-01 10:44:22.809072	2020-11-01 10:44:22.809072
360	[{"x":0.6112,"y":0.7567},{"x":0.61,"y":0.4783},{"x":0.6125,"y":0.22},{"x":0.585,"y":0.1583}]	223	380	2020-11-01 10:44:22.818193	2020-11-01 10:44:22.818193
365	[{"x":0.6575,"y":0.855},{"x":0.6837,"y":0.6767},{"x":0.6613,"y":0.4217},{"x":0.64,"y":0.12}]	150	466	2020-11-01 10:44:22.835452	2020-11-01 10:44:22.835452
368	[{"x":0.6338,"y":0.7483},{"x":0.6238,"y":0.4783},{"x":0.625,"y":0.3},{"x":0.62,"y":0.18}]	138	321	2020-11-01 10:44:22.845258	2020-11-01 10:44:22.845258
369	[{"x":0.565,"y":0.7417},{"x":0.5587,"y":0.5117},{"x":0.5613,"y":0.3033}]	43	454	2020-11-01 10:44:22.848592	2020-11-01 10:44:22.848592
370	[{"x":0.3675,"y":0.82},{"x":0.3362,"y":0.5433},{"x":0.3588,"y":0.3},{"x":0.3862,"y":0.1883}]	41	305	2020-11-01 10:44:22.852235	2020-11-01 10:44:22.852235
372	[{"x":0.5012,"y":0.885},{"x":0.5075,"y":0.395},{"x":0.5112,"y":0.0917}]	116	395	2020-11-01 10:44:22.859953	2020-11-01 10:44:22.859953
374	[{"x":0.435,"y":0.8367},{"x":0.485,"y":0.5117},{"x":0.4988,"y":0.175}]	142	381	2020-11-01 10:44:22.868632	2020-11-01 10:44:22.868632
375	[{"x":0.5225,"y":0.8617},{"x":0.5537,"y":0.4617},{"x":0.5513,"y":0.235}]	47	354	2020-11-01 10:44:22.871803	2020-11-01 10:44:22.871803
376	[{"x":0.4938,"y":0.8117},{"x":0.4988,"y":0.3817},{"x":0.52,"y":0.1933},{"x":0.555,"y":0.1167}]	136	390	2020-11-01 10:44:22.875057	2020-11-01 10:44:22.875057
377	[{"x":0.5938,"y":0.8233},{"x":0.5962,"y":0.495},{"x":0.5837,"y":0.3183},{"x":0.5062,"y":0.1467}]	137	358	2020-11-01 10:44:22.878044	2020-11-01 10:44:22.878044
378	[{"x":0.605,"y":0.685},{"x":0.6312,"y":0.605},{"x":0.6825,"y":0.5067},{"x":0.7137,"y":0.3383}]	229	405	2020-11-01 10:44:22.880952	2020-11-01 10:44:22.880952
379	[{"x":0.38,"y":0.8517},{"x":0.4075,"y":0.535},{"x":0.39,"y":0.3617},{"x":0.4313,"y":0.1683}]	39	432	2020-11-01 10:44:22.884566	2020-11-01 10:44:22.884566
380	[{"x":0.4738,"y":0.8167},{"x":0.4725,"y":0.415},{"x":0.485,"y":0.1367}]	97	320	2020-11-01 10:44:22.887968	2020-11-01 10:44:22.887968
381	[{"x":0.72,"y":0.545},{"x":0.6425,"y":0.5867},{"x":0.4188,"y":0.5933},{"x":0.2637,"y":0.5133},{"x":0.2625,"y":0.3333},{"x":0.3075,"y":0.1433}]	235	284	2020-11-01 10:44:22.891344	2020-11-01 10:44:22.891344
382	[{"x":0.4238,"y":0.81},{"x":0.4325,"y":0.4417},{"x":0.5088,"y":0.21}]	161	460	2020-11-01 10:44:22.894468	2020-11-01 10:44:22.894468
383	[{"x":0.8,"y":0.4433},{"x":0.7288,"y":0.4567},{"x":0.6462,"y":0.46},{"x":0.5725,"y":0.4183},{"x":0.515,"y":0.3917},{"x":0.38,"y":0.3717},{"x":0.2925,"y":0.3733},{"x":0.215,"y":0.3683}]	222	448	2020-11-01 10:44:22.897488	2020-11-01 10:44:22.897488
384	[{"x":0.105,"y":0.6833},{"x":0.1225,"y":0.52},{"x":0.2313,"y":0.4933},{"x":0.3862,"y":0.475},{"x":0.5262,"y":0.4333},{"x":0.6138,"y":0.205}]	48	370	2020-11-01 10:44:22.900922	2020-11-01 10:44:22.900922
385	[{"x":0.5162,"y":0.6983},{"x":0.5425,"y":0.4867},{"x":0.5863,"y":0.34},{"x":0.5913,"y":0.235},{"x":0.5675,"y":0.1767}]	133	441	2020-11-01 10:44:22.904743	2020-11-01 10:44:22.904743
386	[{"x":0.5275,"y":0.8483},{"x":0.5175,"y":0.4167},{"x":0.5313,"y":0.2017},{"x":0.525,"y":0.12}]	87	297	2020-11-01 10:44:22.908271	2020-11-01 10:44:22.908271
387	[{"x":0.3275,"y":0.8483},{"x":0.3538,"y":0.4867},{"x":0.4475,"y":0.275},{"x":0.4938,"y":0.125}]	198	383	2020-11-01 10:44:22.911322	2020-11-01 10:44:22.911322
388	[{"x":0.5112,"y":0.8017},{"x":0.4338,"y":0.5467},{"x":0.4487,"y":0.4017},{"x":0.5,"y":0.2117},{"x":0.5262,"y":0.1267}]	169	384	2020-11-01 10:44:22.914447	2020-11-01 10:44:22.914447
389	[{"x":0.6438,"y":0.42},{"x":0.5787,"y":0.3883},{"x":0.5025,"y":0.3667},{"x":0.4412,"y":0.3883},{"x":0.3875,"y":0.4333},{"x":0.3425,"y":0.485}]	80	361	2020-11-01 10:44:22.919901	2020-11-01 10:44:22.919901
390	[{"x":0.5275,"y":0.805},{"x":0.5325,"y":0.5017},{"x":0.5325,"y":0.305},{"x":0.5413,"y":0.1433}]	141	416	2020-11-01 10:44:22.923496	2020-11-01 10:44:22.923496
392	[{"x":0.4525,"y":0.8283},{"x":0.4063,"y":0.5617},{"x":0.3962,"y":0.39},{"x":0.4363,"y":0.2217},{"x":0.455,"y":0.1667}]	44	291	2020-11-01 10:44:22.92969	2020-11-01 10:44:22.92969
393	[{"x":0.6,"y":0.9717},{"x":0.64,"y":0.5883},{"x":0.6687,"y":0.34},{"x":0.6613,"y":0.1617}]	40	280	2020-11-01 10:44:22.932608	2020-11-01 10:44:22.932608
396	[{"x":0.5225,"y":0.81},{"x":0.5763,"y":0.65},{"x":0.58,"y":0.54},{"x":0.5363,"y":0.3467},{"x":0.5188,"y":0.2067}]	182	359	2020-11-01 10:44:22.943083	2020-11-01 10:44:22.943083
397	[{"x":0.6338,"y":0.8333},{"x":0.6462,"y":0.4467},{"x":0.655,"y":0.1933}]	179	411	2020-11-01 10:44:22.946026	2020-11-01 10:44:22.946026
399	[{"x":0.46,"y":0.9317},{"x":0.485,"y":0.5367},{"x":0.4913,"y":0.33},{"x":0.5175,"y":0.1083}]	45	292	2020-11-01 10:44:22.953816	2020-11-01 10:44:22.953816
400	[{"x":0.6775,"y":0.7283},{"x":0.6863,"y":0.395},{"x":0.6462,"y":0.235}]	42	438	2020-11-01 10:44:22.957389	2020-11-01 10:44:22.957389
402	[{"x":0.3713,"y":0.7933},{"x":0.3613,"y":0.4633},{"x":0.3563,"y":0.14}]	129	368	2020-11-01 10:44:22.963595	2020-11-01 10:44:22.963595
403	[{"x":0.3663,"y":0.8333},{"x":0.3937,"y":0.5683},{"x":0.5387,"y":0.4333},{"x":0.5487,"y":0.1417}]	37	269	2020-11-01 10:44:22.966659	2020-11-01 10:44:22.966659
373	[{"x":0.4587,"y":0.775},{"x":0.4863,"y":0.615},{"x":0.455,"y":0.38},{"x":0.375,"y":0.2233},{"x":0.3175,"y":0.11}]	221	445	2020-11-01 10:44:22.863003	2020-11-02 09:49:29.006271
361	[{"x":0.33,"y":0.7867},{"x":0.3362,"y":0.565},{"x":0.3663,"y":0.3433},{"x":0.385,"y":0.175}]	144	472	2020-11-01 10:44:22.821429	2020-11-03 12:48:33.231958
401	[{"x":0.31,"y":0.7617},{"x":0.2888,"y":0.52},{"x":0.2838,"y":0.29},{"x":0.3175,"y":0.1367}]	224	441	2020-11-01 10:44:22.960565	2020-11-03 12:59:26.185669
366	[{"x":0.3,"y":0.85},{"x":0.275,"y":0.565},{"x":0.25,"y":0.4233},{"x":0.2787,"y":0.2333},{"x":0.3088,"y":0.1283}]	228	358	2020-11-01 10:44:22.838771	2020-11-03 12:57:42.288817
359	[{"x":0.5175,"y":0.795},{"x":0.5313,"y":0.4117},{"x":0.5062,"y":0.1533}]	143	380	2020-11-01 10:44:22.814131	2020-11-03 12:44:35.493084
362	[{"x":0.485,"y":0.7767},{"x":0.475,"y":0.5367},{"x":0.4587,"y":0.3317},{"x":0.4637,"y":0.1967}]	145	472	2020-11-01 10:44:22.825078	2020-11-03 12:48:55.867849
367	[{"x":0.5325,"y":0.835},{"x":0.5062,"y":0.265},{"x":0.5125,"y":0.1167}]	139	321	2020-11-01 10:44:22.842276	2020-11-03 12:55:12.286145
398	[{"x":0.4963,"y":0.8583},{"x":0.4738,"y":0.5117},{"x":0.4688,"y":0.2417},{"x":0.4863,"y":0.145}]	70	411	2020-11-01 10:44:22.949119	2020-11-03 13:28:39.984799
394	[{"x":0.6425,"y":0.785},{"x":0.5737,"y":0.68},{"x":0.5425,"y":0.5117},{"x":0.5525,"y":0.325},{"x":0.565,"y":0.21}]	69	349	2020-11-01 10:44:22.936469	2020-11-03 13:32:07.289916
371	[{"x":0.3738,"y":0.7517},{"x":0.3337,"y":0.5517},{"x":0.3237,"y":0.3833},{"x":0.365,"y":0.275},{"x":0.42,"y":0.215}]	114	274	2020-11-01 10:44:22.856789	2020-11-03 13:50:23.658311
391	[{"x":0.6238,"y":0.8333},{"x":0.645,"y":0.5517},{"x":0.6637,"y":0.4067},{"x":0.6637,"y":0.28},{"x":0.6288,"y":0.2017},{"x":0.5962,"y":0.1633}]	162	461	2020-11-01 10:44:22.926726	2020-11-03 14:09:41.41137
364	[{"x":0.5938,"y":0.83},{"x":0.5938,"y":0.47},{"x":0.5375,"y":0.315},{"x":0.505,"y":0.145}]	160	445	2020-11-01 10:44:22.831306	2020-11-09 17:38:36.576242
404	[{"x":0.7238,"y":0.795},{"x":0.7475,"y":0.53},{"x":0.7788,"y":0.3717},{"x":0.755,"y":0.2533}]	131	327	2020-11-01 10:44:22.972281	2020-11-01 10:44:22.972281
406	[{"x":0.3212,"y":0.7817},{"x":0.2875,"y":0.5617},{"x":0.29,"y":0.3167},{"x":0.3175,"y":0.1867}]	132	423	2020-11-01 10:44:22.978546	2020-11-01 10:44:22.978546
407	[{"x":0.4288,"y":0.815},{"x":0.4363,"y":0.3767},{"x":0.4475,"y":0.1483}]	36	336	2020-11-01 10:44:22.981436	2020-11-01 10:44:22.981436
408	[{"x":0.4412,"y":0.83},{"x":0.4437,"y":0.4183},{"x":0.4913,"y":0.1267}]	33	403	2020-11-01 10:44:22.984304	2020-11-01 10:44:22.984304
409	[{"x":0.2512,"y":0.8117},{"x":0.2375,"y":0.6083},{"x":0.34,"y":0.4983},{"x":0.5225,"y":0.5167},{"x":0.6325,"y":0.4933},{"x":0.78,"y":0.5233},{"x":0.8275,"y":0.3867},{"x":0.8325,"y":0.305}]	178	430	2020-11-01 10:44:22.988602	2020-11-01 10:44:22.988602
410	[{"x":0.5188,"y":0.8717},{"x":0.5188,"y":0.455},{"x":0.5212,"y":0.13}]	163	332	2020-11-01 10:44:22.992049	2020-11-01 10:44:22.992049
411	[{"x":0.5,"y":0.8367},{"x":0.475,"y":0.51},{"x":0.4738,"y":0.2517},{"x":0.4838,"y":0.13}]	217	476	2020-11-01 10:44:22.995027	2020-11-01 10:44:22.995027
413	[{"x":0.545,"y":0.9183},{"x":0.4763,"y":0.6783},{"x":0.5175,"y":0.405},{"x":0.5787,"y":0.2383}]	177	322	2020-11-01 10:44:23.000975	2020-11-01 10:44:23.000975
415	[{"x":0.6038,"y":0.78},{"x":0.58,"y":0.405},{"x":0.58,"y":0.1767}]	28	324	2020-11-01 10:44:23.008427	2020-11-01 10:44:23.008427
416	[{"x":0.3625,"y":0.4783},{"x":0.2437,"y":0.4733},{"x":0.1762,"y":0.4417},{"x":0.1688,"y":0.3733}]	34	393	2020-11-01 10:44:23.011524	2020-11-01 10:44:23.011524
417	[{"x":0.4063,"y":0.845},{"x":0.3638,"y":0.585},{"x":0.335,"y":0.2933}]	31	369	2020-11-01 10:44:23.014557	2020-11-01 10:44:23.014557
419	[{"x":0.52,"y":0.8317},{"x":0.525,"y":0.4617},{"x":0.5175,"y":0.1483}]	165	342	2020-11-01 10:44:23.023233	2020-11-01 10:44:23.023233
420	[{"x":0.5513,"y":0.805},{"x":0.5537,"y":0.4767},{"x":0.575,"y":0.1717}]	168	413	2020-11-01 10:44:23.026356	2020-11-01 10:44:23.026356
421	[{"x":0.5313,"y":0.805},{"x":0.5138,"y":0.755},{"x":0.5225,"y":0.6067},{"x":0.5112,"y":0.135}]	190	386	2020-11-01 10:44:23.029271	2020-11-01 10:44:23.029271
422	[{"x":0.6125,"y":0.8367},{"x":0.6188,"y":0.4017},{"x":0.5962,"y":0.225},{"x":0.5713,"y":0.1767}]	210	473	2020-11-01 10:44:23.03209	2020-11-01 10:44:23.03209
423	[{"x":0.3225,"y":0.8083},{"x":0.3862,"y":0.6433},{"x":0.6012,"y":0.5283},{"x":0.635,"y":0.24}]	209	282	2020-11-01 10:44:23.03503	2020-11-01 10:44:23.03503
424	[{"x":0.5525,"y":0.81},{"x":0.5487,"y":0.5167},{"x":0.5275,"y":0.2483},{"x":0.5138,"y":0.105}]	28	527	2020-11-01 10:44:23.038975	2020-11-01 10:44:23.038975
425	[{"x":0.4963,"y":0.8483},{"x":0.4888,"y":0.6117},{"x":0.4562,"y":0.565},{"x":0.4462,"y":0.36},{"x":0.47,"y":0.2017}]	208	302	2020-11-01 10:44:23.042336	2020-11-01 10:44:23.042336
427	[{"x":0.5487,"y":0.8033},{"x":0.5387,"y":0.5367},{"x":0.545,"y":0.265},{"x":0.5463,"y":0.1667}]	167	337	2020-11-01 10:44:23.048207	2020-11-01 10:44:23.048207
428	[{"x":0.4012,"y":0.85},{"x":0.41,"y":0.595},{"x":0.3488,"y":0.4283},{"x":0.3475,"y":0.2517}]	219	474	2020-11-01 10:44:23.051094	2020-11-01 10:44:23.051094
430	[{"x":0.5125,"y":0.74},{"x":0.4888,"y":0.4283},{"x":0.445,"y":0.2083}]	75	463	2020-11-01 10:44:23.058626	2020-11-01 10:44:23.058626
432	[{"x":0.4863,"y":0.7167},{"x":0.4975,"y":0.4967},{"x":0.5062,"y":0.3667},{"x":0.4988,"y":0.25},{"x":0.51,"y":0.17}]	74	392	2020-11-01 10:44:23.064646	2020-11-01 10:44:23.064646
434	[{"x":0.3387,"y":0.8},{"x":0.3412,"y":0.7217},{"x":0.5112,"y":0.6433},{"x":0.5825,"y":0.5883},{"x":0.5725,"y":0.4683},{"x":0.505,"y":0.3733},{"x":0.4088,"y":0.2983},{"x":0.4275,"y":0.1933}]	232	364	2020-11-01 10:44:23.073582	2020-11-01 10:44:23.073582
435	[{"x":0.3387,"y":0.69},{"x":0.35,"y":0.415},{"x":0.3638,"y":0.2333},{"x":0.4,"y":0.18}]	196	374	2020-11-01 10:44:23.076926	2020-11-01 10:44:23.076926
436	[{"x":0.8287,"y":0.4983},{"x":0.6412,"y":0.4733},{"x":0.4825,"y":0.47},{"x":0.365,"y":0.5067},{"x":0.2587,"y":0.515},{"x":0.2437,"y":0.455}]	231	378	2020-11-01 10:44:23.079811	2020-11-01 10:44:23.079811
437	[{"x":0.5175,"y":0.8833},{"x":0.5787,"y":0.3483},{"x":0.6262,"y":0.0867}]	211	434	2020-11-01 10:44:23.08273	2020-11-01 10:44:23.08273
438	[{"x":0.4775,"y":0.89},{"x":0.4963,"y":0.355},{"x":0.4913,"y":0.1383}]	201	446	2020-11-01 10:44:23.085739	2020-11-01 10:44:23.085739
439	[{"x":0.4225,"y":0.78},{"x":0.44,"y":0.4583},{"x":0.5038,"y":0.1967}]	30	376	2020-11-01 10:44:23.089789	2020-11-01 10:44:23.089789
440	[{"x":0.8363,"y":0.3083},{"x":0.7462,"y":0.32},{"x":0.665,"y":0.535},{"x":0.5687,"y":0.5817},{"x":0.415,"y":0.5767},{"x":0.3237,"y":0.5733},{"x":0.2387,"y":0.5533},{"x":0.16,"y":0.5317},{"x":0.1037,"y":0.5183}]	29	420	2020-11-01 10:44:23.093053	2020-11-01 10:44:23.093053
441	[{"x":0.5188,"y":0.8267},{"x":0.515,"y":0.485},{"x":0.52,"y":0.2117}]	90	309	2020-11-01 10:44:23.096175	2020-11-01 10:44:23.096175
442	[{"x":0.53,"y":0.7933},{"x":0.52,"y":0.4633},{"x":0.5437,"y":0.13}]	91	429	2020-11-01 10:44:23.099088	2020-11-01 10:44:23.099088
443	[{"x":0.6062,"y":0.8633},{"x":0.585,"y":0.5983},{"x":0.6012,"y":0.36},{"x":0.5363,"y":0.1167}]	92	330	2020-11-01 10:44:23.10204	2020-11-01 10:44:23.10204
445	[{"x":0.1737,"y":0.6167},{"x":0.365,"y":0.5633},{"x":0.56,"y":0.575},{"x":0.645,"y":0.4717},{"x":0.6725,"y":0.3367},{"x":0.6613,"y":0.2467}]	99	348	2020-11-01 10:44:23.109675	2020-11-01 10:44:23.109675
446	[{"x":0.5138,"y":0.8383},{"x":0.495,"y":0.4733},{"x":0.5012,"y":0.1617}]	24	443	2020-11-01 10:44:23.112795	2020-11-01 10:44:23.112795
447	[{"x":0.6913,"y":0.3117},{"x":0.62,"y":0.3667},{"x":0.5763,"y":0.5483},{"x":0.4113,"y":0.5883},{"x":0.2162,"y":0.56}]	68	459	2020-11-01 10:44:23.115758	2020-11-01 10:44:23.115758
448	[{"x":0.305,"y":0.5867},{"x":0.435,"y":0.495},{"x":0.575,"y":0.4617},{"x":0.64,"y":0.3633},{"x":0.6825,"y":0.285}]	18	289	2020-11-01 10:44:23.120751	2020-11-01 10:44:23.120751
449	[{"x":0.4575,"y":0.77},{"x":0.4825,"y":0.4267},{"x":0.4725,"y":0.1983}]	127	425	2020-11-01 10:44:23.125906	2020-11-01 10:44:23.125906
450	[{"x":0.515,"y":0.8317},{"x":0.5188,"y":0.4333},{"x":0.5275,"y":0.195}]	15	356	2020-11-01 10:44:23.128942	2020-11-01 10:44:23.128942
451	[{"x":0.5713,"y":0.8483},{"x":0.5525,"y":0.6067},{"x":0.54,"y":0.4317},{"x":0.5463,"y":0.2067}]	189	399	2020-11-01 10:44:23.131933	2020-11-01 10:44:23.131933
405	[{"x":0.525,"y":0.8},{"x":0.4587,"y":0.4883},{"x":0.47,"y":0.1717}]	130	327	2020-11-01 10:44:22.975664	2020-11-03 13:03:39.628532
431	[{"x":0.515,"y":0.7833},{"x":0.5162,"y":0.555},{"x":0.475,"y":0.4167},{"x":0.3912,"y":0.2983},{"x":0.3563,"y":0.1717}]	156	314	2020-11-01 10:44:23.061655	2020-11-03 13:06:11.926205
429	[{"x":0.5325,"y":0.85},{"x":0.5313,"y":0.49},{"x":0.53,"y":0.1833}]	215	304	2020-11-01 10:44:23.055116	2020-11-03 13:17:19.232599
452	[{"x":0.1737,"y":0.7083},{"x":0.1575,"y":0.5917},{"x":0.2238,"y":0.4083},{"x":0.2963,"y":0.1667}]	216	304	2020-11-01 10:44:23.13519	2020-11-03 13:18:04.823159
426	[{"x":0.8163,"y":0.7933},{"x":0.8075,"y":0.59},{"x":0.7688,"y":0.4683},{"x":0.6975,"y":0.3433},{"x":0.605,"y":0.1717}]	72	344	2020-11-01 10:44:23.045325	2020-11-03 13:23:32.926535
418	[{"x":0.545,"y":0.8517},{"x":0.5337,"y":0.4717},{"x":0.5075,"y":0.1367}]	199	369	2020-11-01 10:44:23.017624	2020-11-03 13:26:15.099809
433	[{"x":0.6587,"y":0.8267},{"x":0.6575,"y":0.5983},{"x":0.6488,"y":0.36},{"x":0.6212,"y":0.16}]	200	364	2020-11-01 10:44:23.067669	2020-11-03 13:27:54.618941
444	[{"x":0.7813,"y":0.75},{"x":0.7738,"y":0.585},{"x":0.75,"y":0.42},{"x":0.7238,"y":0.3217}]	17	425	2020-11-01 10:44:23.106264	2020-11-03 13:44:44.370276
453	[{"x":0.4338,"y":0.8183},{"x":0.4575,"y":0.4333},{"x":0.4475,"y":0.1167}]	77	271	2020-11-01 10:44:23.139421	2020-11-01 10:44:23.139421
454	[{"x":0.4625,"y":0.8583},{"x":0.4788,"y":0.415},{"x":0.4738,"y":0.1517}]	23	450	2020-11-01 10:44:23.14278	2020-11-01 10:44:23.14278
455	[{"x":0.5787,"y":0.88},{"x":0.4788,"y":0.6033},{"x":0.4625,"y":0.11}]	96	408	2020-11-01 10:44:23.145769	2020-11-01 10:44:23.145769
456	[{"x":0.5837,"y":0.8667},{"x":0.63,"y":0.665},{"x":0.5175,"y":0.5067},{"x":0.4587,"y":0.365},{"x":0.4325,"y":0.0817}]	104	372	2020-11-01 10:44:23.148703	2020-11-01 10:44:23.148703
458	[{"x":0.7462,"y":0.4783},{"x":0.47,"y":0.4},{"x":0.3688,"y":0.4167},{"x":0.1988,"y":0.6167}]	16	329	2020-11-01 10:44:23.155851	2020-11-01 10:44:23.155851
459	[{"x":0.6012,"y":0.8633},{"x":0.6262,"y":0.46},{"x":0.6,"y":0.2533}]	214	281	2020-11-01 10:44:23.159221	2020-11-01 10:44:23.159221
460	[{"x":0.5138,"y":0.845},{"x":0.4913,"y":0.4717},{"x":0.48,"y":0.145}]	155	469	2020-11-01 10:44:23.163016	2020-11-01 10:44:23.163016
461	[{"x":0.4925,"y":0.6717},{"x":0.4988,"y":0.6133},{"x":0.5188,"y":0.5167},{"x":0.5463,"y":0.46},{"x":0.54,"y":0.3883},{"x":0.53,"y":0.225},{"x":0.5175,"y":0.1367}]	230	418	2020-11-01 10:44:23.166067	2020-11-01 10:44:23.166067
462	[{"x":0.4375,"y":0.745},{"x":0.4587,"y":0.6817},{"x":0.445,"y":0.6533},{"x":0.3575,"y":0.6117},{"x":0.3113,"y":0.4733},{"x":0.3137,"y":0.3583},{"x":0.34,"y":0.25},{"x":0.3675,"y":0.19}]	205	452	2020-11-01 10:44:23.169193	2020-11-01 10:44:23.169193
463	[{"x":0.4562,"y":0.835},{"x":0.4775,"y":0.45},{"x":0.475,"y":0.2317}]	204	464	2020-11-01 10:44:23.173871	2020-11-01 10:44:23.173871
464	[{"x":0.6512,"y":0.9},{"x":0.64,"y":0.515},{"x":0.6038,"y":0.2217},{"x":0.5525,"y":0.125}]	203	382	2020-11-01 10:44:23.178642	2020-11-01 10:44:23.178642
465	[{"x":0.655,"y":0.7917},{"x":0.6787,"y":0.58},{"x":0.6863,"y":0.5133},{"x":0.6375,"y":0.3817},{"x":0.605,"y":0.285},{"x":0.5913,"y":0.2467}]	102	379	2020-11-01 10:44:23.181639	2020-11-01 10:44:23.181639
466	[{"x":0.6062,"y":0.84},{"x":0.61,"y":0.5217},{"x":0.5813,"y":0.3167},{"x":0.5325,"y":0.1183}]	103	419	2020-11-01 10:44:23.18463	2020-11-01 10:44:23.18463
467	[{"x":0.405,"y":0.84},{"x":0.4213,"y":0.4183},{"x":0.4325,"y":0.1867}]	109	468	2020-11-01 10:44:23.188309	2020-11-01 10:44:23.188309
468	[{"x":0.5337,"y":0.8367},{"x":0.5275,"y":0.6683},{"x":0.555,"y":0.2767}]	10	400	2020-11-01 10:44:23.19261	2020-11-01 10:44:23.19261
469	[{"x":0.7538,"y":0.5933},{"x":0.6188,"y":0.5683},{"x":0.5112,"y":0.535},{"x":0.4325,"y":0.4133},{"x":0.3663,"y":0.3083}]	11	345	2020-11-01 10:44:23.19571	2020-11-01 10:44:23.19571
470	[{"x":0.2162,"y":0.4917},{"x":0.5725,"y":0.46},{"x":0.8612,"y":0.45}]	12	343	2020-11-01 10:44:23.198746	2020-11-01 10:44:23.198746
471	[{"x":0.5375,"y":0.865},{"x":0.5363,"y":0.5967},{"x":0.5088,"y":0.4433},{"x":0.5325,"y":0.215},{"x":0.5463,"y":0.11}]	66	377	2020-11-01 10:44:23.201654	2020-11-01 10:44:23.201654
472	[{"x":0.49,"y":0.8833},{"x":0.52,"y":0.6233},{"x":0.425,"y":0.5083},{"x":0.395,"y":0.4167},{"x":0.435,"y":0.2717}]	14	371	2020-11-01 10:44:23.204788	2020-11-01 10:44:23.204788
473	[{"x":0.5012,"y":0.7717},{"x":0.57,"y":0.4583},{"x":0.5313,"y":0.3033},{"x":0.445,"y":0.2017}]	106	295	2020-11-01 10:44:23.208986	2020-11-01 10:44:23.208986
474	[{"x":0.5537,"y":0.79},{"x":0.5487,"y":0.4933},{"x":0.5212,"y":0.23},{"x":0.505,"y":0.1467}]	60	328	2020-11-01 10:44:23.212179	2020-11-01 10:44:23.212179
475	[{"x":0.61,"y":0.1717},{"x":0.5725,"y":0.3233},{"x":0.49,"y":0.47},{"x":0.405,"y":0.6433},{"x":0.3513,"y":0.8417}]	152	431	2020-11-01 10:44:23.215295	2020-11-01 10:44:23.215295
476	[{"x":0.455,"y":0.7517},{"x":0.4637,"y":0.685},{"x":0.53,"y":0.615},{"x":0.6312,"y":0.5933},{"x":0.6737,"y":0.5167},{"x":0.685,"y":0.415},{"x":0.6725,"y":0.3017},{"x":0.6525,"y":0.195}]	230	509	2020-11-01 10:44:23.218408	2020-11-01 10:44:23.218408
477	[{"x":0.5,"y":0.8683},{"x":0.4925,"y":0.6617},{"x":0.495,"y":0.4417},{"x":0.5038,"y":0.1517}]	73	523	2020-11-01 10:44:23.221785	2020-11-01 10:44:23.221785
479	[{"x":0.4863,"y":0.79},{"x":0.48,"y":0.525},{"x":0.5138,"y":0.2967},{"x":0.565,"y":0.1367}]	30	525	2020-11-01 10:44:23.231764	2020-11-01 10:44:23.231764
480	[{"x":0.4675,"y":0.8533},{"x":0.4813,"y":0.5383},{"x":0.5075,"y":0.2767},{"x":0.5162,"y":0.1233}]	211	519	2020-11-01 10:44:23.234674	2020-11-01 10:44:23.234674
481	[{"x":0.515,"y":0.8367},{"x":0.52,"y":0.6783},{"x":0.4763,"y":0.4517},{"x":0.41,"y":0.2583},{"x":0.37,"y":0.1317}]	213	521	2020-11-01 10:44:23.237576	2020-11-01 10:44:23.237576
482	[{"x":0.4188,"y":0.7767},{"x":0.41,"y":0.4983},{"x":0.4575,"y":0.2483},{"x":0.5,"y":0.13}]	107	290	2020-11-01 10:44:23.241379	2020-11-01 10:44:23.241379
483	[{"x":0.5288,"y":0.655},{"x":0.5713,"y":0.4917},{"x":0.6225,"y":0.335}]	7	334	2020-11-01 10:44:23.244994	2020-11-01 10:44:23.244994
484	[{"x":0.5363,"y":0.8367},{"x":0.5325,"y":0.5233},{"x":0.53,"y":0.2467},{"x":0.5487,"y":0.17}]	61	355	2020-11-01 10:44:23.248032	2020-11-01 10:44:23.248032
485	[{"x":0.51,"y":0.8917},{"x":0.485,"y":0.6083},{"x":0.5,"y":0.3783},{"x":0.5225,"y":0.15}]	153	283	2020-11-01 10:44:23.251064	2020-11-01 10:44:23.251064
486	[{"x":0.5238,"y":0.8433},{"x":0.5275,"y":0.6433},{"x":0.4988,"y":0.3533},{"x":0.4725,"y":0.19}]	204	511	2020-11-01 10:44:23.253976	2020-11-01 10:44:23.253976
487	[{"x":0.2762,"y":0.7283},{"x":0.2787,"y":0.5233},{"x":0.2838,"y":0.235},{"x":0.3038,"y":0.1767}]	196	513	2020-11-01 10:44:23.257639	2020-11-01 10:44:23.257639
488	[{"x":0.7163,"y":0.4817},{"x":0.5262,"y":0.4883},{"x":0.2813,"y":0.485},{"x":0.195,"y":0.4617},{"x":0.1988,"y":0.4167}]	231	514	2020-11-01 10:44:23.261432	2020-11-01 10:44:23.261432
489	[{"x":0.6675,"y":0.8383},{"x":0.6737,"y":0.6733},{"x":0.6475,"y":0.475},{"x":0.6225,"y":0.17}]	210	517	2020-11-01 10:44:23.264499	2020-11-01 10:44:23.264499
490	[{"x":0.5487,"y":0.8967},{"x":0.5775,"y":0.4517},{"x":0.5975,"y":0.18}]	3	436	2020-11-01 10:44:23.267481	2020-11-01 10:44:23.267481
491	[{"x":0.5887,"y":0.815},{"x":0.5737,"y":0.5933},{"x":0.5275,"y":0.4833},{"x":0.4637,"y":0.4067},{"x":0.435,"y":0.2717},{"x":0.4363,"y":0.1917}]	244	278	2020-11-01 10:44:23.270418	2020-11-01 10:44:23.270418
492	[{"x":0.5787,"y":0.8133},{"x":0.5525,"y":0.4733},{"x":0.5463,"y":0.185}]	125	288	2020-11-01 10:44:23.274055	2020-11-01 10:44:23.274055
493	[{"x":0.575,"y":0.8367},{"x":0.5188,"y":0.69},{"x":0.5337,"y":0.3617}]	81	410	2020-11-01 10:44:23.279353	2020-11-01 10:44:23.279353
494	[{"x":0.405,"y":0.8},{"x":0.4063,"y":0.4517},{"x":0.3937,"y":0.2183}]	25	299	2020-11-01 10:44:23.28246	2020-11-01 10:44:23.28246
495	[{"x":0.4213,"y":0.795},{"x":0.4225,"y":0.7317},{"x":0.3925,"y":0.6333},{"x":0.4025,"y":0.5},{"x":0.4188,"y":0.35},{"x":0.415,"y":0.24},{"x":0.4288,"y":0.1533}]	207	516	2020-11-01 10:44:23.285433	2020-11-01 10:44:23.285433
496	[{"x":0.4512,"y":0.8767},{"x":0.43,"y":0.5583},{"x":0.4625,"y":0.2733},{"x":0.4763,"y":0.1417}]	35	522	2020-11-01 10:44:23.289205	2020-11-01 10:44:23.289205
497	[{"x":0.4863,"y":0.8383},{"x":0.4913,"y":0.5367},{"x":0.4788,"y":0.3417},{"x":0.465,"y":0.1583}]	201	524	2020-11-01 10:44:23.292978	2020-11-01 10:44:23.292978
498	[{"x":0.6088,"y":0.8933},{"x":0.6262,"y":0.2883},{"x":0.6288,"y":0.1683}]	2	303	2020-11-01 10:44:23.297084	2020-11-01 10:44:23.297084
457	[{"x":0.55,"y":0.8183},{"x":0.5537,"y":0.5483},{"x":0.5475,"y":0.3483},{"x":0.5313,"y":0.1883}]	238	310	2020-11-01 10:44:23.151649	2020-11-03 10:16:16.830219
499	[{"x":0.5012,"y":0.8617},{"x":0.5138,"y":0.6217},{"x":0.5075,"y":0.4133},{"x":0.4487,"y":0.215}]	82	341	2020-11-01 10:44:23.300371	2020-11-08 17:06:56.37585
500	[{"x":0.4888,"y":0.7233},{"x":0.505,"y":0.4767},{"x":0.5012,"y":0.24},{"x":0.49,"y":0.1617}]	157	409	2020-11-01 10:44:23.303312	2020-11-01 10:44:23.303312
501	[{"x":0.6,"y":0.8667},{"x":0.5437,"y":0.455},{"x":0.5188,"y":0.1817}]	212	279	2020-11-01 10:44:23.30678	2020-11-01 10:44:23.30678
502	[{"x":0.4562,"y":0.8417},{"x":0.445,"y":0.7067},{"x":0.4188,"y":0.67},{"x":0.3725,"y":0.3433},{"x":0.3688,"y":0.1467}]	213	296	2020-11-01 10:44:23.311088	2020-11-01 10:44:23.311088
503	[{"x":0.4562,"y":0.8433},{"x":0.4587,"y":0.63},{"x":0.4363,"y":0.3783},{"x":0.425,"y":0.245}]	25	528	2020-11-01 10:44:23.314313	2020-11-01 10:44:23.314313
504	[{"x":0.6462,"y":0.755},{"x":0.6362,"y":0.5267},{"x":0.5125,"y":0.3783},{"x":0.465,"y":0.1833},{"x":0.4763,"y":0.14}]	22	277	2020-11-01 10:44:23.317452	2020-11-01 10:44:23.317452
505	[{"x":0.4838,"y":0.8633},{"x":0.4612,"y":0.65},{"x":0.455,"y":0.33},{"x":0.4575,"y":0.1667}]	23	531	2020-11-01 10:44:23.320821	2020-11-01 10:44:23.320821
506	[{"x":0.4338,"y":0.8233},{"x":0.4562,"y":0.4883},{"x":0.4938,"y":0.1617},{"x":0.4988,"y":0.12}]	94	458	2020-11-01 10:44:23.325896	2020-11-01 10:44:23.325896
507	[{"x":0.2062,"y":0.5567},{"x":0.3412,"y":0.4717},{"x":0.4975,"y":0.4033},{"x":0.6512,"y":0.3933},{"x":0.7662,"y":0.4167}]	84	276	2020-11-01 10:44:23.330219	2020-11-01 10:44:23.330219
508	[{"x":0.9313,"y":0.67},{"x":0.9313,"y":0.525},{"x":0.8688,"y":0.4067},{"x":0.695,"y":0.4233},{"x":0.4913,"y":0.465},{"x":0.3038,"y":0.4683},{"x":0.1462,"y":0.46}]	29	526	2020-11-01 10:44:23.335489	2020-11-01 10:44:23.335489
510	[{"x":0.4587,"y":0.7883},{"x":0.4637,"y":0.5567},{"x":0.4637,"y":0.34},{"x":0.4775,"y":0.195}]	24	529	2020-11-01 10:44:23.343627	2020-11-01 10:44:23.343627
511	[{"x":0.62,"y":0.8233},{"x":0.58,"y":0.5867},{"x":0.5637,"y":0.345},{"x":0.555,"y":0.2283},{"x":0.5175,"y":0.1533}]	203	512	2020-11-01 10:44:23.347001	2020-11-01 10:44:23.347001
512	[{"x":0.7712,"y":0.5},{"x":0.6725,"y":0.5883},{"x":0.5212,"y":0.57},{"x":0.43,"y":0.4983},{"x":0.3588,"y":0.505},{"x":0.305,"y":0.5133},{"x":0.2762,"y":0.44},{"x":0.2625,"y":0.3183}]	231	515	2020-11-01 10:44:23.350245	2020-11-01 10:44:23.350245
513	[{"x":0.37,"y":0.8183},{"x":0.375,"y":0.5733},{"x":0.4037,"y":0.425},{"x":0.5075,"y":0.3783},{"x":0.59,"y":0.3867},{"x":0.64,"y":0.3467},{"x":0.6637,"y":0.25},{"x":0.675,"y":0.1583}]	209	518	2020-11-01 10:44:23.353538	2020-11-01 10:44:23.353538
514	[{"x":0.535,"y":0.8533},{"x":0.51,"y":0.52},{"x":0.4925,"y":0.2417},{"x":0.49,"y":0.175}]	212	520	2020-11-01 10:44:23.357535	2020-11-01 10:44:23.357535
515	[{"x":0.4088,"y":0.8},{"x":0.4113,"y":0.5667},{"x":0.4275,"y":0.3},{"x":0.4437,"y":0.21}]	94	532	2020-11-01 10:44:23.361331	2020-11-01 10:44:23.361331
521	[{"x":0.51,"y":0.84},{"x":0.4637,"y":0.64},{"x":0.4725,"y":0.44},{"x":0.5375,"y":0.2117}]	64	549	2020-11-01 10:44:23.382174	2020-11-01 10:44:23.382174
522	[{"x":0.3025,"y":0.79},{"x":0.38,"y":0.5133},{"x":0.5425,"y":0.4817},{"x":0.6488,"y":0.3617},{"x":0.695,"y":0.23}]	18	535	2020-11-01 10:44:23.386972	2020-11-01 10:44:23.386972
523	[{"x":0.3912,"y":0.81},{"x":0.3887,"y":0.525},{"x":0.4175,"y":0.2433},{"x":0.4387,"y":0.1183}]	100	536	2020-11-01 10:44:23.391884	2020-11-01 10:44:23.391884
524	[{"x":0.55,"y":0.8317},{"x":0.5513,"y":0.7067},{"x":0.4425,"y":0.58},{"x":0.3862,"y":0.4667},{"x":0.4163,"y":0.3133}]	14	541	2020-11-01 10:44:23.395367	2020-11-01 10:44:23.395367
525	[{"x":0.5012,"y":0.8533},{"x":0.4788,"y":0.765},{"x":0.4863,"y":0.5317},{"x":0.5,"y":0.3333},{"x":0.4938,"y":0.2},{"x":0.49,"y":0.1317}]	63	542	2020-11-01 10:44:23.398435	2020-11-01 10:44:23.398435
526	[{"x":0.5525,"y":0.8383},{"x":0.5038,"y":0.7383},{"x":0.5038,"y":0.625},{"x":0.49,"y":0.375},{"x":0.475,"y":0.1533}]	124	548	2020-11-01 10:44:23.401497	2020-11-01 10:44:23.401497
527	[{"x":0.3387,"y":0.835},{"x":0.3175,"y":0.6933},{"x":0.37,"y":0.53},{"x":0.4213,"y":0.3667},{"x":0.4238,"y":0.2633},{"x":0.4163,"y":0.1383}]	111	545	2020-11-01 10:44:23.404658	2020-11-01 10:44:23.404658
528	[{"x":0.5288,"y":0.9083},{"x":0.5275,"y":0.68},{"x":0.4575,"y":0.5333},{"x":0.3325,"y":0.4967},{"x":0.2313,"y":0.4467},{"x":0.1675,"y":0.395}]	4	546	2020-11-01 10:44:23.409015	2020-11-01 10:44:23.409015
529	[{"x":0.4188,"y":0.8283},{"x":0.4387,"y":0.4083},{"x":0.4975,"y":0.0983}]	100	339	2020-11-01 10:44:23.412517	2020-11-01 10:44:23.412517
530	[{"x":0.61,"y":0.855},{"x":0.6512,"y":0.61},{"x":0.6062,"y":0.4217},{"x":0.5487,"y":0.2633},{"x":0.5525,"y":0.185}]	101	360	2020-11-01 10:44:23.415676	2020-11-01 10:44:23.415676
531	[{"x":0.3912,"y":0.7967},{"x":0.3775,"y":0.6383},{"x":0.445,"y":0.4917},{"x":0.4437,"y":0.35},{"x":0.3762,"y":0.2667},{"x":0.3862,"y":0.1017}]	237	444	2020-11-01 10:44:23.418855	2020-11-01 10:44:23.418855
532	[{"x":0.5687,"y":0.8217},{"x":0.5825,"y":0.7667},{"x":0.5813,"y":0.4283},{"x":0.5487,"y":0.2167}]	110	435	2020-11-01 10:44:23.422881	2020-11-01 10:44:23.422881
533	[{"x":0.5112,"y":0.8267},{"x":0.5062,"y":0.5567},{"x":0.4913,"y":0.3333},{"x":0.4938,"y":0.2017},{"x":0.5125,"y":0.125}]	5	547	2020-11-01 10:44:23.42789	2020-11-01 10:44:23.42789
534	[{"x":0.6438,"y":0.76},{"x":0.6225,"y":0.575},{"x":0.55,"y":0.4217},{"x":0.4662,"y":0.345},{"x":0.45,"y":0.195}]	8	550	2020-11-01 10:44:23.431216	2020-11-01 10:44:23.431216
535	[{"x":0.3613,"y":0.8333},{"x":0.3875,"y":0.4417},{"x":0.3862,"y":0.2083}]	126	456	2020-11-01 10:44:23.434375	2020-11-01 10:44:23.434375
536	[{"x":0.69,"y":0.7983},{"x":0.67,"y":0.52},{"x":0.6162,"y":0.195}]	49	471	2020-11-01 10:44:23.437937	2020-11-01 10:44:23.437937
537	[{"x":0.5463,"y":0.7967},{"x":0.52,"y":0.55},{"x":0.49,"y":0.3333},{"x":0.4913,"y":0.2283}]	56	556	2020-11-01 10:44:23.444265	2020-11-01 10:44:23.444265
538	[{"x":0.5763,"y":0.9033},{"x":0.5825,"y":0.68},{"x":0.5375,"y":0.555},{"x":0.4213,"y":0.4983},{"x":0.355,"y":0.4417}]	57	470	2020-11-01 10:44:23.447605	2020-11-01 10:44:23.447605
539	[{"x":0.205,"y":0.8417},{"x":0.2125,"y":0.6067},{"x":0.3337,"y":0.475},{"x":0.535,"y":0.4017},{"x":0.6825,"y":0.375},{"x":0.7238,"y":0.28}]	58	373	2020-11-01 10:44:23.450767	2020-11-01 10:44:23.450767
540	[{"x":0.37,"y":0.7867},{"x":0.39,"y":0.5083},{"x":0.3887,"y":0.2433}]	126	552	2020-11-01 10:44:23.453963	2020-11-01 10:44:23.453963
542	[{"x":0.3162,"y":0.7383},{"x":0.3825,"y":0.6867},{"x":0.43,"y":0.54},{"x":0.4512,"y":0.3783},{"x":0.4512,"y":0.2317}]	245	554	2020-11-01 10:44:23.462132	2020-11-01 10:44:23.462132
543	[{"x":0.585,"y":0.8117},{"x":0.5913,"y":0.67},{"x":0.5275,"y":0.5317},{"x":0.4163,"y":0.4733},{"x":0.375,"y":0.4133}]	57	557	2020-11-01 10:44:23.465359	2020-11-01 10:44:23.465359
517	[{"x":0.6488,"y":0.8717},{"x":0.7037,"y":0.6633},{"x":0.6262,"y":0.5467},{"x":0.5012,"y":0.445},{"x":0.4537,"y":0.26},{"x":0.4125,"y":0.145}]	104	538	2020-11-01 10:44:23.367696	2020-11-03 13:46:18.28805
518	[{"x":0.3887,"y":0.7917},{"x":0.3613,"y":0.645},{"x":0.4113,"y":0.4917},{"x":0.4225,"y":0.3583},{"x":0.3725,"y":0.1817}]	237	538	2020-11-01 10:44:23.371172	2020-11-03 13:46:26.112843
519	[{"x":0.5387,"y":0.8467},{"x":0.54,"y":0.6883},{"x":0.48,"y":0.525},{"x":0.4888,"y":0.3117},{"x":0.5337,"y":0.0983}]	66	541	2020-11-01 10:44:23.37557	2020-11-03 13:47:12.812766
520	[{"x":0.62,"y":0.7183},{"x":0.615,"y":0.4667},{"x":0.63,"y":0.3283},{"x":0.635,"y":0.275}]	110	545	2020-11-01 10:44:23.379086	2020-11-03 13:48:52.994228
541	[{"x":0.6038,"y":0.8},{"x":0.6062,"y":0.5817},{"x":0.5913,"y":0.3383},{"x":0.5825,"y":0.2133}]	49	552	2020-11-01 10:44:23.458343	2020-11-03 13:52:32.654202
544	[{"x":0.6188,"y":0.7183},{"x":0.6312,"y":0.3483},{"x":0.6038,"y":0.2433}]	220	311	2020-11-01 12:48:57.512846	2020-11-01 12:51:21.535041
545	\N	527	300	2020-11-01 13:14:26.569415	2020-11-01 13:14:26.569415
546	[{"x":0.7262,"y":0.6917},{"x":0.7538,"y":0.555},{"x":0.735,"y":0.43},{"x":0.7475,"y":0.3383},{"x":0.7225,"y":0.2483},{"x":0.6937,"y":0.1967}]	527	300	2020-11-01 13:31:45.891838	2020-11-01 13:32:49.606446
547	[{"x":0.7262,"y":0.6917},{"x":0.7538,"y":0.555},{"x":0.735,"y":0.43},{"x":0.7475,"y":0.3383},{"x":0.7225,"y":0.2483},{"x":0.6937,"y":0.1967}]	527	311	2020-11-01 13:35:34.353901	2020-11-01 13:35:38.116339
548	[{"x":0.3525,"y":0.8183},{"x":0.34,"y":0.5783},{"x":0.39,"y":0.3567},{"x":0.415,"y":0.245}]	528	265	2020-11-01 17:15:18.957434	2020-11-01 17:15:47.99712
549	[{"x":0.29,"y":0.7017},{"x":0.3038,"y":0.6617},{"x":0.305,"y":0.6267},{"x":0.285,"y":0.5983},{"x":0.235,"y":0.59},{"x":0.195,"y":0.565},{"x":0.1525,"y":0.515},{"x":0.1588,"y":0.4233},{"x":0.235,"y":0.2783}]	529	475	2020-11-01 17:32:03.693719	2020-11-01 17:32:34.850662
550	[{"x":0.29,"y":0.7017},{"x":0.3038,"y":0.6617},{"x":0.305,"y":0.6267},{"x":0.285,"y":0.5983},{"x":0.235,"y":0.59},{"x":0.195,"y":0.565},{"x":0.1525,"y":0.515},{"x":0.1588,"y":0.4233},{"x":0.235,"y":0.2783}]	530	475	2020-11-01 17:34:33.118445	2020-11-01 17:34:44.310477
551	[{"x":0.585,"y":0.6833},{"x":0.5713,"y":0.5633},{"x":0.53,"y":0.4367},{"x":0.5288,"y":0.3467},{"x":0.5325,"y":0.3}]	531	475	2020-11-01 17:38:39.105335	2020-11-01 17:39:07.875429
552	[{"x":0.7163,"y":0.86},{"x":0.7163,"y":0.6433},{"x":0.69,"y":0.4783},{"x":0.6763,"y":0.3767},{"x":0.6863,"y":0.26},{"x":0.6525,"y":0.155}]	539	437	2020-11-01 21:17:30.17623	2020-11-01 21:17:44.839044
553	[{"x":0.3025,"y":0.8483},{"x":0.3488,"y":0.665},{"x":0.3638,"y":0.4783},{"x":0.3425,"y":0.3467},{"x":0.3675,"y":0.235},{"x":0.4125,"y":0.165}]	540	474	2020-11-01 21:20:28.481676	2020-11-01 21:20:53.168804
554	[{"x":0.5613,"y":0.815},{"x":0.5575,"y":0.6633},{"x":0.535,"y":0.5083},{"x":0.5,"y":0.355},{"x":0.485,"y":0.2383},{"x":0.4925,"y":0.1417}]	541	474	2020-11-01 21:23:39.832211	2020-11-01 21:24:26.929591
555	[{"x":0.715,"y":0.7567},{"x":0.69,"y":0.6767},{"x":0.7,"y":0.5783},{"x":0.715,"y":0.49},{"x":0.6587,"y":0.4033},{"x":0.6012,"y":0.3267},{"x":0.545,"y":0.2517},{"x":0.5288,"y":0.1467}]	542	474	2020-11-01 21:27:42.711264	2020-11-01 21:28:12.03793
556	[{"x":0.2825,"y":0.8517},{"x":0.2387,"y":0.7433},{"x":0.135,"y":0.6283},{"x":0.06,"y":0.45},{"x":0.0963,"y":0.2717},{"x":0.1563,"y":0.1283}]	543	337	2020-11-01 21:45:15.122514	2020-11-01 21:50:52.165938
557	[{"x":0.2587,"y":0.8583},{"x":0.2537,"y":0.78},{"x":0.1812,"y":0.6517},{"x":0.1812,"y":0.545},{"x":0.255,"y":0.41},{"x":0.3325,"y":0.295},{"x":0.3725,"y":0.17}]	544	337	2020-11-01 21:53:41.17649	2020-11-01 21:54:03.96729
558	[{"x":0.6813,"y":0.8317},{"x":0.69,"y":0.5833},{"x":0.7,"y":0.3883},{"x":0.6725,"y":0.2583}]	546	342	2020-11-01 21:58:07.720424	2020-11-01 21:58:27.938208
336	[{"x":0.5275,"y":0.8167},{"x":0.5288,"y":0.525},{"x":0.5325,"y":0.3417},{"x":0.5587,"y":0.145}]	166	353	2020-11-01 10:44:22.727971	2020-11-01 22:04:09.563636
560	[{"x":0.1187,"y":0.7467},{"x":0.1688,"y":0.5133},{"x":0.2137,"y":0.2483}]	547	383	2020-11-01 22:08:22.87996	2020-11-01 22:08:34.641465
561	[{"x":0.3262,"y":0.8667},{"x":0.3613,"y":0.4833},{"x":0.3713,"y":0.2567},{"x":0.3812,"y":0.1083}]	548	383	2020-11-01 22:11:52.717084	2020-11-01 22:12:26.643022
395	[{"x":0.445,"y":0.7783},{"x":0.3663,"y":0.6717},{"x":0.305,"y":0.585},{"x":0.3362,"y":0.4433},{"x":0.3688,"y":0.3183},{"x":0.4037,"y":0.2267}]	184	349	2020-11-01 10:44:22.93995	2020-11-02 09:14:00.050382
562	[{"x":0.5188,"y":0.795},{"x":0.44,"y":0.685},{"x":0.395,"y":0.595},{"x":0.4475,"y":0.48},{"x":0.5038,"y":0.345},{"x":0.5713,"y":0.2083}]	549	349	2020-11-02 09:14:49.140315	2020-11-02 09:15:32.790242
563	[{"x":0.4725,"y":0.8983},{"x":0.4,"y":0.6617},{"x":0.3325,"y":0.395},{"x":0.2775,"y":0.215},{"x":0.2537,"y":0.1183}]	550	412	2020-11-02 09:20:51.051401	2020-11-02 09:21:07.590724
564	[{"x":0.7275,"y":0.7517},{"x":0.7338,"y":0.685},{"x":0.6863,"y":0.5133},{"x":0.5837,"y":0.315},{"x":0.5313,"y":0.225}]	551	412	2020-11-02 09:23:01.384331	2020-11-02 09:23:23.074171
565	[{"x":0.4387,"y":0.84},{"x":0.4375,"y":0.72},{"x":0.4225,"y":0.4417},{"x":0.415,"y":0.27},{"x":0.4275,"y":0.135}]	552	389	2020-11-02 09:30:56.81272	2020-11-02 09:32:49.480618
566	[{"x":0.55,"y":0.8083},{"x":0.5363,"y":0.585},{"x":0.52,"y":0.3717},{"x":0.51,"y":0.1517}]	553	389	2020-11-02 09:35:30.352196	2020-11-02 09:35:45.118816
567	[{"x":0.7075,"y":0.8383},{"x":0.7075,"y":0.715},{"x":0.7963,"y":0.5633},{"x":0.82,"y":0.4433},{"x":0.8037,"y":0.3283}]	554	349	2020-11-02 09:40:10.131602	2020-11-03 13:36:09.813436
568	[{"x":0.4587,"y":0.775},{"x":0.4863,"y":0.615},{"x":0.455,"y":0.38},{"x":0.375,"y":0.2233},{"x":0.3175,"y":0.11}]	555	445	2020-11-02 09:51:27.104762	2020-11-02 09:51:34.288325
569	[{"x":0.1875,"y":0.7333},{"x":0.22,"y":0.425},{"x":0.2487,"y":0.2933},{"x":0.2787,"y":0.1917}]	558	314	2020-11-02 10:02:32.958114	2020-11-02 10:02:46.489263
570	[{"x":0.27,"y":0.8467},{"x":0.2762,"y":0.5067},{"x":0.3,"y":0.1883}]	559	431	2020-11-02 10:06:29.13253	2020-11-02 10:07:09.637863
571	[{"x":0.4875,"y":0.7633},{"x":0.5075,"y":0.5783},{"x":0.5012,"y":0.3133},{"x":0.4938,"y":0.1767}]	560	465	2020-11-02 10:11:22.287867	2020-11-02 10:11:34.863308
572	[{"x":0.52,"y":0.735},{"x":0.545,"y":0.5733},{"x":0.5313,"y":0.3517},{"x":0.4963,"y":0.21}]	561	448	2020-11-02 10:20:16.691995	2020-11-02 10:20:24.89237
573	[{"x":0.5775,"y":0.7},{"x":0.58,"y":0.5283},{"x":0.5663,"y":0.2967}]	562	448	2020-11-02 10:26:13.366126	2020-11-02 10:26:24.847719
574	[{"x":0.835,"y":0.735},{"x":0.8575,"y":0.6083},{"x":0.8575,"y":0.46},{"x":0.82,"y":0.3167}]	567	472	2020-11-02 10:59:06.212247	2020-11-02 10:59:25.398615
575	[{"x":0.7412,"y":0.76},{"x":0.7538,"y":0.5633},{"x":0.7612,"y":0.32}]	568	472	2020-11-02 11:00:45.850607	2020-11-02 11:00:57.189352
576	[{"x":0.6375,"y":0.76},{"x":0.6512,"y":0.5367},{"x":0.6538,"y":0.375}]	569	472	2020-11-02 11:04:52.397861	2020-11-02 11:05:01.828421
577	[{"x":0.5875,"y":0.7683},{"x":0.5938,"y":0.455},{"x":0.5625,"y":0.2367}]	570	472	2020-11-02 11:05:37.82465	2020-11-02 11:06:08.450879
578	[{"x":0.3312,"y":0.785},{"x":0.3362,"y":0.57},{"x":0.2825,"y":0.38},{"x":0.2562,"y":0.215}]	571	472	2020-11-02 11:08:28.352876	2020-11-02 11:08:49.610645
579	[{"x":0.1725,"y":0.77},{"x":0.1988,"y":0.58},{"x":0.1787,"y":0.35},{"x":0.1938,"y":0.235}]	572	472	2020-11-02 11:11:20.351038	2020-11-02 11:11:36.552413
580	[{"x":0.3175,"y":0.77},{"x":0.3275,"y":0.535},{"x":0.3625,"y":0.225}]	573	380	2020-11-02 11:14:31.443057	2020-11-02 11:15:20.446186
581	[{"x":0.7063,"y":0.6917},{"x":0.6825,"y":0.5533},{"x":0.71,"y":0.4633},{"x":0.725,"y":0.3533},{"x":0.6675,"y":0.2433},{"x":0.6162,"y":0.1717}]	574	380	2020-11-02 11:18:14.986777	2020-11-02 11:18:29.065017
582	[{"x":0.6663,"y":0.705},{"x":0.6388,"y":0.5333},{"x":0.6538,"y":0.405},{"x":0.6637,"y":0.2517}]	575	380	2020-11-02 11:19:28.940421	2020-11-02 11:19:46.400471
414	[{"x":0.6412,"y":0.8083},{"x":0.6212,"y":0.655},{"x":0.5225,"y":0.2817},{"x":0.455,"y":0.205},{"x":0.4313,"y":0.1517}]	226	508	2020-11-01 10:44:23.004873	2020-11-02 11:24:40.750339
583	[{"x":0.5175,"y":0.8417},{"x":0.5387,"y":0.5383},{"x":0.5262,"y":0.26},{"x":0.5038,"y":0.08}]	583	507	2020-11-02 12:29:25.031158	2020-11-02 12:30:00.468073
509	[{"x":0.3962,"y":0.8383},{"x":0.39,"y":0.5817},{"x":0.375,"y":0.2933},{"x":0.3738,"y":0.1067}]	197	507	2020-11-01 10:44:23.339137	2020-11-02 12:30:20.860638
584	[{"x":0.6012,"y":0.8633},{"x":0.61,"y":0.6317},{"x":0.5875,"y":0.4017},{"x":0.5587,"y":0.1867},{"x":0.54,"y":0.0767}]	584	507	2020-11-02 12:32:41.493915	2020-11-02 12:33:03.221712
610	[{"x":0.18,"y":0.425},{"x":0.295,"y":0.4483},{"x":0.4788,"y":0.4633},{"x":0.6362,"y":0.44},{"x":0.74,"y":0.4233},{"x":0.8275,"y":0.3967},{"x":0.8825,"y":0.355}]	612	336	2020-11-03 09:20:14.068796	2020-11-03 09:21:14.702426
585	[{"x":0.795,"y":0.735},{"x":0.8575,"y":0.5717},{"x":0.87,"y":0.4217},{"x":0.8225,"y":0.2667},{"x":0.7412,"y":0.19}]	585	370	2020-11-02 12:39:12.892848	2020-11-02 12:39:34.402513
586	[{"x":0.3387,"y":0.7983},{"x":0.3475,"y":0.6367},{"x":0.3787,"y":0.4217},{"x":0.43,"y":0.1633}]	586	461	2020-11-02 12:41:06.774627	2020-11-02 12:41:55.368636
587	[{"x":0.825,"y":0.54},{"x":0.6188,"y":0.51},{"x":0.4763,"y":0.4967},{"x":0.3875,"y":0.505},{"x":0.2525,"y":0.53},{"x":0.155,"y":0.5533},{"x":0.0512,"y":0.5433},{"x":0.0013,"y":0.505}]	587	416	2020-11-02 12:44:07.282182	2020-11-02 12:44:29.230943
588	[{"x":0.355,"y":0.7417},{"x":0.3438,"y":0.5717},{"x":0.355,"y":0.425},{"x":0.39,"y":0.285},{"x":0.4125,"y":0.215}]	588	313	2020-11-02 12:47:26.374508	2020-11-02 12:47:38.019737
589	[{"x":0.3088,"y":0.7017},{"x":0.3,"y":0.5567},{"x":0.3013,"y":0.415},{"x":0.3212,"y":0.3183}]	589	313	2020-11-02 12:48:26.036204	2020-11-02 12:48:46.047584
39	[{"x":0.4788,"y":0.7983},{"x":0.54,"y":0.56},{"x":0.5162,"y":0.35},{"x":0.5125,"y":0.155}]	135	414	2020-11-01 10:44:21.724355	2020-11-02 12:50:51.466961
590	[{"x":0.57,"y":0.67},{"x":0.5837,"y":0.505},{"x":0.6175,"y":0.3983},{"x":0.6312,"y":0.3}]	590	441	2020-11-02 12:53:03.694868	2020-11-02 12:53:14.094549
591	[{"x":0.7063,"y":0.4883},{"x":0.665,"y":0.5017},{"x":0.605,"y":0.515},{"x":0.5425,"y":0.5083},{"x":0.4575,"y":0.5633},{"x":0.3688,"y":0.5567},{"x":0.3575,"y":0.43},{"x":0.3787,"y":0.2883},{"x":0.4163,"y":0.145}]	591	441	2020-11-02 12:55:43.065643	2020-11-02 12:56:40.097269
592	[{"x":0.7063,"y":0.4983},{"x":0.6575,"y":0.515},{"x":0.5813,"y":0.5183},{"x":0.5188,"y":0.5283},{"x":0.4387,"y":0.53},{"x":0.3563,"y":0.505},{"x":0.2988,"y":0.49},{"x":0.2762,"y":0.4467}]	592	441	2020-11-02 12:58:14.281487	2020-11-02 12:58:29.332583
593	[{"x":0.3688,"y":0.7733},{"x":0.3787,"y":0.5967},{"x":0.345,"y":0.4517},{"x":0.3287,"y":0.2233}]	593	405	2020-11-02 13:04:43.138154	2020-11-02 13:04:49.281585
594	[{"x":0.2125,"y":0.7683},{"x":0.1825,"y":0.5833},{"x":0.2288,"y":0.4267},{"x":0.2675,"y":0.3},{"x":0.345,"y":0.2217}]	596	305	2020-11-02 13:16:27.940903	2020-11-02 13:17:40.627839
595	[{"x":0.8575,"y":0.7467},{"x":0.7712,"y":0.5717},{"x":0.6675,"y":0.35},{"x":0.61,"y":0.19}]	597	305	2020-11-02 13:18:59.125992	2020-11-02 13:19:13.924992
597	[{"x":0.9175,"y":0.7883},{"x":0.89,"y":0.5883},{"x":0.8475,"y":0.4167},{"x":0.7425,"y":0.3033}]	599	312	2020-11-02 13:23:13.261846	2020-11-02 13:23:25.866489
598	[{"x":0.0762,"y":0.8733},{"x":0.0912,"y":0.6283},{"x":0.1412,"y":0.365},{"x":0.2112,"y":0.1633}]	600	368	2020-11-02 13:29:44.330818	2020-11-02 13:29:57.045916
599	[{"x":0.2313,"y":0.83},{"x":0.2075,"y":0.5833},{"x":0.2263,"y":0.3817},{"x":0.2675,"y":0.1467}]	601	368	2020-11-02 13:31:10.115973	2020-11-02 13:31:21.984718
600	[{"x":0.61,"y":0.715},{"x":0.6025,"y":0.505},{"x":0.5988,"y":0.215}]	602	368	2020-11-02 13:33:39.086143	2020-11-02 13:34:12.194965
601	[{"x":0.5225,"y":0.7417},{"x":0.515,"y":0.42},{"x":0.51,"y":0.2317}]	603	368	2020-11-02 13:35:12.335741	2020-11-02 13:35:16.849143
602	[{"x":0.7438,"y":0.6867},{"x":0.7375,"y":0.4533},{"x":0.7325,"y":0.245}]	604	368	2020-11-02 13:36:41.933515	2020-11-02 13:37:00.312157
603	[{"x":0.955,"y":0.6517},{"x":0.9725,"y":0.5083},{"x":0.94,"y":0.3583}]	605	368	2020-11-02 13:38:19.564138	2020-11-02 13:38:24.159987
604	[{"x":0.07,"y":0.8533},{"x":0.115,"y":0.465},{"x":0.2712,"y":0.5233},{"x":0.3837,"y":0.445},{"x":0.58,"y":0.445},{"x":0.7137,"y":0.3733},{"x":0.7937,"y":0.2933}]	606	368	2020-11-02 13:39:32.812909	2020-11-02 13:40:00.936493
605	[{"x":0.6288,"y":0.89},{"x":0.6362,"y":0.5833},{"x":0.6637,"y":0.3017},{"x":0.6825,"y":0.18}]	607	513	2020-11-02 15:05:49.510642	2020-11-02 15:06:03.910837
611	[{"x":0.1313,"y":0.46},{"x":0.2537,"y":0.4683},{"x":0.3787,"y":0.4717},{"x":0.5188,"y":0.4883},{"x":0.6088,"y":0.4683},{"x":0.69,"y":0.3433},{"x":0.7,"y":0.21}]	612	327	2020-11-03 09:21:42.165681	2020-11-03 09:21:59.389182
606	[{"x":0.5763,"y":0.7633},{"x":0.5387,"y":0.7117},{"x":0.5188,"y":0.555},{"x":0.5112,"y":0.4317},{"x":0.5138,"y":0.31},{"x":0.5325,"y":0.1867}]	608	515	2020-11-02 15:09:17.520863	2020-11-02 15:10:49.758974
607	[{"x":0.635,"y":0.7267},{"x":0.6875,"y":0.6417},{"x":0.6963,"y":0.51},{"x":0.6875,"y":0.35},{"x":0.6388,"y":0.1633}]	609	515	2020-11-02 15:11:31.718038	2020-11-02 15:11:46.643875
608	[{"x":0.265,"y":0.74},{"x":0.2762,"y":0.4683},{"x":0.275,"y":0.24},{"x":0.2913,"y":0.1783}]	610	336	2020-11-03 09:15:53.769786	2020-11-03 09:16:11.200395
609	[{"x":0.1437,"y":0.6933},{"x":0.1512,"y":0.4617},{"x":0.175,"y":0.2667},{"x":0.2075,"y":0.1817}]	611	336	2020-11-03 09:18:10.777085	2020-11-03 09:18:20.046248
612	[{"x":0.4688,"y":0.4867},{"x":0.3075,"y":0.5067},{"x":0.18,"y":0.485},{"x":0.1425,"y":0.4383}]	613	327	2020-11-03 09:23:45.77501	2020-11-03 09:24:09.357301
613	[{"x":0.8975,"y":0.4433},{"x":0.805,"y":0.4967},{"x":0.6112,"y":0.5383},{"x":0.3887,"y":0.5317},{"x":0.27,"y":0.485},{"x":0.1487,"y":0.4383},{"x":0.1475,"y":0.285},{"x":0.1812,"y":0.2}]	613	336	2020-11-03 09:24:15.974303	2020-11-03 09:25:08.755257
615	[{"x":0.7875,"y":0.7267},{"x":0.7788,"y":0.5767},{"x":0.7675,"y":0.485},{"x":0.7275,"y":0.3933},{"x":0.675,"y":0.2867},{"x":0.6438,"y":0.1667}]	618	330	2020-11-03 09:49:01.953828	2020-11-03 09:49:17.844734
516	[{"x":0.69,"y":0.3083},{"x":0.6438,"y":0.3383},{"x":0.6225,"y":0.4633},{"x":0.5713,"y":0.5417},{"x":0.4338,"y":0.5417},{"x":0.2675,"y":0.5317},{"x":0.1688,"y":0.4517},{"x":0.1638,"y":0.3367}]	68	533	2020-11-01 10:44:23.364527	2020-11-03 09:50:13.105383
616	[{"x":0.2562,"y":0.7983},{"x":0.2512,"y":0.6733},{"x":0.255,"y":0.4767},{"x":0.2612,"y":0.265},{"x":0.2687,"y":0.2083}]	619	533	2020-11-03 09:50:53.737442	2020-11-03 09:51:12.201795
617	[{"x":0.4175,"y":0.8367},{"x":0.425,"y":0.6233},{"x":0.43,"y":0.43},{"x":0.4587,"y":0.24},{"x":0.4938,"y":0.155}]	620	533	2020-11-03 09:54:36.869618	2020-11-03 09:55:00.224343
6	[{"x":0.4525,"y":0.4967},{"x":0.5725,"y":0.4817},{"x":0.6488,"y":0.4517},{"x":0.7688,"y":0.4683},{"x":0.8237,"y":0.46},{"x":0.8488,"y":0.31}]	236	449	2020-11-01 10:44:21.616988	2020-11-03 09:56:26.995055
618	[{"x":0.2225,"y":0.86},{"x":0.22,"y":0.62},{"x":0.245,"y":0.3683},{"x":0.2737,"y":0.13}]	621	451	2020-11-03 09:58:38.117456	2020-11-03 09:58:52.733318
619	[{"x":0.58,"y":0.9217},{"x":0.5913,"y":0.6717},{"x":0.5863,"y":0.355},{"x":0.5513,"y":0.1533}]	622	284	2020-11-03 10:02:11.859984	2020-11-03 10:02:26.232932
620	[{"x":0.7312,"y":0.8717},{"x":0.725,"y":0.6417},{"x":0.6875,"y":0.4167},{"x":0.635,"y":0.295},{"x":0.5625,"y":0.16}]	623	284	2020-11-03 10:04:15.749724	2020-11-03 10:04:35.495281
621	[{"x":0.2362,"y":0.9117},{"x":0.2963,"y":0.4967},{"x":0.3675,"y":0.0917}]	624	284	2020-11-03 10:05:15.79608	2020-11-03 10:05:28.23099
622	[{"x":0.2412,"y":0.6983},{"x":0.2737,"y":0.455},{"x":0.3162,"y":0.29},{"x":0.3725,"y":0.2017}]	625	320	2020-11-03 10:07:27.026377	2020-11-03 10:07:39.294232
596	[{"x":0.8612,"y":0.6383},{"x":0.8063,"y":0.5167},{"x":0.7275,"y":0.3767},{"x":0.6737,"y":0.2667}]	598	305	2020-11-02 13:20:01.198625	2020-11-09 18:46:39.50482
623	[{"x":0.785,"y":0.86},{"x":0.8337,"y":0.7083},{"x":0.8625,"y":0.445},{"x":0.8413,"y":0.27},{"x":0.79,"y":0.1533}]	626	367	2020-11-03 10:12:18.202625	2020-11-03 10:12:32.625715
624	[{"x":0.895,"y":0.8317},{"x":0.94,"y":0.5983},{"x":0.935,"y":0.3717},{"x":0.8812,"y":0.2117},{"x":0.82,"y":0.1617}]	627	367	2020-11-03 10:13:30.437942	2020-11-03 10:13:51.164409
625	[{"x":0.3237,"y":0.84},{"x":0.2637,"y":0.555},{"x":0.2338,"y":0.28}]	628	348	2020-11-03 10:18:01.318159	2020-11-03 10:18:15.30963
626	[{"x":0.5275,"y":0.815},{"x":0.5175,"y":0.6017},{"x":0.48,"y":0.3417},{"x":0.455,"y":0.2083}]	629	348	2020-11-03 10:19:18.7904	2020-11-03 10:19:28.988707
627	[{"x":0.3613,"y":0.8283},{"x":0.3262,"y":0.5933},{"x":0.345,"y":0.3333},{"x":0.3987,"y":0.1683}]	631	362	2020-11-03 10:22:21.823578	2020-11-03 10:22:38.180957
628	[{"x":0.67,"y":0.795},{"x":0.6863,"y":0.5483},{"x":0.585,"y":0.4967},{"x":0.3787,"y":0.4467},{"x":0.185,"y":0.3783},{"x":0.1487,"y":0.31},{"x":0.1913,"y":0.2467},{"x":0.215,"y":0.1583},{"x":0.245,"y":0.1117}]	632	379	2020-11-03 10:26:46.895022	2020-11-03 10:27:16.530506
630	[{"x":0.22,"y":0.9033},{"x":0.19,"y":0.685},{"x":0.2338,"y":0.4},{"x":0.3,"y":0.165}]	637	316	2020-11-03 10:38:28.390085	2020-11-03 10:38:43.801015
631	[{"x":0.2938,"y":0.64},{"x":0.3925,"y":0.6283},{"x":0.5112,"y":0.635},{"x":0.5637,"y":0.585},{"x":0.6238,"y":0.5133},{"x":0.6538,"y":0.4467},{"x":0.6538,"y":0.2783},{"x":0.6475,"y":0.1817}]	638	316	2020-11-03 10:39:41.521664	2020-11-03 10:40:00.136219
632	[{"x":0.2863,"y":0.7917},{"x":0.29,"y":0.59},{"x":0.3225,"y":0.4033},{"x":0.3937,"y":0.27},{"x":0.4288,"y":0.1033}]	639	395	2020-11-03 10:41:16.03539	2020-11-03 10:41:26.083345
633	[{"x":0.69,"y":0.715},{"x":0.67,"y":0.555},{"x":0.6338,"y":0.3333},{"x":0.6038,"y":0.1967}]	640	351	2020-11-03 10:43:11.651237	2020-11-03 10:43:16.995395
634	[{"x":0.4487,"y":0.8333},{"x":0.4975,"y":0.7333},{"x":0.5713,"y":0.6183},{"x":0.5437,"y":0.4733},{"x":0.52,"y":0.2617},{"x":0.5313,"y":0.1683}]	643	315	2020-11-03 11:02:15.673558	2020-11-03 11:03:19.06402
635	[{"x":0.5,"y":0.83},{"x":0.44,"y":0.7283},{"x":0.4,"y":0.605},{"x":0.4537,"y":0.4433},{"x":0.5587,"y":0.16}]	644	315	2020-11-03 11:04:27.608546	2020-11-03 11:04:37.543277
636	[{"x":0.3937,"y":0.615},{"x":0.505,"y":0.6267},{"x":0.6587,"y":0.645},{"x":0.7275,"y":0.6667}]	645	315	2020-11-03 11:05:46.241115	2020-11-03 11:06:21.013014
74	[{"x":0.7638,"y":0.8183},{"x":0.795,"y":0.5967},{"x":0.7412,"y":0.3833},{"x":0.7338,"y":0.1433},{"x":0.7662,"y":0.0283}]	71	332	2020-11-01 10:44:21.865763	2020-11-03 13:24:58.461523
637	[{"x":0.2587,"y":0.6733},{"x":0.3025,"y":0.585},{"x":0.3538,"y":0.44},{"x":0.4037,"y":0.165}]	645	352	2020-11-03 11:06:25.409475	2020-11-03 11:06:52.660243
638	[{"x":0.4037,"y":0.8533},{"x":0.4075,"y":0.605},{"x":0.4225,"y":0.4383},{"x":0.3412,"y":0.305},{"x":0.3538,"y":0.2083}]	646	352	2020-11-03 11:08:28.331423	2020-11-03 11:08:47.787354
639	[{"x":0.9975,"y":0.5383},{"x":0.875,"y":0.5567},{"x":0.64,"y":0.5683},{"x":0.4763,"y":0.5667},{"x":0.3975,"y":0.5333},{"x":0.4012,"y":0.3667},{"x":0.4412,"y":0.2383},{"x":0.495,"y":0.1267}]	647	397	2020-11-03 11:10:43.420545	2020-11-03 11:11:03.728003
51	[{"x":0.7662,"y":0.7417},{"x":0.7762,"y":0.6383},{"x":0.7675,"y":0.4417},{"x":0.7588,"y":0.32},{"x":0.7525,"y":0.2433}]	183	412	2020-11-01 10:44:21.794966	2020-11-03 13:30:13.638057
640	[{"x":0.1588,"y":0.5633},{"x":0.2925,"y":0.5717},{"x":0.4863,"y":0.5867},{"x":0.6613,"y":0.55},{"x":0.85,"y":0.5267},{"x":0.9962,"y":0.4917}]	649	428	2020-11-03 11:17:11.06809	2020-11-03 11:18:12.161232
641	[{"x":0.0988,"y":0.76},{"x":0.1688,"y":0.5317},{"x":0.2437,"y":0.3717},{"x":0.3412,"y":0.25}]	651	552	2020-11-03 11:19:49.07958	2020-11-03 11:19:55.23874
642	[{"x":0.805,"y":0.765},{"x":0.7813,"y":0.6267},{"x":0.6625,"y":0.49},{"x":0.6325,"y":0.38},{"x":0.5787,"y":0.2883}]	657	554	2020-11-03 11:32:55.089746	2020-11-03 11:33:11.664851
643	[{"x":0.8113,"y":0.7367},{"x":0.7762,"y":0.615},{"x":0.6663,"y":0.485},{"x":0.5675,"y":0.41},{"x":0.4888,"y":0.3267},{"x":0.4238,"y":0.2483},{"x":0.405,"y":0.1167}]	658	554	2020-11-03 11:34:18.114687	2020-11-03 11:34:31.141219
644	[{"x":0.7963,"y":0.89},{"x":0.78,"y":0.665},{"x":0.7625,"y":0.4383},{"x":0.795,"y":0.005}]	662	426	2020-11-03 11:41:11.23015	2020-11-03 11:41:23.697889
645	[{"x":0.1075,"y":0.7967},{"x":0.09,"y":0.7217},{"x":0.0488,"y":0.5267},{"x":0.03,"y":0.1983},{"x":0.035,"y":0.13}]	663	328	2020-11-03 11:42:22.960204	2020-11-03 11:42:45.179912
363	[{"x":0.8788,"y":0.5583},{"x":0.7638,"y":0.5667},{"x":0.6512,"y":0.54},{"x":0.58,"y":0.5383},{"x":0.5088,"y":0.5083},{"x":0.39,"y":0.5417},{"x":0.2575,"y":0.5767},{"x":0.1537,"y":0.5517}]	146	472	2020-11-01 10:44:22.828074	2020-11-03 12:49:13.485445
123	[{"x":0.1425,"y":0.4483},{"x":0.3025,"y":0.4617},{"x":0.4612,"y":0.4633},{"x":0.535,"y":0.3617},{"x":0.5675,"y":0.2117}]	1	318	2020-11-01 10:44:22.022137	2020-11-03 13:02:30.518016
412	[{"x":0.6625,"y":0.7983},{"x":0.6525,"y":0.5233},{"x":0.575,"y":0.3717},{"x":0.5125,"y":0.255},{"x":0.4938,"y":0.1417}]	218	474	2020-11-01 10:44:22.997955	2020-11-03 13:18:50.090859
325	[{"x":0.6563,"y":0.8267},{"x":0.6538,"y":0.5383},{"x":0.6412,"y":0.3083},{"x":0.625,"y":0.2217}]	185	349	2020-11-01 10:44:22.685079	2020-11-03 13:32:53.310569
647	[{"x":0.2875,"y":0.89},{"x":0.3175,"y":0.6467},{"x":0.395,"y":0.4733},{"x":0.445,"y":0.2317}]	670	341	2020-11-08 17:09:05.182284	2020-11-08 17:09:21.871257
648	[{"x":0.8075,"y":0.74},{"x":0.8025,"y":0.6},{"x":0.7712,"y":0.455},{"x":0.7325,"y":0.3267},{"x":0.6863,"y":0.215},{"x":0.6275,"y":0.1217}]	671	386	2020-11-08 17:13:44.2886	2020-11-08 17:13:58.777213
649	[{"x":0.5012,"y":0.8417},{"x":0.4963,"y":0.51},{"x":0.4863,"y":0.1833}]	673	432	2020-11-08 17:26:50.099813	2020-11-08 17:27:02.131805
650	[{"x":0.5613,"y":0.8517},{"x":0.5487,"y":0.5333},{"x":0.5487,"y":0.1433}]	674	269	2020-11-08 17:29:35.148188	2020-11-08 17:29:43.537099
651	[{"x":0.49,"y":0.7967},{"x":0.495,"y":0.5133},{"x":0.4975,"y":0.2133}]	675	318	2020-11-08 17:33:04.946416	2020-11-08 17:33:16.533085
652	[{"x":0.2662,"y":0.8133},{"x":0.2988,"y":0.55},{"x":0.3625,"y":0.3283},{"x":0.4313,"y":0.1417}]	676	522	2020-11-08 17:41:51.631848	2020-11-08 17:41:59.801306
653	[{"x":0.2888,"y":0.72},{"x":0.2188,"y":0.6283},{"x":0.1338,"y":0.5267},{"x":0.0712,"y":0.355},{"x":0.0838,"y":0.2717},{"x":0.12,"y":0.185}]	677	274	2020-11-08 18:00:50.799419	2020-11-08 18:01:44.038659
629	[{"x":0.2875,"y":0.7167},{"x":0.2188,"y":0.6317},{"x":0.1338,"y":0.5267},{"x":0.07,"y":0.3567},{"x":0.0762,"y":0.2817},{"x":0.0875,"y":0.25}]	241	274	2020-11-03 10:32:19.270311	2020-11-08 18:02:05.75268
\.


--
-- Data for Name: pois; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.pois (id, title, subtitle, description, location, route, area_id, created_at, updated_at) FROM stdin;
2	Parking	Roche aux Sabots	Parking Roche aux Sabots	0101000020E610000082E2C798BB160440EAAEEC82C12F4840	0102000020E610000011000000CDCD37A27B160440DE0033DFC12F48403C32569BFF1704408E76DCF0BB2F484006F357C85C1904400A815CE2C82F48404757E9EE3A1B0440D3F4D901D72F4840F0FB372F4E1C0440DDD26A48DC2F484053CE177B2F1E0440FF40B96DDF2F484068925852EE1E0440D4450A65E12F4840D960E124CD1F0440C6FB71FBE52F48407B82C476F720044009707A17EF2F4840C425C79DD22104409981CAF8F72F4840A64412BD8C220440AF415F7AFB2F4840C748F60835230440DCF5D214013048405F0839EFFF230440C4CDA96400304840F52D73BA2C26044062D8614CFA2F48407CF0DAA50D270440F8A6E9B303304840CAA99D616A2B04405D6C5A2904304840444E5FCFD72C044004AC55BB26304840	2	2020-05-09 21:18:37.4188	2020-05-09 21:44:44.481227
1	Parking	Rocher Canon	Parking Rocher Canon	0101000020E6100000446ADAC534530540A818E76F423B4840	0102000020E6100000030000001E5B274B30530540A82EC69C423B4840BBF7B1645253054084EBB3053D3B484092536B00145105404A76BD4F383B4840	1	2020-05-09 19:45:02.796229	2020-05-09 19:50:49.931636
3	Parking	Carrefour de l'épine	Parking du carrefour de l'épine (Cuvier)	0101000020E61000003A0DE9CDE4190540E3AD1D5615394840	0102000020E6100000030000003A0DE9CDE4190540E3AD1D56153948401DD6A33F541A054073206F2B19394840E5E0A35F9D1A054058CCE0FE25394840	4	2020-10-25 22:17:52.436204	2020-10-25 22:18:28.707517
\.


--
-- Data for Name: problems; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.problems (id, name, grade, created_at, updated_at, location, circuit_id, circuit_number, steepness, height, area_id, tags, bleau_info_id) FROM stdin;
248	La Motte de Grès	2a	2020-05-07 12:44:29.61171	2020-11-09 22:52:22.098031	0101000020E61000006C5953C6512E0440FEA776F7FF2F4840	10	1	slab	3	2	{}	5826
246	Le Rebord	2c	2020-05-07 12:44:29.557853	2020-11-09 22:52:36.496657	0101000020E6100000A3681824EB2D04400A055070FC2F4840	10	2	wall	4	2	{}	5827
554	Morituri te Salutant	7b+	2020-11-02 09:39:47.664097	2020-11-03 14:18:19.711981	0101000020E610000043FFBC91B34E054018AF0197293B4840	\N		overhang	\N	1	{sit_start}	1671
48		2c	2020-04-16 20:19:03.107744	2020-11-08 11:47:34.00531	0101000020E6100000B43D1A08324E0540D9E1B96E403B4840	1	1	traverse	\N	1	{}	4372
261	L'Angle Rond	3a	2020-05-07 12:44:29.658253	2020-11-09 22:53:02.000332	0101000020E610000050D43EAC482D04403E0A896C04304840	10	4	slab	3	2	{}	5829
271	Le Livret	3a	2020-05-07 12:44:29.703409	2020-11-09 22:53:59.352463	0101000020E6100000E39180B7F02D04402C7A3C9A1C304840	10	9	slab	2	2	{}	5834
280	L'Indulgent	2b	2020-05-07 12:44:29.747438	2020-11-09 22:54:40.26712	0101000020E6100000172039BCE42E044049DBD37127304840	10	13	slab	3	2	{}	5838
324	Le Boisseau	2b+	2020-05-07 12:44:29.94265	2020-11-09 22:57:44.934645	0101000020E61000003E09C82193320440FDED40DE34304840	10	28	other	3	2	{}	5853
39		2c	2020-04-16 20:19:03.085051	2020-11-08 17:26:09.441977	0101000020E610000041421743E74C05407580C4AA4C3B4840	1	10	wall	\N	1	{}	4381
36	Le Bistrot	3a	2020-04-16 20:19:03.0744	2020-11-08 14:55:55.498491	0101000020E61000002642ECDD454D05407264C45D3E3B4840	1	14	slab	3	1	{}	4385
233	Expositions retrospectives	6c+	2020-04-16 20:19:03.656695	2020-11-08 16:04:36.510753	0101000020E6100000EB37901EB34E0540A10307A8293B4840	6	13	overhang	\N	1	{}	4506
572	L'Angle de l'Astragale	6a	2020-11-02 11:11:13.137462	2020-11-02 11:28:09.30769	0101000020E6100000D5387ADFC34E05405B28DC7E453B4840	\N	\N	overhang	\N	1	{}	824
20		2b	2020-04-16 20:19:03.03048	2020-11-08 14:59:43.114199	0101000020E610000003CA2A95854F05402929AAC31A3B4840	1	30	slab	\N	1	{}	4401
19		3b	2020-04-16 20:19:03.027729	2020-11-08 14:59:53.560413	0101000020E61000000A5DDB80FF4E054045AE5A191A3B4840	1	31	wall	\N	1	{}	4402
74		3a	2020-04-16 20:19:03.193952	2020-11-08 15:08:23.834405	0101000020E6100000001D44C8D34E05401BBD60503B3B4840	2	13	wall	\N	1	{}	4426
154	Mariage de Figaro	3b+	2020-04-16 20:19:03.424206	2020-11-08 15:09:00.373163	0101000020E61000004E000B4DDF4E0540C6F250C7373B4840	2	16	wall	4	1	{}	4429
591	Cocaline	7b+	2020-11-02 12:55:34.156812	2020-11-02 13:40:44.992417	0101000020E6100000874F7A79754E0540ECB35A8A4A3B4840	\N	\N	traverse	\N	1	{}	820
587	La Traversée du Groin	6a	2020-11-02 12:43:59.238343	2020-11-02 13:40:45.036022	0101000020E6100000F93CFA1D334E0540E0E928EA433B4840	\N	\N	traverse	\N	1	{}	19377
588	Le Korrigan	3a	2020-11-02 12:47:22.715042	2020-11-02 13:40:45.211316	0101000020E61000002C62F4B67B4E0540B01BCB7F453B4840	\N	\N	wall	\N	1	{}	
589	Saint Marcel	2a	2020-11-02 12:48:16.693842	2020-11-02 13:40:45.263216	0101000020E6100000AE3FFA48804E0540294B80E4453B4840	\N	\N	wall	\N	1	{}	
590		5b	2020-11-02 12:52:59.328825	2020-11-02 13:40:45.309107	0101000020E61000002486F446734E0540BF21BA164A3B4840	\N	\N	other	\N	1	{}	
592	Cocaline (rallongé)	7b+	2020-11-02 12:58:09.130358	2020-11-02 13:40:45.402385	0101000020E6100000874F7A79754E05403051129C4A3B4840	\N	\N	traverse	\N	1	{}	303337
67	Drambruie	3a	2020-04-16 20:19:03.165587	2020-11-08 15:10:36.538888	0101000020E6100000510DEC87BD4E0540F22B7DB8193B4840	2	24	wall	\N	1	{}	4437
49	La Crêpe	4a	2020-04-16 20:19:03.110558	2020-11-08 16:04:36.525069	0101000020E610000022B9E07BE44F05400C2EBDEA043B4840	2	43	slab	5	1	{}	4458
86	Le Beaufort	5b	2020-04-16 20:19:03.228394	2020-11-08 16:04:36.537001	0101000020E61000006929E0C2C34F0540C95713721E3B4840	3	12	overhang	5	1	{}	1817
610	Épousaille	5b	2020-11-03 09:14:39.30725	2020-11-03 09:44:20.078367	0101000020E61000006959FA9F484D05409BEFB60E3E3B4840	\N		wall	\N	1	{}	19526
611	Marquetterie	4c	2020-11-03 09:17:43.115163	2020-11-03 09:44:20.311586	0101000020E6100000DB1AFA64474D05404BBCA7BC3D3B4840	\N	\N	wall	\N	1	{}	19525
443	\N	\N	2020-10-19 19:34:08.096548	2020-10-30 22:05:33.492381	0101000020E61000007E1CE9718B1A0540AFE7400042394840	13	7	other	\N	4	{}	\N
418	\N	\N	2020-10-19 19:33:22.82788	2020-10-30 22:05:33.972835	0101000020E610000083E5E8D0571C054085EF1BC340394840	14	32	other	\N	4	{}	\N
436	\N	\N	2020-10-19 19:33:22.862817	2020-10-30 22:05:34.010153	0101000020E6100000BEDAE87D7C1D0540D862474F33394840	14	50	other	\N	4	{}	\N
216	L'Amérique	4a	2020-04-16 20:19:03.610389	2020-11-08 15:17:28.665375	0101000020E610000056C2FCF3144F05405EBFE1A1343B4840	5	15	wall	4	1	{}	4475
214	Soleil Couchant	4b	2020-04-16 20:19:03.604353	2020-11-08 15:17:48.453881	0101000020E61000002B6D2340064F0540ECAAA3F8343B4840	5	17	wall	4	1	{}	4477
136	Hôtels	4b	2020-04-16 20:19:03.375385	2020-11-08 15:20:07.795475	0101000020E610000050772093424E0540B1A5980F463B4840	5	29	wall	4	1	{}	4490
130	Nocturne	3c	2020-04-16 20:19:03.358913	2020-11-08 15:20:39.373595	0101000020E6100000CFA651FA2D4D0540A77C34DA3E3B4840	5	32	wall	3	1	{}	4493
210	Méditation	4c	2020-04-16 20:19:03.591445	2020-11-08 15:21:41.893214	0101000020E610000055E0C4021E4C05406F59C60D2D3B4840	5	38	wall	3	1	{}	4499
123	L'Intermédiaire	4a	2020-04-16 20:19:03.339222	2020-11-08 15:23:55.607461	0101000020E6100000833FCEDA994F05402E219284173B4840	3	10	wall	\N	1	{}	1814
629	La Vipère	4a	2020-11-03 10:19:16.108797	2020-11-03 10:43:50.767497	0101000020E6100000F555FA05FF4E0540DB84DF3F153B4840	\N	\N	wall	\N	1	{}	304552
628	Le Cobra	4b	2020-11-03 10:17:50.340945	2020-11-03 10:43:50.799411	0101000020E61000003845FAA8014F0540005329DB143B4840	\N	\N	wall	\N	1	{}	304553
630	Monsieur Danglard	3b	2020-11-03 10:20:40.003941	2020-11-03 10:43:51.080871	0101000020E61000000A50FA87C84E0540B3C5FBF1153B4840	\N	\N	slab	\N	1	{}	
50	La calandre	3a	2020-04-16 20:19:03.113229	2020-11-08 16:10:40.252269	0101000020E6100000D865F84F37500540B69DB646043B4840	2	42	overhang	\N	1	{risky}	4457
189	Les Plats	4b	2020-04-16 20:19:03.530687	2020-11-08 15:26:00.487018	0101000020E610000078230E6E634F0540BDEFFA35323B4840	3	23	wall	\N	1	{}	1830
113	Dure Limite	6b	2020-04-16 20:19:03.307868	2020-11-08 15:29:37.317559	0101000020E610000012EFC29A024F0540003A67980B3B4840	4	4	overhang	4	1	{}	3280
124	Quintessence	5c	2020-04-16 20:19:03.341645	2020-11-08 15:29:54.138562	0101000020E610000007AC0F63F44D054004EA9907093B4840	4	6	slab	4	1	{}	3281
108	Coup de Poker	5c	2020-04-16 20:19:03.292023	2020-11-08 15:30:18.885893	0101000020E610000025E922ACFD4C0540AEA216140E3B4840	4	9	wall	\N	1	{}	3284
149	Les Temps Modernes	6b	2020-04-16 20:19:03.411405	2020-11-08 15:33:30.182175	0101000020E61000008644613B214F05406A75EEEE413B4840	4	29	traverse	\N	1	{}	3304
193	Les Petits Pieds	6a	2020-04-16 20:19:03.541645	2020-11-08 15:31:59.470403	0101000020E61000003C0B09F3BA4E0540B17DEB87273B4840	4	19	slab	4	1	{}	3294
144	L'Astragale	6b	2020-04-16 20:19:03.39802	2020-11-08 15:34:11.44458	0101000020E61000002E186C0CB94E05409EFB8FB4453B4840	4	33	wall	4	1	{}	3308
132	Saillie d'Esprit	6b+	2020-04-16 20:19:03.363868	2020-11-08 15:35:34.56536	0101000020E6100000CE9D8031594D0540974539483F3B4840	4	42	wall	3	1	{}	3317
21	Magouilles	3b	2020-04-16 20:19:03.033315	2020-11-08 16:04:36.504886	0101000020E6100000DBD2ACC35A4F05401528E6A11B3B4840	1	29	wall	5	1	{}	4400
88	Le Pilier du Dromadaire	4c	2020-04-16 20:19:03.234423	2020-11-08 16:04:36.540937	0101000020E61000001AAFABEE544F05409E162B111C3B4840	3	14	wall	5	1	{}	1820
16		1b	2020-04-16 20:19:03.019868	2020-11-08 16:12:39.380154	0101000020E61000007795F3BFA14E0540E78EA4A4113B4840	1	34	slab	\N	1	{risky}	4406
265	La Dignité	5a	2020-05-07 12:44:29.683406	2020-11-09 23:02:45.391342	0101000020E61000008D37AB13032D0440DF0A3D850B304840	12	4	wall	4	2	{}	23928
263	Antigel	5c	2020-05-07 12:44:29.676841	2020-11-09 23:09:54.301075	0101000020E6100000E9149A4F422D04409296F83F07304840	11	2	overhang	4	2	{}	8848
571	L'Astragale (direct)	6c	2020-11-02 11:08:16.867613	2020-11-03 14:18:19.418977	0101000020E61000003A3D7A18B84E054077074D9B453B4840	\N	\N	wall	\N	1	{}	3309
291	Mauvaise Pioche	5b+	2020-05-07 12:44:29.78503	2020-11-09 23:11:03.038665	0101000020E61000006D8C4497772F0440CD3C44F825304840	11	9	wall	4	2	{}	5895
45		2b	2020-04-16 20:19:03.099817	2020-11-08 11:48:19.922352	0101000020E6100000086494E8C84D0540668B1D36453B4840	1	4	overhang	\N	1	{}	4375
17	Lola	2c	2020-04-16 20:19:03.022537	2020-11-08 15:00:14.572316	0101000020E61000009AF988B2D44E05409B5E38FD153B4840	1	33	slab	\N	1	{}	4404
85		3a	2020-04-16 20:19:03.225198	2020-11-08 15:05:40.664461	0101000020E6100000E676F3178350054054CEE539363B4840	2	2	traverse	\N	1	{}	4414
84	La Folklorique	2a	2020-04-16 20:19:03.222079	2020-11-08 15:05:49.979505	0101000020E6100000FB2860BD32500540A90B72A5353B4840	2	3	traverse	\N	1	{}	4415
83	Le Butte	3b	2020-04-16 20:19:03.219112	2020-11-08 15:06:01.937745	0101000020E610000061B7DA7F24500540171C17F2353B4840	2	4	slab	3	1	{}	4416
78		2c	2020-04-16 20:19:03.20556	2020-11-08 15:07:57.495767	0101000020E6100000FD371FB50A4F0540D3D028DC303B4840	2	10	wall	\N	1	{}	4423
167	Opus Dei	3c	2020-04-16 20:19:03.464213	2020-11-08 15:08:06.63966	0101000020E61000000DBCF537204F05409E6B8CB2313B4840	2	11	wall	\N	1	{}	4424
539	Eric	3b	2020-11-01 21:17:02.980235	2020-11-01 22:14:40.022216	0101000020E6100000CF59F4EE334F054078AAE19B323B4840	\N	\N	wall	\N	1	{}	
221	Magifix	6c+	2020-04-16 20:19:03.623733	2020-11-02 11:28:09.352207	0101000020E61000000B76B3DB2C500540C41250613F3B4840	6	2	overhang	4	1	{}	1744
573	Capri	3c	2020-11-02 11:14:24.44257	2020-11-02 11:28:09.401728	0101000020E6100000B329FA2BBB4E054016FE0E5A443B4840	\N	\N	wall	\N	1	{}	
75		3a+	2020-04-16 20:19:03.196731	2020-11-08 15:09:19.569953	0101000020E6100000425E11FBD54E0540166CED9C343B4840	2	18	overhang	\N	1	{}	4431
65	Bofinger	3b	2020-04-16 20:19:03.160686	2020-11-08 15:10:55.20882	0101000020E610000029AF13CC764E0540D81816E7133B4840	2	26	slab	4	1	{}	4439
63		2c	2020-04-16 20:19:03.152875	2020-11-08 15:11:05.222238	0101000020E6100000C9B85589D04D05409526E7A6103B4840	2	27	wall	4	1	{}	4440
59	Candide	4a+	2020-04-16 20:19:03.138365	2020-11-08 15:12:01.237275	0101000020E6100000B1096132864E054083126196FE3A4840	2	32	overhang	4	1	{}	4445
434	\N	\N	2020-10-19 19:33:22.859067	2020-10-30 22:05:33.446422	0101000020E6100000B707E9D4AC1D05408CF3F1F039394840	14	48	other	\N	4	{}	\N
52		3b+	2020-04-16 20:19:03.118716	2020-11-08 15:13:17.388516	0101000020E610000098332963C35005400BEB0B47053B4840	2	40	wall	\N	1	{}	4455
466			2020-10-19 19:34:08.148258	2020-10-30 22:05:33.862027	0101000020E6100000E024E9D3AE1C054038EB54FC3D394840	13	30	other	\N	4	{}	\N
754	La Fosse Perplexe	4c	2020-11-11 15:12:13.247546	2020-11-11 15:17:43.460915	0101000020E6100000AF0FE96F2A33044064AD3CBF55304840	\N	\N	traverse	\N	2	{}	23950
276	Le Bilbo	5b	2020-05-07 12:44:29.72365	2020-11-11 15:17:43.476097	0101000020E6100000EAB479A5392E0440A8AE3A9022304840	11	6	wall	5	2	{}	23909
327	Le Couloir	3a	2020-05-07 12:44:29.954071	2020-11-11 15:17:43.497261	0101000020E61000008B7120E5E8320440E46FC2F833304840	10	30	traverse	2	2	{}	5855
753	La Disparition	5a	2020-11-11 15:11:22.112289	2020-11-11 15:17:43.505626	0101000020E6100000D00CE97B78330440ED105B7960304840	\N	\N	wall	\N	2	{}	23937
274	Tentation pour Quatre	4c	2020-05-07 12:44:29.713637	2020-11-11 15:17:43.598483	0101000020E6100000C391F0B8A72E04406D9699EF20304840	11	5	overhang	3	2	{}	5888
297	Vol à Vue	5b+	2020-05-07 12:44:29.817348	2020-11-11 15:17:43.755447	0101000020E6100000017B8CBFDB2F0440FE30223024304840	11	16	overhang	4	2	{}	5893
273	L'Accusation	3b+	2020-05-07 12:44:29.710103	2020-11-11 15:17:43.771539	0101000020E6100000B71CCA5A712E0440D958A94C1D304840	12	6	wall	4	2	{}	5823
417	\N	\N	2020-10-19 19:33:22.826188	2020-10-30 22:05:33.929356	0101000020E61000000014E99F5C1B054056BB88D545394840	14	31	other	\N	4	{}	\N
484	\N	\N	2020-10-19 19:34:08.18634	2020-10-30 22:05:33.977326	0101000020E61000008FD9E897711D0540CE8EB4B032394840	13	48	other	\N	4	{}	\N
139	Le Sylphe	5a	2020-04-16 20:19:03.384731	2020-11-08 15:19:30.466787	0101000020E61000001F574EF20F4E05404131B8CD433B4840	5	26	wall	4	1	{}	4487
138	Quatrain	4a+	2020-04-16 20:19:03.381005	2020-11-08 15:19:37.761074	0101000020E6100000A044ED54194E05401C85FA0E443B4840	5	27	wall	4	1	{}	4488
128	Poésies	4a	2020-04-16 20:19:03.353357	2020-11-08 15:20:27.364361	0101000020E6100000236EFD94E44C05408CA724D2453B4840	5	31	slab	\N	1	{}	4492
237	Délivrance / Marquis de Sade	7a+	2020-04-16 20:19:03.668523	2020-11-08 16:04:36.598079	0101000020E610000017F140368C4E0540469F537F153B4840	6	17	slab	6	1	{}	815
752	Zone à Défendre	6b+	2020-11-11 15:07:33.511721	2020-11-11 15:17:43.780455	0101000020E61000008759F4FEE2360440135AA0D081304840	\N	\N	roof	\N	2	{}	24606
219	Nuage Blanc	6a+	2020-04-16 20:19:03.618292	2020-11-08 15:32:54.109255	0101000020E6100000481EE89EFE4E0540BECF99DF333B4840	4	25	overhang	4	1	{}	3300
161	Puzzle	5c	2020-04-16 20:19:03.444224	2020-11-08 15:33:21.118343	0101000020E6100000810BC0E03A500540CA53F2F83E3B4840	4	28	overhang	4	1	{}	3303
223	L'Innominata	6c+	2020-04-16 20:19:03.629074	2020-11-08 15:37:12.033199	0101000020E6100000D69A27E2C14E054040D61FDE443B4840	6	4	wall	4	1	{}	4502
234	Les Copains d'abord	7a	2020-04-16 20:19:03.659414	2020-11-08 15:38:41.637106	0101000020E610000031DCEF5D545005403E47B4391F3B4840	6	14	overhang	\N	1	{sit_start}	805
551	Le Cruciverbiste	6a	2020-11-02 09:22:57.98702	2020-11-08 16:51:28.852241	0101000020E61000002159F430C54E0540DE1984F1273B4840	\N		slab	\N	1	{}	1823
118	L'Appuyette	5b	2020-04-16 20:19:03.324845	2020-11-08 16:04:36.585141	0101000020E610000083BD22C2954F05407FEC494D0A3B4840	3	4	slab	5	1	{}	1806
183	Chlorophylle	6b	2020-04-16 20:19:03.508384	2020-11-08 16:04:36.587339	0101000020E6100000802363C6CD4E05409E5E2D49283B4840	4	20	slab	6	1	{}	3295
699	Le Coq	6a	2020-11-11 13:22:57.72276	2020-11-11 15:17:43.879533	0101000020E6100000DB2DFABEA22F044084DD34E82C304840	\N	\N	overhang	\N	2	{}	22891
294	Le Lux	5a	2020-05-07 12:44:29.806067	2020-11-09 23:03:42.128132	0101000020E6100000F6D25C86C52F0440EC5BD38225304840	12	10	wall	4	2	{}	5819
299	La Borne	4a	2020-05-07 12:44:29.82442	2020-11-09 23:03:50.919912	0101000020E6100000F38D950D2C300440E93453DA26304840	12	11	slab	4	2	{}	5816
308	L'Indolent	4a+	2020-05-07 12:44:29.876089	2020-11-09 23:04:11.931959	0101000020E6100000AD9B8BA2E83004409822B3C633304840	12	13	wall	3	2	{}	24002
31	Autoroute du Soleil	2c	2020-04-16 20:19:03.061908	2020-11-08 14:57:04.098421	0101000020E610000082E5251EE34D0540C5B05F5F313B4840	1	19	overhang	\N	1	{}	4390
634	La Mare (droite)	7b	2020-11-03 10:34:47.055092	2020-11-08 18:03:54.758146	0101000020E6100000C26DF49E1A4F05400362B95F0F3B4840	\N	\N	overhang	\N	1	{}	821
285	Coquetterie	6a+	2020-05-07 12:44:29.764821	2020-11-09 23:11:41.332152	0101000020E61000006649E583992F0440A5E99FF32C304840	11	14	traverse	3	2	{}	5901
11		2a	2020-04-16 20:19:03.0008	2020-11-08 15:02:34.06239	0101000020E610000041001CF4C34D054083BBF57C103B4840	1	39	slab	\N	1	{}	4410
593	Goulotte	6a	2020-11-02 13:04:36.50484	2020-11-02 13:40:45.292129	0101000020E61000006BA2F4FF234E054074D6AE1F473B4840	\N	\N	overhang	\N	1	{}	17755
79	La Contrabasse	3c+	2020-04-16 20:19:03.208392	2020-11-08 15:07:48.083956	0101000020E61000007D64C67C134F05404FF603422F3B4840	2	9	slab	\N	1	{}	4422
574	Rondopo	4c	2020-11-02 11:18:02.820313	2020-11-02 11:28:09.36198	0101000020E61000008852FA5DC54E054034944D4F453B4840	\N		overhang	\N	1	{sit_start}	17432
557	Rue de Siam	7b	2020-11-02 09:58:03.835745	2020-11-02 11:28:09.395916	0101000020E6100000EA9BF4DB554F054068C1E041423B4840	\N	\N	traverse	\N	1	{}	825
556	L'Amiral	4c	2020-11-02 09:54:39.565069	2020-11-02 11:28:09.646348	0101000020E6100000755EFAA49B4F0540481C3C393B3B4840	\N	\N	wall	\N	1	{}	4466
76		1a+	2020-04-16 20:19:03.199881	2020-11-08 15:08:15.746053	0101000020E610000039C87487E84E0540C9E026A4343B4840	2	12	wall	\N	1	{}	17726
164	Égérie	4b	2020-04-16 20:19:03.455374	2020-11-08 15:16:14.216657	0101000020E61000002B42A08A2F4F0540832A34402E3B4840	5	10	slab	4	1	{}	4470
114	Le dévers	4b	2020-04-16 20:19:03.312006	2020-11-08 15:23:22.994087	0101000020E610000047FEBBE24B4F054048F6FCED0E3B4840	3	7	overhang	3	1	{}	1809
200	L'Oubliée	4b	2020-04-16 20:19:03.561823	2020-11-08 15:26:40.029024	0101000020E6100000E08A5F31834D0540DAB1479F2C3B4840	3	27	wall	\N	1	{}	1834
594	Sixième Piste	6b+	2020-11-02 13:08:56.095494	2020-11-02 13:40:45.058373	0101000020E6100000CC7CF420034E054035ACC5E0453B4840	\N		overhang	\N	1	{sit_start}	17756
595	Crescendo	7c	2020-11-02 13:10:37.745385	2020-11-02 13:40:45.266351	0101000020E61000009083F4250D4E0540C6858DAC453B4840	\N	\N	traverse	\N	1	{}	836
612	Un Verset Satanique	7b	2020-11-03 09:20:08.789088	2020-11-03 09:44:20.155499	0101000020E6100000D639FA48454D0540267396BD3D3B4840	\N	\N	traverse	\N	1	{}	827
115	Le Talon d'Achille	6a+	2020-04-16 20:19:03.315145	2020-11-08 15:29:27.091274	0101000020E6100000136167805A4F0540BD02F4760C3B4840	4	3	wall	3	1	{}	3279
127	Faute de Frappe	5c	2020-04-16 20:19:03.350497	2020-11-08 15:31:09.939936	0101000020E6100000D795049CED4E054036F59DF7153B4840	4	15	wall	3	1	{}	3290
126	Le Cap Gap	5a	2020-04-16 20:19:03.34717	2020-11-08 16:04:36.611131	0101000020E61000006EFEE87CCF4F0540B5089A8D043B4840	3	1	slab	5	1	{}	1803
739	L'Orage	5a	2020-11-11 14:52:29.489745	2020-11-11 15:17:43.394804	0101000020E6100000055EF4DA743204409F9E3D104C304840	\N	\N	wall	\N	2	{}	23919
706		4b	2020-11-11 13:42:42.708971	2020-11-11 15:17:43.399477	0101000020E6100000ED6CF48508300440C2CA001E24304840	\N	\N	slab	\N	2	{}	
340	L'Éminence	5a	2020-05-07 12:44:30.012221	2020-11-11 15:17:43.406767	0101000020E61000006856A4EA15330440DAFDC12C47304840	11	29	wall	4	2	{}	23917
342	La Placette	3a	2020-05-07 12:44:30.019746	2020-11-11 15:17:43.41606	0101000020E61000009B7354B2D5320440710C2C6C48304840	10	37	other	3	2	{}	5862
731		3a	2020-11-11 14:37:35.618192	2020-11-11 15:17:43.420958	0101000020E610000087683494D5320440CAA8AABF32304840	\N	\N	other	\N	2	{}	
749	Gros Ventre	6c	2020-11-11 15:05:06.873043	2020-11-11 15:17:43.430452	0101000020E61000007C61F4B665380440281635A587304840	\N	\N	overhang	\N	2	{}	12286
288	Jeu de Quilles	5c	2020-05-07 12:44:29.774914	2020-11-11 15:17:43.446679	0101000020E610000023A516B6B32F0440CDBC76B228304840	11	15	wall	3	2	{}	5902
671		3c	2020-11-08 17:13:03.034034	2020-11-08 17:48:54.020147	0101000020E61000008CFE3CFB7D4F0540F3B0B989313B4840	\N	\N	other	\N	1	{}	4420
737	Long Way	6c	2020-11-11 14:50:06.256206	2020-11-11 15:17:43.467346	0101000020E61000002E69F4187332044058D25E0C4E304840	\N	\N	traverse	\N	2	{}	9889
680	La peintre	4c	2020-11-11 12:46:31.724976	2020-11-11 15:17:43.653816	0101000020E61000005252F440232D0440BA044F3D0C304840	\N	\N	other	\N	2	{}	
679	Zsa Zsa Gabor	2a	2020-11-11 12:45:27.17769	2020-11-11 15:17:43.81986	0101000020E610000053E4681A232E0440CF05C134FE2F4840	\N	\N	other	\N	2	{}	
678	Verglas Fréquent	6b	2020-11-11 12:42:55.574408	2020-11-11 15:17:43.836418	0101000020E61000008013E98D4D2E0440F08F6BD5FE2F4840	\N	\N	slab	\N	2	{}	8846
756	La Marbrerie	4b	2020-11-11 15:15:26.424672	2020-11-11 15:17:43.884105	0101000020E6100000E912FA8FBF32044064D8134148304840	\N	\N	slab	\N	2	{}	23948
681	Coup de Manivelle	6b	2020-11-11 12:48:19.583932	2020-11-11 15:17:43.907198	0101000020E6100000B28FF495192D0440EBFCBF6F0C304840	\N	\N	traverse	\N	2	{}	13702
454	\N	\N	2020-10-19 19:34:08.122809	2020-10-30 22:05:33.456388	0101000020E6100000D100E9F84D1C0540B18390F630394840	13	18	other	\N	4	{}	\N
635	La Mare (direct)	7c	2020-11-03 10:35:28.153651	2020-11-03 10:43:50.735284	0101000020E61000005D69F465264F0540DE18A8600F3B4840	\N	\N	overhang	\N	1	{}	832
475			2020-10-19 19:34:08.164936	2020-10-30 22:05:33.528445	0101000020E6100000C405E9E5C91C054039F8118E39394840	13	39	other	\N	4	{}	\N
483	\N	\N	2020-10-19 19:34:08.180996	2020-10-30 22:05:33.598744	0101000020E61000005CF4E897CB1D0540FB8A27402F394840	13	47	other	\N	4	{}	\N
468	\N	\N	2020-10-19 19:34:08.153166	2020-10-30 22:05:33.703912	0101000020E6100000EDDBE863871D05400CD723F847394840	13	32	other	\N	4	{}	\N
521	\N	\N	2020-10-19 19:34:28.362649	2020-10-30 22:05:33.804808	0101000020E610000089DBE878641C054054F858BD33394840	15	37	other	\N	4	{}	\N
633	Luminaire	5c	2020-11-03 10:33:23.35698	2020-11-03 10:43:50.749574	0101000020E6100000B06EF470574F0540A42159C60D3B4840	\N	\N	other	\N	1	{}	
636	Fosse sceptique	5c+	2020-11-03 10:36:05.55748	2020-11-03 10:43:50.756144	0101000020E61000003759F47B2E4F0540C498014E0F3B4840	\N	\N	overhang	\N	1	{}	
632	Zermatt Express	6c	2020-11-03 10:26:44.47533	2020-11-03 10:43:50.932162	0101000020E6100000AD167A675A4E05403E12F7BA153B4840	\N	\N	traverse	\N	1	{}	822
655	La Maschine	7c	2020-11-03 11:27:51.930039	2020-11-03 11:49:07.170512	0101000020E6100000D2517AC78F4F0540E69D4ABD013B4840	\N		other	\N	1	{}	15408
664	La Baleine	7c+	2020-11-03 11:44:49.62779	2020-11-03 11:49:07.644356	0101000020E61000002793F45B7D4D0540A2D775950A3B4840	\N		roof	\N	1	{sit_start}	462
654	Full Metal Jacket	7b+	2020-11-03 11:25:48.578521	2020-11-03 11:49:07.796699	0101000020E61000003183F4D4C54F0540DED07983013B4840	\N	\N	overhang	\N	1	{}	968
653	Compressman	7a	2020-11-03 11:25:10.049801	2020-11-03 11:49:07.829217	0101000020E610000075A1F43BD74F0540324A30E8013B4840	\N	\N	overhang	\N	1	{}	14290
335	Le Bac Rond	4b	2020-05-07 12:44:29.98695	2020-11-09 23:04:59.726349	0101000020E61000004D6399CC61330440FBD6404C45304840	12	18	wall	3	2	{}	5792
18		2a	2020-04-16 20:19:03.025123	2020-11-08 15:00:03.508725	0101000020E6100000DD67DD34D74E05403AA9888E193B4840	1	32	traverse	\N	1	{}	4403
358	Le Velouté	3c	2020-05-07 12:44:30.084878	2020-11-09 23:06:11.82363	0101000020E610000036BAAEF9493304408B00221A58304840	12	25	wall	4	2	{}	5787
220	Cadeau du Vent	7b	2020-04-16 20:19:03.620885	2020-11-08 16:04:36.689191	0101000020E6100000570E1A3583500540DD49122C383B4840	6	1	overhang	5	1	{}	1406
558	Leporello	4a	2020-11-02 10:02:20.751033	2020-11-02 11:28:09.512099	0101000020E6100000171C7ABDF44E0540500CD11D383B4840	\N	\N	wall	\N	1	{}	
575	Lisboa	4b	2020-11-02 11:19:21.658018	2020-11-02 11:28:09.741203	0101000020E61000001D58FA7CC44E05401E2A8B22453B4840	\N	\N	overhang	\N	1	{}	
80	L'Ex Saut du Jaune	2c	2020-04-16 20:19:03.211104	2020-11-08 15:07:38.698464	0101000020E6100000C4498AA6344F0540433F04DE303B4840	2	8	traverse	\N	1	{}	17725
125		3c	2020-04-16 20:19:03.344473	2020-11-08 15:12:47.96864	0101000020E6100000EA240D10855005404C491035FE3A4840	2	37	wall	\N	1	{}	4452
51		3b	2020-04-16 20:19:03.116043	2020-11-08 15:13:29.824623	0101000020E61000003834215790500540960CC257053B4840	2	41	overhang	\N	1	{}	4456
682	Fissure Matin	3a	2020-11-11 12:54:54.550563	2020-11-11 15:17:43.433418	0101000020E6100000C989F4E4502E0440AACD503C1D304840	\N	\N	other	\N	2	{}	
729	L'Œil de la Sibylle	7c+	2020-11-11 14:27:21.676214	2020-11-11 15:17:43.470361	0101000020E61000005339FA69C831044096B736E62E304840	\N	\N	roof	\N	2	{}	180
376	Le Barbot	4a	2020-05-07 12:44:30.159825	2020-11-11 15:17:43.48491	0101000020E6100000B20116DD2B36044040EFF8D280304840	12	34	wall	3	2	{}	5770
726	Lame de Fond	8a	2020-11-11 14:23:48.580554	2020-11-11 15:17:43.487661	0101000020E6100000983D3DDACC31044017515AF32D304840	\N	\N	roof	\N	2	{}	182
685	Le Crépuscule	5a	2020-11-11 13:02:16.672711	2020-11-11 15:17:43.491439	0101000020E6100000A45F7A45432E044057C6835E23304840	\N	\N	other	\N	2	{}	
687	La Bataille	4a	2020-11-11 13:04:32.01296	2020-11-11 15:17:43.514306	0101000020E610000055127A5BA52E0440886B5BAA20304840	\N	\N	other	\N	2	{}	
747	La Voie de Crécelle	3b	2020-11-11 15:02:17.010408	2020-11-11 15:17:43.517051	0101000020E61000009D1CFAAE423604408AA48F6F80304840	\N	\N	other	\N	2	{}	
708	Cigarettes	5a	2020-11-11 13:44:57.67395	2020-11-11 15:17:43.537699	0101000020E61000004D5E7A6341300440590E5EDD26304840	\N		other	\N	2	{}	
326	L'Audacieuse	3a+	2020-05-07 12:44:29.949997	2020-11-11 15:17:43.543627	0101000020E610000075C30358B0320440A40AD89633304840	10	29	overhang	2	2	{}	5854
727	Le Retour de la Chenille	7a+	2020-11-11 14:24:23.662774	2020-11-11 15:17:43.551579	0101000020E61000008F2CBDC3CC310440CA01442D2E304840	\N	\N	roof	\N	2	{}	954
741	Le Sortant	4c	2020-11-11 14:55:15.396624	2020-11-11 15:17:43.554229	0101000020E61000005E99F4C28C320440BAE31E214B304840	\N	\N	wall	\N	2	{}	24001
710	Bombay	3b	2020-11-11 13:48:15.127536	2020-11-11 15:17:43.574292	0101000020E610000013ECE8630C300440FCC7C22E05304840	\N	\N	slab	\N	2	{}	
730	L'Audacieux	4c	2020-11-11 14:34:55.991443	2020-11-11 15:17:43.57858	0101000020E61000006C6BF4DAA1320440400F3C8A35304840	\N	\N	overhang	\N	2	{}	5809
722	La Totalité de l'Autre Toit	8a	2020-11-11 14:20:13.83398	2020-11-11 15:17:43.590263	0101000020E6100000DBA77E48C4310440F54CC04A2D304840	\N	\N	roof	\N	2	{}	181
688	Jour de Gloire	6b	2020-11-11 13:07:17.773043	2020-11-11 15:17:43.605155	0101000020E6100000429FF4D9792E0440E0EBCB7722304840	\N		roof	\N	2	{risky}	23628
712	Comme Vous Voudrez	6b	2020-11-11 13:50:03.879045	2020-11-11 15:17:43.613985	0101000020E6100000F491F4F123300440592B192906304840	\N	\N	slab	\N	2	{}	20179
290	L'Écorce	4a	2020-05-07 12:44:29.781526	2020-11-11 15:17:43.620794	0101000020E6100000A550550C752F04408BD41E8626304840	12	8	wall	3	2	{}	24004
702	Libre Service	5c	2020-11-11 13:36:37.171051	2020-11-11 15:17:43.625694	0101000020E6100000CC59340ADB2F044086E9FEC123304840	\N	\N	slab	\N	2	{}	5892
318	Pierre Ponce	5a	2020-05-07 12:44:29.911999	2020-11-11 15:17:43.630276	0101000020E6100000C9595EF750300440F1C9646307304840	11	22	wall	3	2	{}	5909
160	L'Hiver	4b+	2020-04-16 20:19:03.441015	2020-11-08 15:14:44.586052	0101000020E610000023E29CC7175005402473238C3F3B4840	5	4	overhang	\N	1	{}	4463
520	\N	\N	2020-10-19 19:34:28.360786	2020-10-30 22:05:33.468624	0101000020E61000008D2BE98D4F1C05407508F2D936394840	15	36	other	\N	4	{}	\N
425	\N	\N	2020-10-19 19:33:22.841119	2020-10-30 22:05:33.594121	0101000020E6100000A4D0E81BA21D0540CC8A3BAB48394840	14	39	other	\N	4	{}	\N
177	L'Espace	5a	2020-04-16 20:19:03.491804	2020-11-08 15:15:20.448166	0101000020E610000052D6734501500540C41C4748373B4840	5	8	wall	4	1	{}	19914
156	Paysage	3b	2020-04-16 20:19:03.429431	2020-11-08 15:18:04.902472	0101000020E6100000B6502584EC4E05402B989BFF373B4840	5	19	wall	4	1	{}	4479
95	L'Imprévue	5a+	2020-04-16 20:19:03.255305	2020-11-08 15:27:50.106615	0101000020E6100000A278088F074F0540FA52461A1A3B4840	3	34	wall	\N	1	{}	1842
598		2a	2020-11-02 13:19:53.425654	2020-11-02 13:40:44.948917	0101000020E6100000CA9CF454394D05403EBB0FF0483B4840	\N		slab	\N	1	{}	
613	Destruction d'Indices	6b	2020-11-03 09:23:40.619748	2020-11-03 09:44:20.189583	0101000020E6100000AE347AED2F4D054063EA63E23E3B4840	\N	\N	traverse	\N	1	{}	19545
96	La Cachée	4c	2020-04-16 20:19:03.258264	2020-11-08 15:28:01.103742	0101000020E6100000424E551BBD4E0540847B7D89183B4840	3	35	wall	4	1	{}	1843
120	Scarlatine	6b	2020-04-16 20:19:03.33075	2020-11-08 15:29:18.072157	0101000020E6100000B5661D13644F0540CD3602B4073B4840	4	2	slab	\N	1	{}	3278
728	Jack in the Box	8a+	2020-11-11 14:26:10.614193	2020-11-11 15:17:43.634822	0101000020E6100000E748FD74CC3104404C064E5E2E304840	\N	\N	roof	\N	2	{}	184
740	Pince-Oreille	6a	2020-11-11 14:54:23.752112	2020-11-11 15:17:43.640161	0101000020E6100000CC5FF43385320440BDECF1EA4A304840	\N	\N	overhang	\N	2	{}	13704
672		4a	2020-11-08 17:19:31.394309	2020-11-08 17:48:53.973314	0101000020E6100000753EFAA3F74E0540568BE20C2D3B4840	\N	\N	overhang	\N	1	{}	11629
705	Fissure Physique	3c	2020-11-11 13:40:57.185702	2020-11-11 15:17:43.666119	0101000020E61000008B66F49EB32F0440A094FC1023304840	\N	\N	other	\N	2	{}	
720	Arabesque / L'Autre Toit	7b+	2020-11-11 14:16:49.348457	2020-11-11 15:17:43.669394	0101000020E6100000AF467AC4C0310440D66E9A372D304840	\N	\N	roof	\N	2	{}	177
743	Mâle à l'Aise	7a+	2020-11-11 14:56:52.243093	2020-11-11 15:17:43.672415	0101000020E6100000229AF4CB64330440BEDB353F48304840	\N		wall	\N	2	{risky}	174
684	Abus de Confiance	5c	2020-11-11 13:00:44.437385	2020-11-11 15:17:43.681767	0101000020E61000003B317AF4392E0440A20E3AF122304840	\N	\N	wall	\N	2	{}	5885
251	Le Liseré	4a+	2020-05-07 12:44:29.624968	2020-11-09 23:02:18.967192	0101000020E61000001CBB16BDEB2D04401F2E2520FB2F4840	12	2	wall	3	2	{}	23932
697	Aire de Repos	6a	2020-11-11 13:18:38.95715	2020-11-11 15:17:43.456233	0101000020E610000031DAE8DF812F0440834B02412C304840	\N	\N	other	\N	2	{}	5897
701	Cyanure	4a	2020-11-11 13:27:58.403195	2020-11-11 15:17:43.481881	0101000020E6100000F93EFA39552F04404CB86DBC2A304840	\N	\N	other	\N	2	{}	
700	Décadence	4c	2020-11-11 13:24:24.505048	2020-11-11 15:17:43.561883	0101000020E6100000E8457AEE7A2F04409F4706C428304840	\N	\N	other	\N	2	{}	
373	Le Phare	3c	2020-05-07 12:44:30.148345	2020-11-11 15:17:43.657771	0101000020E610000073E0C26A863804409168726687304840	12	30	wall	5	2	{}	5798
289	Le Cireur	2a	2020-05-07 12:44:29.778233	2020-11-11 15:17:43.684986	0101000020E6100000F8CCE9C6662F044067E9123D27304840	10	15	wall	4	2	{}	5840
696	G Force	6a	2020-11-11 13:17:07.03969	2020-11-11 15:17:43.696914	0101000020E6100000157EF4BF382F0440FC4B4AD035304840	\N	\N	overhang	\N	2	{}	
686	Coup de Fou	6a	2020-11-11 13:03:21.500059	2020-11-11 15:17:43.703373	0101000020E6100000C9D5E8D91F2E044069B9EC861F304840	\N	\N	other	\N	2	{}	
277	L'Envers du Toit	2b	2020-05-07 12:44:29.727318	2020-11-11 15:17:43.709115	0101000020E61000002AFE855B4B2E0440B3ECE90324304840	10	11	traverse	6	2	{}	5836
296	Navigation	5b	2020-05-07 12:44:29.813464	2020-11-11 15:17:43.712183	0101000020E6100000BA536579AF2F0440BF5FE29823304840	11	8	wall	4	2	{}	5891
691	Le Toit aux Grattons	7b	2020-11-11 13:12:07.053797	2020-11-11 15:17:43.715131	0101000020E6100000D7357A827E2E04407BAC866C23304840	\N		roof	\N	2	{risky}	176
28		3a	2020-04-16 20:19:03.052401	2020-11-08 14:57:39.60716	0101000020E6100000A496424B2D4E05408DAC2259273B4840	1	22	wall	\N	1	{}	4393
122	Force G	6a+	2020-04-16 20:19:03.336502	2020-11-08 16:04:36.731236	0101000020E6100000BF7F676C6A4F054088DC8A48063B4840	4	1	wall	6	1	{}	3277
506			2020-10-19 19:34:28.331405	2020-10-31 09:24:01.117468	0101000020E6100000ADE3E599F11C0540BBCCF7FA37394840	15	22	other	\N	4	{}	\N
508	\N	\N	2020-10-19 19:34:28.33573	2020-10-31 09:24:01.229102	0101000020E6100000600D7CEB051D054089F20B9639394840	15	24	other	\N	4	{}	\N
275	La Coque	4a	2020-05-07 12:44:29.717511	2020-11-11 15:17:43.72026	0101000020E6100000978F324F9F2E0440E0D49E7320304840	12	7	wall	2	2	{}	5822
157	Ode	4b+	2020-04-16 20:19:03.432134	2020-11-08 15:15:12.382993	0101000020E6100000A2A97679AB4F05403F5E5EB5383B4840	5	7	wall	3	1	{}	4467
170	Crépuscule	4b	2020-04-16 20:19:03.472262	2020-11-08 15:15:30.071331	0101000020E610000095A0DEAA4F4F0540BEB2F1B1323B4840	5	9	wall	\N	1	{}	4469
559	Jeu de Paume	4a	2020-11-02 10:06:19.837269	2020-11-02 11:28:09.338892	0101000020E61000004B2AFA9EC04E054003853526383B4840	\N	\N	wall	\N	1	{}	4481
329	La Trace	2a+	2020-05-07 12:44:29.961774	2020-11-11 15:17:43.72649	0101000020E610000026DD76B3273304401F864A9733304840	10	32	other	3	2	{}	5857
198	Bateau Pilote	6a	2020-04-16 20:19:03.556024	2020-11-01 22:14:40.206358	0101000020E6100000BAE84B05DD4E0540B8B1FA40273B4840	4	18	wall	\N	1	{}	1663
142	Il va Neiger	3c	2020-04-16 20:19:03.392806	2020-11-08 15:19:22.025611	0101000020E6100000AEED85121C4E0540F0760327433B4840	5	25	wall	\N	1	{}	4486
576	Le Jardin sans Plantes	4b	2020-11-02 11:26:19.673766	2020-11-02 13:40:45.050987	0101000020E61000000AE263B4A24E05407D4FF19C4F3B4840	\N	\N	slab	\N	1	{}	
319	Le Puzzle Brisé	5a	2020-05-07 12:44:29.915721	2020-11-11 15:17:43.729492	0101000020E61000006AA6D77B6C300440CD2F6A0203304840	11	21	wall	4	2	{}	5907
746	La Saison	5a	2020-11-11 15:01:25.719829	2020-11-11 15:17:43.734413	0101000020E61000006854FAE439360440EA78B99780304840	\N	\N	other	\N	2	{}	
698	La Grande Coquetterie	6b	2020-11-11 13:21:32.845713	2020-11-11 15:17:43.740065	0101000020E61000009268F40B922F0440F77710DC2C304840	\N		traverse	\N	2	{sit_start}	13707
742	Laisse Béton	7a+	2020-11-11 14:56:12.123109	2020-11-11 15:17:43.74808	0101000020E61000003E64F4F864330440978EFD7A48304840	\N	\N	wall	\N	2	{}	1202
683	Pleine Lune	5b	2020-11-11 12:59:23.476925	2020-11-11 15:17:43.758519	0101000020E610000066A6F4FC382E04403D8779E021304840	\N	\N	wall	\N	2	{}	5886
693	Jus de Citron	6a+	2020-11-11 13:14:18.595659	2020-11-11 15:17:43.762804	0101000020E6100000452B7AB7852E04406DB83E5324304840	\N	\N	wall	\N	2	{}	9532
695	Moses	4b	2020-11-11 13:16:32.940609	2020-11-11 15:17:43.784555	0101000020E6100000BBA5F40B382F0440DE099ECC34304840	\N	\N	other	\N	2	{}	
121	Le Bombé	5a	2020-04-16 20:19:03.333627	2020-11-08 15:22:39.156985	0101000020E6100000EE8A2FB0724F0540DA444C39083B4840	3	3	overhang	\N	1	{}	1805
87	L'Ex-Souche	3c+	2020-04-16 20:19:03.231431	2020-11-08 15:24:05.325484	0101000020E6100000C53BF200EA4F054074C41AD61C3B4840	3	11	wall	\N	1	{}	1815
704	Vol au Vent	4a+	2020-11-11 13:38:59.87855	2020-11-11 15:17:43.789853	0101000020E6100000D25FFAC1CC2F0440E5BE7D3225304840	\N	\N	other	\N	2	{}	
104	Superlative	6b+	2020-04-16 20:19:03.281088	2020-11-08 16:04:36.738859	0101000020E6100000AF98F219804E0540928C01E4153B4840	4	14	slab	6	1	{}	3289
511	\N	\N	2020-10-19 19:34:28.342371	2020-10-30 22:05:33.557444	0101000020E6100000B1EEE82D631D0540779CADA434394840	15	27	other	\N	4	{}	\N
148	Pyramide	5c	2020-04-16 20:19:03.408707	2020-11-08 16:04:36.740493	0101000020E610000047A7E4DCAA4F05402A7DDD1E443B4840	4	36	slab	\N	1	{}	3311
284	Le Bustier	2b	2020-05-07 12:44:29.761396	2020-11-11 15:17:43.79273	0101000020E6100000111803DD322F04408021963C34304840	10	52	overhang	3	2	{}	5877
751		3a	2020-11-11 15:06:32.087728	2020-11-11 15:17:43.797421	0101000020E6100000E2FFBC818F3804403127E56987304840	\N	\N	other	\N	2	{}	
133	L'Araignée	6a	2020-04-16 20:19:03.366761	2020-11-08 15:35:00.569278	0101000020E610000033F1A077704E05408619A7BE493B4840	4	38	overhang	\N	1	{}	3313
131	Macadam	6a	2020-04-16 20:19:03.361354	2020-11-08 15:35:25.620741	0101000020E6100000E2C87A14214D0540C091BF8D3E3B4840	4	41	wall	\N	1	{}	3316
173	La Belle Vieille	3c	2020-04-16 20:19:03.48083	2020-11-08 16:04:36.71266	0101000020E6100000C6E7C9F389500540F11CDE60363B4840	5	3	wall	5	1	{}	4462
690	Le Toit du Cul de Chien	7a	2020-11-11 13:09:40.511922	2020-11-11 15:17:43.80402	0101000020E6100000A5687A0C7C2E04400F7207F422304840	\N		roof	\N	2	{risky}	173
675		4a	2020-11-08 17:33:01.740079	2020-11-08 17:48:53.996539	0101000020E6100000A93A7DBEF54C05402FF5B911463B4840	\N	\N	other	\N	1	{}	4384
47		2a	2020-04-16 20:19:03.105104	2020-11-08 11:47:52.052796	0101000020E6100000CC78C3CC2A4E0540357FF0B8453B4840	1	2	slab	\N	1	{}	4373
560	Tiddlywinks	4b	2020-11-02 10:11:15.643893	2020-11-02 11:28:09.43711	0101000020E6100000D5A4F457254F054017EF4E20423B4840	\N	\N	other	\N	1	{}	
43		2b	2020-04-16 20:19:03.09497	2020-11-08 14:52:36.214606	0101000020E61000008E804233964D0540CBCC0745473B4840	1	6	wall	\N	1	{}	4377
174	Solitude	4a	2020-04-16 20:19:03.483646	2020-11-08 16:04:36.757794	0101000020E61000002370977688500540D6BCA5CE363B4840	5	2	wall	5	1	{}	4461
190		3c	2020-04-16 20:19:03.533414	2020-11-08 15:07:26.199792	0101000020E61000002B0DAD0A7E4F05406BF850F6303B4840	2	7	overhang	\N	1	{}	4419
385	Le Terminal	2b+	2020-05-07 20:11:37.778837	2020-11-09 23:01:51.576896	0101000020E61000007EA1D929F72E0440A5FBD08745304840	10	56	other	4	2	{}	5881
54		3a	2020-04-16 20:19:03.124347	2020-11-08 15:12:57.472929	0101000020E61000008B45FA0EB15005401D12C124003B4840	2	38	wall	\N	1	{}	4453
515	\N	\N	2020-10-19 19:34:28.349563	2020-10-30 22:05:33.473638	0101000020E6100000A52EE9A3BF1D054090E454672F394840	15	31	other	\N	4	{}	\N
474	\N	\N	2020-10-19 19:34:08.163102	2020-10-30 22:05:33.500522	0101000020E61000005AF768AFAD1C054021E7A49B3A394840	13	38	other	\N	4	{}	\N
476			2020-10-19 19:34:08.168	2020-10-31 09:24:01.334076	0101000020E61000003ED5C76FE31C0540FE1B62B838394840	13	40	other	\N	4	{}	\N
550	L'Oiseau	5a	2020-11-02 09:20:36.117624	2020-11-02 11:28:09.469506	0101000020E61000008428FA45B04E0540A3F2091B273B4840	\N	\N	slab	\N	1	{}	304545
119	Le Pied Levé	4a	2020-04-16 20:19:03.327877	2020-11-08 16:04:36.760782	0101000020E61000002CE5545E634F05400EC56A4E073B4840	3	2	overhang	6	1	{}	1804
169	Stances	4c	2020-04-16 20:19:03.46935	2020-11-08 15:17:00.202635	0101000020E61000004F0548E03F4F05402173BFB8303B4840	5	13	overhang	\N	1	{}	4473
134	Le Pont Mirabeau	5a	2020-04-16 20:19:03.369801	2020-11-08 15:19:57.680872	0101000020E610000000532B9A584E05401994E44B493B4840	5	28	slab	4	1	{}	4489
182	Le Cheval d'Arçon	5b+	2020-04-16 20:19:03.505746	2020-11-08 16:04:36.770009	0101000020E610000022843A24D74E05407C5010E4283B4840	3	17	wall	6	1	{}	1824
117	Le Bloc	5b	2020-04-16 20:19:03.321877	2020-11-08 15:23:04.780928	0101000020E6100000CABC0F11AE4F0540A40DCCEE0B3B4840	3	5	wall	4	1	{}	1807
97	Le Sphinx (droite)	5c+	2020-04-16 20:19:03.261062	2020-11-08 15:23:31.700486	0101000020E6100000CB7AADA48E4F054051BE2743153B4840	3	8	wall	4	1	{}	1810
186	La Dalle de Marbre	4c	2020-04-16 20:19:03.516731	2020-11-08 15:24:49.671552	0101000020E610000076366F66884E054014A862FF253B4840	3	15	slab	\N	1	{}	1821
194	L'Emmenthal	4a	2020-04-16 20:19:03.544902	2020-11-08 15:24:58.964216	0101000020E6100000F591A067CF4E0540DE6768B2263B4840	3	16	wall	\N	1	{}	1822
540	Émeraude	5a	2020-11-01 21:20:01.356184	2020-11-01 22:14:39.819701	0101000020E6100000DD9C341AF64E05402D6B54DA333B4840	\N	\N	overhang	\N	1	{}	
416	La Fissure des Enfants	3a+	2020-10-19 19:33:22.824233	2020-10-30 22:05:33.582577	0101000020E610000026DEE88BDA1A0540667481D650394840	14	30	slab	\N	4	{}	\N
496			2020-10-19 19:34:28.306993	2020-10-30 22:05:33.588174	0101000020E6100000FD06E98A521C0540F977ADC73E394840	15	12	other	\N	4	{}	\N
163	La Contralto	5a	2020-04-16 20:19:03.451859	2020-11-08 16:04:36.771357	0101000020E61000009285AC89254F0540A55B3B172D3B4840	3	20	wall	6	1	{}	1827
166	La Bendix	5b+	2020-04-16 20:19:03.461333	2020-11-08 16:04:36.774663	0101000020E6100000B4DA5A89204F05408CA5FD6A2F3B4840	3	21	wall	5	1	{}	1828
517	\N	\N	2020-10-19 19:34:28.3543	2020-10-30 22:05:33.614638	0101000020E610000008FEE84F051D05409BC1F7F030394840	15	33	other	\N	4	{}	\N
438	\N	\N	2020-10-19 19:34:08.083591	2020-10-30 22:05:33.696339	0101000020E6100000C4C0E86A1A1A054057EB716A2C394840	13	2	other	\N	4	{}	\N
101	Le Cervin	4b	2020-04-16 20:19:03.272614	2020-11-08 16:04:36.779158	0101000020E6100000C499AE557D4E05406218B403163B4840	3	40	slab	6	1	{}	1848
188	La Frouch'mammouth	4c	2020-04-16 20:19:03.527786	2020-11-08 15:26:09.680654	0101000020E6100000BA925642394F05402DCAFBBE323B4840	3	24	wall	\N	1	{}	1831
639	Dionée	4b	2020-11-03 10:41:12.889466	2020-11-03 10:43:50.918236	0101000020E6100000F29AF44A9B4F0540AC7B8B160E3B4840	\N	\N	other	\N	1	{}	
637	Fondue	5a	2020-11-03 10:38:26.124938	2020-11-03 10:43:51.00253	0101000020E61000008551F4A4E74E05400DE861D40B3B4840	\N		other	\N	1	{}	
640	Bloquematique	5c	2020-11-03 10:43:09.356366	2020-11-03 10:43:51.086039	0101000020E61000005369F4A6A84F05404467C0900C3B4840	\N	\N	wall	\N	1	{}	
172	La Prothèse	6a+	2020-04-16 20:19:03.478131	2020-11-08 16:04:36.785038	0101000020E6100000F8CE9198855005404B6D43BE373B4840	4	27	wall	5	1	{}	3302
112	L'Ancien	6a	2020-04-16 20:19:03.30446	2020-11-08 15:29:45.163843	0101000020E61000005B729369F34E0540F9E854990B3B4840	4	5	overhang	4	1	{}	3322
110	Jets Interdits	6a+	2020-04-16 20:19:03.29833	2020-11-08 15:30:02.572138	0101000020E6100000212EE629B94D054074F42A570B3B4840	4	7	wall	4	1	{}	3282
109	Le Smig	6a+	2020-04-16 20:19:03.295059	2020-11-08 15:30:51.747013	0101000020E6100000A49F28DB664E05400B32FD27133B4840	4	13	wall	4	1	{}	3288
176	Le Damier	6b+	2020-04-16 20:19:03.489102	2020-11-08 15:33:03.524409	0101000020E61000009F22656B1A50054092DCE7DE363B4840	4	26	slab	4	1	{}	3301
147	L'Oeuf de Colombe	6a	2020-04-16 20:19:03.405965	2020-11-08 15:33:51.974928	0101000020E61000005C84F0B87A4E05403A18820F453B4840	4	31	wall	3	1	{}	3306
135	La Dame de Pique	5c	2020-04-16 20:19:03.37264	2020-11-08 15:35:08.526326	0101000020E610000032F907C34D4E0540C5B19D6A493B4840	4	39	slab	4	1	{}	3314
137	Le Pot de Fer	6b	2020-04-16 20:19:03.378151	2020-11-08 15:35:17.192647	0101000020E61000006FB2E6D92C4E0540E4EEE4F5463B4840	4	40	overhang	4	1	{}	3315
229	Beaux Mouvements sur Fonds Sableux	6c+	2020-04-16 20:19:03.64575	2020-11-08 15:37:58.185602	0101000020E61000009620B1BF134E0540A5A8DE47473B4840	6	9	overhang	3	1	{sit_start}	4505
231	Sledgehammer	7a	2020-04-16 20:19:03.651288	2020-11-08 15:38:15.835694	0101000020E6100000D436255D474C0540A60027A2393B4840	6	11	traverse	2	1	{}	1405
14		2a	2020-04-16 20:19:03.01478	2020-11-08 16:04:36.746044	0101000020E6100000CA6EE8F88A4E0540A577C4FD143B4840	1	36	slab	\N	1	{}	4407
676		3c	2020-11-08 17:41:48.726086	2020-11-08 17:48:53.867282	0101000020E6100000561C7A04554D0540AC3E195E3A3B4840	\N	\N	slab	\N	1	{}	16272
555	Magifix (assis)	7a	2020-11-02 09:51:16.163489	2020-11-03 14:18:19.726744	0101000020E61000005936BD172C5005406500294D3F3B4840	\N		overhang	\N	1	{sit_start}	20340
714	Belle Lurette	7a	2020-11-11 13:53:36.512578	2020-11-11 15:17:43.44143	0101000020E610000015207A87773004404363033B03304840	\N	\N	slab	\N	2	{}	171
232	Jour de Pluie	7b	2020-04-16 20:19:03.653963	2020-11-03 09:40:00.583595	0101000020E6100000EFA2442D954D0540076766822C3B4840	6	12	overhang	4	1	{sit_start}	992
477			2020-10-19 19:34:08.170092	2020-10-31 09:24:01.475423	0101000020E61000006CE1A756FD1C0540DF0EC39E3A394840	13	41	other	\N	4	{}	\N
69	Confiance	4a	2020-04-16 20:19:03.17155	2020-11-08 16:04:36.820356	0101000020E61000006686B65DCA4E0540AFB1F0B0293B4840	2	22	slab	6	1	{}	4435
562	La Grande Ourse	3a	2020-11-02 10:26:06.889881	2020-11-02 11:28:09.382256	0101000020E6100000F23D7A95A44E05408494001F3F3B4840	\N	\N	wall	\N	1	{}	
713	Doléance	6a	2020-11-11 13:51:07.601841	2020-11-11 15:17:43.529602	0101000020E61000007749FA8652300440F77F150C07304840	\N	\N	slab	\N	2	{}	13699
717	La Noirâtre (assis)	7c	2020-11-11 14:01:27.195645	2020-11-11 15:17:43.677638	0101000020E610000087A6B434983104406BC9D4AC2D304840	\N		overhang	\N	2	{sit_start}	24642
152	Prison	2b	2020-04-16 20:19:03.419142	2020-11-08 15:08:44.540931	0101000020E6100000EF64D794B34E0540867D1B41383B4840	2	15	wall	\N	1	{}	4428
243	Les Grimpeurs se Cachent pour Médire	7a	2020-04-16 20:19:03.684865	2020-11-08 16:04:36.871298	0101000020E6100000C325A8C3A64F054085108BA2013B4840	6	22	wall	5	1	{sit_start}	969
716	Hammer's Break	6c	2020-11-11 13:56:32.748836	2020-11-11 15:17:43.752787	0101000020E6100000E1E9E82DC9300440ACDA0E090B304840	\N	\N	wall	\N	2	{}	172
674		3a	2020-11-08 17:29:30.69149	2020-11-08 17:48:53.999984	0101000020E6100000975A7A9F9C4C0540682ADEE5463B4840	\N	\N	wall	\N	1	{}	16271
215	Le Vallon	5c	2020-04-16 20:19:03.60743	2020-11-08 15:17:38.35585	0101000020E61000000B213BFD0D4F0540FFB60AE4343B4840	5	16	wall	4	1	{}	4476
150	Le Chou-Fleur	4a	2020-04-16 20:19:03.413927	2020-11-08 15:18:58.48423	0101000020E61000004E217E35CE4E054020E625573E3B4840	5	22	wall	\N	1	{}	4483
719	Eclipse	7c	2020-11-11 14:06:19.35689	2020-11-11 15:17:43.807255	0101000020E610000061903468B73104405D516F1F2D304840	\N	\N	roof	\N	2	{}	178
738	Sideway	3a	2020-11-11 14:51:42.711972	2020-11-11 15:17:43.811514	0101000020E61000008EA6F46D693204408C4B2CBA4D304840	\N	\N	other	\N	2	{}	
703	Trompe l'Œil	6a	2020-11-11 13:37:55.258055	2020-11-11 15:17:43.822635	0101000020E6100000AA3AFA4BCA2F0440AE85834E25304840	\N	\N	wall	\N	2	{}	5894
222	Lune de Fiel	7a	2020-04-16 20:19:03.626411	2020-11-02 11:28:09.671866	0101000020E610000055F39B9BA04E0540F96710D83E3B4840	6	3	traverse	\N	1	{}	809
745	Le Barbot (assis)	6a+	2020-11-11 15:00:31.241409	2020-11-11 15:17:43.830474	0101000020E6100000C5477A072E360440752575F080304840	\N		wall	\N	2	{sit_start}	24607
748	Basse Saison	6c	2020-11-11 15:03:25.53158	2020-11-11 15:17:43.839644	0101000020E6100000C8427A5B34360440B04513AF80304840	\N	\N	wall	\N	2	{}	17017
692	La Nano	6a	2020-11-11 13:13:02.362803	2020-11-11 15:17:43.847809	0101000020E6100000FE5A7AF8802E0440C30003D723304840	\N	\N	other	\N	2	{}	5889
715	Bel Interlude	6a	2020-11-11 13:54:30.056078	2020-11-11 15:17:43.901501	0101000020E610000029577A408230044009BBCB7603304840	\N		wall	\N	2	{}	5906
718	La Noirâtre	7a+	2020-11-11 14:05:00.508424	2020-11-11 15:17:43.910092	0101000020E61000005E2C7DC19631044038527A952D304840	\N		overhang	\N	2	{}	20034
552	Styrax (gauche)	5c	2020-11-02 09:30:51.355217	2020-11-02 11:28:09.674473	0101000020E61000006047FA1FC74E054060C393B8293B4840	\N		slab	\N	1	{}	
561	Le pilier du fiel	4b	2020-11-02 10:19:26.081976	2020-11-02 11:28:09.681134	0101000020E6100000DB74741CA54E0540139C407C3F3B4840	\N	\N	overhang	\N	1	{}	17424
542	Les Trois Lancers du Bengale	6b	2020-11-01 21:27:33.589226	2020-11-01 22:14:39.902582	0101000020E6100000B55B7AD4194F054084C42E9E333B4840	\N		overhang	\N	1	{sit_start}	13395
541	Mauvaise Foi	6a+	2020-11-01 21:23:33.951461	2020-11-01 22:14:39.96227	0101000020E61000004D62FA29084F05403253A1B3333B4840	\N	\N	overhang	\N	1	{}	19911
228	Pot de Terre	6c+	2020-04-16 20:19:03.642973	2020-11-02 13:40:45.410669	0101000020E61000004E8A83EB3E4E054090395881463B4840	6	8	wall	\N	1	{}	1408
208	Tristesse	4a	2020-04-16 20:19:03.585363	2020-11-08 15:21:23.508482	0101000020E61000004633CB16D94B05401E500931313B4840	5	36	overhang	\N	1	{}	4497
486	\N	\N	2020-10-19 19:34:28.286907	2020-10-30 22:05:33.416373	0101000020E610000001317ABCEE190540A4F30A4E2D394840	15	2	other	\N	4	{}	\N
460	\N	\N	2020-10-19 19:34:08.134265	2020-10-30 22:05:33.49677	0101000020E6100000D0C5E86F6D1C0540BAFBA0F834394840	13	24	other	\N	4	{}	\N
199	Le But	4a	2020-04-16 20:19:03.559041	2020-11-08 15:26:30.193535	0101000020E61000008AA5A7B3E54D0540030304EA313B4840	3	26	wall	\N	1	{}	1833
471	\N	\N	2020-10-19 19:34:08.15826	2020-10-30 22:05:33.606229	0101000020E6100000D910E9A5CC1D0540984C46D448394840	13	35	other	\N	4	{}	\N
482	\N	\N	2020-10-19 19:34:08.179001	2020-10-30 22:05:33.61813	0101000020E610000019E2E8F58B1D0540AA73E4FF30394840	13	46	other	\N	4	{}	\N
445			2020-10-19 19:34:08.10057	2020-10-30 22:05:33.621841	0101000020E610000088C4E8718B1A05403DC1E92448394840	13	9	other	\N	4	{}	\N
481	\N	\N	2020-10-19 19:34:08.177106	2020-10-30 22:05:33.64688	0101000020E61000004AAFE86B8E1D0540470B9DDB32394840	13	45	other	\N	4	{}	\N
143	Le Pion Cassé	5a	2020-04-16 20:19:03.39548	2020-11-08 15:34:00.658846	0101000020E6100000DA54EEF7BE4E05407D221D9A443B4840	4	32	wall	4	1	{}	3307
146	La Longue Marche	6b	2020-04-16 20:19:03.40327	2020-11-08 15:34:32.998627	0101000020E61000004E3F85928D4E054050448F4A463B4840	4	35	traverse	\N	1	{}	3310
224	Les Câlins de Kim	7a	2020-04-16 20:19:03.631588	2020-11-08 15:37:22.89478	0101000020E610000021CD5C3D6B4E05401CA7B44F493B4840	6	5	overhang	\N	1	{}	1407
227	Canonnerie	6c	2020-04-16 20:19:03.640143	2020-11-08 15:37:40.912433	0101000020E61000004F0D5BB7554E054016E842B94D3B4840	6	7	traverse	\N	1	{}	4504
241	36.15 Gauche	7a	2020-04-16 20:19:03.678818	2020-11-08 15:39:30.224309	0101000020E6100000F6EA161E5B4F054021941A550E3B4840	6	20	overhang	\N	1	{}	819
527	Vol Innocent	6c	2020-10-31 21:40:50.227898	2020-11-08 16:09:34.157303	0101000020E6100000A78EF4B27D500540E07F809E383B4840	\N		wall	5	1	{sit_start,risky}	19910
27		2b	2020-04-16 20:19:03.050092	2020-11-08 16:04:36.812195	0101000020E610000070AA41F0844E054047C69263293B4840	1	23	wall	\N	1	{}	4394
673		4a	2020-11-08 17:26:44.986586	2020-11-08 17:48:54.106683	0101000020E6100000223D7A00E14C054045D1B5BB4C3B4840	\N	\N	wall	\N	1	{}	198871
7		2b	2020-04-16 20:19:02.988854	2020-11-08 15:03:18.679306	0101000020E61000007852D536D44D0540FAE69F9D0A3B4840	1	43	traverse	\N	1	{}	16263
563	Les Grattons du Fiel	3a	2020-11-02 10:29:12.143258	2020-11-02 11:28:09.685316	0101000020E6100000DC34FA69B94E0540AE7E85783F3B4840	\N		wall	\N	1	{}	16979
348	La Cheminée	3a	2020-05-07 12:44:30.04072	2020-11-09 22:59:42.583068	0101000020E610000036EA33B4793204407E6E20D04D304840	10	41	other	5	2	{}	5865
724	The Maxx	7c+	2020-11-11 14:22:17.906922	2020-11-11 15:17:43.426052	0101000020E61000006C373D48C831044025A63D672D304840	\N	\N	roof	\N	2	{}	183
568	Be Bop	4b	2020-11-02 11:00:38.100808	2020-11-02 11:28:09.801289	0101000020E61000002A173A23934E05408B92E23F463B4840	\N	\N	wall	\N	1	{}	
5		2a+	2020-04-16 20:19:02.983516	2020-11-08 15:03:38.009527	0101000020E610000043C63A369B4D0540B092A7CA0A3B4840	1	45	slab	5	1	{}	16265
3		3a	2020-04-16 20:19:02.977993	2020-11-08 15:04:00.449079	0101000020E61000007A805683F44C0540862DF279093B4840	1	47	slab	\N	1	{}	16267
721	Total Eclipse	8a+	2020-11-11 14:19:08.135963	2020-11-11 15:17:43.451885	0101000020E61000004F683ADBBC310440185540202D304840	\N	\N	roof	\N	2	{}	185
68	Ninkenphoop	4b+	2020-04-16 20:19:03.168278	2020-11-08 15:10:27.724153	0101000020E610000024C8C0F6DE4E0540B4D174841D3B4840	2	23	traverse	4	1	{}	4436
57	Le Tour de Canon	2b	2020-04-16 20:19:03.13278	2020-11-08 15:12:19.381632	0101000020E61000009017216A9D4F05400004C283FC3A4840	2	34	wall	\N	1	{}	4448
56		3a	2020-04-16 20:19:03.130012	2020-11-08 15:12:27.957979	0101000020E6100000C089CB9014500540E4DBBF0FFB3A4840	2	35	wall	2	1	{}	4449
53		4a	2020-04-16 20:19:03.121574	2020-11-08 15:13:06.464252	0101000020E610000051CF49292651054056E1AA7A033B4840	2	39	traverse	\N	1	{}	4454
212	Fables	4a+	2020-04-16 20:19:03.597443	2020-11-08 16:04:36.92026	0101000020E610000015E4F25E7F4B0540DDEE0A6C2D3B4840	5	40	slab	5	1	{}	4501
209	Les Chimères	4a	2020-04-16 20:19:03.588394	2020-11-08 15:21:34.057945	0101000020E6100000C8F3A3920C4C0540F44A9B8C2D3B4840	5	37	traverse	3	1	{}	4498
600	L'Arête pour les truites	3a	2020-11-02 13:25:29.804826	2020-11-02 13:40:45.299685	0101000020E61000004D63FAACD24C0540BB24C1A9453B4840	\N	\N	wall	\N	1	{}	
577	Le Dièdre	3b	2020-11-02 11:27:16.963714	2020-11-02 13:40:45.573155	0101000020E61000000909323CA94E05407783AE5D4F3B4840	\N	\N	slab	\N	1	{}	
528	Abîme	4a+	2020-11-01 17:14:44.15547	2020-11-01 17:21:48.138867	0101000020E610000083187A19C45005408800CD71363B4840	\N	\N	wall	\N	1	{}	4460
396	\N	\N	2020-10-19 19:33:22.782048	2020-10-30 22:05:33.479063	0101000020E6100000FDE1E810471A05402156AE8235394840	14	10	other	\N	4	{}	\N
548	Bateau Pilote (direct)	6b	2020-11-01 22:11:44.726516	2020-11-08 17:48:54.137815	0101000020E6100000F58CDEEBDE4E0540FBE3EB2D273B4840	\N	\N	wall	\N	1	{}	3293
614	Babaobab	6c+	2020-11-03 09:33:03.271699	2020-11-03 09:44:20.062072	0101000020E6100000DAE6E827934D054031212B082F3B4840	\N		wall	\N	1	{sit_start}	1246
107	Adrénaline	6a	2020-04-16 20:19:03.289388	2020-11-08 15:30:26.915829	0101000020E610000055691473674D0540F042DE470F3B4840	4	10	overhang	\N	1	{}	3285
618	La Super Canon	6a	2020-11-03 09:48:34.499968	2020-11-03 10:14:22.358521	0101000020E6100000A872F4FFAA4E0540C9E2DFD41D3B4840	\N	\N	slab	\N	1	{}	19915
723	Mad Maxx	8b	2020-11-11 14:21:24.358496	2020-11-11 15:17:43.463998	0101000020E61000009628FA0CCB310440781FEF872D304840	\N	\N	roof	\N	2	{}	1172
175	Fantaisie	4a	2020-04-16 20:19:03.486351	2020-11-01 18:31:22.958549	0101000020E61000004EBA1DF899500540E56837B3383B4840	5	1	wall	4	1	{}	4459
93	Le Whist	5c	2020-04-16 20:19:03.249386	2020-11-08 15:31:26.566315	0101000020E610000076D19C64C74E054053C2A6261E3B4840	4	17	wall	4	1	{}	3292
638	Gros Câlin	7a	2020-11-03 10:39:38.804009	2020-11-03 10:43:50.878686	0101000020E61000005B60F49EED4E054044CECFB20B3B4840	\N	\N	traverse	\N	1	{}	1245
191	SOS Glycogène	5c	2020-04-16 20:19:03.536171	2020-11-08 15:32:36.165511	0101000020E6100000C7CDB5D79E4E0540EBDE3B3C293B4840	4	23	overhang	\N	1	{}	3298
196	Outrage	5b+	2020-04-16 20:19:03.550693	2020-11-08 15:35:43.18955	0101000020E6100000FEE6D8F03C4C05406866951B3B3B4840	4	43	wall	4	1	{}	3318
656	La Maschette	8a	2020-11-03 11:28:49.49381	2020-11-03 11:49:07.139945	0101000020E61000000C30FA53924F05401F79B89B013B4840	\N	\N	overhang	\N	1	{}	15413
547		4b	2020-11-01 22:07:52.13502	2020-11-01 22:14:40.17424	0101000020E6100000B74D7A61E74E05403766AB8E273B4840	\N	\N	other	\N	1	{}	
245	Chasseur de Prises	7a	2020-04-16 20:19:03.691413	2020-11-03 11:49:07.222197	0101000020E6100000108CB9954E5105402CCFC8A5013B4840	6	24	wall	5	1	{}	804
230	Lévitation	7a+	2020-04-16 20:19:03.648415	2020-11-08 15:38:07.531329	0101000020E6100000AB8BE7E2164C0540683BB9F63B3B4840	6	10	roof	4	1	{sit_start}	807
235	La Singlette	6b+	2020-04-16 20:19:03.662079	2020-11-08 15:38:50.223775	0101000020E610000075C964D5A64F05404A5A3AA2143B4840	6	15	traverse	4	1	{}	4507
236	Gainage et Dévers	6c	2020-04-16 20:19:03.665873	2020-11-08 15:38:58.286999	0101000020E610000089519173B44E0540D5492A86193B4840	6	16	traverse	3	1	{}	4508
238	La Dénoyautée	7a+	2020-04-16 20:19:03.671096	2020-11-08 15:39:14.239161	0101000020E61000005CE527AEDD4E0540E68A62DB113B4840	6	18	wall	4	1	{}	814
239	Nut's	7b	2020-04-16 20:19:03.673611	2020-11-08 15:39:21.950379	0101000020E6100000CE7F3EA53E4F0540238C3F210F3B4840	6	19	overhang	4	1	{}	1466
242	Fantasia chez les Ploucs	7a+	2020-04-16 20:19:03.682064	2020-11-08 15:39:40.098207	0101000020E6100000589E5ECFD74F0540A6522B58063B4840	6	21	overhang	4	1	{}	806
140	Chanson d'Automne	4a	2020-04-16 20:19:03.387309	2020-11-08 16:04:36.903408	0101000020E61000006493D3524D4E0540B0264E60423B4840	5	23	wall	5	1	{}	4484
1	Poseurs	3b	2020-04-16 20:19:02.969757	2020-11-08 17:48:54.162021	0101000020E6100000A13DB91EFF4C054009C0630C463B4840	1	13	slab	4	1	{}	35410
180	La Soprano	4a	2020-04-16 20:19:03.500527	2020-11-08 17:48:54.254934	0101000020E61000005E975663E14E05401A86A4652B3B4840	3	18	overhang	5	1	{risky}	1825
82		4c	2020-04-16 20:19:03.216232	2020-11-08 17:48:54.408683	0101000020E6100000B84995261B500540B7BCA3A62F3B4840	2	5	slab	5	1	{}	4417
670		3a	2020-11-08 17:09:02.078025	2020-11-08 17:48:54.545717	0101000020E610000023597A802150054060474E4B2F3B4840	\N	\N	slab	\N	1	{}	4417
179	La Goulotte	3c	2020-04-16 20:19:03.497705	2020-11-08 17:48:54.54997	0101000020E6100000A6D0F8970E4F05404CC5D3122B3B4840	3	19	wall	3	1	{}	1826
30	Pseudonyme	2b	2020-04-16 20:19:03.059233	2020-11-08 14:57:16.211682	0101000020E6100000DE8A773B3D4E0540B82825C3283B4840	1	20	wall	2	1	{}	4391
411			2020-10-19 19:33:22.813396	2020-10-30 22:20:04.481343	0101000020E61000004152575BA41A0540585486C043394840	14	25	other	\N	4	{}	\N
10		2a	2020-04-16 20:19:02.997912	2020-11-08 16:04:36.94939	0101000020E61000006F5B6EDFEB4D05406421ACCE0F3B4840	1	40	slab	\N	1	{}	4411
564	Looney Tunes	2c	2020-11-02 10:30:57.540243	2020-11-02 11:28:09.311579	0101000020E61000008342FA7DB44E05401865C7823F3B4840	\N	\N	wall	\N	1	{}	
565	Les Miches de la Veuve	4a	2020-11-02 10:31:58.704042	2020-11-02 11:28:09.549667	0101000020E6100000D61E7AA7BF4E054081F58B5C3F3B4840	\N	\N	wall	\N	1	{}	16978
24		2a	2020-04-16 20:19:03.041946	2020-11-08 14:58:22.378004	0101000020E610000061A65702524E0540F00DE3B5213B4840	1	26	slab	4	1	{}	212689
631	Gogol Bordello	4a	2020-11-03 10:22:18.781397	2020-11-03 10:43:51.191779	0101000020E610000025177AD0784E054089B03D9C133B4840	\N	\N	slab	\N	1	{}	
23	Tintin	2b	2020-04-16 20:19:03.039262	2020-11-08 14:58:38.022373	0101000020E6100000A7C282B0984E0540A029D8901E3B4840	1	27	wall	3	1	{}	4398
322	Le Bourru	2b	2020-05-07 12:44:29.926841	2020-11-09 22:57:35.50898	0101000020E6100000FCB252646A3204403C94400136304840	10	27	wall	2	2	{}	5852
325	Du Genou	5b+	2020-05-07 12:44:29.946172	2020-11-09 23:13:20.374741	0101000020E61000005C96162B9432044031C3EAD933304840	11	26	overhang	3	2	{}	23997
13		2a	2020-04-16 20:19:03.012177	2020-11-08 15:02:15.302658	0101000020E6100000129A9A3D6A4D0540D7852EB10F3B4840	1	37	wall	\N	1	{}	4408
601	L'Angle du 30	4c	2020-11-02 13:31:07.749538	2020-11-02 13:40:45.35206	0101000020E6100000B1227DF3CF4C05407D31CACB453B4840	\N	\N	slab	\N	1	{}	19004
578	Bastogne	7a+	2020-11-02 12:18:37.083702	2020-11-02 13:40:45.519567	0101000020E61000003B04E948534E054033CAB843513B4840	\N		overhang	\N	1	{sit_start}	16169
415	\N	\N	2020-10-19 19:33:22.821635	2020-10-30 22:05:33.484247	0101000020E6100000A406E95EAD1A05404DD5E3A852394840	14	29	other	\N	4	{}	\N
420	\N	\N	2020-10-19 19:33:22.831183	2020-10-30 22:05:33.610704	0101000020E6100000D4EFE887821C0540CA0B02BA3B394840	14	34	other	\N	4	{}	\N
451	\N	\N	2020-10-19 19:34:08.111663	2020-10-30 22:05:33.758462	0101000020E61000006DF7E846F21A05406D45ECCB3F394840	13	15	other	\N	4	{}	\N
213	Boomerang	6a	2020-04-16 20:19:03.601495	2020-11-08 16:04:36.976434	0101000020E61000001B884157824B05405204CACF2D3B4840	4	46	wall	5	1	{}	3321
6		2a	2020-04-16 20:19:02.98631	2020-11-08 15:03:27.958331	0101000020E61000000190D9BCA94D054038C9D8CE0C3B4840	1	44	traverse	4	1	{}	16264
64		3a	2020-04-16 20:19:03.157965	2020-11-08 15:11:32.652568	0101000020E6100000ACF04043CC4D0540468C0BCC0C3B4840	2	29	slab	6	1	{}	4443
616	Circus Baobab	7c+	2020-11-03 09:38:01.206449	2020-11-03 09:44:20.087762	0101000020E61000001A9BF446924D0540F1D0EFBE2F3B4840	\N	\N	traverse	\N	1	{}	1204
529	42 Fillette	7a	2020-11-01 17:31:38.373554	2020-11-01 18:31:22.883807	0101000020E6100000C848FA2790500540871B956C393B4840	\N	\N	overhang	\N	1	{}	1467
615	Friponneries Sociales	7b+	2020-11-03 09:37:18.452921	2020-11-03 09:44:20.123141	0101000020E61000003565F473924D05401EF96BAA2F3B4840	\N	\N	traverse	\N	1	{}	1205
58		4a	2020-04-16 20:19:03.135732	2020-11-08 15:12:09.846588	0101000020E6100000B2347CA53B4F054059115C1CFC3A4840	2	33	traverse	\N	1	{}	4447
55	La cheminée	3b	2020-04-16 20:19:03.127257	2020-11-08 15:12:37.305747	0101000020E6100000E31A41CD365005404EDC4B4DFB3A4840	2	36	traverse	\N	1	{}	4450
544	Mini Dei	6a	2020-11-01 21:53:12.90208	2020-11-01 22:14:39.978434	0101000020E6100000AC4AFABD194F0540393150E2313B4840	\N		overhang	\N	1	{sit_start}	8774
203	Les Horloges	3b	2020-04-16 20:19:03.570915	2020-11-08 15:20:48.053534	0101000020E6100000318F0C5B324C0540D8FA9A5F3B3B4840	5	33	wall	4	1	{}	4494
619	Hocus Pocus	4a	2020-11-03 09:50:48.996932	2020-11-03 10:14:22.233545	0101000020E6100000F767F42ACB4E0540B20B1FBD1C3B4840	\N	\N	wall	\N	1	{}	304544
620	Jiggery Pokery	4a	2020-11-03 09:54:34.281224	2020-11-03 10:14:22.636642	0101000020E61000004F74F44ED44E0540E8F56BE21C3B4840	\N	\N	wall	\N	1	{}	304543
204	Gravitation	4a	2020-04-16 20:19:03.573668	2020-11-08 15:20:57.446834	0101000020E6100000A0A02D7D0F4C0540EC162D113D3B4840	5	34	overhang	3	1	{}	4495
211	Anthologie	4b	2020-04-16 20:19:03.594483	2020-11-08 15:21:50.0694	0101000020E610000095C474FF974B0540E96CA4F52C3B4840	5	39	slab	4	1	{}	4500
116	L'Atrappe-Mouche	5a+	2020-04-16 20:19:03.318314	2020-11-08 15:23:14.616153	0101000020E6100000BDDB71F2A44F05404460D32F0E3B4840	3	6	wall	4	1	{}	1808
201	La Spéciale	4a+	2020-04-16 20:19:03.564889	2020-11-08 15:26:51.214348	0101000020E61000008CF4844C7F4D0540A0F7CC4D2B3B4840	3	28	wall	4	1	{}	1835
202	La Bizuth	4b	2020-04-16 20:19:03.568045	2020-11-08 15:27:01.4751	0101000020E61000009565D91F964D05407004C394293B4840	3	29	wall	3	1	{}	1836
90	Le Prétoire	4c	2020-04-16 20:19:03.241177	2020-11-08 15:27:17.832152	0101000020E610000032F247004C4E0540C90AA0EF233B4840	3	31	wall	\N	1	{}	1838
91	La Fédérale	5a+	2020-04-16 20:19:03.243833	2020-11-08 15:27:28.405705	0101000020E6100000C49F9FDD624E0540AF5D04B6223B4840	3	32	wall	3	1	{}	1839
660	Le Pain Noir	6b	2020-11-03 11:36:38.951047	2020-11-03 11:49:07.336147	0101000020E61000008C58F48A2D50054094A6BCFEF93A4840	\N	\N	wall	\N	1	{}	9942
659	La Yoyo	6a	2020-11-03 11:36:02.947811	2020-11-03 11:49:07.387611	0101000020E61000005D57F4A4225005408309D918FA3A4840	\N	\N	wall	\N	1	{}	14788
661	Les Mains Blanches	5b	2020-11-03 11:37:38.533464	2020-11-03 11:49:07.610752	0101000020E61000006181F4BC37500540A643A0E4F93A4840	\N	\N	traverse	\N	1	{}	9941
658	La Maîtrise du Genre Littéraire	7c	2020-11-03 11:34:11.205686	2020-11-03 11:49:07.687128	0101000020E6100000D570BE1947510540CB61E1EF013B4840	\N		other	\N	1	{sit_start}	11526
662	Charleston	6c	2020-11-03 11:40:25.571623	2020-11-03 11:49:07.689524	0101000020E61000003BF8E883814E0540D89D9B36FE3A4840	\N	\N	overhang	\N	1	{}	14786
657	Le Bonsaï	7a	2020-11-03 11:32:52.788423	2020-11-03 11:49:07.72128	0101000020E6100000622F7A4948510540070CB4FC013B4840	\N	\N	other	\N	1	{}	8591
102	L'Impossible	5a+	2020-04-16 20:19:03.275219	2020-11-08 15:28:27.00318	0101000020E61000000D79F2DE5C4E054078575AC4153B4840	3	38	wall	\N	1	{}	1846
106	Le Nain Jaune	5c+	2020-04-16 20:19:03.286851	2020-11-08 15:30:35.513664	0101000020E6100000202EA99A864D0540A42876760F3B4840	4	11	wall	\N	1	{}	3286
105	Le Rouge et le Noir	5b+	2020-04-16 20:19:03.28409	2020-11-08 15:30:43.111546	0101000020E6100000BDD0A0C48E4D05406E90245B113B4840	4	12	wall	\N	1	{}	3287
92	Le Bossu	6b	2020-04-16 20:19:03.246488	2020-11-08 15:31:18.786502	0101000020E610000089CF88E2B94E0540014C18FD1D3B4840	4	16	overhang	4	1	{}	3291
206	Boute-en-Train	4c	2020-04-16 20:19:03.57939	2020-11-08 15:36:00.466155	0101000020E6100000DA6A29F4474C05409FD110A1343B4840	4	45	wall	\N	1	{}	3320
244	La Théorie du Chaos	7b	2020-04-16 20:19:03.688228	2020-11-08 16:06:19.361522	0101000020E6100000B873FF88F44F05408D91AF6CFA3A4840	6	23	overhang	4	1	{risky}	1116
25	Fun and Games	2a	2020-04-16 20:19:03.044576	2020-11-08 16:04:36.938141	0101000020E6100000A6D237EC594E05403C0C1F03233B4840	1	25	wall	4	1	{}	145395
621	Le Dromadaire	5a	2020-11-03 09:58:34.636198	2020-11-08 16:50:07.990971	0101000020E610000014677A67684F054084C68F251D3B4840	\N		wall	\N	1	{}	1819
677	36.15 Power	7c	2020-11-08 18:00:35.917028	2020-11-08 18:03:54.860631	0101000020E6100000692F7A3B584F054092E94A510E3B4840	\N	\N	overhang	\N	1	{}	835
524	\N	\N	2020-10-19 19:34:28.368284	2020-10-30 22:05:33.422128	0101000020E61000007EF8E8EF831C0540E5A465F72E394840	15	40	other	\N	4	{}	\N
487	\N	\N	2020-10-19 19:34:28.289642	2020-10-30 22:05:33.509472	0101000020E6100000A142FA45F41905400C5BDDF02E394840	15	3	other	\N	4	{}	\N
503	\N	\N	2020-10-19 19:34:28.325849	2020-10-30 22:05:33.515153	0101000020E61000005B48FA08B61C0540EE661C263A394840	15	19	other	\N	4	{}	\N
430	\N	\N	2020-10-19 19:33:22.849799	2020-10-30 22:05:33.519254	0101000020E61000006829E9E3F71D0540B20426154A394840	14	44	other	\N	4	{}	\N
530	42 Fillette (assis)	7b	2020-11-01 17:34:21.209961	2020-11-03 14:18:19.939539	0101000020E610000013497AE192500540E157C770393B4840	\N	\N	overhang	\N	1	{sit_start}	18587
465			2020-10-19 19:34:08.145539	2020-10-30 22:05:33.524323	0101000020E6100000B1DAE8F1901C05408869FAAD3D394840	13	29	other	\N	4	{}	\N
498	\N	\N	2020-10-19 19:34:28.310516	2020-10-30 22:05:33.53369	0101000020E61000003628E9307F1C0540D7A56B153C394840	15	14	other	\N	4	{}	\N
469	\N	\N	2020-10-19 19:34:08.154921	2020-10-30 22:05:33.539993	0101000020E61000007FEFE8F5B81D0540390B8B1447394840	13	33	other	\N	4	{}	\N
499	\N	\N	2020-10-19 19:34:28.31247	2020-10-30 22:05:33.547952	0101000020E61000007638FA328C1C0540BA786A373B394840	15	15	other	\N	4	{}	\N
390	\N	\N	2020-10-19 19:33:22.767736	2020-10-30 22:05:33.565712	0101000020E6100000BAF1E8EA791C054036E90F9E29394840	14	4	other	\N	4	{}	\N
305	L'Aérien	2a+	2020-05-07 12:44:29.846057	2020-11-09 22:56:36.911372	0101000020E6100000BE7DD4773D300440AAD77C8A1E304840	10	20	overhang	4	2	{}	5845
424	\N	\N	2020-10-19 19:33:22.837923	2020-10-30 22:05:33.626112	0101000020E6100000F349E9CBB51D05401F06E1A046394840	14	38	other	\N	4	{}	\N
480	\N	\N	2020-10-19 19:34:08.175456	2020-10-30 22:05:33.629535	0101000020E61000003CDDE853791D05409B1033B934394840	13	44	other	\N	4	{}	\N
448	\N	\N	2020-10-19 19:34:08.106358	2020-10-30 22:05:33.633015	0101000020E6100000DB12E978CF1A0540EC4086FE4E394840	13	12	other	\N	4	{}	\N
433	\N	\N	2020-10-19 19:33:22.856767	2020-10-30 22:05:33.636644	0101000020E6100000E0DDE8526A1E0540F477B0113C394840	14	47	other	\N	4	{}	\N
422			2020-10-19 19:33:22.834548	2020-10-30 22:05:33.651419	0101000020E6100000BFF5E805B91C0540D68ABCD43E394840	14	36	other	\N	4	{}	\N
463	\N	\N	2020-10-19 19:34:08.14149	2020-10-30 22:05:33.655677	0101000020E610000060EAE8726A1C054030BB51DF3B394840	13	27	other	\N	4	{}	\N
394	\N	\N	2020-10-19 19:33:22.777881	2020-10-30 22:05:33.660092	0101000020E6100000D1EAFCE3EC1905408A9BACC32F394840	14	8	other	\N	4	{}	\N
501	\N	\N	2020-10-19 19:34:28.322068	2020-10-30 22:05:33.66402	0101000020E6100000B5267A9F9F1C0540F8B00B053B394840	15	17	other	\N	4	{}	\N
26		3a	2020-04-16 20:19:03.047543	2020-11-08 14:58:01.258587	0101000020E6100000158E21BA874E0540E9916AF0283B4840	1	24	wall	\N	1	{}	4395
395	\N	\N	2020-10-19 19:33:22.780038	2020-10-30 22:05:33.668302	0101000020E61000001161F4D9321A05406B3CD2582E394840	14	9	other	\N	4	{}	\N
566	La Fissure de la Veuve	4b	2020-11-02 10:33:11.011673	2020-11-02 11:28:09.601957	0101000020E6100000F366FA76CA4E0540A9DD111E3F3B4840	\N	\N	wall	\N	1	{}	16977
409	\N	\N	2020-10-19 19:33:22.809804	2020-10-30 22:05:33.676811	0101000020E6100000DCECE87BF91A0540FC805E5E40394840	14	23	other	\N	4	{}	\N
526	\N	\N	2020-10-19 19:34:28.371829	2020-10-30 22:05:33.680776	0101000020E61000000D14E92B481C05403AEEFABD2D394840	15	42	other	\N	4	{}	\N
397	\N	\N	2020-10-19 19:33:22.784022	2020-10-30 22:05:33.684412	0101000020E6100000580FE9852C1A0540E542DC8736394840	14	11	other	\N	4	{}	\N
462	\N	\N	2020-10-19 19:34:08.139444	2020-10-30 22:05:33.68844	0101000020E61000006FF7E813601C05408749A3873B394840	13	26	other	\N	4	{}	\N
404	\N	\N	2020-10-19 19:33:22.798931	2020-10-30 22:05:33.692426	0101000020E610000048DC5165341C0540C91D3D7E30394840	14	18	other	\N	4	{}	\N
455	\N	\N	2020-10-19 19:34:08.124488	2020-10-30 22:05:33.700076	0101000020E6100000FEECE8524E1C0540D60D92402E394840	13	19	other	\N	4	{}	\N
442	\N	\N	2020-10-19 19:34:08.094175	2020-10-30 22:05:33.707782	0101000020E6100000DC1EE93DA11A0540B28658D541394840	13	6	other	\N	4	{}	\N
429	\N	\N	2020-10-19 19:33:22.847986	2020-10-30 22:05:33.711956	0101000020E6100000B8E1E8D7D61D05409D78100748394840	14	43	other	\N	4	{}	\N
488	\N	\N	2020-10-19 19:34:28.291808	2020-10-30 22:05:33.715666	0101000020E6100000E028E954121A05409FB0F01D35394840	15	4	other	\N	4	{}	\N
490			2020-10-19 19:34:28.296024	2020-10-30 22:05:33.719452	0101000020E61000000315E9EF941A0540CBFFF57A43394840	15	6	other	\N	4	{}	\N
494	\N	\N	2020-10-19 19:34:28.303312	2020-10-30 22:05:33.723302	0101000020E61000009D04E9F1CE1A0540257EFB4740394840	15	10	other	\N	4	{}	\N
497			2020-10-19 19:34:28.308693	2020-10-30 22:05:33.727221	0101000020E610000034E4E8E0651C05402DB12AF23F394840	15	13	other	\N	4	{}	\N
447	\N	\N	2020-10-19 19:34:08.104463	2020-10-30 22:05:33.730929	0101000020E61000005EF6E86ACE1A054072D4204350394840	13	11	other	\N	4	{}	\N
391	\N	\N	2020-10-19 19:33:22.770223	2020-10-30 22:05:33.735824	0101000020E6100000233029C9791C054050C6518A26394840	14	5	other	\N	4	{}	\N
479			2020-10-19 19:34:08.173717	2020-10-31 09:24:01.146672	0101000020E61000006251E408071D054083BF4F1D38394840	13	43	other	\N	4	{}	\N
333	Le Briscard	2b	2020-05-07 12:44:29.977091	2020-11-09 23:00:09.984847	0101000020E610000054885372893104400A68045845304840	10	44	wall	3	2	{}	5869
178	Le Fourre-Tout	6a+	2020-04-16 20:19:03.494721	2020-11-08 17:48:54.562652	0101000020E6100000771D5765ED4E05408DD8F5282C3B4840	4	24	traverse	4	1	{}	3299
81		3c	2020-04-16 20:19:03.213609	2020-11-08 15:07:16.727506	0101000020E6100000309B1197165005401FDBFA352E3B4840	2	6	traverse	\N	1	{}	17724
192	Le Couloir	4b	2020-04-16 20:19:03.539036	2020-11-08 15:27:10.21514	0101000020E6100000EAFEC6D7814E0540D3AF2B52283B4840	3	30	wall	\N	1	{}	1837
162	Le Dé	5b	2020-04-16 20:19:03.447369	2020-11-08 16:04:37.016496	0101000020E6100000999EB15E624E0540A3963BBD423B4840	4	30	overhang	5	1	{}	3305
546	Sonatine	5c	2020-11-01 21:57:45.634547	2020-11-01 22:14:40.073422	0101000020E6100000812AFAF3104F0540D91E79DA2E3B4840	\N	\N	wall	\N	1	{}	
545	La Blanche	7a	2020-11-01 21:56:00.142566	2020-11-01 22:14:40.197416	0101000020E6100000A929FA6C3D4F05403C4EDC9D2E3B4840	\N	\N	slab	\N	1	{}	17753
98	Le Golgotha	5b+	2020-04-16 20:19:03.26406	2020-11-08 16:42:14.830311	0101000020E61000004FECD49A6B4F05401980EAED153B4840	3	9	wall	4	1	{}	1812
184	La Vieille	5c+	2020-04-16 20:19:03.511011	2020-11-08 16:04:37.011746	0101000020E61000004862BF60D14E05401EA6527E293B4840	4	21	wall	6	1	{}	3296
596	An 8a Plus	4c	2020-11-02 13:16:22.347755	2020-11-02 13:40:44.994914	0101000020E6100000D278F4C4414D0540E26A521C4A3B4840	\N		overhang	\N	1	{}	
579	Passage Canonique	6b+	2020-11-02 12:20:50.903394	2020-11-02 13:40:45.016355	0101000020E6100000EC6DF4677F4E0540DF21FE864D3B4840	\N		overhang	\N	1	{sit_start}	17751
583	Coup de Rein	6a	2020-11-02 12:28:52.998333	2020-11-02 13:40:45.14164	0101000020E61000006216FAAD574E054098185E584D3B4840	\N	\N	wall	\N	1	{}	17754
604	Le Mur Grat'cieux	3a	2020-11-02 13:36:39.326895	2020-11-02 13:40:45.151639	0101000020E61000007EA5F47BB84C0540E65BD0D8463B4840	\N	\N	other	\N	1	{}	191402
617	La Plaisanterie	6b	2020-11-03 09:46:13.227989	2020-11-03 10:14:22.402128	0101000020E6100000C78CF441964E0540C0E398C31E3B4840	\N	\N	other	\N	1	{}	17752
641	Orange Juice	8a	2020-11-03 10:59:07.948123	2020-11-03 11:49:07.451352	0101000020E6100000D3A6F405864F05402D30791F0B3B4840	\N	\N	wall	\N	1	{}	22233
642	Pareur de Femmes	7a	2020-11-03 11:00:25.829687	2020-11-03 11:49:07.552441	0101000020E6100000C161F4D9484F0540933B136A0B3B4840	\N	\N	wall	\N	1	{}	1409
646	Scarlatine (assis)	7b	2020-11-03 11:08:20.715774	2020-11-03 11:49:07.673114	0101000020E610000090FA5C5C664F05401C9ECDB0073B4840	\N		overhang	\N	1	{sit_start}	1626
359	Le Billet Doux	4b+	2020-05-07 12:44:30.08839	2020-11-09 23:08:48.277841	0101000020E6100000941EA2623733044018FF02EE5E304840	12	42	slab	3	2	{}	23938
581	La Clé de Ut (assis)	6c	2020-11-02 12:23:39.863609	2020-11-03 14:18:19.410751	0101000020E6100000DF1C3A4C794E0540813958284D3B4840	\N		overhang	\N	1	{sit_start}	19908
606	Via Graciosa	6c	2020-11-02 13:39:28.549017	2020-11-03 14:18:20.032383	0101000020E61000003D025D99D14C054052E8A7A7453B4840	\N	\N	traverse	\N	1	{}	19498
46		2c	2020-04-16 20:19:03.102135	2020-11-08 11:48:09.668269	0101000020E6100000438F589A054E054092638227453B4840	1	3	traverse	\N	1	{}	4374
41	Champagne Frappé	2a	2020-04-16 20:19:03.090124	2020-11-08 14:53:10.663248	0101000020E6100000AA5849A33A4D05408967D1124A3B4840	1	8	slab	4	1	{}	4379
531	Ecstasy	4c	2020-11-01 17:38:32.253733	2020-11-01 18:31:23.109961	0101000020E61000006E013DBC9D5005407976997A383B4840	\N	\N	wall	\N	1	{}	
549	Sauvez Alain Robert	7c+	2020-11-02 09:14:45.867936	2020-11-02 11:28:09.298611	0101000020E6100000CF2CFD08CF4E054074E0AC94293B4840	\N		overhang	\N	1	{}	8588
567	Satyen	4c	2020-11-02 10:58:58.103632	2020-11-02 11:28:09.534071	0101000020E61000007146FA4D8A4E0540D3248C44463B4840	\N	\N	wall	\N	1	{}	17434
185	Styrax	6b	2020-04-16 20:19:03.513481	2020-11-08 16:04:37.032194	0101000020E6100000176C11D1BD4E0540FAC105BD293B4840	4	22	wall	\N	1	{}	3297
336	Le Sourire	5b	2020-05-07 12:44:29.990595	2020-11-09 23:13:38.746336	0101000020E61000007FB238B537330440F71F017D48304840	11	28	overhang	3	2	{}	23916
624	Glissant	4c	2020-11-03 10:05:12.21466	2020-11-03 10:14:22.48381	0101000020E6100000B2A6F4FB9E4F0540BF290A67153B4840	\N	\N	wall	\N	1	{}	
33		2b	2020-04-16 20:19:03.067215	2020-11-08 14:56:44.263517	0101000020E610000013289F8A684D054083E90A9B363B4840	1	17	wall	\N	1	{}	4388
255	La Caisse	5b	2020-05-07 12:44:29.638657	2020-11-11 15:17:43.722925	0101000020E6100000002A321727330440C82BE55D40304840	11	27	overhang	2	2	{}	23915
72	Tour d'Eiffel	3b	2020-04-16 20:19:03.188287	2020-11-08 16:04:37.045039	0101000020E6100000C73A1D40234F05405A95EAD62D3B4840	2	19	slab	6	1	{}	4432
622	Carrie	2b	2020-11-03 10:02:09.762622	2020-11-03 10:14:22.621141	0101000020E61000001160F4CBA14F0540505C9FE2143B4840	\N	\N	slab	\N	1	{}	
22		2b	2020-04-16 20:19:03.036242	2020-11-08 14:58:48.730869	0101000020E6100000D149F894C74E05409A7B59E21F3B4840	1	28	traverse	4	1	{}	4399
580	La Clé de Ut	5b+	2020-11-02 12:22:44.06005	2020-11-02 13:40:45.091501	0101000020E6100000831FFA7E774E0540485145304D3B4840	\N	\N	overhang	\N	1	{}	18968
582	Retrouvaille	7a	2020-11-02 12:26:04.072632	2020-11-02 13:40:45.179558	0101000020E6100000685BF4B1714E0540E116C3834C3B4840	\N	\N	overhang	\N	1	{}	18967
603	Le Col Dégrafé	5c	2020-11-02 13:35:09.98004	2020-11-02 13:40:45.196857	0101000020E6100000F65CF4E8C34C0540D9906654463B4840	\N	\N	wall	\N	1	{}	19003
602	Via Grat'	6a	2020-11-02 13:33:34.083126	2020-11-02 13:40:45.474065	0101000020E61000009D6AF4FCBE4C0540FF247C8A463B4840	\N	\N	wall	\N	1	{}	19499
597	C'est la Cerise sur le Gâteau	3a	2020-11-02 13:18:48.338327	2020-11-02 13:40:45.557773	0101000020E6100000BA60F4EF344D05401DFD7F58493B4840	\N	\N	slab	\N	1	{}	
605	Le Pilier Grat'cieux	3b	2020-11-02 13:38:17.176154	2020-11-02 13:40:45.576035	0101000020E61000004FA4F495AD4C05409D5FB648473B4840	\N	\N	wall	\N	1	{}	71731
77	Couche-Tard	3a	2020-04-16 20:19:03.202691	2020-11-08 15:09:11.081448	0101000020E6100000FA9A42A0014F05401DF220F5343B4840	2	17	wall	4	1	{}	4430
623	Sophie	2a	2020-11-03 10:04:13.56293	2020-11-03 10:14:22.677372	0101000020E6100000AB5BF492AD4F05403277B872143B4840	\N	\N	other	\N	1	{}	
71		2a	2020-04-16 20:19:03.185163	2020-11-08 15:09:41.431839	0101000020E6100000B093E1412E4F05409497D2C82C3B4840	2	20	overhang	\N	1	{}	4433
66	L'Arête gauche du Cervin	2c+	2020-04-16 20:19:03.163135	2020-11-08 16:04:37.050391	0101000020E6100000530BDE488E4E0540E0A31F14153B4840	2	25	slab	6	1	{}	4438
60	Imogen	3c	2020-04-16 20:19:03.141151	2020-11-08 16:04:37.052736	0101000020E6100000FAA6772B894E05403F741579FD3A4840	2	31	wall	5	1	{}	4446
61		3c	2020-04-16 20:19:03.143768	2020-11-08 15:11:43.620143	0101000020E61000009AF046701D4E054084A08EED043B4840	2	30	slab	\N	1	{}	4444
663	La Cave de l'Oncle Tom	6c	2020-11-03 11:42:05.947026	2020-11-08 16:09:15.25187	0101000020E61000002F5DF40A824E0540149BE4D1FD3A4840	\N		overhang	\N	1	{risky}	9937
159	Complainte	3b	2020-04-16 20:19:03.437792	2020-11-08 15:14:53.378335	0101000020E61000003D5740CAD44F054036C372E13B3B4840	5	5	slab	\N	1	{}	4464
129	Contemplations	5b	2020-04-16 20:19:03.356315	2020-11-08 15:20:17.031349	0101000020E6100000F418F13FC84C05407E466B20463B4840	5	30	wall	3	1	{}	4491
643	Le Bombé (assis droite)	7a	2020-11-03 11:02:08.139108	2020-11-03 11:49:07.510845	0101000020E610000021FFDC44764F05401652C134083B4840	\N		other	\N	1	{sit_start}	23704
651	Croustillante	2a	2020-11-03 11:19:46.607107	2020-11-03 11:49:07.391564	0101000020E61000000663F40ABD4F0540C9700F4A043B4840	\N	\N	slab	\N	1	{}	
458	\N	\N	2020-10-19 19:34:08.12968	2020-10-30 22:05:33.426976	0101000020E610000001DCE8E1821C0540A7A4FD5730394840	13	22	other	\N	4	{}	\N
652	Hanuman	7c	2020-11-03 11:24:22.395154	2020-11-03 11:49:07.431575	0101000020E6100000BC71F4FADB4F054077562096013B4840	\N	\N	overhang	\N	1	{}	19350
392	\N	\N	2020-10-19 19:33:22.773038	2020-10-30 22:05:33.431787	0101000020E610000077F7E805701A0540091522B128394840	14	6	other	\N	4	{}	\N
485	\N	\N	2020-10-19 19:34:28.283868	2020-10-30 22:05:33.436339	0101000020E61000008EC368FA191A0540D0E35E3E2C394840	15	1	other	\N	4	{}	\N
518	\N	\N	2020-10-19 19:34:28.356619	2020-10-30 22:05:33.451619	0101000020E61000007FDBE8B9E61C05405BB40C9E32394840	15	34	other	\N	4	{}	\N
399			2020-10-19 19:33:22.788514	2020-10-30 22:05:33.460317	0101000020E61000002610E94D821A0540872A222A40394840	14	13	other	\N	4	{}	\N
403	\N	\N	2020-10-19 19:33:22.797141	2020-10-30 22:05:33.464288	0101000020E6100000267BF45CA01A0540FB15F8952F394840	14	17	other	\N	4	{}	\N
427	\N	\N	2020-10-19 19:33:22.844714	2020-10-30 22:05:33.488681	0101000020E610000027E3E8D1AF1D0540444DAD244D394840	14	41	other	\N	4	{}	\N
444			2020-10-19 19:34:08.098579	2020-10-30 22:05:33.504447	0101000020E610000042DAE87A821A05402F28B17E43394840	13	8	other	\N	4	{}	\N
665	Baboon Master	8a+	2020-11-03 11:46:01.352012	2020-11-03 11:49:07.529135	0101000020E61000007E70F4BB774D05400EBE30990A3B4840	\N		roof	\N	1	{sit_start}	1054
89	La Queue du Dromadaire	4b+	2020-04-16 20:19:03.23842	2020-11-08 15:24:30.906684	0101000020E610000015D07830624F0540D1B805E41C3B4840	3	13	wall	4	1	{}	1818
145	Caprice	6a	2020-04-16 20:19:03.400619	2020-11-08 15:34:23.973374	0101000020E610000006018950AB4E0540DB6EF9F2453B4840	4	34	wall	4	1	{}	1766
40	Sauvetage	2a	2020-04-16 20:19:03.087615	2020-11-08 16:04:37.030753	0101000020E6100000242EFBFF324D0540F9F8BDD14D3B4840	1	9	wall	5	1	{}	4380
32		2a	2020-04-16 20:19:03.064545	2020-11-08 16:04:37.036295	0101000020E61000009F895DC5D94D0540CEE1F0BF323B4840	1	18	wall	\N	1	{}	43695
70	Le Bouchon	3b	2020-04-16 20:19:03.178619	2020-11-08 17:48:54.070496	0101000020E6100000213765E5154F054001A885EF2A3B4840	2	21	overhang	3	1	{}	4434
37		3a	2020-04-16 20:19:03.077151	2020-11-08 17:48:54.378561	0101000020E6100000282BDF049F4C0540E4B97A08473B4840	1	12	slab	\N	1	{}	4383
35		1c	2020-04-16 20:19:03.071902	2020-11-08 17:48:54.479826	0101000020E610000033B3E5A7524D0540B82A912A3A3B4840	1	15	slab	\N	1	{}	4386
338	Le Pas de Géant	2b+	2020-05-07 12:44:30.005055	2020-11-09 22:58:50.988543	0101000020E610000029D33A3A463304407E5760C746304840	10	35	traverse	5	2	{}	5860
509	\N	\N	2020-10-19 19:34:28.338394	2020-10-31 09:24:01.283491	0101000020E6100000100D1225051D0540C7E56B073A394840	15	25	other	\N	4	{}	\N
478			2020-10-19 19:34:08.171975	2020-10-31 09:24:01.410656	0101000020E610000040E73484F61C054081BFA09739394840	13	42	other	\N	4	{}	\N
314	La Mer à Boire	6a	2020-05-07 12:44:29.897593	2020-11-09 23:13:12.075107	0101000020E6100000F92D6E10883104405300F39A29304840	11	25	overhang	3	2	{}	23913
532	Hymne à la Mort	6a	2020-11-01 17:47:43.567635	2020-11-03 14:18:19.977619	0101000020E6100000A6505488A34F0540E4E50335343B4840	\N		overhang	\N	1	{}	4468
533	Hymne à la Mort (assis)	6b	2020-11-01 17:49:04.431286	2020-11-03 14:18:20.051741	0101000020E61000002F89148EA14F05402A03F13C343B4840	\N		overhang	\N	1	{sit_start}	19913
42		2a	2020-04-16 20:19:03.092604	2020-11-08 14:52:57.554356	0101000020E6100000C6EAF3C1934D05408A058B9B493B4840	1	7	traverse	\N	1	{}	4378
9		2b	2020-04-16 20:19:02.994807	2020-11-08 15:02:54.687988	0101000020E61000001ED32312E54D05406F30A6130D3B4840	1	41	wall	\N	1	{}	16261
432	\N	\N	2020-10-19 19:33:22.853854	2020-10-30 22:05:33.739745	0101000020E6100000B641E90D551E0540DB17A6C63C394840	14	46	other	\N	4	{}	\N
470	\N	\N	2020-10-19 19:34:08.156569	2020-10-30 22:05:33.747834	0101000020E6100000C929E901AD1D05402DFD979E47394840	13	34	other	\N	4	{}	\N
414	\N	\N	2020-10-19 19:33:22.818914	2020-10-30 22:05:33.751706	0101000020E610000083B4E8917A1A0540EB40626B49394840	14	28	other	\N	4	{}	\N
408	\N	\N	2020-10-19 19:33:22.807966	2020-10-30 22:05:33.755054	0101000020E610000058B4E8C8151B0540B49DCBE13E394840	14	22	other	\N	4	{}	\N
431	\N	\N	2020-10-19 19:33:22.851596	2020-10-30 22:05:33.761971	0101000020E6100000420DE9342E1E05402156991A3D394840	14	45	other	\N	4	{}	\N
437	\N	\N	2020-10-19 19:34:08.080002	2020-10-30 22:05:33.765616	0101000020E61000000E1EE9754B1A05403AF4A23C2A394840	13	1	other	\N	4	{}	\N
387	\N	\N	2020-10-19 19:33:22.746816	2020-10-30 22:05:33.769047	0101000020E61000005B266973BC1C0540A9F70D792F394840	14	1	other	\N	4	{}	\N
2		2c	2020-04-16 20:19:02.975036	2020-11-08 16:12:23.505522	0101000020E61000001AA322C3EB4C05409C2E4488073B4840	1	48	slab	\N	1	{risky}	16268
495	\N	\N	2020-10-19 19:34:28.305115	2020-10-30 22:05:33.772684	0101000020E6100000F112E9C3381B05407C14F1293C394840	15	11	other	\N	4	{}	\N
514	\N	\N	2020-10-19 19:34:28.347323	2020-10-30 22:05:33.776965	0101000020E61000000DD9E86FD51D0540E536FA182F394840	15	30	other	\N	4	{}	\N
426	\N	\N	2020-10-19 19:33:22.842991	2020-10-30 22:05:33.780898	0101000020E6100000B4B7E8BFC11D0540A24A39C24B394840	14	40	other	\N	4	{}	\N
419	\N	\N	2020-10-19 19:33:22.829536	2020-10-30 22:05:33.785225	0101000020E6100000DE41E9094C1C0540E4AEE6DE3C394840	14	33	other	\N	4	{}	\N
410	\N	\N	2020-10-19 19:33:22.811624	2020-10-30 22:05:33.788988	0101000020E6100000EBD0683BC91A0540DAFF6F3B41394840	14	24	other	\N	4	{}	\N
534	Poussinours	7c	2020-11-01 17:50:46.024744	2020-11-01 18:31:22.738606	0101000020E6100000219CF430A64F0540562400B5343B4840	\N	\N	overhang	\N	1	{sit_start}	1776
473	\N	\N	2020-10-19 19:34:08.161455	2020-10-30 22:05:33.792966	0101000020E61000002FF7E8FF911C054068FA23DA3A394840	13	37	other	\N	4	{}	\N
489			2020-10-19 19:34:28.293875	2020-10-30 22:05:33.79717	0101000020E6100000F2D8E88A901A0540EB7560E13F394840	15	5	other	\N	4	{}	\N
401	\N	\N	2020-10-19 19:33:22.793489	2020-10-30 22:05:33.800977	0101000020E610000056C5E839E11A05403153DFC637394840	14	15	other	\N	4	{}	\N
388	\N	\N	2020-10-19 19:33:22.75919	2020-10-30 22:05:33.809578	0101000020E61000005AFDE891961C0540BAB0C18F2C394840	14	2	other	\N	4	{}	\N
513	\N	\N	2020-10-19 19:34:28.345664	2020-10-30 22:05:33.813472	0101000020E6100000E5FFE8F37E1D05405EDCA8A931394840	15	29	other	\N	4	{}	\N
472	\N	\N	2020-10-19 19:34:08.159887	2020-10-30 22:05:33.817358	0101000020E61000000DD9E86FD51D05405D66F2A849394840	13	36	other	\N	4	{}	\N
516	\N	\N	2020-10-19 19:34:28.352221	2020-10-30 22:05:33.821153	0101000020E6100000C7F1E876651D0540562BF5C832394840	15	32	other	\N	4	{}	\N
435	\N	\N	2020-10-19 19:33:22.860899	2020-10-30 22:05:33.824916	0101000020E6100000BCE8E8F0AE1D05403CA5751B32394840	14	49	other	\N	4	{}	\N
405	\N	\N	2020-10-19 19:33:22.800643	2020-10-30 22:05:33.829012	0101000020E6100000F5FBE8563B1C0540493A222935394840	14	19	other	\N	4	{}	\N
510	\N	\N	2020-10-19 19:34:28.340644	2020-10-30 22:05:33.832836	0101000020E6100000D70AE9DC2C1D0540EE9E724339394840	15	26	other	\N	4	{}	\N
493	\N	\N	2020-10-19 19:34:28.301558	2020-10-30 22:05:33.836527	0101000020E6100000F7FCE8A6731B05404BD772C743394840	15	9	other	\N	4	{}	\N
165	Sonnets Posthumes	4c	2020-04-16 20:19:03.45845	2020-11-08 15:16:24.308205	0101000020E61000009ECD75DD054F0540B4FA66A52E3B4840	5	11	wall	\N	1	{}	4471
217	Élégie	3c	2020-04-16 20:19:03.613172	2020-11-08 15:17:10.609687	0101000020E6100000F553E806214F05407B7F42D3333B4840	5	14	wall	4	1	{}	4474
441	\N	\N	2020-10-19 19:34:08.091842	2020-10-30 22:05:33.846369	0101000020E61000004EC6E8CA9B1A054010DFE5F53F394840	13	5	other	\N	4	{}	\N
452	\N	\N	2020-10-19 19:34:08.118834	2020-10-30 22:05:33.850446	0101000020E6100000970BE94B291B0540F4E6C17F3C394840	13	16	other	\N	4	{}	\N
398	\N	\N	2020-10-19 19:33:22.786184	2020-10-30 22:05:33.85433	0101000020E6100000F3E4E84F621A054092CC7CE740394840	14	12	other	\N	4	{}	\N
505	\N	\N	2020-10-19 19:34:28.32928	2020-10-30 22:05:33.858372	0101000020E6100000613EFAB0C21C0540999F64B938394840	15	21	other	\N	4	{}	\N
428	\N	\N	2020-10-19 19:33:22.846318	2020-10-30 22:05:33.869473	0101000020E610000013E9E84FE61D054025A4686C4B394840	14	42	other	\N	4	{}	\N
525	\N	\N	2020-10-19 19:34:28.370067	2020-10-30 22:05:33.873544	0101000020E6100000B1B7E8F2531C0540119512CC2F394840	15	41	other	\N	4	{}	\N
507	\N	\N	2020-10-19 19:34:28.333593	2020-10-30 22:05:33.877491	0101000020E6100000E502E9F1171D0540E47351EA37394840	15	23	other	\N	4	{}	\N
439	\N	\N	2020-10-19 19:34:08.086629	2020-10-30 22:05:33.881105	0101000020E61000007075FACFF11905405643A6B42D394840	13	3	other	\N	4	{}	\N
402	\N	\N	2020-10-19 19:33:22.795314	2020-10-30 22:05:33.885031	0101000020E6100000DE01E907041B054048D85CDA35394840	14	16	other	\N	4	{}	\N
450	La Fissure Morin	4c	2020-10-19 19:34:08.1098	2020-10-30 22:05:33.888771	0101000020E6100000F6D0E8E0FD1A054074B53D0C49394840	13	14	wall	\N	4	{}	\N
449			2020-10-19 19:34:08.108094	2020-10-30 22:05:33.89208	0101000020E61000006CEEE87FB91A0540C8360C0149394840	13	13	other	\N	4	{}	\N
155	Cadavre Exquis	4c	2020-04-16 20:19:03.426854	2020-11-08 15:17:56.849415	0101000020E61000005399C673EF4E054024F9B6C3383B4840	5	18	slab	4	1	{}	4478
512	\N	\N	2020-10-19 19:34:28.344069	2020-10-30 22:05:33.899875	0101000020E61000008210E946951D054066889F3C33394840	15	28	other	\N	4	{}	\N
153	Prose	4c	2020-04-16 20:19:03.421549	2020-11-08 15:18:49.730566	0101000020E6100000932DCB2F9A4E054063A1192D373B4840	5	21	wall	4	1	{}	4482
207	Angoisse	4b	2020-04-16 20:19:03.58209	2020-11-08 15:21:14.027616	0101000020E61000006136C6E1504C05403ACD51EA333B4840	5	35	wall	3	1	{}	4496
94	La Norma	3b	2020-04-16 20:19:03.25223	2020-11-08 15:27:41.097045	0101000020E61000009D8761FBA44E05403473055C1C3B4840	3	33	wall	3	1	{}	1841
111	Presse Citron	6a	2020-04-16 20:19:03.301355	2020-11-08 15:30:10.489425	0101000020E610000051AF7433A54D05400BB978210C3B4840	4	8	wall	4	1	{}	3283
197	Échec et Mat	5c	2020-04-16 20:19:03.553306	2020-11-08 15:34:52.222872	0101000020E61000009C3E06BB584E0540F2DAD3284D3B4840	4	37	wall	3	1	{}	3312
8		3a	2020-04-16 20:19:02.99152	2020-11-08 16:04:37.077742	0101000020E61000008BDC8A15F44D054045EC5C330D3B4840	1	42	slab	4	1	{}	16262
311	L'Autre Voie	3a	2020-05-07 12:44:29.887012	2020-11-09 22:57:27.344756	0101000020E6100000C81EF8497F310440D859A59A2F304840	10	26	wall	4	2	{}	5851
553	Styrax (assis)	7b	2020-11-02 09:35:12.63801	2020-11-03 14:18:19.930322	0101000020E6100000719A5E50BE4E05407E200EAB293B4840	\N		wall	\N	1	{sit_start}	19746
569	Grouppy	2b	2020-11-02 11:04:41.403988	2020-11-02 11:28:09.615749	0101000020E6100000B945FAD09D4E054040B5BB0A463B4840	\N	\N	wall	\N	1	{}	
339	Le Kyste	4c	2020-05-07 12:44:30.008678	2020-11-09 23:05:23.456881	0101000020E6100000B484076B083304406C60A6D647304840	12	20	wall	4	2	{}	5794
389	\N	\N	2020-10-19 19:33:22.762098	2020-10-30 22:05:33.903416	0101000020E610000019F4E8B68F1C0540BF67A1B92A394840	14	3	other	\N	4	{}	\N
406	\N	\N	2020-10-19 19:33:22.802832	2020-10-30 22:05:33.907407	0101000020E6100000B1C9E8B3571B0540316277053A394840	14	20	other	\N	4	{}	\N
456	\N	\N	2020-10-19 19:34:08.126153	2020-10-30 22:05:33.911321	0101000020E6100000A116E94CAE1C0540B542C3122C394840	13	20	other	\N	4	{}	\N
413	\N	\N	2020-10-19 19:33:22.816977	2020-10-30 22:05:33.915135	0101000020E6100000F740E9291F1A0540F38CAF9546394840	14	27	other	\N	4	{}	\N
44		3a	2020-04-16 20:19:03.097409	2020-11-08 11:48:35.70234	0101000020E6100000CEEE731BBE4D0540E4251989473B4840	1	5	slab	\N	1	{}	4376
523	\N	\N	2020-10-19 19:34:28.366363	2020-10-30 22:05:33.919085	0101000020E61000005E04E9AA6E1C0540FD1ACC4C30394840	15	39	other	\N	4	{}	\N
457	\N	\N	2020-10-19 19:34:08.127988	2020-10-30 22:05:33.922689	0101000020E61000004019E92C921C05403A6576872E394840	13	21	other	\N	4	{}	\N
461	\N	\N	2020-10-19 19:34:08.136925	2020-10-30 22:05:33.9261	0101000020E610000021DCE8EB691C0540D748F9FC37394840	13	25	other	\N	4	{}	\N
522	\N	\N	2020-10-19 19:34:28.364328	2020-10-30 22:05:33.933831	0101000020E6100000D0F4E8337C1C0540CE0B935731394840	15	38	other	\N	4	{}	\N
459	\N	\N	2020-10-19 19:34:08.131461	2020-10-30 22:05:33.937473	0101000020E61000003EE1E8A14A1C05408BD7B18834394840	13	23	other	\N	4	{}	\N
440			2020-10-19 19:34:08.08933	2020-10-30 22:05:33.941716	0101000020E6100000D900E9EA5D1A0540267873F43E394840	13	4	other	\N	4	{}	\N
400	\N	\N	2020-10-19 19:33:22.791313	2020-10-30 22:05:33.945381	0101000020E6100000CEF7E864A71A0540F168117841394840	14	14	other	\N	4	{}	\N
504	\N	\N	2020-10-19 19:34:28.327543	2020-10-30 22:05:33.949197	0101000020E6100000F543FACFC11C0540B2B469EA39394840	15	20	other	\N	4	{}	\N
492	\N	\N	2020-10-19 19:34:28.299811	2020-10-30 22:05:33.952902	0101000020E61000006309E948781A0540FFC343FB44394840	15	8	other	\N	4	{}	\N
464	\N	\N	2020-10-19 19:34:08.143476	2020-10-30 22:05:33.956483	0101000020E61000001EE1E897631C054023D95B1F3F394840	13	28	other	\N	4	{}	\N
412	\N	\N	2020-10-19 19:33:22.815085	2020-10-30 22:05:33.95984	0101000020E61000009514E945F4190540FE70E6B141394840	14	26	other	\N	4	{}	\N
500	\N	\N	2020-10-19 19:34:28.314682	2020-10-30 22:05:33.964299	0101000020E61000001300FA898F1C05409FE91C043B394840	15	16	other	\N	4	{}	\N
519	\N	\N	2020-10-19 19:34:28.358919	2020-10-30 22:05:33.969302	0101000020E6100000ABE4E849841C05405DCD35E132394840	15	35	other	\N	4	{}	\N
502	\N	\N	2020-10-19 19:34:28.324075	2020-10-30 22:05:33.981242	0101000020E6100000C347FA95B01C05401557365C3A394840	15	18	other	\N	4	{}	\N
491	\N	\N	2020-10-19 19:34:28.297932	2020-10-30 22:05:33.984799	0101000020E61000008DFAE84E721A0540F2E9F17444394840	15	7	other	\N	4	{}	\N
407	\N	\N	2020-10-19 19:33:22.805085	2020-10-30 22:05:33.992316	0101000020E6100000EF23E934041B0540B25D1D953A394840	14	21	other	\N	4	{}	\N
423	\N	\N	2020-10-19 19:33:22.836217	2020-10-30 22:05:33.995699	0101000020E61000006ED9E88D8A1D0540BDB6FC9D44394840	14	37	other	\N	4	{}	\N
453	\N	\N	2020-10-19 19:34:08.120945	2020-10-30 22:05:33.999074	0101000020E61000002E2E7A54281B054086E0D50630394840	13	17	other	\N	4	{}	\N
446			2020-10-19 19:34:08.102599	2020-10-30 22:05:34.002322	0101000020E610000058DDE8C3841A05404617A7454A394840	13	10	other	\N	4	{}	\N
421	\N	\N	2020-10-19 19:33:22.832852	2020-10-30 22:05:34.005761	0101000020E610000073FBE82E9F1C0540FD0BC59C3E394840	14	35	other	\N	4	{}	\N
38		2c	2020-04-16 20:19:03.082451	2020-11-08 14:54:56.162664	0101000020E6100000DA632DDDC54C05404BEE2A1D4B3B4840	1	11	wall	\N	1	{}	4382
467	\N	\N	2020-10-19 19:34:08.151111	2020-10-30 22:05:34.013653	0101000020E61000002F3AE9FF721D05406E735D5344394840	13	31	other	\N	4	{}	\N
393	\N	\N	2020-10-19 19:33:22.775594	2020-10-30 22:05:34.01695	0101000020E6100000723B7A7D001A0540479F0DE52B394840	14	7	other	\N	4	{}	\N
34		2c	2020-04-16 20:19:03.069571	2020-11-08 14:56:31.509126	0101000020E61000002DC5D8ED974D0540FE1D970F3A3B4840	1	16	traverse	\N	1	{}	4387
12		3a	2020-04-16 20:19:03.009542	2020-11-08 15:02:23.916214	0101000020E6100000E0701A2C964D054050BC3870103B4840	1	38	traverse	\N	1	{}	4409
585	Le Cygne	5a	2020-11-02 12:37:54.0783	2020-11-02 13:40:44.975911	0101000020E61000005069F4D93A4E0540042401B6413B4840	\N	\N	overhang	\N	1	{}	
538	Mitoo	6a+	2020-11-01 18:30:10.101488	2020-11-01 18:31:22.986271	0101000020E61000002984F465804F0540F7DE15EB343B4840	\N	\N	overhang	\N	1	{}	17449
535	L'Œil de Çiva	7c+	2020-11-01 18:25:57.600577	2020-11-01 18:31:23.080925	0101000020E61000002468F4C09D4F0540E7154012353B4840	\N	\N	overhang	\N	1	{sit_start}	837
584	Excalibur	5a	2020-11-02 12:32:31.994223	2020-11-02 13:40:45.011358	0101000020E6100000F61BFACC564E0540E9DFEF794D3B4840	\N	\N	wall	\N	1	{}	
62		3c+	2020-04-16 20:19:03.146353	2020-11-08 15:11:14.275949	0101000020E61000007614B4001E4E05409614AB480D3B4840	2	28	wall	3	1	{}	4441
187	L'eunnuque	4a	2020-04-16 20:19:03.523176	2020-11-08 15:25:51.951965	0101000020E6100000B9349299624F05406D0480E5303B4840	3	22	wall	\N	1	{}	1829
607	Dynamite	4c	2020-11-02 15:05:46.561584	2020-11-02 15:13:08.777352	0101000020E61000002753F459354C05409CF7B2A83A3B4840	\N	\N	wall	\N	1	{}	
609	Gauche Caviar	3c	2020-11-02 15:11:29.706947	2020-11-02 15:13:09.013846	0101000020E6100000F1A4F4C7304C054096334EC3393B4840	\N	\N	overhang	\N	1	{}	
103	Le Jeu de Go	5a+	2020-04-16 20:19:03.278128	2020-11-08 15:28:35.362238	0101000020E6100000DEAA51EA774E0540536DB062133B4840	3	39	wall	4	1	{}	1847
625	Le Sphinx (gauche)	5c	2020-11-03 10:07:23.443435	2020-11-03 10:14:22.435118	0101000020E6100000779974AB8D4F0540695C89F8143B4840	\N	\N	slab	\N	1	{}	18892
4		2a	2020-04-16 20:19:02.980786	2020-11-08 16:04:37.144912	0101000020E6100000BFC481088C4D0540443041AA083B4840	1	46	traverse	2	1	{}	16266
226	Morphotype	6c+	2020-04-16 20:19:03.636799	2020-11-08 16:04:37.152626	0101000020E6100000EA65EE2FA54E054066C4A4BF503B4840	6	6	overhang	4	1	{sit_start}	4503
667	Orca	7c+	2020-11-03 11:47:36.560718	2020-11-03 11:49:07.346823	0101000020E61000004B8EF4B96A4D0540254506720A3B4840	\N		roof	\N	1	{sit_start}	1055
645	Vilaine Biquette	8a	2020-11-03 11:05:43.36959	2020-11-03 11:49:07.557913	0101000020E610000035B11EC9754F0540A7B4461C083B4840	\N	\N	other	\N	1	{}	11527
644	Le Bombé (assis gauche)	6c+	2020-11-03 11:04:23.985507	2020-11-03 11:49:07.597365	0101000020E61000001788FE06764F05401FDB5429083B4840	\N	\N	other	\N	1	{}	1244
666	La Fissure de la Baleine	5b	2020-11-03 11:46:52.652864	2020-11-03 11:49:07.654259	0101000020E61000007F9FF47F864D054075388A860A3B4840	\N	\N	overhang	\N	1	{}	
316	La Tanière	5c	2020-05-07 12:44:29.905102	2020-11-09 23:12:56.358999	0101000020E610000057B2B170D9300440A09AF4FA08304840	11	23	overhang	2	2	{}	23912
368	Le Curseur	6a	2020-05-07 12:44:30.122535	2020-11-09 23:14:47.140017	0101000020E6100000B856391BE6330440610EED3F77304840	11	36	wall	3	2	{}	23923
29		2c	2020-04-16 20:19:03.056197	2020-11-08 14:57:28.590238	0101000020E6100000F6346FE73B4E0540A69DBA3F283B4840	1	21	traverse	\N	1	{}	4392
279	Le Paisible	2a	2020-05-07 12:44:29.743657	2020-11-09 22:54:29.82754	0101000020E6100000784AB9B3C32E044051483FEB26304840	10	12	slab	3	2	{}	5837
570	Chausson de Danse	5a	2020-11-02 11:05:30.938351	2020-11-02 11:28:09.505082	0101000020E6100000E11B7A68A44E054020619CFE453B4840	\N	\N	wall	\N	1	{}	
304	Le Vigoureux	3b	2020-05-07 12:44:29.842521	2020-11-09 22:56:29.391634	0101000020E6100000ECF0EDC5503004404563161022304840	10	19	traverse	2	2	{}	5844
313	La Gageure	3a+	2020-05-07 12:44:29.893979	2020-11-09 22:57:18.809088	0101000020E6100000A4ED6D7C76310440244715EC2B304840	10	25	wall	4	2	{}	5850
586	Le Dièdre sans le Dièdre	5c+	2020-11-02 12:41:03.659193	2020-11-02 13:40:45.082254	0101000020E610000085607AEA404E054045F6D818423B4840	\N	\N	other	\N	1	{}	
347	L'Abri	2b	2020-05-07 12:44:30.03722	2020-11-09 22:59:34.967373	0101000020E6100000264F65DD7A320440235F4F3E4E304840	10	40	other	3	2	{}	5866
300	L'Obstiné	2c	2020-05-07 12:44:29.827788	2020-11-09 23:00:53.445798	0101000020E610000096EDD7F12F30044092B8711426304840	10	49	wall	4	2	{}	5874
537	Rédemption	7a	2020-11-01 18:29:10.753543	2020-11-01 18:31:22.876961	0101000020E61000001481F41C7E4F0540FF8AF431353B4840	\N	\N	roof	\N	1	{}	17740
73		2b+	2020-04-16 20:19:03.191173	2020-11-08 15:08:36.184807	0101000020E610000035D47671624E0540478127213C3B4840	2	14	wall	\N	1	{}	4427
536	Tatoomi	6b	2020-11-01 18:27:31.862414	2020-11-01 18:31:23.051624	0101000020E6100000EA8FF416844F0540A49B798B353B4840	\N	\N	overhang	\N	1	{}	17450
158	Ballade	4a+	2020-04-16 20:19:03.434597	2020-11-08 15:15:01.04051	0101000020E610000058578B02AD4F05401AA94F143B3B4840	5	6	wall	4	1	{}	4465
168	Strophe	4a	2020-04-16 20:19:03.466775	2020-11-08 15:16:33.564853	0101000020E6100000A83E2102154F05402EB5FB2B303B4840	5	12	wall	\N	1	{}	4472
151	L'Amour du Mensonge	4c	2020-04-16 20:19:03.416527	2020-11-08 15:18:13.341955	0101000020E61000007EA2C678C64E054010F141F4373B4840	5	20	wall	4	1	{}	4480
218	Le Surplomb du Bengale	5c	2020-04-16 20:19:03.61576	2020-11-08 15:26:19.712642	0101000020E6100000B70BE2520C4F054077C14B8E333B4840	3	25	overhang	4	1	{}	1832
608	The Roof	6a+	2020-11-02 15:09:14.189777	2020-11-02 15:13:09.049901	0101000020E6100000357AF4322F4C05409BDF3A173A3B4840	\N		roof	\N	1	{sit_start}	17757
100	Le French Cancan	4c	2020-04-16 20:19:03.269684	2020-11-08 15:28:09.535763	0101000020E61000006641EAAFC54E0540C5E831B9153B4840	3	36	wall	4	1	{}	1844
99	Le Serpent	4c	2020-04-16 20:19:03.266975	2020-11-08 15:28:18.3934	0101000020E6100000B0F50E74024F0540B109BFB9143B4840	3	37	traverse	3	1	{}	1845
627	Hypoplasia	4b	2020-11-03 10:13:28.244663	2020-11-03 10:14:22.302026	0101000020E61000005696F4BC564F0540BFAB798A153B4840	\N	\N	other	\N	1	{}	
626	Hyperplasia	5b+	2020-11-03 10:12:15.227166	2020-11-03 10:14:22.752507	0101000020E6100000AF68FA105D4F0540BA227EC1153B4840	\N	\N	wall	\N	1	{}	
205	Le Tarot	5c	2020-04-16 20:19:03.576541	2020-11-08 15:35:51.555334	0101000020E6100000FE9EE5CD104C05409C4999BF3D3B4840	4	44	overhang	4	1	{}	3319
15		2a	2020-04-16 20:19:03.017287	2020-11-08 16:04:37.158102	0101000020E6100000D30B976F844E0540885AC474113B4840	1	35	traverse	\N	1	{}	114543
195	Le Tabac	3a	2020-04-16 20:19:03.547996	2020-11-08 16:04:37.160218	0101000020E6100000DEBB2AC7AF5005407033BFAE363B4840	2	1	wall	5	1	{}	4413
141	Bateau Ivre	4b+	2020-04-16 20:19:03.390152	2020-11-08 16:04:37.167245	0101000020E610000050B99265414E05406C20ABB9433B4840	5	24	wall	5	1	{}	4485
668	Orca (droite)	7a	2020-11-03 11:48:28.44927	2020-11-03 11:49:07.198391	0101000020E610000055657A00684D05406D3F4E600A3B4840	\N		roof	\N	1	{sit_start}	1053
647	Saccageur de Rêves	7c+	2020-11-03 11:10:40.883963	2020-11-03 11:49:07.356062	0101000020E6100000B44F7A0F484F0540126DFFAA063B4840	\N	\N	traverse	\N	1	{}	841
648	Le Chaînon Manquant	7c	2020-11-03 11:12:32.437768	2020-11-03 11:49:07.409181	0101000020E6100000D22E7AC8524F054050B4CE9F063B4840	\N	\N	overhang	\N	1	{}	842
650	Les P'tites Poignées d'Amour	6c+	2020-11-03 11:18:51.09087	2020-11-03 11:49:07.476338	0101000020E6100000BB427AB9BB4F05405866C6DE053B4840	\N	\N	overhang	\N	1	{}	811
649	La Valse aux Adieux	8b	2020-11-03 11:16:37.942106	2020-11-03 11:49:07.516854	0101000020E61000003F2F7A72F34F0540DCF921A9063B4840	\N	\N	traverse	\N	1	{}	845
357	Les Précieuses	3a	2020-05-07 12:44:30.081233	2020-11-09 23:05:59.9659	0101000020E610000065C6E950B7330440C2C52FA350304840	12	24	traverse	4	2	{}	23949
379	Le Succédané	4a	2020-05-07 12:44:30.170205	2020-11-09 23:06:48.699174	0101000020E610000084FF34D9483604405BB289E37A304840	12	29	traverse	3	2	{}	23929
360	L'Angle Solide	4b	2020-05-07 12:44:30.0917	2020-11-09 23:08:38.078142	0101000020E610000048EA9864D3320440DF838F9378304840	12	41	overhang	4	2	{}	5781
254	La Bordée	5a	2020-05-07 12:44:29.634962	2020-11-09 23:12:23.704107	0101000020E6100000670EA2862F300440889CE7BE14304840	11	19	wall	3	2	{}	23910
363	Le Pare-Chocs	5c	2020-05-07 12:44:30.104679	2020-11-09 23:14:30.027316	0101000020E6100000B7A97E355D330440CDBE625F7D304840	11	34	wall	3	2	{}	23922
378	La Coquâtre	5b	2020-05-07 12:44:30.166774	2020-11-09 23:14:54.474342	0101000020E6100000AE2377CB4D3604402D4540847D304840	11	37	wall	4	2	{}	23925
735	Kimoudom	6a	2020-11-11 14:42:03.504921	2020-11-11 15:17:43.413247	0101000020E6100000A5347A443F3304400C952CC83F304840	\N	\N	wall	\N	2	{}	13701
734	Le Quartzite	4b+	2020-11-11 14:41:02.199408	2020-11-11 15:17:43.50856	0101000020E6100000EE88F405493304403CD156F13E304840	\N	\N	wall	\N	2	{}	5790
733	Myrtalles	4a	2020-11-11 14:39:46.207589	2020-11-11 15:17:43.593624	0101000020E61000008F78F4F9923104406BAD763045304840	\N	\N	other	\N	2	{}	
330	La Camée	4b	2020-05-07 12:44:29.965474	2020-11-11 15:17:43.650898	0101000020E6100000FE37190346330440EC4118353F304840	12	17	wall	4	2	{}	5791
298	Passage à Tabac	5c	2020-05-07 12:44:29.820931	2020-11-11 15:17:43.850949	0101000020E6100000B7F038063B300440767CDFFA26304840	11	17	wall	3	2	{}	5904
707	Cool Dude	2b	2020-11-11 13:43:52.681349	2020-11-11 15:17:43.853778	0101000020E6100000FF8EF4B20830044054815AE023304840	\N	\N	other	\N	2	{}	
694	Fruits de Mer	4a	2020-11-11 13:15:43.217598	2020-11-11 15:17:43.856524	0101000020E6100000825EF468352F044054A8A08534304840	\N	\N	other	\N	2	{}	
317	La Plaque Avant	4b	2020-05-07 12:44:29.908576	2020-11-11 15:17:43.864367	0101000020E6100000485E7F821F300440C19A203508304840	11	20	slab	3	2	{}	23911
349	La Bastille	4b	2020-05-07 12:44:30.04424	2020-11-11 15:17:43.867706	0101000020E61000009A709D916B3204407DBDE1794C304840	12	46	wall	5	2	{}	5800
736	Idées Noires	6c	2020-11-11 14:44:40.573564	2020-11-11 15:17:43.870381	0101000020E6100000FC017D583A330440EA84967948304840	\N		overhang	\N	2	{sit_start}	5825
732	Sonneratia	4c	2020-11-11 14:39:02.318104	2020-11-11 15:17:43.877096	0101000020E61000004E92F41DC9310440FE6DA6CB43304840	\N	\N	other	\N	2	{}	
260	Les Petits Pas	3c	2020-05-07 12:44:29.655082	2020-11-09 22:52:47.037284	0101000020E6100000004C1D8A8D2D0440B42938E002304840	10	3	traverse	\N	2	{}	5828
264	La Bête de Somme	2b+	2020-05-07 12:44:29.680027	2020-11-09 22:53:15.983299	0101000020E6100000B52E08620B2D0440D169EA1A0A304840	10	5	wall	4	2	{}	5830
267	Le Flop	2a+	2020-05-07 12:44:29.690084	2020-11-09 22:53:26.475956	0101000020E610000092EDD2CAB42D0440D05D93BB10304840	10	6	wall	2	2	{}	5831
268	L'Aisée	2a+	2020-05-07 12:44:29.693119	2020-11-09 22:53:46.844601	0101000020E6100000168D5DA1CA2D04407E4C1D5A15304840	10	8	overhang	2	2	{}	5833
292	Le Réta	2b	2020-05-07 12:44:29.788733	2020-11-09 22:55:55.158524	0101000020E61000002BACAB16832F04408913C65324304840	10	16	overhang	3	2	{}	5841
301	La Rampe	2a	2020-05-07 12:44:29.831278	2020-11-09 22:56:19.287382	0101000020E610000055BDB4C91B30044054BA419A24304840	10	18	wall	4	2	{}	5843
307	La Glissade	2b	2020-05-07 12:44:29.872361	2020-11-09 22:56:54.581692	0101000020E61000005F09ABC7B2300440336EB17525304840	10	22	slab	3	2	{}	5847
310	La Marche	2a	2020-05-07 12:44:29.883384	2020-11-09 22:57:10.961863	0101000020E6100000D5B25159DB30044086D8E6C22F304840	10	24	wall	2	2	{}	5849
331	La Mogette	2b	2020-05-07 12:44:29.969669	2020-11-09 22:58:31.453986	0101000020E61000004E2AF8C2373304402848AF433D304840	10	33	other	3	2	{}	5858
352	Le Sortant	2a	2020-05-07 12:44:30.055227	2020-11-09 22:59:19.643526	0101000020E61000006946FC047132044026B43D4851304840	10	38	wall	3	2	{}	5863
355	La Rotation	2a+	2020-05-07 12:44:30.073804	2020-11-09 22:59:27.382461	0101000020E61000000C787EBC5F3204404C10EE4B52304840	10	39	wall	3	2	{}	5864
346	L'Oblique	2a	2020-05-07 12:44:30.033726	2020-11-09 23:00:01.356466	0101000020E6100000E2DD1708AF310440658C3B424C304840	10	43	wall	4	2	{}	5868
321	Le Vigoureux	2b	2020-05-07 12:44:29.923071	2020-11-09 23:00:28.464841	0101000020E6100000773B6365D9310440C05A1EE935304840	10	46	traverse	5	2	{}	5871
320	L'Autorisation	2c	2020-05-07 12:44:29.919458	2020-11-09 23:00:37.374389	0101000020E6100000371E0B46A43104401995C2B132304840	10	47	slab	4	2	{}	5872
259	L'Additif	2c	2020-05-07 12:44:29.6514	2020-11-09 23:00:45.489666	0101000020E6100000EF7F14F5413004401147187E33304840	10	48	traverse	3	2	{}	5873
286	L'Embarras	3a	2020-05-07 12:44:29.768207	2020-11-09 23:01:01.314364	0101000020E61000008B7529B39A2F04403F63F83529304840	10	50	other	3	2	{}	5875
384	Le Brise-Lame	2b	2020-05-07 20:11:37.775359	2020-11-09 23:01:41.741415	0101000020E61000009F33F0E4FB2E04407BCF6D6F43304840	10	55	other	4	2	{}	5880
249	La Meringue	3a	2020-05-07 12:44:29.617078	2020-11-09 23:02:10.440549	0101000020E610000049EF46C94A2E04400EDA3F18FE2F4840	12	1	wall	3	2	{}	23930
270	Le Château Fort	4a	2020-05-07 12:44:29.699491	2020-11-09 23:02:55.084429	0101000020E6100000C3CCAA4F7A2E0440ABFBAF2915304840	12	5	slab	3	2	{}	23942
323	La Téméraire	5a	2020-05-07 12:44:29.939199	2020-11-09 23:04:31.073912	0101000020E61000007F35A921AB320440A370C38C35304840	12	15	wall	4	2	{}	5808
350	La Dülfer	4a	2020-05-07 12:44:30.047885	2020-11-09 23:05:49.212804	0101000020E6100000C2F6B5D985320440C9E734134C304840	12	23	wall	3	2	{}	5797
370	Le Pied de Nez	4c	2020-05-07 12:44:30.137125	2020-11-09 23:06:30.336616	0101000020E6100000B9BB90D2A4330440AC8C571273304840	12	27	wall	4	2	{}	5784
380	Le Baraqué	4c	2020-05-07 12:44:30.173697	2020-11-09 23:06:40.907483	0101000020E61000008BFA97661F3604404D3E7E8178304840	12	28	wall	2	2	{}	23953
375	Les Bourses	4b	2020-05-07 12:44:30.156365	2020-11-09 23:07:15.49327	0101000020E6100000F6AD04C2B63604405C7D1D4D84304840	12	32	wall	4	2	{}	5768
367	La Moucheture	5a	2020-05-07 12:44:30.119058	2020-11-09 23:08:00.073929	0101000020E61000002C8F68E80D3404408197414777304840	12	37	slab	4	2	{}	23936
362	Le Crack	4a+	2020-05-07 12:44:30.098802	2020-11-09 23:08:21.672402	0101000020E6100000B645140F153304408F3D21DC7C304840	12	39	overhang	4	2	{}	5779
252	La Dépêche	3c	2020-05-07 12:44:29.628237	2020-11-09 23:08:29.547868	0101000020E610000048D81C7DC7320440121A9F347B304840	12	40	wall	4	2	{}	5780
354	La Traversée du Temps	4a+	2020-05-07 12:44:30.070128	2020-11-09 23:09:05.588895	0101000020E610000042C1235450320440D975587D52304840	12	44	traverse	3	2	{}	5799
353	La Bascule	4a	2020-05-07 12:44:30.058978	2020-11-09 23:09:15.703996	0101000020E6100000413378767A320440D5826EB850304840	12	45	wall	3	2	{}	5801
247	Pince sans Rire	6a	2020-05-07 12:44:29.607908	2020-11-09 23:09:44.924727	0101000020E610000000BF15A91E2E0440EBA5AED4FE2F4840	11	1	wall	3	2	{}	8847
266	Coup de Sang	5c	2020-05-07 12:44:29.6869	2020-11-09 23:10:03.164108	0101000020E6100000CF05E5B1062D04406A4E27C90B304840	11	3	wall	4	2	{}	8849
258	Rage de Dents	5b	2020-05-07 12:44:29.647939	2020-11-09 23:10:16.482525	0101000020E61000006D8A5CDD432E0440AD9627391D304840	11	4	wall	4	2	{}	5887
282	Le Cyanure Sucré	5c	2020-05-07 12:44:29.754642	2020-11-09 23:11:18.669736	0101000020E6100000D4991BEC582F0440548E10B82A304840	11	11	traverse	3	2	{}	5898
253	Bourre en Bref	5a	2020-05-07 12:44:29.631362	2020-11-09 23:11:26.290593	0101000020E61000002B3049A44D2F04400ED39F542D304840	11	12	slab	3	2	{}	5899
283	Épreuve de Force	5b	2020-05-07 12:44:29.758001	2020-11-09 23:11:33.394812	0101000020E610000007D202203B2F044038804A1235304840	11	13	traverse	2	2	{}	5900
315	Belle au Fond de Teint	6a	2020-05-07 12:44:29.901467	2020-11-09 23:13:04.057342	0101000020E6100000523616200B310440A259B1010D304840	11	24	overhang	4	2	{}	5905
371	Le Bouton Salvateur	6a	2020-05-07 12:44:30.141242	2020-11-09 23:14:14.066332	0101000020E61000009FD435B6943304400AA342B272304840	11	32	wall	3	2	{}	23954
361	Le Virtuose	4c	2020-05-07 12:44:30.095222	2020-11-09 23:14:21.383645	0101000020E6100000290CB39824330440FD23209E7D304840	11	33	overhang	4	2	{}	5778
257	Les Plaquettes de Chocolat	5c	2020-05-07 12:44:29.64496	2020-11-09 23:15:14.387499	0101000020E6100000588B6AA67338044056AFE05A87304840	11	38	overhang	5	2	{}	23926
269	L'Encoignure	3a	2020-05-07 12:44:29.696251	2020-11-09 22:53:36.167854	0101000020E6100000281CD28C6B2E0440BEF4562E15304840	10	7	wall	3	2	{}	5832
272	Le bac à Eau	2a+	2020-05-07 12:44:29.706829	2020-11-09 22:54:08.151993	0101000020E61000000460B1E8312E04400EA7845E1D304840	10	10	traverse	3	2	{}	5835
281	L'Évitable Bi	3a	2020-05-07 12:44:29.751089	2020-11-09 22:54:48.293388	0101000020E61000007F2A41FC2E2F04402EC1EDEA29304840	10	14	wall	3	2	{}	5839
293	Le Coiné	3a	2020-05-07 12:44:29.792276	2020-11-09 22:56:10.232807	0101000020E610000035AF27FAA12F04402227D72023304840	10	17	wall	3	2	{}	5842
306	Le Montant	2b+	2020-05-07 12:44:29.859307	2020-11-09 22:56:45.526597	0101000020E61000009434F1B7E0300440384F887122304840	10	21	wall	2	2	{}	5846
309	La Fuite en Amont	3b	2020-05-07 12:44:29.879339	2020-11-09 22:57:02.151015	0101000020E6100000A4E10FBBDC300440A4A9C49332304840	10	23	traverse	4	2	{}	5848
328	La Combine	4a	2020-05-07 12:44:29.957855	2020-11-09 22:58:12.325748	0101000020E610000080F2740B00330440B7E9F5BA30304840	10	31	wall	3	2	{}	5856
334	Le Terminus	2a	2020-05-07 12:44:29.980827	2020-11-09 22:58:39.625884	0101000020E6100000845CDD677E3304405DEB9DBF46304840	10	34	other	4	2	{}	5859
341	La Rabiboche	2b	2020-05-07 12:44:30.015624	2020-11-09 22:59:01.811946	0101000020E6100000654C83660F3304402BC16F0C46304840	10	36	other	4	2	{}	5861
344	La Bravoure	2c	2020-05-07 12:44:30.026746	2020-11-09 22:59:50.700777	0101000020E610000038BA98C4A0320440FACB955A4B304840	10	42	wall	4	2	{}	5867
332	Le Roi Mage	2b	2020-05-07 12:44:29.973382	2020-11-09 23:00:17.120193	0101000020E61000008726C94FA1310440AE19E27442304840	10	45	slab	5	2	{}	5870
381	La Sortie du Tunnel	2a+	2020-05-07 20:11:37.743528	2020-11-09 23:01:08.699261	0101000020E610000043EFDDE42D2F0440BB6661CA2C304840	10	51	traverse	4	2	{}	5876
382	L'Embarcadère	2a+	2020-05-07 20:11:37.76795	2020-11-09 23:01:23.815321	0101000020E6100000A311D128392F04403033EAA53B304840	10	53	other	3	2	{}	5878
383	Le Front de Mer	3a	2020-05-07 20:11:37.771971	2020-11-09 23:01:34.021083	0101000020E6100000DFE26D3F282F0440941C10933F304840	10	54	wall	3	2	{}	5879
303	La Pacotille	4a	2020-05-07 12:44:29.838547	2020-11-09 23:04:03.981182	0101000020E61000001F8ACD4133300440A655D0DE23304840	12	12	wall	3	2	{}	5817
262	Le Chameau	4a	2020-05-07 12:44:29.673559	2020-11-09 23:02:37.463342	0101000020E610000018C5CFF6332D0440BA19D18B06304840	12	3	wall	3	2	{}	23921
295	La Bottine	4c	2020-05-07 12:44:29.810017	2020-11-09 23:03:33.386565	0101000020E610000067286571A82F04402777F3CC24304840	12	9	traverse	4	2	{}	5821
312	L'Autre Dalle	3a	2020-05-07 12:44:29.890614	2020-11-09 23:04:22.104152	0101000020E610000006E082EE5D3104404AAFBF352C304840	12	14	slab	5	2	{}	5811
250	L'Élégante	4b	2020-05-07 12:44:29.621304	2020-11-09 23:04:40.61576	0101000020E610000061C156DAA23204403E499EB236304840	12	16	slab	3	2	{}	5806
337	L'Existentiel	4a+	2020-05-07 12:44:29.994277	2020-11-09 23:05:13.52628	0101000020E61000006BED9F52523304409C37B2FA46304840	12	19	wall	5	2	{}	5793
343	Le Bon Coin	4b+	2020-05-07 12:44:30.023209	2020-11-09 23:05:31.4926	0101000020E610000074FFA45F73320440B9D1207E47304840	12	21	wall	4	2	{}	5795
345	Le Rentrant	4a	2020-05-07 12:44:30.030029	2020-11-09 23:05:41.083247	0101000020E6100000FE3AE7A998320440F305DA334A304840	12	22	wall	4	2	{}	5796
372	La Bafouille	4b	2020-05-07 12:44:30.144909	2020-11-09 23:06:21.002031	0101000020E6100000AB2F19FA7B3304406B0FD2B071304840	12	26	wall	3	2	{}	23951
374	Le Combinard	4b	2020-05-07 12:44:30.152936	2020-11-09 23:07:05.768689	0101000020E61000006081EDB9333704406248D25E82304840	12	31	wall	3	2	{}	5767
377	Le Pain Blanc	3c	2020-05-07 12:44:30.163254	2020-11-09 23:07:24.03436	0101000020E61000005F2C68E4A4360440C75C9E1081304840	12	33	traverse	3	2	{}	5769
365	La Poulette	4b	2020-05-07 12:44:30.112054	2020-11-09 23:07:41.259655	0101000020E610000079E13E7BA2340440ACF9129072304840	12	35	wall	4	2	{}	5773
366	La Bourrique	3c	2020-05-07 12:44:30.115411	2020-11-09 23:07:52.16685	0101000020E6100000647E2A183B340440234EE3FD74304840	12	36	wall	3	2	{}	5775
364	La Coqueluche	4b	2020-05-07 12:44:30.108294	2020-11-09 23:08:09.008227	0101000020E6100000A8891B3C6B330440809299D67B304840	12	38	wall	3	2	{}	5776
356	Et Tic en Toc	4b+	2020-05-07 12:44:30.077385	2020-11-09 23:08:57.567563	0101000020E6100000569FB8782E32044052CCA62E5A304840	12	43	wall	3	2	{}	24739
278	Citron Vert	6a	2020-05-07 12:44:29.739906	2020-11-09 23:10:42.949019	0101000020E61000008655566D882E0440018F9B9B24304840	11	7	wall	4	2	{}	148085
287	Indécence	5b	2020-05-07 12:44:29.771544	2020-11-09 23:11:10.764032	0101000020E61000007E9EE3FC7D2F04406E890A8F28304840	11	10	wall	3	2	{}	5896
302	Coule Douce	5b	2020-05-07 12:44:29.834877	2020-11-09 23:12:16.209109	0101000020E61000007EB0B2EA0C3004401760836124304840	11	18	slab	4	2	{}	5903
256	La Constance	5a	2020-05-07 12:44:29.641858	2020-11-09 23:14:06.868131	0101000020E610000049F0C2721D320440BA3C99E054304840	11	31	wall	2	2	{}	23920
369	L'Œuf du Chien	5b	2020-05-07 12:44:30.126254	2020-11-09 23:14:39.015139	0101000020E6100000163B88E9A13304408F544BFC75304840	11	35	wall	5	2	{}	23996
725	Nouvelle Vague	7c	2020-11-11 14:23:12.900938	2020-11-11 15:17:43.886716	0101000020E61000001D467DE5CC310440D2F83DBC2D304840	\N	\N	roof	\N	2	{}	179
750	Petit Ventre	6a+	2020-11-11 15:05:57.933331	2020-11-11 15:17:43.893619	0101000020E6100000BC55F4056238044017761A2688304840	\N	\N	overhang	\N	2	{}	23914
689	Jour de Gloire (assis)	6c	2020-11-11 13:08:45.718735	2020-11-11 15:17:43.899036	0101000020E6100000EB237A3F762E0440F2F8149022304840	\N		roof	\N	2	{sit_start,risky}	25075
709	Goa	3a+	2020-11-11 13:47:46.697251	2020-11-11 15:17:43.904076	0101000020E610000096CFE8550B300440E03324C604304840	\N	\N	slab	\N	2	{}	
711	Pierre Douce	5a	2020-11-11 13:49:02.257609	2020-11-11 15:17:43.917832	0101000020E6100000CB0FE9DF353004404BA4192906304840	\N	\N	slab	\N	2	{}	5908
755	L'Échalas	4a	2020-11-11 15:13:55.924346	2020-11-11 15:17:43.925664	0101000020E61000007453F40F7C3204408032AC9251304840	\N	\N	slab	\N	2	{}	23940
744	Ping-Pong	6b	2020-11-11 14:58:23.465685	2020-11-11 15:17:43.928395	0101000020E6100000FD89F4E16C330440D283BA717C304840	\N	\N	wall	\N	2	{}	17015
351	L'Arête Principale	5a	2020-05-07 12:44:30.051749	2020-11-11 15:17:43.930971	0101000020E6100000203D21F064320440F1D810E54C304840	11	30	overhang	5	2	{}	23918
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
20201101094419
20201101100712
20201101160643
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: topos; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.topos (id, created_at, updated_at, published, metadata) FROM stdin;
453	2020-09-03 20:45:15.022446	2020-10-22 17:00:32.385972	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1106438711283575","GPSTimeStamp":"2020-09-01T15:38:53Z","GPSImgDirection":"344.81916816999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635049999999998","GPSLatitude":"48.461753329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.700000000000003","GPSHPositioningError":"15.999419279907086","DateCreated":"2020-09-01T17:38:52+02:00"}}}}
447	2020-09-03 20:45:14.008603	2020-10-22 16:19:39.337304	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.048246923828372153","GPSTimeStamp":"2020-09-01T14:10:26Z","GPSImgDirection":"204.28925318999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628450000000004","GPSLatitude":"48.462219999999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94","GPSHPositioningError":"15.634881682734443","DateCreated":"2020-09-01T16:10:26+02:00"}}}}
530	2020-10-27 10:54:08.193069	2020-10-27 10:54:35.437526	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.023560855553126522","GPSTimeStamp":"2020-10-26T14:29:22Z","GPSImgDirection":"86.058380110000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634716700000003","GPSLatitude":"48.461913330000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.799999999999997","GPSHPositioningError":"4.5615548834726916","DateCreated":"2020-10-26T15:29:21+01:00"}}}}
534	2020-10-27 10:58:37.081096	2020-10-27 10:58:57.731748	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.014541610149206097","GPSTimeStamp":"2020-10-26T14:36:04Z","GPSImgDirection":"60.27166751","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634466699999999","GPSLatitude":"48.461669999999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.5","GPSHPositioningError":"5.2284529240978843","DateCreated":"2020-10-26T15:36:03+01:00"}}}}
538	2020-10-27 11:04:40.666466	2020-10-27 11:05:10.051281	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.032271042460856603","GPSTimeStamp":"2020-10-26T14:39:26Z","GPSImgDirection":"244.66557309999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633216700000002","GPSLatitude":"48.461538329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"5.0136577225418293","DateCreated":"2020-10-26T15:39:26+01:00"}}}}
449	2020-09-03 20:45:14.290367	2020-09-03 21:53:26.497233	t	\N
270	2020-09-03 20:43:09.53689	2020-09-04 19:56:07.109039	f	\N
91	2020-04-18 20:36:58.806167	2020-07-05 19:48:04.184823	f	\N
113	2020-04-18 20:36:59.740272	2020-07-05 19:48:04.188926	f	\N
56	2020-04-18 20:36:57.358564	2020-07-05 19:48:04.244806	f	\N
27	2020-04-18 20:36:56.219626	2020-07-05 19:48:04.255106	f	\N
6	2020-04-18 20:36:55.470758	2020-04-21 13:38:05.098216	f	\N
457	2020-09-03 20:45:15.514203	2020-10-22 08:21:43.134948	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.081233024563234627","GPSTimeStamp":"2020-09-01T13:02:46Z","GPSImgDirection":"225.5456847800001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6624783299999999","GPSLatitude":"48.463254999999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.099999999999994","GPSHPositioningError":"7.0482875004794234","DateCreated":"2020-09-01T15:02:45+02:00"}}}}
319	2020-09-03 20:43:16.399836	2020-10-22 16:01:38.239353	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.011819472535612744","GPSTimeStamp":"2020-09-01T13:17:58Z","GPSImgDirection":"168.12536614000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630283300000004","GPSLatitude":"48.462486669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.799999999999997","GPSHPositioningError":"4.5180760833053411","DateCreated":"2020-09-01T15:17:58+02:00"}}}}
367	2020-09-03 20:43:23.511853	2020-10-22 16:56:04.3342	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.064254559638774952","GPSTimeStamp":"2020-09-01T15:30:13Z","GPSImgDirection":"167.03183736","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637033299999997","GPSLatitude":"48.461599999999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.099999999999994","GPSHPositioningError":"12.107642659881465","DateCreated":"2020-09-01T17:30:13+02:00"}}}}
357	2020-09-03 20:43:22.085541	2020-10-22 16:23:49.087303	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.040701046591008247","GPSTimeStamp":"2020-09-01T14:21:53Z","GPSImgDirection":"203.73458103000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.461871670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.400000000000006","GPSHPositioningError":"9.1684611933602511","DateCreated":"2020-09-01T16:21:53+02:00"}}}}
407	2020-09-03 20:43:29.191382	2020-10-22 08:19:35.543234	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.013611908072682895","GPSTimeStamp":"2020-09-01T12:50:46Z","GPSImgDirection":"0.55075072999999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632299999999995","GPSLatitude":"48.463203329999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.700000000000003","GPSHPositioningError":"8.1844470827679778","DateCreated":"2020-09-01T14:50:45+02:00"}}}}
350	2020-09-03 20:43:21.193527	2020-10-22 17:15:16.004178	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0051283696704260461","GPSTimeStamp":"2020-09-01T16:14:25Z","GPSImgDirection":"21.453704850000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635283300000006","GPSLatitude":"48.462396669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.799999999999997","GPSHPositioningError":"8.5835013748854259","DateCreated":"2020-09-01T18:14:25+02:00"}}}}
396	2020-09-03 20:43:27.823918	2020-10-22 16:44:22.273674	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.47145718333251924","GPSTimeStamp":"2020-09-01T14:55:10Z","GPSImgDirection":"132.78739165000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66310833","GPSLatitude":"48.461291670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.5","GPSHPositioningError":"16.282317006654303","DateCreated":"2020-09-01T16:55:10+02:00"}}}}
172	2020-04-18 20:37:02.015801	2020-07-05 19:48:04.192297	f	\N
29	2020-04-18 20:36:56.293222	2020-07-05 19:48:04.203956	f	\N
185	2020-04-18 20:37:02.527586	2020-07-05 19:48:04.220702	f	\N
30	2020-04-18 20:36:56.329741	2020-07-05 19:48:04.229037	f	\N
14	2020-04-18 20:36:55.767721	2020-07-05 19:48:04.233744	f	\N
39	2020-04-18 20:36:56.676968	2020-07-05 19:48:04.235546	f	\N
38	2020-04-18 20:36:56.636095	2020-07-05 19:48:04.240379	f	\N
42	2020-04-18 20:36:56.812715	2020-07-05 19:48:04.241943	f	\N
148	2020-04-18 20:37:01.06601	2020-07-05 19:48:04.251173	f	\N
26	2020-04-18 20:36:56.179514	2020-07-05 19:48:04.253773	f	\N
12	2020-04-18 20:36:55.708032	2020-07-05 19:48:04.256694	f	\N
9	2020-04-18 20:36:55.602905	2020-07-05 19:48:04.25843	f	\N
141	2020-04-18 20:37:00.793299	2020-04-21 14:18:18.074817	f	\N
437	2020-09-03 20:43:33.740351	2020-10-22 17:21:07.425274	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.075148299400840612","GPSTimeStamp":"2020-09-01T16:20:50Z","GPSImgDirection":"122.81607439000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.663675","GPSLatitude":"48.462478329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.900000000000006","GPSHPositioningError":"11.955097742736797","DateCreated":"2020-09-01T18:20:50+02:00"}}}}
421	2020-09-03 20:43:31.40184	2020-10-22 16:25:44.645413	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.32741749290638589","GPSTimeStamp":"2020-09-01T14:26:24Z","GPSImgDirection":"169.87709030000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635","GPSLatitude":"48.461741670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.700000000000003","GPSHPositioningError":"4.5322950068712782","DateCreated":"2020-09-01T16:26:23+02:00"}}}}
551	2020-10-27 11:21:07.537918	2020-10-27 11:21:25.780679	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0034048715595557844","GPSTimeStamp":"2020-10-26T15:08:32Z","GPSImgDirection":"206.57512661999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631283300000002","GPSLatitude":"48.461319999999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97","GPSHPositioningError":"4.9797656400076837","DateCreated":"2020-10-26T16:08:31+01:00"}}}}
362	2020-09-03 20:43:22.818346	2020-10-22 16:37:16.698758	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0030703884553975732","GPSTimeStamp":"2020-09-01T14:40:09Z","GPSImgDirection":"249.41641233999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632216699999995","GPSLatitude":"48.461546670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"10.639886420577918","DateCreated":"2020-09-01T16:40:09+02:00"}}}}
461	2020-09-03 20:47:10.675226	2020-10-22 08:09:05.188672	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.089978896077440806","GPSTimeStamp":"2020-09-01T11:26:59Z","GPSImgDirection":"298.95533769000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632366699999999","GPSLatitude":"48.462928329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.700000000000003","GPSHPositioningError":"4.3346900438321851","DateCreated":"2020-09-01T13:26:59+02:00"}}}}
426	2020-09-03 20:43:32.149391	2020-10-22 16:46:31.96468	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.052131209523100755","GPSTimeStamp":"2020-09-01T15:00:19Z","GPSImgDirection":"95.828354430000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633416700000003","GPSLatitude":"48.460913329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"102.2","GPSHPositioningError":"10.163006436955699","DateCreated":"2020-09-01T17:00:19+02:00"}}}}
414	2020-09-03 20:43:30.083597	2020-10-22 08:20:01.955218	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.03877437116285487","GPSTimeStamp":"2020-09-01T12:51:38Z","GPSImgDirection":"355.27539062000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.663195","GPSLatitude":"48.463203329999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.400000000000006","GPSHPositioningError":"5.4944794081925581","DateCreated":"2020-09-01T14:51:37+02:00"}}}}
71	2020-04-18 20:36:57.994555	2020-07-05 19:48:04.190697	f	\N
92	2020-04-18 20:36:58.84357	2020-07-05 19:48:04.224448	f	\N
55	2020-04-18 20:36:57.324444	2020-07-05 19:48:04.22753	f	\N
46	2020-04-18 20:36:56.963857	2020-07-05 19:48:04.237147	f	\N
61	2020-04-18 20:36:57.55429	2020-07-05 19:48:04.252467	f	\N
268	2020-09-03 20:43:09.212717	2020-10-22 16:51:38.539376	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.039257347598406461","GPSTimeStamp":"2020-09-01T15:16:34Z","GPSImgDirection":"101.69729515000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635916700000002","GPSLatitude":"48.46125","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97","GPSHPositioningError":"15.882587631803933","DateCreated":"2020-09-01T17:16:33+02:00"}}}}
351	2020-09-03 20:43:21.278169	2020-10-22 16:54:41.194387	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10725206132304253","GPSTimeStamp":"2020-09-01T15:26:56Z","GPSImgDirection":"279.62318419999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637949999999999","GPSLatitude":"48.461288329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.299999999999997","GPSHPositioningError":"8.8690248855748539","DateCreated":"2020-09-01T17:26:55+02:00"}}}}
388	2020-09-03 20:43:26.400934	2020-10-22 16:59:28.990029	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.98122650375939857","GPSTimeStamp":"2020-09-01T15:38:13Z","GPSImgDirection":"39.285827600000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635533300000001","GPSLatitude":"48.461761670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.299999999999997","GPSHPositioningError":"4.4926495810261189","DateCreated":"2020-09-01T17:38:12+02:00"}}}}
344	2020-09-03 20:43:20.31303	2020-10-22 17:14:04.996761	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.070793956540058989","GPSTimeStamp":"2020-09-01T16:11:08Z","GPSImgDirection":"163.96342477000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636116700000003","GPSLatitude":"48.462336669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.700000000000003","GPSHPositioningError":"12.089865158764681","DateCreated":"2020-09-01T18:11:08+02:00"}}}}
398	2020-09-03 20:43:28.045965	2020-10-22 17:16:31.441823	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.071196593343544876","GPSTimeStamp":"2020-09-01T16:18:36Z","GPSImgDirection":"22.909759509999994","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637216700000002","GPSLatitude":"48.462411670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.700000000000003","GPSHPositioningError":"5.227365200266914","DateCreated":"2020-09-01T18:18:35+02:00"}}}}
558	2020-10-27 11:28:48.421443	2020-10-27 11:29:20.421882	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.016132956366351502","GPSTimeStamp":"2020-10-26T16:37:25Z","GPSImgDirection":"47.28082276","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637116700000001","GPSLatitude":"48.460828329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"100.8","GPSHPositioningError":"9.4000697999069338","DateCreated":"2020-10-26T17:37:24+01:00"}}}}
338	2020-09-03 20:43:19.370627	2020-09-03 22:16:09.183772	t	\N
166	2020-04-18 20:37:01.758745	2020-07-05 19:48:04.209448	f	\N
171	2020-04-18 20:37:01.957603	2020-07-05 19:48:04.211608	f	\N
142	2020-04-18 20:37:00.833463	2020-07-05 19:48:04.214745	f	\N
150	2020-04-18 20:37:01.136938	2020-07-05 19:48:04.226055	f	\N
44	2020-04-18 20:36:56.891662	2020-07-05 19:48:04.249711	f	\N
23	2020-04-18 20:36:56.077299	2020-07-05 19:48:04.259785	f	\N
127	2020-04-18 20:37:00.277291	2020-04-21 14:16:00.190411	f	\N
133	2020-04-18 20:37:00.508484	2020-04-21 14:17:01.895109	f	\N
424	2020-09-03 20:43:31.788177	2020-10-22 16:40:51.721532	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.47936356023447785","GPSTimeStamp":"2020-09-01T14:45:45Z","GPSImgDirection":"166.09360518999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628216700000005","GPSLatitude":"48.461466670000007","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"5.0614008717871632","DateCreated":"2020-09-01T16:45:45+02:00"}}}}
365	2020-09-03 20:43:23.236699	2020-10-22 17:20:45.345724	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.089205585404735194","GPSTimeStamp":"2020-09-01T16:20:19Z","GPSImgDirection":"185.87664042","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637383300000002","GPSLatitude":"48.462483329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.700000000000003","GPSHPositioningError":"6.8641019626241304","DateCreated":"2020-09-01T18:20:18+02:00"}}}}
301	2020-09-03 20:43:13.81249	2020-10-22 17:27:23.020188	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.4483537677366029","GPSTimeStamp":"2020-09-01T16:29:12Z","GPSImgDirection":"267.02354437999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634199999999999","GPSLatitude":"48.462638329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"4.5039608003266638","DateCreated":"2020-09-01T18:29:11+02:00"}}}}
346	2020-09-03 20:43:20.568496	2020-10-22 17:31:24.221237	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.21388991171742394","GPSTimeStamp":"2020-09-01T16:50:22Z","GPSImgDirection":"318.30641184000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641549999999996","GPSLatitude":"48.462566670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.5","GPSHPositioningError":"4.2141081955843251","DateCreated":"2020-09-01T18:50:22+02:00"}}}}
494	2020-10-19 21:46:13.361869	2020-10-19 21:46:35.436222	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.02714896761450029","GPSTimeStamp":"2020-10-18T14:53:19Z","GPSImgDirection":"331.02767920999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379866700000001","GPSLatitude":"48.447361669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.900000000000006","GPSHPositioningError":"16.497946963216425","DateCreated":"2020-10-18T16:53:19+02:00"}}}}
489	2020-10-19 21:41:02.623598	2020-10-19 21:41:32.158154	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.043835189227862267","GPSTimeStamp":"2020-10-18T14:44:27Z","GPSImgDirection":"29.816284179999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379450000000002","GPSLatitude":"48.447483329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.099999999999994","GPSHPositioningError":"11.715366573352501","DateCreated":"2020-10-18T16:44:27+02:00"}}}}
559	2020-11-01 14:02:20.942654	2020-11-01 14:02:29.208915	f	\N
485	2020-10-19 19:41:22.707557	2020-10-19 20:17:19.774829	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0086412159714206269","GPSTimeStamp":"2020-10-18T14:31:35Z","GPSImgDirection":"116.50459290000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6380299999999997","GPSLatitude":"48.447741670000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.799999999999997","GPSHPositioningError":"5.9820785597381345","DateCreated":"2020-10-18T16:31:34+02:00"}}}}
487	2020-10-19 21:39:07.392707	2020-10-19 21:39:30.451457	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.31236854193361224","GPSTimeStamp":"2020-10-18T14:40:17Z","GPSImgDirection":"94.198529719999982","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6378699999999999","GPSLatitude":"48.447525000000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.900000000000006","GPSHPositioningError":"16.189856065798491","DateCreated":"2020-10-18T16:40:17+02:00"}}}}
493	2020-10-19 21:45:00.842042	2020-10-19 21:45:18.28731	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.16031032803576961","GPSTimeStamp":"2020-10-18T14:51:22Z","GPSImgDirection":"245.73602305","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379083299999997","GPSLatitude":"48.447266670000012","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.799999999999997","GPSHPositioningError":"11.95904531304047","DateCreated":"2020-10-18T16:51:21+02:00"}}}}
219	2020-04-18 20:37:04.125333	2020-07-05 19:48:04.222687	f	\N
163	2020-04-18 20:37:01.633238	2020-07-05 19:48:04.238635	f	\N
60	2020-04-18 20:36:57.522941	2020-07-05 19:48:04.248263	f	\N
49	2020-04-18 20:36:57.09079	2020-04-21 13:53:48.459033	f	\N
184	2020-04-18 20:37:02.476536	2020-04-21 14:26:06.387603	f	\N
298	2020-09-03 20:43:13.477945	2020-10-22 17:12:36.332735	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.054584782571077545","GPSTimeStamp":"2020-09-01T16:08:30Z","GPSImgDirection":"73.315856939999989","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635499999999999","GPSLatitude":"48.462313329999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.400000000000006","GPSHPositioningError":"7.2590746739762437","DateCreated":"2020-09-01T18:08:30+02:00"}}}}
129	2020-04-18 20:37:00.356404	2020-07-05 19:48:04.174192	f	\N
75	2020-04-18 20:36:58.149081	2020-07-05 19:48:04.182182	f	\N
99	2020-04-18 20:36:59.136377	2020-07-05 19:48:04.186949	f	\N
149	2020-04-18 20:37:01.10395	2020-07-05 19:48:04.193996	f	\N
198	2020-04-18 20:37:03.056544	2020-07-05 19:48:04.196126	f	\N
45	2020-04-18 20:36:56.929777	2020-07-05 19:48:04.199204	f	\N
40	2020-04-18 20:36:56.726179	2020-07-05 19:48:04.21796	f	\N
143	2020-04-18 20:37:00.867425	2020-07-05 19:48:04.24344	f	\N
25	2020-04-18 20:36:56.142631	2020-07-05 19:48:04.246732	f	\N
486	2020-10-19 21:37:29.335152	2020-10-19 21:37:58.12259	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11804264036009811","GPSTimeStamp":"2020-10-18T14:36:53Z","GPSImgDirection":"86.80545042","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6380616699999999","GPSLatitude":"48.447600000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.599999999999994","GPSHPositioningError":"10.659548505186089","DateCreated":"2020-10-18T16:36:52+02:00"}}}}
492	2020-10-19 21:43:59.537526	2020-10-19 21:44:27.594295	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.18672539303847802","GPSTimeStamp":"2020-10-18T14:49:18Z","GPSImgDirection":"358.06005859000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379366700000002","GPSLatitude":"48.447308329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.700000000000003","GPSHPositioningError":"16.124053904375117","DateCreated":"2020-10-18T16:49:18+02:00"}}}}
488	2020-10-19 21:39:56.050058	2020-10-19 21:40:21.010965	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.066725932123620768","GPSTimeStamp":"2020-10-18T14:42:59Z","GPSImgDirection":"230.19692982000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6380333299999998","GPSLatitude":"48.447558329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.200000000000003","GPSHPositioningError":"7.6956644621558983","DateCreated":"2020-10-18T16:42:59+02:00"}}}}
490	2020-10-19 21:41:48.18356	2020-10-19 21:42:06.028916	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.21622145167851542","GPSTimeStamp":"2020-10-18T14:46:31Z","GPSImgDirection":"357.22320550999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6381133299999999","GPSLatitude":"48.447436670000009","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.900000000000006","GPSHPositioningError":"34.771779141104297","DateCreated":"2020-10-18T16:46:30+02:00"}}}}
491	2020-10-19 21:43:14.095418	2020-10-19 21:43:41.863546	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.18672539303847802","GPSTimeStamp":"2020-10-18T14:49:18Z","GPSImgDirection":"358.06005859000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379366700000002","GPSLatitude":"48.447308329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.700000000000003","GPSHPositioningError":"16.124053904375117","DateCreated":"2020-10-18T16:49:18+02:00"}}}}
331	2020-09-03 20:43:18.189322	2020-10-22 08:15:44.185803	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012963270768567561","GPSTimeStamp":"2020-09-01T11:47:40Z","GPSImgDirection":"171.12978369000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630500000000001","GPSLatitude":"48.463058329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.200000000000003","GPSHPositioningError":"4.1810475708502022","DateCreated":"2020-09-01T13:47:40+02:00"}}}}
4	2020-04-18 20:36:55.36101	2020-04-21 13:35:44.876981	f	\N
10	2020-04-18 20:36:55.630165	2020-04-21 13:39:37.301329	f	\N
11	2020-04-18 20:36:55.670284	2020-04-21 13:39:47.1239	f	\N
13	2020-04-18 20:36:55.734295	2020-04-21 13:40:19.956168	f	\N
16	2020-04-18 20:36:55.834834	2020-04-21 13:41:03.797073	f	\N
19	2020-04-18 20:36:55.933529	2020-04-21 13:41:50.114825	f	\N
24	2020-04-18 20:36:56.114268	2020-04-21 13:42:55.93633	f	\N
28	2020-04-18 20:36:56.250382	2020-04-21 13:43:49.882216	f	\N
33	2020-04-18 20:36:56.437838	2020-04-21 13:44:36.373651	f	\N
35	2020-04-18 20:36:56.514756	2020-04-21 13:44:56.257547	f	\N
37	2020-04-18 20:36:56.59497	2020-04-21 13:45:15.734954	f	\N
43	2020-04-18 20:36:56.842231	2020-04-21 13:46:20.678616	f	\N
48	2020-04-18 20:36:57.044109	2020-04-21 13:47:17.608002	f	\N
51	2020-04-18 20:36:57.165773	2020-04-21 13:54:23.394209	f	\N
53	2020-04-18 20:36:57.24196	2020-04-21 13:54:42.252805	f	\N
58	2020-04-18 20:36:57.438395	2020-04-21 13:57:10.082725	f	\N
64	2020-04-18 20:36:57.702249	2020-04-21 13:58:09.335409	f	\N
65	2020-04-18 20:36:57.737684	2020-04-21 13:58:16.883117	f	\N
67	2020-04-18 20:36:57.823657	2020-04-21 13:58:30.694166	f	\N
70	2020-04-18 20:36:57.949455	2020-04-21 13:59:07.983045	f	\N
72	2020-04-18 20:36:58.032896	2020-04-21 13:59:21.053191	f	\N
78	2020-04-18 20:36:58.267143	2020-04-21 14:07:20.936282	f	\N
81	2020-04-18 20:36:58.382356	2020-04-21 14:07:44.578106	f	\N
86	2020-04-18 20:36:58.589598	2020-04-21 14:08:26.92738	f	\N
90	2020-04-18 20:36:58.761552	2020-04-21 14:09:04.451284	f	\N
93	2020-04-18 20:36:58.889003	2020-04-21 14:09:24.585363	f	\N
96	2020-04-18 20:36:59.010758	2020-04-21 14:10:09.307452	f	\N
102	2020-04-18 20:36:59.257692	2020-04-21 14:11:02.064592	f	\N
103	2020-04-18 20:36:59.295566	2020-04-21 14:11:07.912406	f	\N
106	2020-04-18 20:36:59.424191	2020-04-21 14:11:28.731251	f	\N
109	2020-04-18 20:36:59.583821	2020-04-21 14:12:05.382211	f	\N
119	2020-04-18 20:36:59.981833	2020-04-21 14:15:00.359853	f	\N
122	2020-04-18 20:37:00.094688	2020-04-21 14:15:26.89932	f	\N
312	2020-09-03 20:43:15.376475	2020-10-22 08:22:03.247392	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.026575228223800804","GPSTimeStamp":"2020-09-01T13:04:56Z","GPSImgDirection":"119.56403923000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6625749999999999","GPSLatitude":"48.463078329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91","GPSHPositioningError":"4.4266040809993017","DateCreated":"2020-09-01T15:04:56+02:00"}}}}
124	2020-04-18 20:37:00.175966	2020-04-21 14:15:39.112112	f	\N
3	2020-04-18 20:36:55.332313	2020-04-21 13:35:23.860365	f	\N
132	2020-04-18 20:37:00.470415	2020-04-21 14:16:54.233764	f	\N
5	2020-04-18 20:36:55.415765	2020-04-21 13:37:51.669785	f	\N
136	2020-04-18 20:37:00.616095	2020-04-21 14:17:31.761511	f	\N
138	2020-04-18 20:37:00.681426	2020-04-21 14:17:55.803696	f	\N
7	2020-04-18 20:36:55.537502	2020-04-21 13:38:18.631501	f	\N
151	2020-04-18 20:37:01.170633	2020-04-21 14:20:08.23647	f	\N
156	2020-04-18 20:37:01.362609	2020-04-21 14:20:45.906389	f	\N
158	2020-04-18 20:37:01.442855	2020-04-21 14:21:10.477079	f	\N
160	2020-04-18 20:37:01.521857	2020-04-21 14:21:27.404796	f	\N
15	2020-04-18 20:36:55.80428	2020-04-21 13:40:50.080939	f	\N
162	2020-04-18 20:37:01.58881	2020-04-21 14:21:51.610035	f	\N
165	2020-04-18 20:37:01.717044	2020-04-21 14:22:12.776146	f	\N
17	2020-04-18 20:36:55.868135	2020-04-21 13:41:12.446243	f	\N
18	2020-04-18 20:36:55.907439	2020-04-21 13:41:40.533038	f	\N
173	2020-04-18 20:37:02.053489	2020-04-21 14:24:12.165629	f	\N
177	2020-04-18 20:37:02.203214	2020-04-21 14:24:58.328323	f	\N
20	2020-04-18 20:36:55.965327	2020-04-21 13:41:59.934637	f	\N
178	2020-04-18 20:37:02.240658	2020-04-21 14:25:19.176772	f	\N
181	2020-04-18 20:37:02.357726	2020-04-21 14:25:39.811476	f	\N
183	2020-04-18 20:37:02.43824	2020-04-21 14:25:56.306132	f	\N
188	2020-04-18 20:37:02.634556	2020-04-21 14:26:42.837949	f	\N
194	2020-04-18 20:37:02.863059	2020-04-21 14:27:52.029331	f	\N
197	2020-04-18 20:37:02.996215	2020-04-21 14:28:25.041611	f	\N
199	2020-04-18 20:37:03.096536	2020-04-21 14:28:48.1651	f	\N
202	2020-04-18 20:37:03.240685	2020-04-21 14:29:09.165992	f	\N
205	2020-04-18 20:37:03.3901	2020-04-21 14:29:29.618748	f	\N
210	2020-04-18 20:37:03.70411	2020-04-21 14:30:54.515781	f	\N
212	2020-04-18 20:37:03.793979	2020-04-21 14:31:20.75183	f	\N
217	2020-04-18 20:37:04.016163	2020-04-21 14:32:18.099099	f	\N
221	2020-04-18 20:37:04.229757	2020-04-21 14:32:52.633474	f	\N
223	2020-04-18 20:37:04.316844	2020-04-21 14:33:15.704427	f	\N
31	2020-04-18 20:36:56.364656	2020-04-21 13:44:21.09593	f	\N
34	2020-04-18 20:36:56.477018	2020-04-21 13:44:45.791506	f	\N
36	2020-04-18 20:36:56.548958	2020-04-21 13:45:06.832291	f	\N
41	2020-04-18 20:36:56.762915	2020-04-21 13:46:03.259615	f	\N
50	2020-04-18 20:36:57.13078	2020-04-21 13:54:15.891098	f	\N
52	2020-04-18 20:36:57.208816	2020-04-21 13:54:34.290804	f	\N
54	2020-04-18 20:36:57.278584	2020-04-21 13:54:59.756131	f	\N
59	2020-04-18 20:36:57.477727	2020-04-21 13:57:21.293261	f	\N
62	2020-04-18 20:36:57.608789	2020-04-21 13:57:53.901354	f	\N
63	2020-04-18 20:36:57.645884	2020-04-21 13:58:02.516215	f	\N
66	2020-04-18 20:36:57.776354	2020-04-21 13:58:24.888369	f	\N
68	2020-04-18 20:36:57.869007	2020-04-21 13:58:49.147925	f	\N
69	2020-04-18 20:36:57.917624	2020-04-21 13:59:00.438455	f	\N
74	2020-04-18 20:36:58.1157	2020-04-21 13:59:37.918714	f	\N
76	2020-04-18 20:36:58.189541	2020-04-21 13:59:56.095516	f	\N
79	2020-04-18 20:36:58.312885	2020-04-21 14:07:29.523718	f	\N
80	2020-04-18 20:36:58.3403	2020-04-21 14:07:37.450912	f	\N
82	2020-04-18 20:36:58.429653	2020-04-21 14:07:57.310638	f	\N
84	2020-04-18 20:36:58.512773	2020-04-21 14:08:12.238051	f	\N
85	2020-04-18 20:36:58.546359	2020-04-21 14:08:18.648392	f	\N
88	2020-04-18 20:36:58.676284	2020-04-21 14:08:49.87644	f	\N
94	2020-04-18 20:36:58.933692	2020-04-21 14:09:31.670298	f	\N
95	2020-04-18 20:36:58.969379	2020-04-21 14:09:37.15947	f	\N
97	2020-04-18 20:36:59.048247	2020-04-21 14:10:15.547684	f	\N
100	2020-04-18 20:36:59.180781	2020-04-21 14:10:46.673199	f	\N
101	2020-04-18 20:36:59.221288	2020-04-21 14:10:54.777981	f	\N
104	2020-04-18 20:36:59.337064	2020-04-21 14:11:15.910804	f	\N
105	2020-04-18 20:36:59.377541	2020-04-21 14:11:22.297359	f	\N
176	2020-04-18 20:37:02.167926	2020-04-18 21:00:40.317518	f	\N
108	2020-04-18 20:36:59.511006	2020-04-21 14:11:59.803475	f	\N
110	2020-04-18 20:36:59.62738	2020-04-21 14:13:30.484403	f	\N
114	2020-04-18 20:36:59.778806	2020-04-21 14:14:11.228392	f	\N
115	2020-04-18 20:36:59.827503	2020-04-21 14:14:21.075759	f	\N
117	2020-04-18 20:36:59.899503	2020-04-21 14:14:32.068886	f	\N
118	2020-04-18 20:36:59.937785	2020-04-21 14:14:52.284167	f	\N
120	2020-04-18 20:37:00.023369	2020-04-21 14:15:07.080822	f	\N
121	2020-04-18 20:37:00.059559	2020-04-21 14:15:17.253113	f	\N
123	2020-04-18 20:37:00.141466	2020-04-21 14:15:33.05313	f	\N
125	2020-04-18 20:37:00.214023	2020-04-21 14:15:46.721659	f	\N
126	2020-04-18 20:37:00.242728	2020-04-21 14:15:54.966413	f	\N
130	2020-04-18 20:37:00.390445	2020-04-21 14:16:39.76611	f	\N
135	2020-04-18 20:37:00.574293	2020-04-21 14:17:24.043921	f	\N
137	2020-04-18 20:37:00.644319	2020-04-21 14:17:39.759349	f	\N
139	2020-04-18 20:37:00.724581	2020-04-21 14:18:03.044723	f	\N
140	2020-04-18 20:37:00.75431	2020-04-21 14:18:10.383882	f	\N
144	2020-04-18 20:37:00.903547	2020-04-21 14:18:46.691454	f	\N
146	2020-04-18 20:37:00.976245	2020-04-21 14:19:06.364658	f	\N
147	2020-04-18 20:37:01.020426	2020-04-21 14:19:15.476912	f	\N
152	2020-04-18 20:37:01.206705	2020-04-21 14:20:16.746208	f	\N
154	2020-04-18 20:37:01.28052	2020-04-21 14:20:31.018999	f	\N
155	2020-04-18 20:37:01.321264	2020-04-21 14:20:39.317409	f	\N
157	2020-04-18 20:37:01.395994	2020-04-21 14:20:54.694699	f	\N
159	2020-04-18 20:37:01.480908	2020-04-21 14:21:20.724616	f	\N
161	2020-04-18 20:37:01.555363	2020-04-21 14:21:40.675913	f	\N
164	2020-04-18 20:37:01.678052	2020-04-21 14:22:04.976207	f	\N
168	2020-04-18 20:37:01.838319	2020-04-21 14:23:30.237815	f	\N
170	2020-04-18 20:37:01.917484	2020-04-21 14:23:50.423655	f	\N
174	2020-04-18 20:37:02.087672	2020-04-21 14:24:17.974863	f	\N
175	2020-04-18 20:37:02.133861	2020-04-21 14:24:31.273464	f	\N
179	2020-04-18 20:37:02.279234	2020-04-21 14:25:26.643225	f	\N
211	2020-04-18 20:37:03.757978	2020-04-18 21:00:40.391042	f	\N
216	2020-04-18 20:37:03.972043	2020-04-18 21:00:40.404725	f	\N
1	2020-04-18 19:51:17.374644	2020-04-21 13:33:46.367889	f	\N
2	2020-04-18 20:36:55.239653	2020-04-21 13:34:27.027339	f	\N
8	2020-04-18 20:36:55.565201	2020-04-21 13:39:07.618489	f	\N
21	2020-04-18 20:36:56.005996	2020-04-21 13:42:23.230116	f	\N
22	2020-04-18 20:36:56.039619	2020-04-21 13:42:41.227811	f	\N
32	2020-04-18 20:36:56.409067	2020-04-21 13:44:29.35076	f	\N
57	2020-04-18 20:36:57.40939	2020-04-21 13:56:29.971594	f	\N
182	2020-04-18 20:37:02.392176	2020-04-21 14:25:50.476895	f	\N
187	2020-04-18 20:37:02.59408	2020-04-21 14:26:26.252653	f	\N
189	2020-04-18 20:37:02.66842	2020-04-21 14:26:50.542769	f	\N
190	2020-04-18 20:37:02.700822	2020-04-21 14:27:11.891713	f	\N
193	2020-04-18 20:37:02.825696	2020-04-21 14:27:44.605272	f	\N
195	2020-04-18 20:37:02.900519	2020-04-21 14:28:09.272792	f	\N
196	2020-04-18 20:37:02.947674	2020-04-21 14:28:17.773065	f	\N
200	2020-04-18 20:37:03.141585	2020-04-21 14:28:55.985865	f	\N
201	2020-04-18 20:37:03.190245	2020-04-21 14:29:03.092361	f	\N
203	2020-04-18 20:37:03.285476	2020-04-21 14:29:15.925628	f	\N
204	2020-04-18 20:37:03.340594	2020-04-21 14:29:23.914335	f	\N
206	2020-04-18 20:37:03.438698	2020-04-21 14:29:53.73391	f	\N
209	2020-04-18 20:37:03.659325	2020-04-21 14:30:48.856758	f	\N
213	2020-04-18 20:37:03.840809	2020-04-21 14:31:27.057385	f	\N
214	2020-04-18 20:37:03.878065	2020-04-21 14:31:35.509429	f	\N
220	2020-04-18 20:37:04.18197	2020-04-21 14:32:47.255802	f	\N
222	2020-04-18 20:37:04.272266	2020-04-21 14:33:08.414593	f	\N
224	2020-04-18 20:37:04.370683	2020-04-21 14:33:22.248228	f	\N
73	2020-04-18 20:36:58.06937	2020-04-21 13:59:28.574715	f	\N
77	2020-04-18 20:36:58.231256	2020-04-21 14:00:09.212403	f	\N
83	2020-04-18 20:36:58.472796	2020-04-21 14:08:05.246821	f	\N
87	2020-04-18 20:36:58.632095	2020-04-21 14:08:32.891521	f	\N
89	2020-04-18 20:36:58.719967	2020-04-21 14:08:59.329816	f	\N
98	2020-04-18 20:36:59.095596	2020-04-21 14:10:33.239133	f	\N
107	2020-04-18 20:36:59.462889	2020-04-21 14:11:41.816482	f	\N
112	2020-04-18 20:36:59.707148	2020-04-21 14:13:59.603559	f	\N
116	2020-04-18 20:36:59.860067	2020-04-21 14:14:26.69707	f	\N
128	2020-04-18 20:37:00.32277	2020-04-21 14:16:15.859574	f	\N
131	2020-04-18 20:37:00.435148	2020-04-21 14:16:47.902917	f	\N
134	2020-04-18 20:37:00.539647	2020-04-21 14:17:11.53666	f	\N
145	2020-04-18 20:37:00.939492	2020-04-21 14:18:59.706697	f	\N
167	2020-04-18 20:37:01.793838	2020-04-21 14:22:52.009377	f	\N
169	2020-04-18 20:37:01.877461	2020-04-21 14:23:42.781271	f	\N
180	2020-04-18 20:37:02.323557	2020-04-21 14:25:33.574261	f	\N
186	2020-04-18 20:37:02.559485	2020-04-21 14:26:20.715785	f	\N
191	2020-04-18 20:37:02.742198	2020-04-21 14:27:22.589374	f	\N
192	2020-04-18 20:37:02.78092	2020-04-21 14:27:35.967984	f	\N
207	2020-04-18 20:37:03.54561	2020-04-21 14:30:15.077179	f	\N
208	2020-04-18 20:37:03.608045	2020-04-21 14:30:33.573556	f	\N
218	2020-04-18 20:37:04.067592	2020-04-21 14:32:35.398081	f	\N
238	2020-07-05 20:00:23.336479	2020-07-05 20:48:35.483552	f	\N
236	2020-07-05 20:00:23.153873	2020-07-05 20:46:55.998953	f	\N
239	2020-07-05 20:00:23.41996	2020-07-05 20:47:51.248305	f	\N
235	2020-07-05 20:00:23.089874	2020-07-05 20:56:51.930827	f	\N
234	2020-07-05 20:00:23.031964	2020-07-05 20:58:07.096604	f	\N
248	2020-07-05 20:00:24.028446	2020-07-05 20:57:36.176498	f	\N
258	2020-07-05 20:00:24.821282	2020-07-05 20:59:45.697978	f	\N
264	2020-07-05 20:00:25.199488	2020-07-05 20:50:02.765213	f	\N
241	2020-07-05 20:00:23.58865	2020-07-05 20:47:23.746741	f	\N
245	2020-07-05 20:00:23.820682	2020-07-05 20:58:48.461421	f	\N
262	2020-07-05 20:00:25.072006	2020-07-05 21:01:05.681477	f	\N
251	2020-07-05 20:00:24.277451	2020-07-05 20:49:08.967762	f	\N
246	2020-07-05 20:00:23.895763	2020-07-05 20:49:38.169032	f	\N
226	2020-07-05 20:00:22.197966	2020-07-05 21:01:43.23582	f	\N
232	2020-07-05 20:00:22.83111	2020-07-05 20:51:00.345056	f	\N
230	2020-07-05 20:00:22.674697	2020-07-05 20:53:01.832122	f	\N
253	2020-07-05 20:00:24.405026	2020-07-05 20:55:22.041861	f	\N
260	2020-07-05 20:00:24.949955	2020-07-05 20:53:52.404558	f	\N
240	2020-07-05 20:00:23.512448	2020-07-05 20:44:12.466362	f	\N
254	2020-07-05 20:00:24.467166	2020-07-05 20:50:39.727558	f	\N
247	2020-07-05 20:00:23.973393	2020-07-05 20:45:45.703562	f	\N
263	2020-07-05 20:00:25.130154	2020-07-05 20:39:26.079322	f	\N
225	2020-07-05 19:59:51.026596	2020-07-05 20:41:35.67124	f	\N
233	2020-07-05 20:00:22.940122	2020-07-05 20:42:56.896923	f	\N
237	2020-07-05 20:00:23.240223	2020-07-05 20:43:35.314439	f	\N
250	2020-07-05 20:00:24.200784	2020-07-05 20:46:26.696137	f	\N
261	2020-07-05 20:00:25.013763	2020-07-05 20:52:07.44383	f	\N
227	2020-07-05 20:00:22.395586	2020-07-05 20:51:30.282205	f	\N
256	2020-07-05 20:00:24.600909	2020-07-05 20:52:39.119319	f	\N
229	2020-07-05 20:00:22.587219	2020-07-05 20:53:33.457952	f	\N
257	2020-07-05 20:00:24.674593	2020-07-05 20:54:43.695953	f	\N
244	2020-07-05 20:00:23.757752	2020-07-05 20:56:08.651943	f	\N
242	2020-07-05 20:00:23.641112	2020-07-05 20:56:28.026397	f	\N
249	2020-07-05 20:00:24.076408	2020-07-05 20:57:13.173349	f	\N
243	2020-07-05 20:00:23.705781	2020-07-05 20:57:52.819884	f	\N
252	2020-07-05 20:00:24.343704	2020-07-05 20:58:27.140479	f	\N
259	2020-07-05 20:00:24.8884	2020-07-05 20:59:22.910444	f	\N
231	2020-07-05 20:00:22.774222	2020-07-05 20:59:59.497821	f	\N
228	2020-07-05 20:00:22.460859	2020-07-05 21:00:38.433076	f	\N
255	2020-07-05 20:00:24.524308	2020-07-05 21:01:25.976397	f	\N
318	2020-09-03 20:43:16.256737	2020-10-22 08:22:39.577703	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.018706090746503663","GPSTimeStamp":"2020-09-01T13:05:40Z","GPSImgDirection":"111.61694153000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6625549999999998","GPSLatitude":"48.463046670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.799999999999997","GPSHPositioningError":"10.033350703491402","DateCreated":"2020-09-01T15:05:39+02:00"}}}}
326	2020-09-03 20:43:17.350891	2020-10-22 17:06:49.187211	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.058897156270842896","GPSTimeStamp":"2020-09-01T15:53:24Z","GPSImgDirection":"80.443298340000013","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634783299999998","GPSLatitude":"48.462125","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.400000000000006","GPSHPositioningError":"5.645715267044479","DateCreated":"2020-09-01T17:53:23+02:00"}}}}
314	2020-09-03 20:43:15.577919	2020-10-22 17:28:14.99357	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010091121308486545","GPSTimeStamp":"2020-09-01T16:30:23Z","GPSImgDirection":"173.28211991000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635333299999995","GPSLatitude":"48.462630000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96","GPSHPositioningError":"7.9926532190500739","DateCreated":"2020-09-01T18:30:22+02:00"}}}}
293	2020-09-03 20:43:12.79275	2020-10-22 16:47:50.377763	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11071044208701972","GPSTimeStamp":"2020-09-01T15:05:00Z","GPSImgDirection":"317.51951600000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641866700000003","GPSLatitude":"48.460799999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.900000000000006","GPSHPositioningError":"5.3056777289084369","DateCreated":"2020-09-01T17:05:00+02:00"}}}}
495	2020-10-19 21:46:52.965584	2020-10-19 21:47:14.804112	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.02714896761450029","GPSTimeStamp":"2020-10-18T14:53:19Z","GPSImgDirection":"331.02767920999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379866700000001","GPSLatitude":"48.447361669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.900000000000006","GPSHPositioningError":"16.497946963216425","DateCreated":"2020-10-18T16:53:19+02:00"}}}}
428	2020-09-03 20:43:32.382498	2020-10-22 16:49:34.452259	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.24529595667282642","GPSTimeStamp":"2020-09-01T15:14:12Z","GPSImgDirection":"137.74995039000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638700000000002","GPSLatitude":"48.461120000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.200000000000003","GPSHPositioningError":"7.4783245459871122","DateCreated":"2020-09-01T17:14:11+02:00"}}}}
315	2020-09-03 20:43:15.704623	2020-10-22 16:52:15.18831	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.031640324750192163","GPSTimeStamp":"2020-09-01T15:17:56Z","GPSImgDirection":"184.72368624000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637116700000001","GPSLatitude":"48.461216670000013","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.200000000000003","GPSHPositioningError":"12.349507129868886","DateCreated":"2020-09-01T17:17:55+02:00"}}}}
496	2020-10-19 21:47:41.880387	2020-10-19 21:48:06.740141	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.088585607707087052","GPSTimeStamp":"2020-10-18T14:56:49Z","GPSImgDirection":"243.21298220999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.63890833","GPSLatitude":"48.44731333","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90","GPSHPositioningError":"14.503445706835537","DateCreated":"2020-10-18T16:56:49+02:00"}}}}
497	2020-10-19 21:48:23.901163	2020-10-19 21:48:43.174619	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.050244245685535205","GPSTimeStamp":"2020-10-18T14:58:16Z","GPSImgDirection":"13.988250729999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6387799999999997","GPSLatitude":"48.447303329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.299999999999997","GPSHPositioningError":"9.5861615117044288","DateCreated":"2020-10-18T16:58:16+02:00"}}}}
498	2020-10-19 21:49:06.810049	2020-10-19 21:49:35.967603	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.057265579715529924","GPSTimeStamp":"2020-10-18T15:00:02Z","GPSImgDirection":"310.31036384000009","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6389383299999998","GPSLatitude":"48.447220000000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.200000000000003","GPSHPositioningError":"10.528830806065443","DateCreated":"2020-10-18T17:00:02+02:00"}}}}
499	2020-10-19 21:50:01.830685	2020-10-19 21:50:21.744742	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.015429579662481697","GPSTimeStamp":"2020-10-18T15:02:38Z","GPSImgDirection":"101.25133033","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6389916700000002","GPSLatitude":"48.447303329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.200000000000003","GPSHPositioningError":"5.0407586632457537","DateCreated":"2020-10-18T17:02:37+02:00"}}}}
439	2020-09-03 20:43:34.142284	2020-10-22 16:58:53.891305	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.061494074727580533","GPSTimeStamp":"2020-09-01T15:37:08Z","GPSImgDirection":"172.25637834000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637300000000002","GPSLatitude":"48.461741670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.200000000000003","GPSHPositioningError":"4.5619078311311636","DateCreated":"2020-09-01T17:37:07+02:00"}}}}
501	2020-10-19 21:51:38.373555	2020-10-19 21:51:58.424568	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.091703087110289683","GPSTimeStamp":"2020-10-18T15:05:04Z","GPSImgDirection":"150.34474175","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6391300000000002","GPSLatitude":"48.447188330000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.299999999999997","GPSHPositioningError":"25.832432194821749","DateCreated":"2020-10-18T17:05:03+02:00"}}}}
500	2020-10-19 21:50:58.540016	2020-10-19 21:51:22.724708	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.015429579662481697","GPSTimeStamp":"2020-10-18T15:02:38Z","GPSImgDirection":"101.25133033","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6389916700000002","GPSLatitude":"48.447303329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.200000000000003","GPSHPositioningError":"5.0407586632457537","DateCreated":"2020-10-18T17:02:37+02:00"}}}}
397	2020-09-03 20:43:27.927183	2020-10-22 16:50:03.234472	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.31038084635577728","GPSTimeStamp":"2020-09-01T15:15:41Z","GPSImgDirection":"159.06182090999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636383299999999","GPSLatitude":"48.461220000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.099999999999994","GPSHPositioningError":"5.7552511083654334","DateCreated":"2020-09-01T17:15:40+02:00"}}}}
274	2020-09-03 20:43:10.026726	2020-10-22 16:53:57.76362	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.57298487404569243","GPSTimeStamp":"2020-09-01T15:24:04Z","GPSImgDirection":"213.46614835999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637549999999997","GPSLatitude":"48.461395000000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.299999999999997","GPSHPositioningError":"12.21033234191129","DateCreated":"2020-09-01T17:24:04+02:00"}}}}
335	2020-09-03 20:43:18.951922	2020-10-22 16:54:59.176466	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11432502427970219","GPSTimeStamp":"2020-09-01T15:27:34Z","GPSImgDirection":"257.41210937999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638500000000001","GPSLatitude":"48.461261670000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95","GPSHPositioningError":"12.363679961633762","DateCreated":"2020-09-01T17:27:33+02:00"}}}}
375	2020-09-03 20:43:24.598253	2020-10-22 17:02:27.798705	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11140376330885472","GPSTimeStamp":"2020-09-01T15:40:35Z","GPSImgDirection":"139.03238296000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637416700000007","GPSLatitude":"48.461913330000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.400000000000006","GPSHPositioningError":"8.7184142835527307","DateCreated":"2020-09-01T17:40:34+02:00"}}}}
406	2020-09-03 20:43:29.102152	2020-10-22 17:09:05.770729	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012782710601934298","GPSTimeStamp":"2020-09-01T15:59:35Z","GPSImgDirection":"179.78369906","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633749999999998","GPSLatitude":"48.462228330000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.099999999999994","GPSHPositioningError":"6.6366385484641093","DateCreated":"2020-09-01T17:59:34+02:00"}}}}
389	2020-09-03 20:43:26.719561	2020-10-22 17:09:26.918801	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.019792985178228736","GPSTimeStamp":"2020-09-01T16:00:13Z","GPSImgDirection":"206.56737518","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634366699999998","GPSLatitude":"48.462216670000011","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"13.012424503882658","DateCreated":"2020-09-01T18:00:12+02:00"}}}}
323	2020-09-03 20:43:17.048019	2020-10-22 17:09:46.716599	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.019792985178228736","GPSTimeStamp":"2020-09-01T16:00:13Z","GPSImgDirection":"206.56737518","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634366699999998","GPSLatitude":"48.462216670000011","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"13.012424503882658","DateCreated":"2020-09-01T18:00:12+02:00"}}}}
385	2020-09-03 20:43:26.048919	2020-10-22 17:10:59.024483	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.076863460223387275","GPSTimeStamp":"2020-09-01T16:04:09Z","GPSImgDirection":"17.764648440000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634116700000003","GPSLatitude":"48.462208329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97","GPSHPositioningError":"9.1920039980009989","DateCreated":"2020-09-01T18:04:09+02:00"}}}}
502	2020-10-19 21:52:18.619209	2020-10-19 21:52:39.180495	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.028580306106596242","GPSTimeStamp":"2020-10-18T15:05:52Z","GPSImgDirection":"94.890315049999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6391616700000005","GPSLatitude":"48.447138329999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.299999999999997","GPSHPositioningError":"9.420692928334125","DateCreated":"2020-10-18T17:05:51+02:00"}}}}
352	2020-09-03 20:43:21.379969	2020-10-22 16:51:27.735615	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.039257347598406461","GPSTimeStamp":"2020-09-01T15:16:34Z","GPSImgDirection":"101.69729515000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635916700000002","GPSLatitude":"48.46125","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97","GPSHPositioningError":"15.882587631803933","DateCreated":"2020-09-01T17:16:33+02:00"}}}}
267	2020-09-03 20:43:09.066618	2020-10-22 16:52:53.04437	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.19659231592420842","GPSTimeStamp":"2020-09-01T15:19:25Z","GPSImgDirection":"50.09347537","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634283299999999","GPSLatitude":"48.461404999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.299999999999997","GPSHPositioningError":"5.0551461656814318","DateCreated":"2020-09-01T17:19:24+02:00"}}}}
333	2020-09-03 20:43:18.426828	2020-10-22 16:55:23.898945	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.21003292482165725","GPSTimeStamp":"2020-09-01T15:28:26Z","GPSImgDirection":"231.92158515999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637999999999997","GPSLatitude":"48.461328330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"5.930072142766738","DateCreated":"2020-09-01T17:28:26+02:00"}}}}
287	2020-09-03 20:43:11.915017	2020-10-22 16:56:20.915135	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.15290364622798774","GPSTimeStamp":"2020-09-01T15:31:08Z","GPSImgDirection":"139.82210928000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638383299999999","GPSLatitude":"48.461638330000007","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.799999999999997","GPSHPositioningError":"6.3268458274398869","DateCreated":"2020-09-01T17:31:08+02:00"}}}}
306	2020-09-03 20:43:14.644759	2020-10-22 17:01:52.896252	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.17293882374329606","GPSTimeStamp":"2020-09-01T15:40:05Z","GPSImgDirection":"128.37382885999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637033299999997","GPSLatitude":"48.461886669999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.700000000000003","GPSHPositioningError":"3.9067762971363766","DateCreated":"2020-09-01T17:40:05+02:00"}}}}
451	2020-09-03 20:45:14.587615	2020-10-22 17:03:04.400209	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.45097115624393896","GPSTimeStamp":"2020-09-01T15:41:06Z","GPSImgDirection":"180.33879093000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637999999999997","GPSLatitude":"48.461916670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.299999999999997","GPSHPositioningError":"9.1801792828685258","DateCreated":"2020-09-01T17:41:06+02:00"}}}}
363	2020-09-03 20:43:22.909369	2020-10-22 17:08:46.338973	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11389227962858829","GPSTimeStamp":"2020-09-01T15:58:24Z","GPSImgDirection":"56.671112070000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632866700000006","GPSLatitude":"48.462186670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.700000000000003","GPSHPositioningError":"8.6110228716645487","DateCreated":"2020-09-01T17:58:23+02:00"}}}}
353	2020-09-03 20:43:21.636651	2020-10-22 17:14:44.70424	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.077524565207362645","GPSTimeStamp":"2020-09-01T16:13:04Z","GPSImgDirection":"4.5338745099999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635783299999995","GPSLatitude":"48.462379999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.099999999999994","GPSHPositioningError":"9.1925255646288537","DateCreated":"2020-09-01T18:13:04+02:00"}}}}
503	2020-10-19 21:52:57.926932	2020-10-19 21:53:20.925375	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.059276506331989325","GPSTimeStamp":"2020-10-18T15:06:54Z","GPSImgDirection":"346.16073619999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6391633300000001","GPSLatitude":"48.447066670000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.799999999999997","GPSHPositioningError":"10.112441156691325","DateCreated":"2020-10-18T17:06:53+02:00"}}}}
316	2020-09-03 20:43:15.883583	2020-10-22 16:52:36.188869	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.19659231592420842","GPSTimeStamp":"2020-09-01T15:19:25Z","GPSImgDirection":"50.09347537","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634283299999999","GPSLatitude":"48.461404999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.299999999999997","GPSHPositioningError":"5.0551461656814318","DateCreated":"2020-09-01T17:19:24+02:00"}}}}
442	2020-09-03 20:45:13.195164	2020-10-22 16:58:16.121294	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11092346161853146","GPSTimeStamp":"2020-09-01T15:35:27Z","GPSImgDirection":"251.26528926","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66393667","GPSLatitude":"48.461800000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.900000000000006","GPSHPositioningError":"4.8190930204131526","DateCreated":"2020-09-01T17:35:26+02:00"}}}}
504	2020-10-19 21:53:46.595686	2020-10-19 21:54:05.88851	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.059276506331989325","GPSTimeStamp":"2020-10-18T15:06:54Z","GPSImgDirection":"346.16073619999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6391633300000001","GPSLatitude":"48.447066670000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.799999999999997","GPSHPositioningError":"10.112441156691325","DateCreated":"2020-10-18T17:06:53+02:00"}}}}
506	2020-10-19 21:56:23.370699	2020-10-19 21:56:56.098254	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.023874064922212595","GPSTimeStamp":"2020-10-18T15:12:07Z","GPSImgDirection":"28.166076650000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6390549999999999","GPSLatitude":"48.447086670000012","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"88.700000000000003","GPSHPositioningError":"5.6419422941590431","DateCreated":"2020-10-18T17:12:06+02:00"}}}}
412	2020-09-03 20:43:29.884973	2020-10-22 17:07:29.148664	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.018477449202454681","GPSTimeStamp":"2020-09-01T15:54:54Z","GPSImgDirection":"303.8252714699999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634049999999996","GPSLatitude":"48.462070000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98","GPSHPositioningError":"5.2221413957717662","DateCreated":"2020-09-01T17:54:54+02:00"}}}}
422	2020-09-03 20:43:31.523419	2020-10-22 17:07:46.697124	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.071529552318056619","GPSTimeStamp":"2020-09-01T15:56:13Z","GPSImgDirection":"144.82843792","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633699999999996","GPSLatitude":"48.462070000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.900000000000006","GPSHPositioningError":"4.8832338464760712","DateCreated":"2020-09-01T17:56:12+02:00"}}}}
273	2020-09-03 20:43:09.91377	2020-10-22 17:08:13.92129	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.22566017508085809","GPSTimeStamp":"2020-09-01T15:57:08Z","GPSImgDirection":"76.837219250000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632666699999996","GPSLatitude":"48.46213667","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.099999999999994","GPSHPositioningError":"4.3336347197106688","DateCreated":"2020-09-01T17:57:07+02:00"}}}}
286	2020-09-03 20:43:11.832075	2020-10-22 17:08:30.629165	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0049835224646217618","GPSTimeStamp":"2020-09-01T15:57:49Z","GPSImgDirection":"5.2379455600000009","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633049999999998","GPSLatitude":"48.462146670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"10.988661274472749","DateCreated":"2020-09-01T17:57:49+02:00"}}}}
505	2020-10-19 21:55:06.277444	2020-10-19 21:56:02.693855	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.041779741646286561","GPSTimeStamp":"2020-10-18T15:09:07Z","GPSImgDirection":"73.654449450000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6390800000000003","GPSLatitude":"48.447021670000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.299999999999997","GPSHPositioningError":"7.0256808854620072","DateCreated":"2020-10-18T17:09:06+02:00"}}}}
265	2020-09-03 19:26:29.409872	2020-10-22 07:55:09.559066	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.019590001552799639","GPSTimeStamp":"2020-09-01T09:23:12Z","GPSImgDirection":"162.30752572","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6644083299999997","GPSLatitude":"48.462630000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.799999999999997","GPSHPositioningError":"4.7281319814401099","DateCreated":"2020-09-01T11:23:11+02:00"}}}}
475	2020-09-03 20:47:14.734561	2020-10-22 07:57:31.68864	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0035671633635930783","GPSTimeStamp":"2020-09-01T09:26:30Z","GPSImgDirection":"47.465637230000013","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66432","GPSLatitude":"48.462788329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.799999999999997","GPSHPositioningError":"10.566194262011752","DateCreated":"2020-09-01T11:26:30+02:00"}}}}
275	2020-09-03 20:43:10.117387	2020-10-22 08:00:42.1234	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.029905255883599581","GPSTimeStamp":"2020-09-01T09:53:09Z","GPSImgDirection":"270.81240839999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66431167","GPSLatitude":"48.462628329999987","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.900000000000006","GPSHPositioningError":"5.4790813458604353","DateCreated":"2020-09-01T11:53:08+02:00"}}}}
307	2020-09-03 20:43:14.714869	2020-10-22 08:01:26.233271	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.035232372575315987","GPSTimeStamp":"2020-09-01T09:53:21Z","GPSImgDirection":"313.86953728000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6643300000000001","GPSLatitude":"48.462638329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92","GPSHPositioningError":"5.2180690443156781","DateCreated":"2020-09-01T11:53:21+02:00"}}}}
272	2020-09-03 20:43:09.802016	2020-10-22 08:02:02.674842	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.024772532296343609","GPSTimeStamp":"2020-09-01T10:03:02Z","GPSImgDirection":"174.96537795999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641583299999998","GPSLatitude":"48.462630000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.299999999999997","GPSHPositioningError":"4.7580126056054715","DateCreated":"2020-09-01T12:03:01+02:00"}}}}
300	2020-09-03 20:43:13.698263	2020-11-01 13:09:10.682496	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12778234475780956","GPSTimeStamp":"2020-09-01T09:50:16Z","GPSImgDirection":"232.56666565","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66431167","GPSLatitude":"48.462661670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93","GPSHPositioningError":"16.66792463002399","DateCreated":"2020-09-01T11:50:15+02:00"}}}}
308	2020-09-03 20:43:14.81373	2020-11-03 12:42:02.985664	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.029905255883599581","GPSTimeStamp":"2020-09-01T09:53:09Z","GPSImgDirection":"270.81240839999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66431167","GPSLatitude":"48.462628329999987","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.900000000000006","GPSHPositioningError":"5.4790813458604353","DateCreated":"2020-09-01T11:53:08+02:00"}}}}
387	2020-09-03 20:43:26.290592	2020-10-22 08:03:38.354892	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0084827113958236","GPSTimeStamp":"2020-09-01T10:08:08Z","GPSImgDirection":"142.39834982999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638999999999999","GPSLatitude":"48.462738330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"4.2584955158318589","DateCreated":"2020-09-01T12:08:07+02:00"}}}}
347	2020-09-03 20:43:20.856688	2020-10-22 08:04:14.793489	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.011668536810832495","GPSTimeStamp":"2020-09-01T10:10:13Z","GPSImgDirection":"146.02148438","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6639250000000003","GPSLatitude":"48.462769999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.200000000000003","GPSHPositioningError":"9.2059849600744244","DateCreated":"2020-09-01T12:10:13+02:00"}}}}
465	2020-09-03 20:47:11.515127	2020-10-22 08:06:46.068942	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.019751429571711988","GPSTimeStamp":"2020-09-01T11:05:06Z","GPSImgDirection":"338.11833171999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634783299999998","GPSLatitude":"48.462978329999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.599999999999994","GPSHPositioningError":"4.2553576272719056","DateCreated":"2020-09-01T13:05:06+02:00"}}}}
313	2020-09-03 20:43:15.481285	2020-10-22 08:10:59.489228	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.054441388670619338","GPSTimeStamp":"2020-09-01T11:31:59Z","GPSImgDirection":"67.872406060000017","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632166700000006","GPSLatitude":"48.463055000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.200000000000003","GPSHPositioningError":"4.2494566693833198","DateCreated":"2020-09-01T13:31:58+02:00"}}}}
433	2020-09-03 20:43:33.26214	2020-10-22 08:11:24.081154	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0018275622260678301","GPSTimeStamp":"2020-09-01T11:33:23Z","GPSImgDirection":"307.16761769000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634000000000002","GPSLatitude":"48.463013330000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.5","GPSHPositioningError":"4.2002902584966035","DateCreated":"2020-09-01T13:33:22+02:00"}}}}
380	2020-09-03 20:43:25.309849	2020-10-22 08:11:49.613422	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0018275622260678301","GPSTimeStamp":"2020-09-01T11:33:23Z","GPSImgDirection":"307.16761769000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634000000000002","GPSLatitude":"48.463013330000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.5","GPSHPositioningError":"4.2002902584966035","DateCreated":"2020-09-01T13:33:22+02:00"}}}}
472	2020-09-03 20:47:13.940905	2020-10-22 08:12:14.120328	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0031289604957932989","GPSTimeStamp":"2020-09-01T11:35:19Z","GPSImgDirection":"200.92263792000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633666700000003","GPSLatitude":"48.463108329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.400000000000006","GPSHPositioningError":"4.1334751063297475","DateCreated":"2020-09-01T13:35:19+02:00"}}}}
394	2020-09-03 20:43:27.330896	2020-10-22 08:12:30.530359	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0031289604957932989","GPSTimeStamp":"2020-09-01T11:35:19Z","GPSImgDirection":"200.92263792000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633666700000003","GPSLatitude":"48.463108329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.400000000000006","GPSHPositioningError":"4.1334751063297475","DateCreated":"2020-09-01T13:35:19+02:00"}}}}
340	2020-09-03 20:43:19.627973	2020-10-22 08:04:46.011112	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0099056977778837277","GPSTimeStamp":"2020-09-01T10:12:20Z","GPSImgDirection":"179.54981242000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641166700000003","GPSLatitude":"48.462886670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.400000000000006","GPSHPositioningError":"4.0258050980803528","DateCreated":"2020-09-01T12:12:19+02:00"}}}}
466	2020-09-03 20:47:11.679263	2020-10-22 08:07:25.866359	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010556058027161955","GPSTimeStamp":"2020-09-01T11:11:30Z","GPSImgDirection":"332.34907530000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634166700000002","GPSLatitude":"48.462830000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92","GPSHPositioningError":"3.6244654984488975","DateCreated":"2020-09-01T13:11:30+02:00"}}}}
391	2020-09-03 20:43:26.959321	2020-10-22 08:14:20.501946	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.030921187244622738","GPSTimeStamp":"2020-09-01T11:44:05Z","GPSImgDirection":"214.16986062999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632083299999998","GPSLatitude":"48.463136670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.299999999999997","GPSHPositioningError":"15.748833138856476","DateCreated":"2020-09-01T13:44:05+02:00"}}}}
366	2020-09-03 20:43:23.413173	2020-10-22 08:16:16.70509	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.02121220528821836","GPSTimeStamp":"2020-09-01T11:54:34Z","GPSImgDirection":"345.12010221000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629833300000003","GPSLatitude":"48.462974999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.900000000000006","GPSHPositioningError":"4.7425863363363367","DateCreated":"2020-09-01T13:54:33+02:00"}}}}
321	2020-09-03 20:43:16.69628	2020-10-22 08:16:30.051392	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.02121220528821836","GPSTimeStamp":"2020-09-01T11:54:34Z","GPSImgDirection":"345.12010221000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629833300000003","GPSLatitude":"48.462974999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.900000000000006","GPSHPositioningError":"4.7425863363363367","DateCreated":"2020-09-01T13:54:33+02:00"}}}}
454	2020-09-03 20:45:15.13407	2020-10-22 08:17:46.844444	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0091818878396288956","GPSTimeStamp":"2020-09-01T12:39:39Z","GPSImgDirection":"62.884399409999993","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628583300000002","GPSLatitude":"48.463104999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.5","GPSHPositioningError":"7.0610638967579478","DateCreated":"2020-09-01T14:39:39+02:00"}}}}
305	2020-09-03 20:43:14.551584	2020-10-22 08:20:42.736332	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.030074430637431617","GPSTimeStamp":"2020-09-01T12:57:44Z","GPSImgDirection":"165.05345912000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627416700000004","GPSLatitude":"48.463183329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.700000000000003","GPSHPositioningError":"5.5264409881061303","DateCreated":"2020-09-01T14:57:44+02:00"}}}}
401	2020-09-03 20:43:28.448959	2020-10-22 16:53:38.816441	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.14174170796950686","GPSTimeStamp":"2020-09-01T15:23:31Z","GPSImgDirection":"225.3848418","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637549999999997","GPSLatitude":"48.46143","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.099999999999994","GPSHPositioningError":"4.8050290719625464","DateCreated":"2020-09-01T17:23:30+02:00"}}}}
395	2020-09-03 20:43:27.602234	2020-10-22 16:54:25.680844	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.26531285026702717","GPSTimeStamp":"2020-09-01T15:24:55Z","GPSImgDirection":"339.04374678000011","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638216700000004","GPSLatitude":"48.461333329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.5","GPSHPositioningError":"5.2347213770320788","DateCreated":"2020-09-01T17:24:54+02:00"}}}}
445	2020-09-03 20:45:13.513872	2020-10-22 08:05:25.637031	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0099056977778837277","GPSTimeStamp":"2020-09-01T10:12:20Z","GPSImgDirection":"179.54981242000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641166700000003","GPSLatitude":"48.462886670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.400000000000006","GPSHPositioningError":"4.0258050980803528","DateCreated":"2020-09-01T12:12:19+02:00"}}}}
381	2020-09-03 20:43:25.394459	2020-10-22 08:10:24.25469	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012022621926642482","GPSTimeStamp":"2020-09-01T11:30:13Z","GPSImgDirection":"100.13042160000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630783299999998","GPSLatitude":"48.46298333","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.5","GPSHPositioningError":"3.9709783531409166","DateCreated":"2020-09-01T13:30:12+02:00"}}}}
354	2020-09-03 20:43:21.743311	2020-10-22 08:13:34.084079	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0045873536703514156","GPSTimeStamp":"2020-09-01T11:39:26Z","GPSImgDirection":"324.66569525","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631","GPSLatitude":"48.463055000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.700000000000003","GPSHPositioningError":"4.2499816189986026","DateCreated":"2020-09-01T13:39:25+02:00"}}}}
390	2020-09-03 20:43:26.831756	2020-10-22 08:13:57.598283	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012210628944300387","GPSTimeStamp":"2020-09-01T11:43:02Z","GPSImgDirection":"233.02174380999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632166700000006","GPSLatitude":"48.463119999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.5","GPSHPositioningError":"5.1496754700089529","DateCreated":"2020-09-01T13:43:02+02:00"}}}}
358	2020-09-03 20:43:22.200856	2020-10-22 08:14:54.965787	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.017593206846225291","GPSTimeStamp":"2020-09-01T11:44:59Z","GPSImgDirection":"206.27898402","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631783299999996","GPSLatitude":"48.463111670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.5","GPSHPositioningError":"6.8583447645176037","DateCreated":"2020-09-01T13:44:59+02:00"}}}}
405	2020-09-03 20:43:29.002378	2020-10-22 08:15:23.309181	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.023445377130431617","GPSTimeStamp":"2020-09-01T11:45:49Z","GPSImgDirection":"209.18630982999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631833299999998","GPSLatitude":"48.463121670000007","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.900000000000006","GPSHPositioningError":"14.337570589691092","DateCreated":"2020-09-01T13:45:48+02:00"}}}}
432	2020-09-03 20:43:33.159751	2020-10-22 08:21:32.247863	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.072175562392837483","GPSTimeStamp":"2020-09-01T13:01:59Z","GPSImgDirection":"231.48693835000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6625383299999998","GPSLatitude":"48.463283329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.299999999999997","GPSHPositioningError":"10.078772979905942","DateCreated":"2020-09-01T15:01:58+02:00"}}}}
320	2020-09-03 20:43:16.555801	2020-10-22 16:55:49.955878	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.093045607219456941","GPSTimeStamp":"2020-09-01T15:29:30Z","GPSImgDirection":"217.86584481999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638083299999997","GPSLatitude":"48.461588329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94","GPSHPositioningError":"5.2690461199433338","DateCreated":"2020-09-01T17:29:30+02:00"}}}}
284	2020-09-03 20:43:11.634621	2020-10-22 16:56:52.663439	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.03707556427870462","GPSTimeStamp":"2020-09-01T15:32:39Z","GPSImgDirection":"93.237563090000009","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638366699999998","GPSLatitude":"48.461608330000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.799999999999997","GPSHPositioningError":"4.652587607333488","DateCreated":"2020-09-01T17:32:39+02:00"}}}}
460	2020-09-03 20:47:10.534196	2020-10-22 08:05:57.950554	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0071893511313432376","GPSTimeStamp":"2020-09-01T11:00:06Z","GPSImgDirection":"231.00778209999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641116700000005","GPSLatitude":"48.462855000000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.400000000000006","GPSHPositioningError":"11.539567966280295","DateCreated":"2020-09-01T13:00:06+02:00"}}}}
448	2020-09-03 20:45:14.14531	2020-10-22 08:07:50.053285	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.029999323196318189","GPSTimeStamp":"2020-09-01T11:12:48Z","GPSImgDirection":"171.87188729000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634199999999999","GPSLatitude":"48.462903329999989","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.5","GPSHPositioningError":"3.9197500526574456","DateCreated":"2020-09-01T13:12:48+02:00"}}}}
370	2020-09-03 20:43:23.833831	2020-10-22 08:08:07.540121	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.022397335632935857","GPSTimeStamp":"2020-09-01T11:18:11Z","GPSImgDirection":"242.42816167000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632866700000006","GPSLatitude":"48.46289500000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.900000000000006","GPSHPositioningError":"13.187570575899338","DateCreated":"2020-09-01T13:18:10+02:00"}}}}
441	2020-09-03 20:45:07.590769	2020-10-22 08:18:50.628031	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0063340207573066255","GPSTimeStamp":"2020-09-01T12:48:56Z","GPSImgDirection":"285.60658259000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632883299999994","GPSLatitude":"48.463178329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.900000000000006","GPSHPositioningError":"5.0866980938716946","DateCreated":"2020-09-01T14:48:55+02:00"}}}}
297	2020-09-03 20:43:13.261344	2020-10-22 16:58:01.066577	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1315581947743468","GPSTimeStamp":"2020-09-01T15:34:12Z","GPSImgDirection":"318.01640339999994","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6639666700000002","GPSLatitude":"48.461728329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.200000000000003","GPSHPositioningError":"4.4015858208955221","DateCreated":"2020-09-01T17:34:11+02:00"}}}}
383	2020-09-03 20:43:25.833561	2020-10-22 17:06:35.860098	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.058897156270842896","GPSTimeStamp":"2020-09-01T15:53:24Z","GPSImgDirection":"80.443298340000013","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634783299999998","GPSLatitude":"48.462125","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.400000000000006","GPSHPositioningError":"5.645715267044479","DateCreated":"2020-09-01T17:53:23+02:00"}}}}
325	2020-09-03 20:43:17.259839	2020-10-22 17:14:27.879242	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.19029724598860948","GPSTimeStamp":"2020-09-01T16:12:10Z","GPSImgDirection":"296.25936884000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635633300000001","GPSLatitude":"48.462345000000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.099999999999994","GPSHPositioningError":"4.7999586691465179","DateCreated":"2020-09-01T18:12:09+02:00"}}}}
384	2020-09-03 20:43:25.935033	2020-10-22 17:15:57.556056	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.15567186469868008","GPSTimeStamp":"2020-09-01T16:16:43Z","GPSImgDirection":"5.5561828600000016","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636383299999999","GPSLatitude":"48.462383329999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.299999999999997","GPSHPositioningError":"4.8707272117962468","DateCreated":"2020-09-01T18:16:42+02:00"}}}}
361	2020-09-03 20:43:22.739605	2020-10-22 17:16:11.08826	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.014758470470195781","GPSTimeStamp":"2020-09-01T16:17:23Z","GPSImgDirection":"322.71452328000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636583299999996","GPSLatitude":"48.462375000000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.299999999999997","GPSHPositioningError":"12.651575931232092","DateCreated":"2020-09-01T18:17:22+02:00"}}}}
416	2020-09-03 20:43:30.500046	2020-10-22 08:08:46.159935	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0071317264808258354","GPSTimeStamp":"2020-09-01T11:20:42Z","GPSImgDirection":"232.77038570999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632216699999995","GPSLatitude":"48.463004999999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.299999999999997","GPSHPositioningError":"4.2970234525425335","DateCreated":"2020-09-01T13:20:41+02:00"}}}}
477	2020-09-04 19:56:30.839176	2020-10-22 08:09:54.497125	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0061442186150877107","GPSTimeStamp":"2020-09-01T11:27:44Z","GPSImgDirection":"295.48345936000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632199999999999","GPSLatitude":"48.462903329999989","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.900000000000006","GPSHPositioningError":"14.548550016291951","DateCreated":"2020-09-01T13:27:43+02:00"}}}}
291	2020-09-03 20:43:12.588162	2020-10-22 08:17:23.783188	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1242322624070001","GPSTimeStamp":"2020-09-01T11:58:36Z","GPSImgDirection":"320.36532593999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630050000000001","GPSLatitude":"48.463088329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92","GPSHPositioningError":"4.9442558684323759","DateCreated":"2020-09-01T13:58:36+02:00"}}}}
280	2020-09-03 20:43:10.839785	2020-10-22 08:21:15.455442	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.013482664708222406","GPSTimeStamp":"2020-09-01T13:00:41Z","GPSImgDirection":"91.921506610000023","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6626666699999997","GPSLatitude":"48.463330000000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"88.799999999999997","GPSHPositioningError":"13.005134544071502","DateCreated":"2020-09-01T15:00:40+02:00"}}}}
467	2020-09-03 20:47:12.356262	2020-10-22 17:10:08.971484	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.25488775967135879","GPSTimeStamp":"2020-09-01T16:02:27Z","GPSImgDirection":"197.28914641","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634299999999995","GPSLatitude":"48.462199999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"6.5794280495462072","DateCreated":"2020-09-01T18:02:26+02:00"}}}}
349	2020-09-03 20:43:21.114301	2020-10-22 17:10:25.620363	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.25488775967135879","GPSTimeStamp":"2020-09-01T16:02:27Z","GPSImgDirection":"197.28914641","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634299999999995","GPSLatitude":"48.462199999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"6.5794280495462072","DateCreated":"2020-09-01T18:02:26+02:00"}}}}
359	2020-09-03 20:43:22.532018	2020-10-22 17:10:43.934642	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.31042724828204366","GPSTimeStamp":"2020-09-01T16:03:39Z","GPSImgDirection":"242.93817133999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634783299999998","GPSLatitude":"48.462196670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.900000000000006","GPSHPositioningError":"11.824170704435334","DateCreated":"2020-09-01T18:03:38+02:00"}}}}
411	2020-09-03 20:43:29.801718	2020-10-22 17:11:39.399357	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.17961595963371332","GPSTimeStamp":"2020-09-01T16:06:42Z","GPSImgDirection":"250.77439886999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635666700000002","GPSLatitude":"48.462229999999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.599999999999994","GPSHPositioningError":"10.598370170326676","DateCreated":"2020-09-01T18:06:41+02:00"}}}}
285	2020-09-03 20:43:11.752567	2020-10-22 17:11:49.412157	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.17961595963371332","GPSTimeStamp":"2020-09-01T16:06:42Z","GPSImgDirection":"250.77439886999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635666700000002","GPSLatitude":"48.462229999999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.599999999999994","GPSHPositioningError":"10.598370170326676","DateCreated":"2020-09-01T18:06:41+02:00"}}}}
292	2020-09-03 20:43:12.68985	2020-10-22 08:17:04.51096	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0038689440079819402","GPSTimeStamp":"2020-09-01T11:57:10Z","GPSImgDirection":"319.25639344000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629883299999997","GPSLatitude":"48.463038330000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.299999999999997","GPSHPositioningError":"4.6336432916171431","DateCreated":"2020-09-01T13:57:10+02:00"}}}}
438	2020-09-03 20:43:33.964429	2020-10-22 08:18:05.409068	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.036332234757256943","GPSTimeStamp":"2020-09-01T12:41:36Z","GPSImgDirection":"24.816314689999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628616700000003","GPSLatitude":"48.463178329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.099999999999994","GPSHPositioningError":"4.4668196923498575","DateCreated":"2020-09-01T14:41:35+02:00"}}}}
417	2020-09-03 20:43:30.656251	2020-10-22 08:19:10.904446	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.051333803684816881","GPSTimeStamp":"2020-09-01T12:49:51Z","GPSImgDirection":"310.08003234","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632799999999994","GPSLatitude":"48.463199999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.900000000000006","GPSHPositioningError":"12.01358438112087","DateCreated":"2020-09-01T14:49:51+02:00"}}}}
368	2020-09-03 20:43:23.608932	2020-10-22 15:54:00.233582	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0041646277562044139","GPSTimeStamp":"2020-09-01T13:06:27Z","GPSImgDirection":"252.18344114000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.662525","GPSLatitude":"48.463046670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.5","GPSHPositioningError":"8.7534977643155916","DateCreated":"2020-09-01T15:06:27+02:00"}}}}
269	2020-09-03 20:43:09.358572	2020-10-22 15:54:24.690398	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1563719362048718","GPSTimeStamp":"2020-09-01T13:07:17Z","GPSImgDirection":"110.83346550000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6623916700000003","GPSLatitude":"48.463111670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.200000000000003","GPSHPositioningError":"4.8593918918918915","DateCreated":"2020-09-01T15:07:16+02:00"}}}}
327	2020-09-03 20:43:17.528583	2020-10-22 15:56:26.21039	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.025889180599696006","GPSTimeStamp":"2020-09-01T13:09:06Z","GPSImgDirection":"193.95410156000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6626866700000003","GPSLatitude":"48.46289500000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.400000000000006","GPSHPositioningError":"4.1288800335570466","DateCreated":"2020-09-01T15:09:05+02:00"}}}}
415	2020-09-03 20:43:30.370288	2020-10-22 15:57:13.654837	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010520919225947258","GPSTimeStamp":"2020-09-01T13:10:26Z","GPSImgDirection":"259.84294117999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627300000000003","GPSLatitude":"48.462821670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.700000000000003","GPSHPositioningError":"10.667075252812678","DateCreated":"2020-09-01T15:10:26+02:00"}}}}
423	2020-09-03 20:43:31.654505	2020-10-22 15:58:02.193219	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12640155858388044","GPSTimeStamp":"2020-09-01T13:11:36Z","GPSImgDirection":"73.582244849999981","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627049999999999","GPSLatitude":"48.462861670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.299999999999997","GPSHPositioningError":"4.5731531159719356","DateCreated":"2020-09-01T15:11:35+02:00"}}}}
336	2020-09-03 20:43:19.101768	2020-10-22 15:59:14.397831	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010520919225947258","GPSTimeStamp":"2020-09-01T13:10:26Z","GPSImgDirection":"259.84294117999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627300000000003","GPSLatitude":"48.462821670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.700000000000003","GPSHPositioningError":"10.667075252812678","DateCreated":"2020-09-01T15:10:26+02:00"}}}}
403	2020-09-03 20:43:28.804019	2020-10-22 15:59:57.11255	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10229159893503914","GPSTimeStamp":"2020-09-01T13:13:39Z","GPSImgDirection":"180.28170783000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66281167","GPSLatitude":"48.462604999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.200000000000003","GPSHPositioningError":"4.2414083321643989","DateCreated":"2020-09-01T15:13:38+02:00"}}}}
430	2020-09-03 20:43:32.791996	2020-10-22 17:11:16.182256	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10621782389500921","GPSTimeStamp":"2020-09-01T16:05:21Z","GPSImgDirection":"113.00597569000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633916699999998","GPSLatitude":"48.462246669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.400000000000006","GPSHPositioningError":"10.590409150901891","DateCreated":"2020-09-01T18:05:20+02:00"}}}}
332	2020-09-03 20:43:18.332379	2020-10-22 17:12:15.677143	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.011793705633672973","GPSTimeStamp":"2020-09-01T16:08:05Z","GPSImgDirection":"41.145874020000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635466700000001","GPSLatitude":"48.462291669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.299999999999997","GPSHPositioningError":"4.6977336230984168","DateCreated":"2020-09-01T18:08:04+02:00"}}}}
476	2020-09-03 20:47:14.826322	2020-10-22 17:21:27.242704	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012973314139226443","GPSTimeStamp":"2020-09-01T16:21:24Z","GPSImgDirection":"286.59422283000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636116700000003","GPSLatitude":"48.462466670000012","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.400000000000006","GPSHPositioningError":"8.1933486898934635","DateCreated":"2020-09-01T18:21:24+02:00"}}}}
455	2020-09-03 20:45:15.247934	2020-10-22 17:21:40.82751	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.27839294080899585","GPSTimeStamp":"2020-09-01T16:21:57Z","GPSImgDirection":"15.783966060000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.46245832999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.400000000000006","GPSHPositioningError":"5.2610764686576958","DateCreated":"2020-09-01T18:21:56+02:00"}}}}
402	2020-09-03 20:43:28.703133	2020-10-22 17:24:48.9518	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.16996370256129506","GPSTimeStamp":"2020-09-01T16:26:07Z","GPSImgDirection":"83.989288310000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634383300000004","GPSLatitude":"48.462508330000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.900000000000006","GPSHPositioningError":"9.8710686204431735","DateCreated":"2020-09-01T18:26:06+02:00"}}}}
322	2020-09-03 20:43:16.802821	2020-10-22 17:32:02.345351	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.049918767064557619","GPSTimeStamp":"2020-09-01T16:51:56Z","GPSImgDirection":"102.3353386","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6640666700000004","GPSLatitude":"48.462628329999987","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.700000000000003","GPSHPositioningError":"4.4832489857375881","DateCreated":"2020-09-01T18:51:55+02:00"}}}}
508	2020-10-27 10:10:54.154253	2020-10-27 10:11:18.815273	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.050399914387146909","GPSTimeStamp":"2020-10-26T13:34:37Z","GPSImgDirection":"149.03082277000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634166700000002","GPSLatitude":"48.463413329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"87.799999999999997","GPSHPositioningError":"11.779223001882595","DateCreated":"2020-10-26T14:34:37+01:00"}}}}
324	2020-09-03 20:43:17.160889	2020-10-27 10:41:21.391016	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.039670463620696907","GPSTimeStamp":"2020-09-01T14:15:29Z","GPSImgDirection":"180.45736698000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631916699999998","GPSLatitude":"48.462161670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.200000000000003","GPSHPositioningError":"8.0463432609355348","DateCreated":"2020-09-01T16:15:28+02:00"}}}}
393	2020-09-03 20:43:27.205109	2020-10-22 16:01:16.401049	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.022893533110281406","GPSTimeStamp":"2020-09-01T13:16:41Z","GPSImgDirection":"36.111968989999994","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628166700000002","GPSLatitude":"48.462708329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.599999999999994","GPSHPositioningError":"4.8140628433311363","DateCreated":"2020-09-01T15:16:41+02:00"}}}}
369	2020-09-03 20:43:23.719149	2020-10-22 16:02:01.760827	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0055735092631202729","GPSTimeStamp":"2020-09-01T13:18:46Z","GPSImgDirection":"266.53277592000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629833300000003","GPSLatitude":"48.462428329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.299999999999997","GPSHPositioningError":"4.9489894516466704","DateCreated":"2020-09-01T15:18:46+02:00"}}}}
266	2020-09-03 20:43:08.882963	2020-10-22 16:02:22.865535	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0055735092631202729","GPSTimeStamp":"2020-09-01T13:18:46Z","GPSImgDirection":"266.53277592000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629833300000003","GPSLatitude":"48.462428329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.299999999999997","GPSHPositioningError":"4.9489894516466704","DateCreated":"2020-09-01T15:18:46+02:00"}}}}
342	2020-09-03 20:43:20.035905	2020-10-22 17:12:59.640748	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.085228353751850922","GPSTimeStamp":"2020-09-01T16:09:23Z","GPSImgDirection":"330.20085166999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.462336669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.200000000000003","GPSHPositioningError":"12.400949667616334","DateCreated":"2020-09-01T18:09:22+02:00"}}}}
413	2020-09-03 20:43:29.985013	2020-10-22 17:15:01.704713	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.15696150059588582","GPSTimeStamp":"2020-09-01T16:13:53Z","GPSImgDirection":"73.309326170000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635383300000002","GPSLatitude":"48.462403329999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.900000000000006","GPSHPositioningError":"8.4062557838238021","DateCreated":"2020-09-01T18:13:52+02:00"}}}}
386	2020-09-03 20:43:26.175029	2020-10-22 17:16:44.097617	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11150857813327229","GPSTimeStamp":"2020-09-01T16:19:15Z","GPSImgDirection":"259.85726949999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638283300000003","GPSLatitude":"48.462441670000011","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.200000000000003","GPSHPositioningError":"9.1217137390125771","DateCreated":"2020-09-01T18:19:14+02:00"}}}}
473	2020-09-03 20:47:14.033073	2020-10-27 10:25:44.948487	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.46515577986994078","GPSTimeStamp":"2020-09-01T13:53:59Z","GPSImgDirection":"342.09960937999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621633299999994","GPSLatitude":"48.462333329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.900000000000006","GPSHPositioningError":"15.237731622887395","DateCreated":"2020-09-01T15:53:59+02:00"}}}}
282	2020-09-03 20:43:11.057285	2020-10-27 10:26:50.239983	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.018118841572369787","GPSTimeStamp":"2020-09-01T13:53:20Z","GPSImgDirection":"42.087738069999993","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6620866699999999","GPSLatitude":"48.46237167000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.099999999999994","GPSHPositioningError":"4.1252931411557006","DateCreated":"2020-09-01T15:53:19+02:00"}}}}
527	2020-10-27 10:41:28.85943	2020-10-27 10:41:52.883237	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0021529786752946074","GPSTimeStamp":"2020-10-26T14:25:45Z","GPSImgDirection":"153.75562284","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631833299999998","GPSLatitude":"48.462146670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"9.3747888048189232","DateCreated":"2020-10-26T15:25:44+01:00"}}}}
302	2020-09-03 20:43:13.910241	2020-10-22 16:07:20.738991	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.009447998361583965","GPSTimeStamp":"2020-09-01T13:23:50Z","GPSImgDirection":"118.08135792","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6620116700000005","GPSLatitude":"48.462446670000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.900000000000006","GPSHPositioningError":"4.2855626816776633","DateCreated":"2020-09-01T15:23:49+02:00"}}}}
462	2020-09-03 20:47:10.775991	2020-10-22 17:13:43.299546	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.011102675453247897","GPSTimeStamp":"2020-09-01T16:10:04Z","GPSImgDirection":"125.30550775000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636216699999999","GPSLatitude":"48.462311669999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.5","GPSHPositioningError":"9.245792736935341","DateCreated":"2020-09-01T18:10:04+02:00"}}}}
337	2020-09-03 20:43:19.240292	2020-10-22 17:15:34.478413	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.14673645808549451","GPSTimeStamp":"2020-09-01T16:15:29Z","GPSImgDirection":"79.12335204","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.462454999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.5","GPSHPositioningError":"5.9804199581392208","DateCreated":"2020-09-01T18:15:29+02:00"}}}}
474	2020-09-03 20:47:14.29126	2020-10-22 17:21:51.695384	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.27839294080899585","GPSTimeStamp":"2020-09-01T16:21:57Z","GPSImgDirection":"15.783966060000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.46245832999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.400000000000006","GPSHPositioningError":"5.2610764686576958","DateCreated":"2020-09-01T18:21:56+02:00"}}}}
304	2020-09-03 20:43:14.469957	2020-10-22 17:22:42.167757	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.079740270975617963","GPSTimeStamp":"2020-09-01T16:24:23Z","GPSImgDirection":"179.29981993000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635749999999994","GPSLatitude":"48.462566670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.5","GPSHPositioningError":"10.728374297618593","DateCreated":"2020-09-01T18:24:22+02:00"}}}}
463	2020-09-03 20:47:11.263842	2020-10-22 17:26:45.582808	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.086901605133918078","GPSTimeStamp":"2020-09-01T16:27:41Z","GPSImgDirection":"127.51781472999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634700000000002","GPSLatitude":"48.462416670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.700000000000003","GPSHPositioningError":"4.6343133306484088","DateCreated":"2020-09-01T18:27:41+02:00"}}}}
440	2020-09-03 20:43:34.241131	2020-10-22 17:27:57.724371	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010091121308486545","GPSTimeStamp":"2020-09-01T16:30:23Z","GPSImgDirection":"173.28211991000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635333299999995","GPSLatitude":"48.462630000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96","GPSHPositioningError":"7.9926532190500739","DateCreated":"2020-09-01T18:30:22+02:00"}}}}
392	2020-09-03 20:43:27.084976	2020-10-22 17:28:57.542732	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.15585859133546603","GPSTimeStamp":"2020-09-01T16:32:29Z","GPSImgDirection":"251.03739931000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634450000000003","GPSLatitude":"48.462729999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95","GPSHPositioningError":"9.1245602165087956","DateCreated":"2020-09-01T18:32:29+02:00"}}}}
317	2020-09-03 20:43:16.113958	2020-10-22 16:18:39.885321	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.047838434575067465","GPSTimeStamp":"2020-09-01T14:07:45Z","GPSImgDirection":"167.97685242000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628366700000003","GPSLatitude":"48.462366670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.400000000000006","GPSHPositioningError":"4.4813729440638852","DateCreated":"2020-09-01T16:07:45+02:00"}}}}
364	2020-09-03 20:43:23.037111	2020-10-22 16:18:57.433486	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012533367612629369","GPSTimeStamp":"2020-09-01T14:08:46Z","GPSImgDirection":"194.62842574999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628616700000003","GPSLatitude":"48.462336669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.599999999999994","GPSHPositioningError":"4.3634561374525029","DateCreated":"2020-09-01T16:08:45+02:00"}}}}
374	2020-09-03 20:43:24.492434	2020-10-27 10:19:44.559616	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.014216504063955585","GPSTimeStamp":"2020-09-01T14:03:50Z","GPSImgDirection":"81.985321099999993","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621866699999996","GPSLatitude":"48.462775000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.099999999999994","GPSHPositioningError":"6.9534042319921063","DateCreated":"2020-09-01T16:03:50+02:00"}}}}
378	2020-09-03 20:43:25.090944	2020-10-27 10:22:02.545476	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.020953092724649416","GPSTimeStamp":"2020-09-01T14:03:08Z","GPSImgDirection":"32.445373540000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621416699999996","GPSLatitude":"48.462749999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.799999999999997","GPSHPositioningError":"4.458699391065867","DateCreated":"2020-09-01T16:03:08+02:00"}}}}
434	2020-09-03 20:43:33.363073	2020-10-27 10:27:46.524779	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.068873286247054341","GPSTimeStamp":"2020-09-01T13:52:14Z","GPSImgDirection":"264.64752199999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6619533300000002","GPSLatitude":"48.462330000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.700000000000003","GPSHPositioningError":"4.1534790427445012","DateCreated":"2020-09-01T15:52:14+02:00"}}}}
446	2020-09-03 20:45:13.638024	2020-10-27 10:33:33.754248	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.13172042369302064","GPSTimeStamp":"2020-09-01T14:09:56Z","GPSImgDirection":"42.406463640000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627716700000001","GPSLatitude":"48.462261669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.799999999999997","GPSHPositioningError":"16.394096138410774","DateCreated":"2020-09-01T16:09:56+02:00"}}}}
376	2020-09-03 20:43:24.715427	2020-10-27 10:34:19.169341	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.030352631611456668","GPSTimeStamp":"2020-09-01T14:13:14Z","GPSImgDirection":"164.81848144999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66309167","GPSLatitude":"48.462270000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"3.9424406497292797","DateCreated":"2020-09-01T16:13:14+02:00"}}}}
420	2020-09-03 20:43:31.250204	2020-10-27 10:39:57.535449	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.071092158540919048","GPSTimeStamp":"2020-09-01T14:13:56Z","GPSImgDirection":"295.48509229000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630783299999998","GPSLatitude":"48.462128329999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"10.226248182258846","DateCreated":"2020-09-01T16:13:55+02:00"}}}}
309	2020-09-03 20:43:14.936171	2020-10-22 16:21:41.234166	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.20150603348819809","GPSTimeStamp":"2020-09-01T14:16:47Z","GPSImgDirection":"193.86171719999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632199999999999","GPSLatitude":"48.462078329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"4.0509434282129959","DateCreated":"2020-09-01T16:16:46+02:00"}}}}
429	2020-09-03 20:43:32.666251	2020-10-22 16:22:24.463151	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.29765296011890024","GPSTimeStamp":"2020-09-01T14:18:28Z","GPSImgDirection":"235.08839405999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632383299999995","GPSLatitude":"48.46196667000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.200000000000003","GPSHPositioningError":"6.6014733840304185","DateCreated":"2020-09-01T16:18:28+02:00"}}}}
330	2020-09-03 20:43:18.069393	2020-10-22 16:24:03.420276	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.026612449441876795","GPSTimeStamp":"2020-09-01T14:22:24Z","GPSImgDirection":"214.94202413000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635499999999999","GPSLatitude":"48.461874999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.299999999999997","GPSHPositioningError":"6.2291757932286123","DateCreated":"2020-09-01T16:22:23+02:00"}}}}
294	2020-09-03 20:43:12.883136	2020-10-22 16:27:26.512014	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.029064768926759667","GPSTimeStamp":"2020-09-01T14:29:36Z","GPSImgDirection":"194.19494629000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635199999999997","GPSLatitude":"48.461608330000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.400000000000006","GPSHPositioningError":"4.8274354997885238","DateCreated":"2020-09-01T16:29:35+02:00"}}}}
348	2020-09-03 20:43:20.999853	2020-10-22 16:28:21.174839	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.015027155171126844","GPSTimeStamp":"2020-09-01T14:30:50Z","GPSImgDirection":"259.79985062999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635133299999998","GPSLatitude":"48.461588329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.799999999999997","GPSHPositioningError":"8.8593898448221253","DateCreated":"2020-09-01T16:30:49+02:00"}}}}
443	2020-09-03 20:45:13.29638	2020-10-27 10:52:57.226899	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12668965756273398","GPSTimeStamp":"2020-09-01T14:19:07Z","GPSImgDirection":"13.262268069999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631299999999998","GPSLatitude":"48.461925000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"5.0025673463312996","DateCreated":"2020-09-01T16:19:07+02:00"}}}}
459	2020-09-03 20:47:10.23744	2020-10-27 10:56:59.4523	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.019292602315384245","GPSTimeStamp":"2020-09-01T14:23:22Z","GPSImgDirection":"338.06716929000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633866700000004","GPSLatitude":"48.461829999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.5","GPSHPositioningError":"4.3904853074411525","DateCreated":"2020-09-01T16:23:21+02:00"}}}}
289	2020-09-03 20:43:12.136503	2020-10-27 10:59:36.967513	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.020021224390474709","GPSTimeStamp":"2020-09-01T14:27:43Z","GPSImgDirection":"232.44625850000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635333299999995","GPSLatitude":"48.46172","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"18.1854688470296","DateCreated":"2020-09-01T16:27:43+02:00"}}}}
425	2020-09-03 20:43:31.940934	2020-10-22 16:27:50.483877	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12574183940830519","GPSTimeStamp":"2020-09-01T14:30:09Z","GPSImgDirection":"209.81430040999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.461620000000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.299999999999997","GPSHPositioningError":"7.3153970423760404","DateCreated":"2020-09-01T16:30:08+02:00"}}}}
356	2020-09-03 20:43:21.979379	2020-10-22 16:32:52.923348	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.31646496066079416","GPSTimeStamp":"2020-09-01T14:34:44Z","GPSImgDirection":"250.79682913000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633333299999995","GPSLatitude":"48.461521670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.900000000000006","GPSHPositioningError":"7.9008387144659693","DateCreated":"2020-09-01T16:34:44+02:00"}}}}
399	2020-09-03 20:43:28.146374	2020-10-22 17:17:00.384751	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.65165263439740573","GPSTimeStamp":"2020-09-01T16:19:47Z","GPSImgDirection":"212.31250764000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637583299999994","GPSLatitude":"48.462508330000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99","GPSHPositioningError":"7.4254130788922508","DateCreated":"2020-09-01T18:19:47+02:00"}}}}
427	2020-09-03 20:43:32.273362	2020-10-22 17:22:14.825986	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10051354762851661","GPSTimeStamp":"2020-09-01T16:23:56Z","GPSImgDirection":"159.05798342999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635700000000004","GPSLatitude":"48.462575000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.099999999999994","GPSHPositioningError":"4.8412249099330928","DateCreated":"2020-09-01T18:23:55+02:00"}}}}
271	2020-09-03 20:43:09.725049	2020-10-22 17:24:02.097733	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.035168167216557619","GPSTimeStamp":"2020-09-01T16:25:24Z","GPSImgDirection":"173.76921841999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635499999999999","GPSLatitude":"48.462555000000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.099999999999994","GPSHPositioningError":"11.467174641877476","DateCreated":"2020-09-01T18:25:24+02:00"}}}}
450	2020-09-03 20:45:14.444203	2020-10-27 10:54:56.891098	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.23120242348920308","GPSTimeStamp":"2020-09-01T14:20:05Z","GPSImgDirection":"85.31655889999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633616700000005","GPSLatitude":"48.461916670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95","GPSHPositioningError":"4.4636293113736727","DateCreated":"2020-09-01T16:20:04+02:00"}}}}
408	2020-09-03 20:43:29.496963	2020-10-27 10:58:25.950845	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10093744101671455","GPSTimeStamp":"2020-09-01T14:28:38Z","GPSImgDirection":"50.302886969999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634616700000002","GPSLatitude":"48.461675","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94","GPSHPositioningError":"4.4999842465106017","DateCreated":"2020-09-01T16:28:38+02:00"}}}}
372	2020-09-03 20:43:24.205189	2020-10-27 11:03:13.736002	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.22296205157897275","GPSTimeStamp":"2020-09-01T14:36:29Z","GPSImgDirection":"243.41471860999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66330833","GPSLatitude":"48.461553330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"4.6398571892242781","DateCreated":"2020-09-01T16:36:28+02:00"}}}}
310	2020-09-03 20:43:15.05152	2020-10-22 16:32:03.373953	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.091560974690462274","GPSTimeStamp":"2020-09-01T14:32:05Z","GPSImgDirection":"300.69732669000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634783299999998","GPSLatitude":"48.461463330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.400000000000006","GPSHPositioningError":"4.1667193326170766","DateCreated":"2020-09-01T16:32:04+02:00"}}}}
329	2020-09-03 20:43:17.944815	2020-10-22 16:32:22.275663	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1008271425289117","GPSTimeStamp":"2020-09-01T14:32:53Z","GPSImgDirection":"172.67701717","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633783299999996","GPSLatitude":"48.461505000000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.799999999999997","GPSHPositioningError":"5.2664652964738332","DateCreated":"2020-09-01T16:32:53+02:00"}}}}
281	2020-09-03 20:43:10.945796	2020-10-22 17:23:24.689877	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.087108738726668897","GPSTimeStamp":"2020-09-01T16:24:56Z","GPSImgDirection":"169.97811900000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635450000000001","GPSLatitude":"48.46255","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.200000000000003","GPSHPositioningError":"13.832619371016612","DateCreated":"2020-09-01T18:24:55+02:00"}}}}
469	2020-09-03 20:47:13.029937	2020-10-22 17:27:42.535474	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.16096992799661161","GPSTimeStamp":"2020-09-01T16:29:58Z","GPSImgDirection":"77.008636479999979","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66349167","GPSLatitude":"48.462661670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"5.0168562564632886","DateCreated":"2020-09-01T18:29:57+02:00"}}}}
418	2020-09-03 20:43:30.803272	2020-10-27 10:12:39.145084	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12398778645701009","GPSTimeStamp":"2020-09-01T13:59:21Z","GPSImgDirection":"25.823577910000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621633299999994","GPSLatitude":"48.462761669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.700000000000003","GPSHPositioningError":"4.3725029560022399","DateCreated":"2020-09-01T15:59:20+02:00"}}}}
452	2020-09-03 20:45:14.702762	2020-10-27 10:14:41.904113	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.017648220063726686","GPSTimeStamp":"2020-09-01T14:00:07Z","GPSImgDirection":"35.495056179999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621716700000002","GPSLatitude":"48.462761669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.099999999999994","GPSHPositioningError":"9.9685219475002729","DateCreated":"2020-09-01T16:00:06+02:00"}}}}
464	2020-09-03 20:47:11.394255	2020-10-27 10:16:43.313114	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.16128106428957323","GPSTimeStamp":"2020-09-01T14:00:35Z","GPSImgDirection":"55.615539569999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621133299999995","GPSLatitude":"48.46280333","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.200000000000003","GPSHPositioningError":"6.3844057665260197","DateCreated":"2020-09-01T16:00:35+02:00"}}}}
382	2020-09-03 20:43:25.5381	2020-10-27 10:18:40.602415	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0060664257006283846","GPSTimeStamp":"2020-09-01T14:01:44Z","GPSImgDirection":"359.49194312999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621699999999997","GPSLatitude":"48.462820000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.599999999999994","GPSHPositioningError":"4.7787745294353225","DateCreated":"2020-09-01T16:01:43+02:00"}}}}
379	2020-09-03 20:43:25.196881	2020-10-22 16:36:48.902107	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.21534779653336356","GPSTimeStamp":"2020-09-01T14:39:26Z","GPSImgDirection":"184.82858289999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632716700000003","GPSLatitude":"48.461620000000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.299999999999997","GPSHPositioningError":"4.6159732766474342","DateCreated":"2020-09-01T16:39:25+02:00"}}}}
419	2020-09-03 20:43:30.944575	2020-10-22 16:37:36.179688	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.26825070377339227","GPSTimeStamp":"2020-09-01T14:40:52Z","GPSImgDirection":"328.42602539000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632166700000006","GPSLatitude":"48.461508330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96","GPSHPositioningError":"13.146074914490699","DateCreated":"2020-09-01T16:40:52+02:00"}}}}
468	2020-09-03 20:47:12.887322	2020-10-22 16:37:56.017223	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11717549704133012","GPSTimeStamp":"2020-09-01T14:41:27Z","GPSImgDirection":"356.34841954000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631833299999998","GPSLatitude":"48.461505000000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.200000000000003","GPSHPositioningError":"5.7452584685956243","DateCreated":"2020-09-01T16:41:27+02:00"}}}}
400	2020-09-03 20:43:28.255468	2020-10-22 16:38:37.570344	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.05346066501711691","GPSTimeStamp":"2020-09-01T14:42:36Z","GPSImgDirection":"163.01194766","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630700000000003","GPSLatitude":"48.46142167","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97","GPSHPositioningError":"4.4484508656325463","DateCreated":"2020-09-01T16:42:36+02:00"}}}}
345	2020-09-03 20:43:20.418341	2020-10-22 16:38:55.124631	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.13987381758072476","GPSTimeStamp":"2020-09-01T14:43:11Z","GPSImgDirection":"49.400268549999993","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629550000000002","GPSLatitude":"48.46143","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97","GPSHPositioningError":"8.1016579308483117","DateCreated":"2020-09-01T16:43:10+02:00"}}}}
343	2020-09-03 20:43:20.186461	2020-10-22 16:40:00.772624	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.21919184918214585","GPSTimeStamp":"2020-09-01T14:44:34Z","GPSImgDirection":"18.120239259999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628716700000004","GPSLatitude":"48.461411669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.599999999999994","GPSHPositioningError":"5.518480148694354","DateCreated":"2020-09-01T16:44:33+02:00"}}}}
377	2020-09-03 20:43:24.916022	2020-10-27 11:06:48.905905	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12581816322356312","GPSTimeStamp":"2020-09-01T14:38:09Z","GPSImgDirection":"301.29003905999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633133299999998","GPSLatitude":"48.461536670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96","GPSHPositioningError":"7.0036695075757578","DateCreated":"2020-09-01T16:38:09+02:00"}}}}
371	2020-09-03 20:43:24.021995	2020-10-27 11:07:37.231323	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12581816322356312","GPSTimeStamp":"2020-09-01T14:38:09Z","GPSImgDirection":"301.29003905999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633133299999998","GPSLatitude":"48.461536670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96","GPSHPositioningError":"7.0036695075757578","DateCreated":"2020-09-01T16:38:09+02:00"}}}}
295	2020-09-03 20:43:12.969104	2020-10-22 16:40:28.189438	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.042608253616156014","GPSTimeStamp":"2020-09-01T14:45:05Z","GPSImgDirection":"265.78387458000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.662855","GPSLatitude":"48.461400000000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.900000000000006","GPSHPositioningError":"6.4285719043495639","DateCreated":"2020-09-01T16:45:04+02:00"}}}}
328	2020-09-03 20:43:17.676112	2020-10-22 16:46:13.547484	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.043312981706750867","GPSTimeStamp":"2020-09-01T14:59:43Z","GPSImgDirection":"73.87155147","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633583299999999","GPSLatitude":"48.460841670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"101.2","GPSHPositioningError":"4.2884836117842111","DateCreated":"2020-09-01T16:59:42+02:00"}}}}
431	2020-09-03 20:43:33.058935	2020-10-22 17:28:35.271468	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.069582052533674582","GPSTimeStamp":"2020-09-01T16:31:44Z","GPSImgDirection":"221.24232488999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634499999999997","GPSLatitude":"48.462666670000011","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"5.6906091500589167","DateCreated":"2020-09-01T18:31:44+02:00"}}}}
509	2020-10-27 10:13:03.227877	2020-10-27 10:13:32.476908	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.015451250602240457","GPSTimeStamp":"2020-10-26T13:39:14Z","GPSImgDirection":"44.231201170000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621616700000006","GPSLatitude":"48.462763329999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.900000000000006","GPSHPositioningError":"4.9481251316621027","DateCreated":"2020-10-26T14:39:14+01:00"}}}}
523	2020-10-27 10:32:37.714455	2020-10-27 10:33:13.058412	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12149875610760118","GPSTimeStamp":"2020-10-26T14:13:07Z","GPSImgDirection":"244.35456832","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632383299999995","GPSLatitude":"48.462775000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93","GPSHPositioningError":"9.0592785139161851","DateCreated":"2020-10-26T15:13:06+01:00"}}}}
510	2020-10-27 10:15:09.929434	2020-10-27 10:16:09.140363	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.015451250602240457","GPSTimeStamp":"2020-10-26T13:39:14Z","GPSImgDirection":"44.231201170000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621616700000006","GPSLatitude":"48.462763329999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.900000000000006","GPSHPositioningError":"4.9481251316621027","DateCreated":"2020-10-26T14:39:14+01:00"}}}}
525	2020-10-27 10:39:21.328375	2020-10-27 10:39:40.059316	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.094161689240346597","GPSTimeStamp":"2020-10-26T14:23:56Z","GPSImgDirection":"164.47733306000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631116700000002","GPSLatitude":"48.462229999999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.400000000000006","GPSHPositioningError":"4.7256621645325385","DateCreated":"2020-10-26T15:23:56+01:00"}}}}
519	2020-10-27 10:27:56.073028	2020-10-27 10:28:14.96712	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12481474124891138","GPSTimeStamp":"2020-10-26T13:55:30Z","GPSImgDirection":"273.95693979999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6619450000000002","GPSLatitude":"48.462294999999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93","GPSHPositioningError":"4.5703878443072226","DateCreated":"2020-10-26T14:55:30+01:00"}}}}
521	2020-10-27 10:30:16.504298	2020-10-27 10:30:46.112159	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.052868291694116457","GPSTimeStamp":"2020-10-26T13:58:19Z","GPSImgDirection":"84.638855049999989","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6618166699999999","GPSLatitude":"48.462341670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.700000000000003","GPSHPositioningError":"11.932755280878148","DateCreated":"2020-10-26T14:58:18+01:00"}}}}
290	2020-09-03 20:43:12.257348	2020-10-22 16:41:18.489436	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.020565554500085466","GPSTimeStamp":"2020-09-01T14:46:22Z","GPSImgDirection":"94.113431420000012","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627866700000005","GPSLatitude":"48.461463330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.200000000000003","GPSHPositioningError":"13.626882776686314","DateCreated":"2020-09-01T16:46:22+02:00"}}}}
334	2020-09-03 20:43:18.548004	2020-10-22 16:44:40.865956	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.035522412543916013","GPSTimeStamp":"2020-09-01T14:56:05Z","GPSImgDirection":"173.90283203000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630799999999999","GPSLatitude":"48.461208329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99","GPSHPositioningError":"5.5893990441118859","DateCreated":"2020-09-01T16:56:04+02:00"}}}}
355	2020-09-03 20:43:21.869664	2020-10-22 16:45:37.962503	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10681958498582089","GPSTimeStamp":"2020-09-01T14:57:48Z","GPSImgDirection":"215.42632293000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631166700000004","GPSLatitude":"48.461016670000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.400000000000006","GPSHPositioningError":"4.5235042229529911","DateCreated":"2020-09-01T16:57:47+02:00"}}}}
283	2020-09-03 20:43:11.273067	2020-10-22 17:29:15.730234	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.060316365249100674","GPSTimeStamp":"2020-09-01T16:33:43Z","GPSImgDirection":"82.054931639999992","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632716700000003","GPSLatitude":"48.462628329999987","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.5","GPSHPositioningError":"4.6488346818017146","DateCreated":"2020-09-01T18:33:43+02:00"}}}}
511	2020-10-27 10:16:59.003262	2020-10-27 10:17:18.720496	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0068440102102627015","GPSTimeStamp":"2020-10-26T13:42:46Z","GPSImgDirection":"64.680114720000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621466700000003","GPSLatitude":"48.462791670000009","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.799999999999997","GPSHPositioningError":"6.7008692687915463","DateCreated":"2020-10-26T14:42:45+01:00"}}}}
513	2020-10-27 10:20:19.894663	2020-10-27 10:20:40.52687	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0022683162239026688","GPSTimeStamp":"2020-10-26T13:45:18Z","GPSImgDirection":"105.87227249","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621950000000005","GPSLatitude":"48.462749999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.799999999999997","GPSHPositioningError":"4.5472242783123615","DateCreated":"2020-10-26T14:45:18+01:00"}}}}
514	2020-10-27 10:22:14.173567	2020-10-27 10:22:51.169157	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.045960441211398154","GPSTimeStamp":"2020-10-26T13:46:29Z","GPSImgDirection":"35.103637700000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621883300000002","GPSLatitude":"48.46271333","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.099999999999994","GPSHPositioningError":"6.9919310132429935","DateCreated":"2020-10-26T14:46:28+01:00"}}}}
517	2020-10-27 10:26:02.615264	2020-10-27 10:26:25.228982	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.014493088241599847","GPSTimeStamp":"2020-10-26T13:52:50Z","GPSImgDirection":"337.19641125000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621666700000004","GPSLatitude":"48.462288329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.299999999999997","GPSHPositioningError":"4.7831449312001153","DateCreated":"2020-10-26T14:52:49+01:00"}}}}
436	2020-09-03 20:43:33.62075	2020-10-22 16:41:57.555298	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.031011726724588143","GPSTimeStamp":"2020-09-01T14:48:34Z","GPSImgDirection":"278.58912656000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6625666699999999","GPSLatitude":"48.461229999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.900000000000006","GPSHPositioningError":"5.4118173429154668","DateCreated":"2020-09-01T16:48:33+02:00"}}}}
278	2020-09-03 20:43:10.468419	2020-10-22 16:47:29.201522	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.018974101162771845","GPSTimeStamp":"2020-09-01T15:03:36Z","GPSImgDirection":"67.032745360000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6640299999999995","GPSLatitude":"48.460761669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"100.3","GPSHPositioningError":"4.4114744081843673","DateCreated":"2020-09-01T17:03:35+02:00"}}}}
288	2020-09-03 20:43:12.022253	2020-10-22 16:48:10.037288	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.027648534610559928","GPSTimeStamp":"2020-09-01T15:06:44Z","GPSImgDirection":"122.43084721","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6642049999999999","GPSLatitude":"48.460888330000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.599999999999994","GPSHPositioningError":"4.5238286103651451","DateCreated":"2020-09-01T17:06:44+02:00"}}}}
410	2020-09-03 20:43:29.696855	2020-10-22 17:29:40.976382	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.01135986951145721","GPSTimeStamp":"2020-09-01T16:47:58Z","GPSImgDirection":"107.79288285","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6639333299999999","GPSLatitude":"48.462405000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.900000000000006","GPSHPositioningError":"4.1697055051178227","DateCreated":"2020-09-01T18:47:57+02:00"}}}}
299	2020-09-03 20:43:13.583996	2020-10-27 10:51:59.49292	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1343562155188977","GPSTimeStamp":"2020-09-01T14:17:55Z","GPSImgDirection":"314.54125998000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632283299999999","GPSLatitude":"48.46194667000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.799999999999997","GPSHPositioningError":"4.6404626481522673","DateCreated":"2020-09-01T16:17:54+02:00"}}}}
516	2020-10-27 10:25:02.610281	2020-10-27 10:25:25.126179	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.20297598829462027","GPSTimeStamp":"2020-10-26T13:49:14Z","GPSImgDirection":"222.36154187000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6622333300000003","GPSLatitude":"48.462528329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.400000000000006","GPSHPositioningError":"4.8313420716854196","DateCreated":"2020-10-26T14:49:13+01:00"}}}}
522	2020-10-27 10:31:40.193328	2020-10-27 10:32:07.600486	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.024744879455891627","GPSTimeStamp":"2020-10-26T14:09:33Z","GPSImgDirection":"81.777801539999984","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627966700000001","GPSLatitude":"48.46268332999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.200000000000003","GPSHPositioningError":"18.351472995090017","DateCreated":"2020-10-26T15:09:33+01:00"}}}}
524	2020-10-27 10:33:43.844193	2020-10-27 10:34:01.274158	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.020554574188002953","GPSTimeStamp":"2020-10-26T14:20:26Z","GPSImgDirection":"52.039672799999991","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66280333","GPSLatitude":"48.462241670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.200000000000003","GPSHPositioningError":"5.6584016098893199","DateCreated":"2020-10-26T15:20:26+01:00"}}}}
303	2020-09-03 20:43:14.164997	2020-10-22 16:43:16.017233	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010111357085194724","GPSTimeStamp":"2020-09-01T14:50:14Z","GPSImgDirection":"44.531646729999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6625450000000002","GPSLatitude":"48.461166669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.700000000000003","GPSHPositioningError":"7.0968249168430599","DateCreated":"2020-09-01T16:50:14+02:00"}}}}
341	2020-09-03 20:43:19.88968	2020-10-22 17:30:23.684488	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.084289811534337983","GPSTimeStamp":"2020-09-01T16:48:48Z","GPSImgDirection":"224.77153024999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6640466700000003","GPSLatitude":"48.462354999999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.700000000000003","GPSHPositioningError":"7.7187549880287314","DateCreated":"2020-09-01T18:48:47+02:00"}}}}
409	2020-09-03 20:43:29.610172	2020-10-22 17:32:56.799315	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.055502265736116163","GPSTimeStamp":"2020-09-01T16:53:11Z","GPSImgDirection":"241.72735590000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638700000000002","GPSLatitude":"48.462671669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.5","GPSHPositioningError":"4.1091511267909855","DateCreated":"2020-09-01T18:53:11+02:00"}}}}
279	2020-09-03 20:43:10.714358	2020-10-27 10:28:41.759108	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.090715140154644894","GPSTimeStamp":"2020-09-01T13:51:04Z","GPSImgDirection":"61.645843499999991","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6617866700000001","GPSLatitude":"48.462366670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.200000000000003","GPSHPositioningError":"6.2448392469590672","DateCreated":"2020-09-01T15:51:03+02:00"}}}}
296	2020-09-03 20:43:13.070933	2020-10-27 10:30:05.753165	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.090889818959303703","GPSTimeStamp":"2020-09-01T13:50:22Z","GPSImgDirection":"77.46194457","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6617333300000001","GPSLatitude":"48.462379999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.400000000000006","GPSHPositioningError":"4.758561151079137","DateCreated":"2020-09-01T15:50:22+02:00"}}}}
528	2020-10-27 10:52:14.268904	2020-10-27 10:52:36.771273	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.07817999271820561","GPSTimeStamp":"2020-10-26T14:26:55Z","GPSImgDirection":"310.21958925999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632449999999999","GPSLatitude":"48.46194667000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"5.6281584204959456","DateCreated":"2020-10-26T15:26:54+01:00"}}}}
277	2020-09-03 20:43:10.306558	2020-10-27 10:53:58.079151	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.061645239578892133","GPSTimeStamp":"2020-09-01T14:21:09Z","GPSImgDirection":"82.748077429999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634549999999999","GPSLatitude":"48.461961670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.200000000000003","GPSHPositioningError":"4.4070837308059208","DateCreated":"2020-09-01T16:21:08+02:00"}}}}
531	2020-10-27 10:55:15.249748	2020-10-27 10:55:36.755025	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.014499979092754193","GPSTimeStamp":"2020-10-26T14:30:11Z","GPSImgDirection":"82.815460229999985","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633550000000001","GPSLatitude":"48.4619","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.900000000000006","GPSHPositioningError":"12.029074820257565","DateCreated":"2020-10-26T15:30:10+01:00"}}}}
458	2020-09-03 20:45:15.607977	2020-10-27 10:55:57.676779	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.052530284983877067","GPSTimeStamp":"2020-09-01T14:24:43Z","GPSImgDirection":"36.325408940000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632633299999999","GPSLatitude":"48.46181167000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.900000000000006","GPSHPositioningError":"11.633081719724318","DateCreated":"2020-09-01T16:24:43+02:00"}}}}
276	2020-09-03 20:43:10.206095	2020-10-22 17:31:39.576444	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.20431724189632125","GPSTimeStamp":"2020-09-01T16:50:57Z","GPSImgDirection":"74.356201170000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641783299999995","GPSLatitude":"48.462575000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"10.324453134547232","DateCreated":"2020-09-01T18:50:56+02:00"}}}}
526	2020-10-27 10:40:08.174586	2020-10-27 10:41:03.730298	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.043364334816012949","GPSTimeStamp":"2020-10-26T14:25:00Z","GPSImgDirection":"293.02807596999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631799999999997","GPSLatitude":"48.462166670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96","GPSHPositioningError":"5.5250283607487241","DateCreated":"2020-10-26T15:24:59+01:00"}}}}
507	2020-10-27 10:07:49.606123	2020-10-27 10:09:36.016424	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0078220153192410744","GPSTimeStamp":"2020-10-26T13:23:18Z","GPSImgDirection":"238.52420051999994","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631883299999997","GPSLatitude":"48.463305000000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"88.200000000000003","GPSHPositioningError":"5.2833646420371529","DateCreated":"2020-10-26T14:23:18+01:00"}}}}
529	2020-10-27 10:53:13.080981	2020-10-27 10:53:37.222399	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.044975459557614124","GPSTimeStamp":"2020-10-26T14:27:58Z","GPSImgDirection":"356.77954102000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631549999999997","GPSLatitude":"48.461911669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"10.216491056113698","DateCreated":"2020-10-26T15:27:58+01:00"}}}}
512	2020-10-27 10:18:52.372413	2020-10-27 10:19:21.519011	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.023077970369243989","GPSTimeStamp":"2020-10-26T13:43:46Z","GPSImgDirection":"18.600158690000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621966700000002","GPSLatitude":"48.462788329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.099999999999994","GPSHPositioningError":"5.2041621213392633","DateCreated":"2020-10-26T14:43:46+01:00"}}}}
515	2020-10-27 10:23:41.875895	2020-10-27 10:24:25.068714	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11726865910180599","GPSTimeStamp":"2020-10-26T13:47:26Z","GPSImgDirection":"90.544212689999981","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621883300000002","GPSLatitude":"48.462729999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.099999999999994","GPSHPositioningError":"15.002478698683191","DateCreated":"2020-10-26T14:47:26+01:00"}}}}
518	2020-10-27 10:27:04.556496	2020-10-27 10:27:30.643558	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.013231756165611527","GPSTimeStamp":"2020-10-26T13:53:57Z","GPSImgDirection":"45.405364989999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621449999999998","GPSLatitude":"48.462341670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.400000000000006","GPSHPositioningError":"17.790219435736677","DateCreated":"2020-10-26T14:53:56+01:00"}}}}
520	2020-10-27 10:29:11.96442	2020-10-27 10:29:45.206069	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10934019087433648","GPSTimeStamp":"2020-10-26T13:57:00Z","GPSImgDirection":"38.513244619999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6617950000000001","GPSLatitude":"48.462333329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.5","GPSHPositioningError":"5.9330205742708566","DateCreated":"2020-10-26T14:57:00+01:00"}}}}
532	2020-10-27 10:56:10.232519	2020-10-27 10:56:37.626611	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.14912439887487525","GPSTimeStamp":"2020-10-26T14:32:18Z","GPSImgDirection":"39.813415530000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633299999999998","GPSLatitude":"48.46183332999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.200000000000003","GPSHPositioningError":"6.6167162091274703","DateCreated":"2020-10-26T15:32:17+01:00"}}}}
533	2020-10-27 10:57:11.140171	2020-10-27 10:58:03.764776	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.063948310940374273","GPSTimeStamp":"2020-10-26T14:33:42Z","GPSImgDirection":"350.17742946999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633916699999998","GPSLatitude":"48.461821670000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.200000000000003","GPSHPositioningError":"5.9243522178304788","DateCreated":"2020-10-26T15:33:42+01:00"}}}}
537	2020-10-27 11:03:20.999397	2020-10-27 11:04:11.042294	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.032271042460856603","GPSTimeStamp":"2020-10-26T14:39:26Z","GPSImgDirection":"244.66557309999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633216700000002","GPSLatitude":"48.461538329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"5.0136577225418293","DateCreated":"2020-10-26T15:39:26+01:00"}}}}
539	2020-10-27 11:05:42.500561	2020-10-27 11:06:20.010722	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.032271042460856603","GPSTimeStamp":"2020-10-26T14:39:26Z","GPSImgDirection":"244.66557309999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633216700000002","GPSLatitude":"48.461538329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"5.0136577225418293","DateCreated":"2020-10-26T15:39:26+01:00"}}}}
540	2020-10-27 11:06:55.363999	2020-10-27 11:07:22.728254	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.041610181348025146","GPSTimeStamp":"2020-10-26T14:40:20Z","GPSImgDirection":"291.33929459000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66329167","GPSLatitude":"48.461516670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.099999999999994","GPSHPositioningError":"9.4455742785202403","DateCreated":"2020-10-26T15:40:19+01:00"}}}}
544	2020-10-27 11:14:31.604166	2020-10-27 11:15:36.23741	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0048773111730962887","GPSTimeStamp":"2020-10-26T14:54:41Z","GPSImgDirection":"75.161773699999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629533299999997","GPSLatitude":"48.461283329999986","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.099999999999994","GPSHPositioningError":"5.2394952517236897","DateCreated":"2020-10-26T15:54:41+01:00"}}}}
549	2020-10-27 11:19:06.930447	2020-10-27 11:19:32.850464	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.51418524974454527","GPSTimeStamp":"2020-10-26T15:05:10Z","GPSImgDirection":"220.15341201000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629700000000005","GPSLatitude":"48.461311670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.400000000000006","GPSHPositioningError":"10.314037965783923","DateCreated":"2020-10-26T16:05:09+01:00"}}}}
535	2020-10-27 10:59:47.417935	2020-10-27 11:00:12.521164	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.094103083059873069","GPSTimeStamp":"2020-10-26T14:37:02Z","GPSImgDirection":"226.90858469000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636116700000003","GPSLatitude":"48.461728329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.299999999999997","GPSHPositioningError":"7.4200059145349693","DateCreated":"2020-10-26T15:37:02+01:00"}}}}
536	2020-10-27 11:00:48.484144	2020-10-27 11:01:08.698657	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.026960710066341521","GPSTimeStamp":"2020-10-26T14:38:17Z","GPSImgDirection":"104.10142517999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.663395","GPSLatitude":"48.461570000000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.200000000000003","GPSHPositioningError":"4.7335451384726053","DateCreated":"2020-10-26T15:38:17+01:00"}}}}
541	2020-10-27 11:07:43.215337	2020-10-27 11:08:06.674234	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.041610181348025146","GPSTimeStamp":"2020-10-26T14:40:20Z","GPSImgDirection":"291.33929459000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66329167","GPSLatitude":"48.461516670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.099999999999994","GPSHPositioningError":"9.4455742785202403","DateCreated":"2020-10-26T15:40:19+01:00"}}}}
542	2020-10-27 11:08:29.346807	2020-10-27 11:08:50.197368	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.026858143502858683","GPSTimeStamp":"2020-10-26T14:42:47Z","GPSImgDirection":"120.41172596000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630283300000004","GPSLatitude":"48.461453329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.5","GPSHPositioningError":"5.6533528765115424","DateCreated":"2020-10-26T15:42:46+01:00"}}}}
548	2020-10-27 11:18:25.161896	2020-10-27 11:18:45.314788	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.23188211018965776","GPSTimeStamp":"2020-10-26T15:03:09Z","GPSImgDirection":"162.76432806","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630616700000003","GPSLatitude":"48.461208329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.599999999999994","GPSHPositioningError":"8.2174003755476743","DateCreated":"2020-10-26T16:03:08+01:00"}}}}
543	2020-10-27 11:09:16.030258	2020-10-27 11:09:51.33834	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.046940319239020936","GPSTimeStamp":"2020-10-26T14:50:30Z","GPSImgDirection":"113.36723137000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628966699999999","GPSLatitude":"48.461283329999986","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.599999999999994","GPSHPositioningError":"8.4851248042737399","DateCreated":"2020-10-26T15:50:29+01:00"}}}}
545	2020-10-27 11:15:50.552752	2020-10-27 11:16:21.244342	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0048773111730962887","GPSTimeStamp":"2020-10-26T14:54:41Z","GPSImgDirection":"75.161773699999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629533299999997","GPSLatitude":"48.461283329999986","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.099999999999994","GPSHPositioningError":"5.2394952517236897","DateCreated":"2020-10-26T15:54:41+01:00"}}}}
546	2020-10-27 11:16:49.418341	2020-10-27 11:17:13.26387	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.014165590528671276","GPSTimeStamp":"2020-10-26T14:56:11Z","GPSImgDirection":"265.75788869999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628166700000002","GPSLatitude":"48.461236669999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.799999999999997","GPSHPositioningError":"4.9404845752922943","DateCreated":"2020-10-26T15:56:10+01:00"}}}}
339	2020-09-03 20:43:19.476015	2020-10-27 11:00:29.30666	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.35021072619488702","GPSTimeStamp":"2020-09-01T14:35:37Z","GPSImgDirection":"105.79767040999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633699999999996","GPSLatitude":"48.461604999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.099999999999994","GPSHPositioningError":"4.8485138563155123","DateCreated":"2020-09-01T16:35:36+02:00"}}}}
360	2020-09-03 20:43:22.635688	2020-10-27 11:04:27.690847	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.22296205157897275","GPSTimeStamp":"2020-09-01T14:36:29Z","GPSImgDirection":"243.41471860999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66330833","GPSLatitude":"48.461553330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"4.6398571892242781","DateCreated":"2020-09-01T16:36:28+02:00"}}}}
444	2020-09-03 20:45:13.39879	2020-10-27 11:05:32.441502	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.22296205157897275","GPSTimeStamp":"2020-09-01T14:36:29Z","GPSImgDirection":"243.41471860999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66330833","GPSLatitude":"48.461553330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"4.6398571892242781","DateCreated":"2020-09-01T16:36:28+02:00"}}}}
435	2020-09-03 20:43:33.516038	2020-10-27 11:14:06.96082	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.042961738981795394","GPSTimeStamp":"2020-09-01T14:53:02Z","GPSImgDirection":"71.878082280000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628833299999997","GPSLatitude":"48.461196670000007","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"101","GPSHPositioningError":"5.3392727512703759","DateCreated":"2020-09-01T16:53:01+02:00"}}}}
547	2020-10-27 11:17:34.68198	2020-10-27 11:18:04.084248	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10658605401047966","GPSTimeStamp":"2020-10-26T14:58:20Z","GPSImgDirection":"229.2688599","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628949999999998","GPSLatitude":"48.461296670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.299999999999997","GPSHPositioningError":"12.583128870195116","DateCreated":"2020-10-26T15:58:20+01:00"}}}}
550	2020-10-27 11:19:55.428884	2020-10-27 11:20:48.29479	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.019314937302532066","GPSTimeStamp":"2020-10-26T15:06:52Z","GPSImgDirection":"197.92826840999993","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630450000000003","GPSLatitude":"48.461278329999992","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.099999999999994","GPSHPositioningError":"4.9376331590160758","DateCreated":"2020-10-26T16:06:51+01:00"}}}}
456	2020-09-03 20:45:15.401371	2020-10-27 11:22:03.021997	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.14884082972188328","GPSTimeStamp":"2020-09-01T15:11:54Z","GPSImgDirection":"330.57759104000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.663875","GPSLatitude":"48.461028329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"4.3398308278547804","DateCreated":"2020-09-01T17:11:54+02:00"}}}}
471	2020-09-03 20:47:13.592136	2020-10-27 11:23:07.929166	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.14884082972188328","GPSTimeStamp":"2020-09-01T15:11:54Z","GPSImgDirection":"330.57759104000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.663875","GPSLatitude":"48.461028329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"4.3398308278547804","DateCreated":"2020-09-01T17:11:54+02:00"}}}}
555	2020-10-27 11:26:29.526497	2020-10-27 11:26:38.401577	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.143230542502016","GPSTimeStamp":"2020-10-26T16:27:44Z","GPSImgDirection":"159.84018692000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6645466700000005","GPSLatitude":"48.461046670000009","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92","GPSHPositioningError":"5.3799807042932946","DateCreated":"2020-10-26T17:27:43+01:00"}}}}
556	2020-10-27 11:27:08.037955	2020-10-27 11:27:25.591775	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.053877457945236726","GPSTimeStamp":"2020-10-26T16:35:20Z","GPSImgDirection":"155.06645963","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6640583299999996","GPSLatitude":"48.460796670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.799999999999997","GPSHPositioningError":"4.7444660118032269","DateCreated":"2020-10-26T17:35:19+01:00"}}}}
470	2020-09-03 20:47:13.1449	2020-10-27 11:27:41.963442	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.025365725159983473","GPSTimeStamp":"2020-09-01T15:02:29Z","GPSImgDirection":"67.761962889999992","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638449999999998","GPSLatitude":"48.460819999999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"100.5","GPSHPositioningError":"6.7606173810460088","DateCreated":"2020-09-01T17:02:29+02:00"}}}}
373	2020-09-03 20:43:24.357977	2020-10-27 11:28:40.494357	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.013690051621794794","GPSTimeStamp":"2020-09-01T15:01:38Z","GPSImgDirection":"27.990447999999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637300000000002","GPSLatitude":"48.460796670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"100.5","GPSHPositioningError":"3.9521587030716723","DateCreated":"2020-09-01T17:01:37+02:00"}}}}
552	2020-10-27 11:22:11.360407	2020-10-27 11:22:50.969286	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0360610969290397","GPSTimeStamp":"2020-10-26T16:11:10Z","GPSImgDirection":"322.76548766999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6639250000000003","GPSLatitude":"48.46104167","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.900000000000006","GPSHPositioningError":"5.5354454203262238","DateCreated":"2020-10-26T17:11:10+01:00"}}}}
553	2020-10-27 11:23:14.426794	2020-10-27 11:23:36.396024	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0360610969290397","GPSTimeStamp":"2020-10-26T16:11:10Z","GPSImgDirection":"322.76548766999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6639250000000003","GPSLatitude":"48.46104167","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.900000000000006","GPSHPositioningError":"5.5354454203262238","DateCreated":"2020-10-26T17:11:10+01:00"}}}}
554	2020-10-27 11:24:43.025202	2020-10-27 11:25:59.885069	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0041482215750620315","GPSTimeStamp":"2020-10-26T16:16:45Z","GPSImgDirection":"239.00137325","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6646533299999997","GPSLatitude":"48.460983329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.400000000000006","GPSHPositioningError":"5.3190918943585652","DateCreated":"2020-10-26T17:16:45+01:00"}}}}
557	2020-10-27 11:27:50.310502	2020-10-27 11:28:18.733055	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.02674935387259586","GPSTimeStamp":"2020-10-26T16:36:44Z","GPSImgDirection":"67.47000122999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637949999999999","GPSLatitude":"48.460779999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"100.59999999999999","GPSHPositioningError":"5.4752012181857737","DateCreated":"2020-10-26T17:36:44+01:00"}}}}
311	2020-09-03 20:43:15.274958	2020-11-01 13:09:03.104428	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12778234475780956","GPSTimeStamp":"2020-09-01T09:50:16Z","GPSImgDirection":"232.56666565","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66431167","GPSLatitude":"48.462661670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93","GPSHPositioningError":"16.66792463002399","DateCreated":"2020-09-01T11:50:15+02:00"}}}}
560	2020-11-01 14:02:46.819905	2020-11-01 14:02:55.667167	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0078220153192410744","GPSTimeStamp":"2020-10-26T13:23:18Z","GPSImgDirection":"238.52420051999994","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631883299999997","GPSLatitude":"48.463305000000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"88.200000000000003","GPSHPositioningError":"5.2833646420371529","DateCreated":"2020-10-26T14:23:18+01:00"}}}}
404	2020-09-03 20:43:28.905181	2020-11-03 12:47:36.080535	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0031289604957932989","GPSTimeStamp":"2020-09-01T11:35:19Z","GPSImgDirection":"200.92263792000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633666700000003","GPSLatitude":"48.463108329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.400000000000006","GPSHPositioningError":"4.1334751063297475","DateCreated":"2020-09-01T13:35:19+02:00"}}}}
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 892, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 892, true);


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.areas_id_seq', 4, true);


--
-- Name: boulders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.boulders_id_seq', 622, true);


--
-- Name: circuits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.circuits_id_seq', 16, true);


--
-- Name: lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.lines_id_seq', 653, true);


--
-- Name: pois_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.pois_id_seq', 3, true);


--
-- Name: problems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.problems_id_seq', 756, true);


--
-- Name: topos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.topos_id_seq', 560, true);


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
-- Name: lines lines_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.lines
    ADD CONSTRAINT lines_pkey PRIMARY KEY (id);


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
-- Name: index_lines_on_problem_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_lines_on_problem_id ON public.lines USING btree (problem_id);


--
-- Name: index_lines_on_topo_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_lines_on_topo_id ON public.lines USING btree (topo_id);


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

