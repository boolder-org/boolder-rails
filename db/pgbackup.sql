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
-- Name: boulders; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.boulders (
    id bigint NOT NULL,
    polygon public.geography(Polygon,4326),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
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
    updated_at timestamp(6) without time zone NOT NULL
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
    steepness character varying,
    height integer
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
-- Name: boulders id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.boulders ALTER COLUMN id SET DEFAULT nextval('public.boulders_id_seq'::regclass);


--
-- Name: circuits id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.circuits ALTER COLUMN id SET DEFAULT nextval('public.circuits_id_seq'::regclass);


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
-- Data for Name: boulders; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.boulders (id, polygon, created_at, updated_at) FROM stdin;
197	0103000020E6100000010000000500000073D712F2414F054055A18158363B484068976F7D584F05403E7958A8353B48400744882B674F0540670C7382363B4840C8EA56CF494F0540DE3CD521373B484073D712F2414F054055A18158363B4840	2020-04-16 20:02:34.222987	2020-04-16 20:02:34.222987
198	0103000020E61000000100000005000000FC1BB4571F4F0540EB1ED95C353B48409BC8CC052E4F054032CB9E04363B4840E59B6D6E4C4F0540D9B3E732353B4840F6984869364F05409EB5DB2E343B4840FC1BB4571F4F0540EB1ED95C353B4840	2020-04-16 20:02:34.22517	2020-04-16 20:02:34.22517
199	0103000020E61000000100000005000000AC8BDB68004F0540670C7382363B4840354415FE0C4F0540DE3CD521373B48403A3B191C254F0540F6984869363B48409B8E006E164F05409D819197353B4840AC8BDB68004F0540670C7382363B4840	2020-04-16 20:02:34.226872	2020-04-16 20:02:34.226872
200	0103000020E61000000100000007000000C9022670EB4E0540B2D991EA3B3B4840A7CEA3E2FF4E054059C2DA183B3B484040BE840A0E4F05400B2593533B3B4840F1A1444B1E4F05409AB1683A3B3B4840357EE195244F05402FFB75A73B3B4840BDC282FB014F05406AF981AB3C3B4840C9022670EB4E0540B2D991EA3B3B4840	2020-04-16 20:02:34.228673	2020-04-16 20:02:34.228673
201	0103000020E610000001000000070000000C01C0B1674F05409A6038D7303B4840CE1B2785794F05409F1D705D313B484067D13B15704F054069A85148323B4840B2F677B6474F0540DA1B7C61323B48405CE333D93F4F054052802898313B4840F015DD7A4D4F05400BD462F0303B48400C01C0B1674F05409A6038D7303B4840	2020-04-16 20:02:34.230549	2020-04-16 20:02:34.230549
202	0103000020E6100000010000000600000050172994854F054070CD1DFD2F3B4840A62A6D718D4F054029ED0DBE303B484023A30392B04F05407C7BD7A02F3B4840289A07B0C84F0540A185048C2E3B484023A30392B04F054078F2E9B12D3B484050172994854F054070CD1DFD2F3B4840	2020-04-16 20:02:34.232337	2020-04-16 20:02:34.232337
203	0103000020E61000000100000005000000BD732843554C0540A1B94E232D3B48403A782634494C05406B44300E2E3B48407E1AF7E6374C0540A77686A92D3B484007D3307C444C05407EE36BCF2C3B4840BD732843554C0540A1B94E232D3B4840	2020-04-16 20:02:34.234216	2020-04-16 20:02:34.234216
204	0103000020E61000000100000007000000346953758F4C0540D27135B22B3B48403FE3C281904C05403737A6272C3B4840B66455849B4C0540191EFB592C3B48404A97FE25A94C05403737A6272C3B484056116E32AA4C0540317A6EA12B3B4840C2DEC4909C4C05409082A7902B3B4840346953758F4C0540D27135B22B3B4840	2020-04-16 20:02:34.236166	2020-04-16 20:02:34.236166
205	0103000020E610000001000000050000002E724F57774C05403012DA722E3B4840E412471E884C05405F96766A2E3B4840EACF7EA4884C05403CF4DDAD2C3B4840342F87DD774C05403CF4DDAD2C3B48402E724F57774C05403012DA722E3B4840	2020-04-16 20:02:34.237974	2020-04-16 20:02:34.237974
206	0103000020E61000000100000005000000062FFA0AD24C0540A60EF27A303B48408EE733A0DE4C05406ADC9BDF303B484017A06D35EB4C0540F3AB3940303B48409961A3ACDF4C05402FDE8FDB2F3B4840062FFA0AD24C0540A60EF27A303B4840	2020-04-16 20:02:34.240121	2020-04-16 20:02:34.240121
207	0103000020E61000000100000007000000D2FD9C82FC4C0540D42AFA43333B484000E65AB4004D0540DFA46950343B4840DE3D40F7E54C05406DFDF49F353B484055850662D94C0540FC89CA86353B484055850662D94C05402D42B115343B48404A4563EDEF4C05407522C154333B4840D2FD9C82FC4C0540D42AFA43333B4840	2020-04-16 20:02:34.24215	2020-04-16 20:02:34.24215
208	0103000020E61000000100000005000000598638D6C54D0540B003E78C283B48403718EAB0C24D05408BF9B9A1293B48401570CFF3A74D05401A868F88293B4840C5538F34B84D0540DF878384283B4840598638D6C54D0540B003E78C283B4840	2020-04-16 20:02:34.243889	2020-04-16 20:02:34.243889
209	0103000020E610000001000000050000004206F2ECF24D0540AFCF9CF5293B48405303CDE7DC4D05402043C70E2A3B4840261B0FB6D84D0540217711A6283B48402B1213D4F04D05400F0C207C283B48404206F2ECF24D0540AFCF9CF5293B4840	2020-04-16 20:02:34.245774	2020-04-16 20:02:34.245774
210	0103000020E61000000100000005000000C6C4E6E3DA5005403788D68A363B4840041E1840F850054049F3C7B4363B48401B12F758FA50054032CB9E04363B48400F5EBBB4E150054091D3D7F3353B4840C6C4E6E3DA5005403788D68A363B4840	2020-04-16 20:02:34.247643	2020-04-16 20:02:34.247643
211	0103000020E610000001000000050000007F69519FE44E054046B58828263B48400D198F52094F0540F35A09DD253B484068E90AB6114F0540A4897780273B48400DDFC2BAF14E0540094FE8F5273B48407F69519FE44E054046B58828263B4840	2020-04-16 20:02:34.249541	2020-04-16 20:02:34.249541
212	0103000020E610000001000000050000007BDCB75A274E05401ADD41EC4C3B484009DE9046054E0540C19140834D3B4840A88AA9F4134E05404FEACBD24E3B4840C5758C2B2E4E0540DE76A1B94E3B48407BDCB75A274E05401ADD41EC4C3B4840	2020-04-16 20:02:34.251674	2020-04-16 20:02:34.251674
213	0103000020E61000000100000005000000D8F4A0A0144D0540DAE731CA333B4840F46BEBA7FF4C054075560BEC313B4840C7BDF90D134D054022FC8BA0313B4840DDEBA4BE2C4D054098F8A3A8333B4840D8F4A0A0144D0540DAE731CA333B4840	2020-04-16 20:02:34.253725	2020-04-16 20:02:34.253725
214	0103000020E6100000010000000600000068757286E24E0540EB353D28283B4840DAFF006BD54E0540289CDD5A263B4840DB8B683BA64E05407BF65CA6263B484096E99788B74E0540863C821B293B4840A794D74AE84E0540A4552DE9283B484068757286E24E0540EB353D28283B4840	2020-04-16 20:02:34.255624	2020-04-16 20:02:34.255624
215	0103000020E610000001000000050000006901DA56B34E0540B16B7BBB253B48403596B036C64E05409F008A91253B484013286211C34E0540F94B8BFA243B484041D653ABAF4E0540DB32E02C253B48406901DA56B34E0540B16B7BBB253B4840	2020-04-16 20:02:34.257335	2020-04-16 20:02:34.257335
216	0103000020E61000000100000006000000029F1F46084F0540EACDA8F92A3B48406E6C76A4FA4E0540A9DE1AD82A3B48408A1D8D43FD4E0540F0BE2A172A3B4840240D6E6B0B4F0540AFCF9CF5293B48407920B248134F0540B58CD47B2A3B4840029F1F46084F0540EACDA8F92A3B4840	2020-04-16 20:02:34.259246	2020-04-16 20:02:34.259246
217	0103000020E61000000100000007000000BDAAB35A604F054070CD1DFD2F3B48403FE08101844F0540EEEE01BA2F3B48400C7558E1964F054012F92EA52E3B4840B727486C774F05402A55A2EC2D3B4840A6F0A0D9754F054053E8BCC62E3B484062DA37F7574F054017B6662B2F3B4840BDAAB35A604F054070CD1DFD2F3B4840	2020-04-16 20:02:34.261134	2020-04-16 20:02:34.261134
218	0103000020E610000001000000060000008ACBF10A444F0540A185048C2E3B4840DFDE35E84B4F0540246420CF2E3B484040A6B5696C4F05403012DA722E3B484051DD5CFC6D4F054018EAB0C22D3B4840D95BCAF9624F054036035C902D3B48408ACBF10A444F0540A185048C2E3B4840	2020-04-16 20:02:34.262859	2020-04-16 20:02:34.262859
219	0103000020E6100000010000000B0000007F17B6662B4F0540F513CE6E2D3B4840ACFF73982F4F054018EAB0C22D3B48400D8D2782384F05405AD93EE42D3B48407E5182FE424F054018EAB0C22D3B4840D464C6DB4A4F054036035C902D3B4840EA58A5F44C4F054042B115342D3B4840CEA78E554A4F05401FDB32E02C3B484062A06B5F404F05407EE36BCF2C3B4840F0DB10E3354F05407EE36BCF2C3B484084D4EDEC2B4F054060CAC0012D3B48407F17B6662B4F0540F513CE6E2D3B4840	2020-04-16 20:02:34.264547	2020-04-16 20:02:34.264547
220	0103000020E610000001000000050000006C2409C215500540C9B08A37323B4840D865F84F37500540C9B08A37323B48405B61FA5E4350054063B7CF2A333B4840D26EF4311F500540B6114F76333B48406C2409C215500540C9B08A37323B4840	2020-04-16 20:02:34.266242	2020-04-16 20:02:34.266242
221	0103000020E6100000010000000500000093E52494BE5005403788D68A363B484076FA415DA45005407F349C32373B4840E2016553AE500540556D37C1373B4840EEB5A0F7C65005407F349C32373B484093E52494BE5005403788D68A363B4840	2020-04-16 20:02:34.267898	2020-04-16 20:02:34.267898
222	0103000020E61000000100000008000000DDD0949D7E5005404A27124C353B4840C6DCB5847C500540C748F608353B484038A1100187500540B5DD04DF343B4840BB9C121093500540446ADAC5343B4840DD0A613596500540D9B3E732353B484060CC96AC8A500540FC89CA86353B4840FF3EE3C281500540FC89CA86353B4840DDD0949D7E5005404A27124C353B4840	2020-04-16 20:02:34.270862	2020-04-16 20:02:34.270862
223	0103000020E610000001000000050000006BBA9EE8BA5005400D8D2782383B4840D13E56F0DB50054025E99AC9373B4840A3906456EF5005400D8D2782383B4840EEB5A0F7C65005401807978E393B48406BBA9EE8BA5005400D8D2782383B4840	2020-04-16 20:02:34.272674	2020-04-16 20:02:34.272674
224	0103000020E6100000010000000700000051A39064564F0540555051F52B3B484040321D3A3D4F0540A9DE1AD82A3B4840D464C6DB4A4F0540B58CD47B2A3B484062DA37F7574F0540C6F7C5A52A3B4840A6B6D4415E4F0540BA490C022B3B48407E8B4E965A4F0540E4DC26DC2B3B484051A39064564F0540555051F52B3B4840	2020-04-16 20:02:34.274338	2020-04-16 20:02:34.274338
225	0103000020E6100000010000000700000025034015374E054042B115342D3B48400395F1EF334E054066BB421F2C3B48404DF4F928234E0540A8AAD0402C3B4840E1ECD632194E05407235B22B2D3B484091D09673294E054078F2E9B12D3B484025034015374E0540950B957F2D3B484025034015374E054042B115342D3B4840	2020-04-16 20:02:34.276065	2020-04-16 20:02:34.276065
226	0103000020E610000001000000070000009CF86A47714E0540DA38622D3E3B484036AE7FD7674E05406F826F9A3E3B48405E9F39EB534E05405D177E703E3B48409D84D217424E05405726FC523F3B4840E6577380604E05401503249A403B4840853E58C6864E054045BB0A293F3B48409CF86A47714E0540DA38622D3E3B4840	2020-04-16 20:02:34.277785	2020-04-16 20:02:34.277785
227	0103000020E610000001000000060000006F9C14E63D4E05408D9B1A683E3B4840FD4B5299624E054087DEE2E13D3B4840B96FB54E5C4E05402219726C3D3B4840C4AF58C3454E05409F3A56293D3B48406422A5D93C4E05406308008E3D3B48406F9C14E63D4E05408D9B1A683E3B4840	2020-04-16 20:02:34.279527	2020-04-16 20:02:34.279527
228	0103000020E6100000010000000500000006A051BAF44F054001DF6DDE383B4840C7BAB88D065005401FF818AC383B48401711C5E40D500540F530B43A393B484033880FECF84F05401807978E393B484006A051BAF44F054001DF6DDE383B4840	2020-04-16 20:02:34.281182	2020-04-16 20:02:34.281182
229	0103000020E61000000100000005000000944F8F6D195005403CDD79E2393B48400057B26323500540FAEDEBC0393B48402D3F7095275005401EC4CE143A3B4840AA436E861B50054000AB23473A3B4840944F8F6D195005403CDD79E2393B4840	2020-04-16 20:02:34.282899	2020-04-16 20:02:34.282899
230	0103000020E610000001000000050000005BED612F14500540419AB1683A3B4840AA436E861B500540F4FC69A33A3B48406C2409C21550054077DB85E63A3B48401711C5E40D500540F4FC69A33A3B48405BED612F14500540419AB1683A3B4840	2020-04-16 20:02:34.284758	2020-04-16 20:02:34.284758
231	0103000020E6100000010000000500000066A19DD32C5005405FB35C363A3B48408ECC237F305005409BE5B2D1393B4840FAD346753A5005401EC4CE143A3B4840CCEB884336500540419AB1683A3B484066A19DD32C5005405FB35C363A3B4840	2020-04-16 20:02:34.286963	2020-04-16 20:02:34.286963
232	0103000020E61000000100000007000000DDD0949D7E5005403BA92F4B3B3B48401B2AC6F99B500540A06EA0C03B3B484093718C648F50054010AE80423D3B4840EE073C30805005402EC72B103D3B4840276A696E8550054046239F573C3B484088BD50C07650054052D158FB3B3B4840DDD0949D7E5005403BA92F4B3B3B4840	2020-04-16 20:02:34.288708	2020-04-16 20:02:34.288708
233	0103000020E61000000100000005000000357EE195244F0540B7627FD93D3B48409B02999D454F05407C6473D53C3B4840B130444E5F4F0540B7627FD93D3B48400D8D2782384F0540F2608BDD3E3B4840357EE195244F0540B7627FD93D3B4840	2020-04-16 20:02:34.290375	2020-04-16 20:02:34.290375
234	0103000020E610000001000000050000004C50C3B7B04E0540E57E87A2403B48403B8DB454DE4E0540E6B2D1393F3B4840F624B039074F0540E57E87A2403B48405DC136E2C94E054073D712F2413B48404C50C3B7B04E0540E57E87A2403B4840	2020-04-16 20:02:34.292004	2020-04-16 20:02:34.292004
235	0103000020E61000000100000005000000734BAB21714F05403A75E5B33C3B484018B5FB55804F0540E71A66683C3B48404B5AF10D854F05407C6473D53C3B4840ACADD85F764F0540CFBEF2203D3B4840734BAB21714F05403A75E5B33C3B4840	2020-04-16 20:02:34.29394	2020-04-16 20:02:34.29394
236	0103000020E610000001000000070000007E737FF5B84F0540EB3BBF28413B4840AB9509BFD44F0540A38FF980403B48406CB07092E64F054062A06B5F403B4840D3FA5B02F04F054038D906EE403B4840DE3AFF76D94F0540F0F8F6AE413B4840BC92E4B9BE4F0540F0F8F6AE413B48407E737FF5B84F0540EB3BBF28413B4840	2020-04-16 20:02:34.295603	2020-04-16 20:02:34.295603
237	0103000020E610000001000000070000003C6BB75D684E05403E963E74413B4840317DAF21384E05401AC05B20413B4840A8C4758C2B4E0540AED51EF6423B484075594C6C3E4E0540840EBA84433B48400E492D944C4E0540A818E76F423B4840525F96766A4E0540F6B52E35423B48403C6BB75D684E05403E963E74413B4840	2020-04-16 20:02:34.297267	2020-04-16 20:02:34.297267
238	0103000020E6100000010000000A000000B3B27DC85B4E05400DDE57E5423B4840147AFD497C4E05407E5182FE423B4840AD69DE718A4E0540C6FD47A6433B48408BC1C3B46F4E0540FB3E1C24443B4840A2B5A2CD714E0540EF906280443B4840A8380EBC5A4E054083DA6FED443B48400E492D944C4E054042EBE1CB443B4840ECDADE6E494E0540B94F8E02443B48401AC39CA04D4E054072A3C85A433B4840B3B27DC85B4E05400DDE57E5423B4840	2020-04-16 20:02:34.298841	2020-04-16 20:02:34.298841
239	0103000020E61000000100000005000000BFF2203D454E054068AED3484B3B4840F7C8E6AA794E0540DA5548F9493B4840C4E9245B5D4E05407C8159A1483B4840CA32C4B12E4E05407B4D0F0A4A3B4840BFF2203D454E054068AED3484B3B4840	2020-04-16 20:02:34.300494	2020-04-16 20:02:34.300494
240	0103000020E61000000100000008000000800D8810574E0540A96917D34C3B4840F1457BBC904E05405743E21E4B3B4840FDF9B660A94E05403239B5334C3B4840FD851E317A4E05403EB324404D3B4840804754A86E4E0540618907944D3B4840AD2F12DA724E0540F6D214014E3B48403C6BB75D684E054037C2A2224E3B4840800D8810574E0540A96917D34C3B4840	2020-04-16 20:02:34.302185	2020-04-16 20:02:34.302185
241	0103000020E6100000010000000900000058CA32C4B14E0540910DA48B4D3B484013286211C34E0540A3ACDF4C4C3B48402A560DC2DC4E0540DFDE35E84B3B48406E32AA0CE34E054021CEC3094C3B484035D07CCEDD4E05407FA2B2614D3B48407F2F8507CD4E0540618907944D3B48401FA2D11DC44E054019A9F7544E3B4840747B4963B44E0540F6D214014E3B484058CA32C4B14E0540910DA48B4D3B4840	2020-04-16 20:02:34.303839	2020-04-16 20:02:34.303839
242	0103000020E610000001000000050000002B6EDC627E4E0540B96C74CE4F3B484085B2F0F5B54E0540AEF204C24E3B4840B891B245D24E0540ADBEBA2A503B4840C45DBD8A8C4E0540F46A80D2503B48402B6EDC627E4E0540B96C74CE4F3B4840	2020-04-16 20:02:34.305586	2020-04-16 20:02:34.305586
243	0103000020E6100000010000000600000070067FBF984D05401D90847D3B3B4840DC476E4DBA4D054011E2CAD93B3B48408C2B2E8ECA4D05408F37F92D3A3B484043588D25AC4D05401807978E393B484049DBF813954D0540D026874F3A3B484070067FBF984D05401D90847D3B3B4840	2020-04-16 20:02:34.307485	2020-04-16 20:02:34.307485
244	0103000020E61000000100000005000000643A747ADE4D0540643C4A253C3B4840F86C1D1CEC4D054083893F8A3A3B4840D07B6308004E05402481069B3A3B4840E1B20A9B014E054052D158FB3B3B4840643A747ADE4D0540643C4A253C3B4840	2020-04-16 20:02:34.309198	2020-04-16 20:02:34.309198
245	0103000020E61000000100000005000000F419506F464D05403D62F4DC423B4840D2E5CDE15A4D0540558A1D8D433B484082035ABA824D0540D89C8367423B4840BBF1EEC8584D0540F0F8F6AE413B4840F419506F464D05403D62F4DC423B4840	2020-04-16 20:02:34.310842	2020-04-16 20:02:34.310842
246	0103000020E61000000100000007000000EE224C512E4D05402BF702B3423B484005DD5ED2184D0540A1F31ABB443B4840E9F17B9BFE4C054095456117453B4840772D211FF44C05403C2EAA45443B484055F99E91084D054055BE6724423B48404F7633A31F4D0540F6B52E35423B4840EE224C512E4D05402BF702B3423B4840	2020-04-16 20:02:34.312643	2020-04-16 20:02:34.312643
247	0103000020E6100000010000000600000049DBF813954D054024D236FE443B48400A302C7FBE4D0540C5C9FD0E453B484070404B57B04D0540AD6D8AC7453B484087342A70B24D05409ACE4E06473B484032E719FB924D0540CA52EBFD463B484049DBF813954D054024D236FE443B4840	2020-04-16 20:02:34.314637	2020-04-16 20:02:34.314637
248	0103000020E610000001000000050000000B0E2F88484D0540C782C2A04C3B4840CC6262F3714D054032056B9C4D3B4840BA6587F8874D0540E59B6D6E4C3B4840B534B742584D0540392A37514B3B48400B0E2F88484D0540C782C2A04C3B4840	2020-04-16 20:02:34.316481	2020-04-16 20:02:34.316481
249	0103000020E610000001000000070000002A90D959F44E054018B0E42A163B484057EC2FBB274F054036C98FF8153B4840950B957F2D4F0540A27F828B153B4840950B957F2D4F054019E42EC2143B4840B24813EF004F05408A5759DB143B4840026553AEF04E05400D36751E153B48402A90D959F44E054018B0E42A163B4840	2020-04-16 20:02:34.318297	2020-04-16 20:02:34.318297
250	0103000020E6100000010000000600000095B9F946744F0540EEB43522183B4840897956D28A4F0540174850FC183B484034A0DE8C9A4F054047CCECF3183B48403F1A4E999B4F0540D68C0C72173B4840346612F5824F054053AEF02E173B484095B9F946744F0540EEB43522183B4840	2020-04-16 20:02:34.320189	2020-04-16 20:02:34.320189
251	0103000020E6100000010000000500000050172994854F0540BF64E3C1163B48403F541A31B34F0540E23AC615173B484034DAAA24B24F0540664D2CF0153B48405C9198A0864F0540245E9ECE153B484050172994854F0540BF64E3C1163B4840	2020-04-16 20:02:34.32213	2020-04-16 20:02:34.32213
252	0103000020E61000000100000006000000848252B4724F05408466D7BD153B484068976F7D584F0540A87004A9143B48408ACBF10A444F05404277499C153B4840BDAAB35A604F05409B8E006E163B4840734BAB21714F0540FB96395D163B4840848252B4724F05408466D7BD153B4840	2020-04-16 20:02:34.323883	2020-04-16 20:02:34.323883
253	0103000020E61000000100000008000000195932C7F24E05404F594DD7133B48409B5434D6FE4E0540A2B3CC22143B48407FDDE9CE134F0540D237691A143B4840ACC5A700184F05407920B248133B48400D198F52094F054026C632FD123B48405D35CF11F94E0540F6419605133B4840139CFA40F24E0540BB0F406A133B4840195932C7F24E05404F594DD7133B4840	2020-04-16 20:02:34.32556	2020-04-16 20:02:34.32556
254	0103000020E6100000010000000700000002F1BA7EC14E05400D36751E153B484013EE9579AB4E0540AE2D3C2F153B48409C6C0377A04E054054E23AC6153B4840A2293BFDA04E05405A9F724C163B4840F1B913ECBF4E0540EEE87FB9163B48408BA9F413CE4E0540245E9ECE153B484002F1BA7EC14E05400D36751E153B4840	2020-04-16 20:02:34.327228	2020-04-16 20:02:34.327228
255	0103000020E610000001000000060000000874266DAA4E0540CC46E7FC143B4840EBFCDB65BF4E0540CC46E7FC143B48403596B036C64E0540E4A25A44143B4840747B4963B44E05404F594DD7133B484080BBECD79D4E05409605137F143B48400874266DAA4E0540CC46E7FC143B4840	2020-04-16 20:02:34.328909	2020-04-16 20:02:34.328909
256	0103000020E61000000100000005000000026553AEF04E05405EF415A4193B48404C38F4160F4F0540A5A0DB4B1A3B48402ACAA5F10B4F05408D4468041B3B4840B20E4757E94E0540D52478431A3B4840026553AEF04E05405EF415A4193B4840	2020-04-16 20:02:34.33054	2020-04-16 20:02:34.33054
257	0103000020E61000000100000005000000D42AFA43334F0540102384471B3B4840739D465A2A4F05408753E6E61B3B4840070ABC934F4F05400FEF39B01C3B484062DA37F7574F0540E65B1FD61B3B4840D42AFA43334F0540102384471B3B4840	2020-04-16 20:02:34.332263	2020-04-16 20:02:34.332263
258	0103000020E61000000100000005000000581CCEFC6A4E054012DC48D9223B4840A2293BFDA04E054095BA641C233B4840F17F4754A84E0540247B849A213B48404128EFE3684E054001A5A146213B4840581CCEFC6A4E054012DC48D9223B4840	2020-04-16 20:02:34.333901	2020-04-16 20:02:34.333901
259	0103000020E61000000100000006000000973B33C1704E0540EF39B01C213B484075CDE49B6D4E054078094E7D203B4840302B14E97E4E0540B43BA418203B4840F17F4754A84E0540C6A69542203B4840CA54C1A8A44E0540D120054F213B4840973B33C1704E0540EF39B01C213B4840	2020-04-16 20:02:34.33576	2020-04-16 20:02:34.33576
260	0103000020E61000000100000005000000A06D35EB8C4F05409065C1C41F3B48404B94BDA59C4F0540E4F38AA71E3B48401D2098A3C74F05409065C1C41F3B48401DE6CB0BB04F0540E97C7896203B4840A06D35EB8C4F05409065C1C41F3B4840	2020-04-16 20:02:34.338504	2020-04-16 20:02:34.338504
261	0103000020E61000000100000008000000A5D8D138D44F05409065C1C41F3B48404A0856D5CB4F054067D2A6EA1E3B484000E31934F44F05407380608E1E3B4840397F130A11500540793D98141F3B48407D5BB05417500540C0E95DBC1F3B4840C7BAB88D0650054007962364203B48406CB07092E64F054084B70721203B4840A5D8D138D44F05409065C1C41F3B4840	2020-04-16 20:02:34.340493	2020-04-16 20:02:34.340493
262	0103000020E6100000010000000600000061FC34EECD4F05401FBE4C14213B4840BCCCB051D64F05401901158E203B4840ABCFD556EC4F05406C5B94D9203B484094DBF63DEA4F0540E38BF678213B48409A5E622CD34F0540B3075A81213B484061FC34EECD4F05401FBE4C14213B4840	2020-04-16 20:02:34.342592	2020-04-16 20:02:34.342592
263	0103000020E61000000100000005000000CB4A9352D04D0540130A1170083B4840B49080D1E54D054073124A5F083B4840A91611C5E44D0540BBF2599E073B4840C0D02346CF4D05401AFB928D073B4840CB4A9352D04D0540130A1170083B4840	2020-04-16 20:02:34.344494	2020-04-16 20:02:34.344494
264	0103000020E6100000010000000500000065C6DB4AAF4D05402B323A20093B484021B07268914D0540D7A3703D0A3B48403D9B559FAB4D054000378B170B3B4840315BB22AC24D054054C554FA093B484065C6DB4AAF4D05402B323A20093B4840	2020-04-16 20:02:34.346331	2020-04-16 20:02:34.346331
265	0103000020E6100000010000000900000016C26A2C614D0540130A1170083B4840213CDA38624D0540494BE5ED083B48409E7AA4C16D4D05406C21C841093B484082035ABA824D0540FBAD9D28093B48400ABC934F8F4D0540B401D880083B4840EE0A7DB08C4D05401AFB928D073B48404E5E64027E4D0540B5352218073B4840327381CB634D05401AFB928D073B484016C26A2C614D0540130A1170083B4840	2020-04-16 20:02:34.348284	2020-04-16 20:02:34.348284
266	0103000020E6100000010000000A0000006DC83F33884F0540634337FB033B484034DAAA24B24F0540338B506C053B484089EDEE01BA4F0540F758FAD0053B484072F90FE9B74F05405070B1A2063B4840D9092FC1A94F054002D369DD063B484001FBE8D4954F0540384888F2053B48402EA9DA6E824F0540FD497CEE043B4840BDE47FF2774F054087191A4F043B484018B5FB55804F0540C24B70EA033B48406DC83F33884F0540634337FB033B4840	2020-04-16 20:02:34.350208	2020-04-16 20:02:34.350208
267	0103000020E61000000100000008000000685DA3E5404F054051A4FB39053B4840B7ED7BD45F4F0540F19BC24A053B484029B2D6506A4F0540E5ED08A7053B484067D13B15704F0540CD91955F063B48407311DF89594F054080F44D9A063B48406D1ADB6B414F0540AF78EA91063B48400D8D2782384F054027DD96C8053B4840685DA3E5404F054051A4FB39053B4840	2020-04-16 20:02:34.351984	2020-04-16 20:02:34.351984
268	0103000020E6100000010000000D000000E561A1D6344F0540DA73999A043B4840840EBA84434F054069006F81043B484034F279C5534F054034BF9A03043B48405C1D0071574F05405D86FF74033B48404BE658DE554F0540874D64E6023B4840685DA3E5404F0540F9C08EFF023B4840B2BCAB1E304F054058C9C7EE023B4840FC1BB4571F4F054058C9C7EE023B48402F87DD770C4F0540AB23473A033B4840FCE1E7BF074F05406FF1F09E033B4840CE33F6251B4F0540B1E07EC0033B48403A3B191C254F0540E621533E043B4840E561A1D6344F0540DA73999A043B4840	2020-04-16 20:02:34.353716	2020-04-16 20:02:34.353716
269	0103000020E610000001000000070000007E8B4E965A4F05409CA56439093B484034A0DE8C9A4F0540D1E638B7093B4840E4839ECDAA4F054013D6C6D8093B48402EE3A6069A4F0540958098840B3B48400DC7F319504F0540E90E62670A3B4840D921FE614B4F0540DD94F25A093B48407E8B4E965A4F05409CA56439093B4840	2020-04-16 20:02:34.355397	2020-04-16 20:02:34.355397
270	0103000020E61000000100000008000000D99596917A4F0540E21DE0490B3B484045292158554F0540E21DE0490B3B4840070ABC934F4F0540594E42E90B3B4840D95BCAF9624F05402F87DD770C3B48403A234A7B834F05405F0B7A6F0C3B4840E449D235934F05406BB933130C3B48408F368E588B4F0540F488D1730B3B4840D99596917A4F0540E21DE0490B3B4840	2020-04-16 20:02:34.357152	2020-04-16 20:02:34.357152
271	0103000020E61000000100000006000000F0FD0DDAAB4F0540535DC0CB0C3B4840C8D2872EA84F0540EE974F560C3B484034DAAA24B24F0540CAC16C020C3B484094675E0EBB4F05401D1CEC4D0C3B484061C26856B64F0540535DC0CB0C3B4840F0FD0DDAAB4F0540535DC0CB0C3B4840	2020-04-16 20:02:34.358813	2020-04-16 20:02:34.358813
272	0103000020E61000000100000007000000E4839ECDAA4F05408D2782380F3B484061889CBE9E4F054069519FE40E3B4840787C7BD7A04F054076FF58880E3B48401DE6CB0BB04F0540058C2E6F0E3B4840C24F1C40BF4F054076FF58880E3B48406D3CD862B74F05401CB4571F0F3B4840E4839ECDAA4F05408D2782380F3B4840	2020-04-16 20:02:34.360475	2020-04-16 20:02:34.360475
273	0103000020E6100000010000000B000000CE6DC2BD324F05409A0986730D3B484095456117454F05409A0986730D3B48407311DF89594F05407CF0DAA50D3B4840A0F99CBB5D4F0540522976340E3B48404BE658DE554F054058E6ADBA0E3B4840C8EA56CF494F0540C959D8D30E3B4840EB1ED95C354F0540AB402D060F3B48404B72C0AE264F0540C959D8D30E3B484007962364204F05406494675E0E3B4840357EE195244F05407CF0DAA50D3B4840CE6DC2BD324F05409A0986730D3B4840	2020-04-16 20:02:34.362342	2020-04-16 20:02:34.362342
274	0103000020E61000000100000007000000B8054B75014F054012A27C410B3B48403B8DB454DE4E0540D1B2EE1F0B3B48406EF8DD74CB4E0540D7A3703D0A3B48402499D53BDC4E0540A2629CBF093B48405778978BF84E0540D1E638B7093B48402ACAA5F10B4F0540FB7953910A3B4840B8054B75014F054012A27C410B3B4840	2020-04-16 20:02:34.364181	2020-04-16 20:02:34.364181
275	0103000020E61000000100000006000000BB7D5699294D0540ACA8C1340C3B4840990F0874264D0540B8567BD80B3B4840B03DB324404D0540240D6E6B0B3B48400B0E2F88484D05409B3DD00A0C3B484021C84109334D054041F2CEA10C3B4840BB7D5699294D0540ACA8C1340C3B4840	2020-04-16 20:02:34.366012	2020-04-16 20:02:34.366012
276	0103000020E61000000100000005000000EF74E789E74C05408FC360FE0A3B48406CB3B112F34C05408FC360FE0A3B484066F6798CF24C05402AFEEF880A3B4840F4311F10E84C05402AFEEF880A3B4840EF74E789E74C05408FC360FE0A3B4840	2020-04-16 20:02:34.367984	2020-04-16 20:02:34.367984
277	0103000020E6100000010000000700000038BC2022354D0540C4D0EAE40C3B484027BF45274B4D054047AF06280D3B4840FFCD8B135F4D0540B82231410D3B4840FFCD8B135F4D0540CF4A5AF10D3B48407C98BD6C3B4D0540CF4A5AF10D3B484005172B6A304D0540F911BF620D3B484038BC2022354D0540C4D0EAE40C3B4840	2020-04-16 20:02:34.370104	2020-04-16 20:02:34.370104
278	0103000020E61000000100000005000000166D8E739B50054026512FF8343B4840E884D0419750054050189469343B48408DEE2076A65005406E313F37343B4840D1CABDC0AC50054026512FF8343B4840166D8E739B50054026512FF8343B4840	2020-04-16 20:02:34.372049	2020-04-16 20:02:34.372049
279	0103000020E61000000100000008000000118E59F624500540246420CF2E3B48402882380F27500540486E4DBA2D3B4840CCEB884336500540E3A8DC442D3B4840492A53CC4150054042B115342D3B48407DCF48844650054036035C902D3B4840054EB6813B500540EE224C512E3B48402882380F2750054035CF11F92E3B4840118E59F624500540246420CF2E3B4840	2020-04-16 20:02:34.373905	2020-04-16 20:02:34.373905
280	0103000020E61000000100000005000000711B0DE02D500540D27135B22B3B484027BC04A73E500540D27135B22B3B4840492A53CC415005401A5245F12A3B4840556AF6402B500540BA490C022B3B4840711B0DE02D500540D27135B22B3B4840	2020-04-16 20:02:34.3758	2020-04-16 20:02:34.3758
281	0103000020E61000000100000005000000F0DB10E3354F05403A24B550323B4840CE6DC2BD324F0540BD361B2B313B48400D535BEA204F0540BD361B2B313B4840357EE195244F05407B134372323B4840F0DB10E3354F05403A24B550323B4840	2020-04-16 20:02:34.377652	2020-04-16 20:02:34.377652
282	0103000020E610000001000000060000005D6F9BA9104F0540BD361B2B313B484040BE840A0E4F0540768A5583303B4840B8054B75014F05404606B98B303B4840CFF9298E034F0540CFA10C55313B484068E90AB6114F05407099D365313B48405D6F9BA9104F0540BD361B2B313B4840	2020-04-16 20:02:34.379603	2020-04-16 20:02:34.379603
283	0103000020E61000000100000005000000029F1F46084F054025E99AC9373B4840D4F02DAC1B4F0540F564FED1373B4840EBE40CC51D4F0540CB9D9960383B4840029F1F46084F05403C11C479383B4840029F1F46084F054025E99AC9373B4840	2020-04-16 20:02:34.381385	2020-04-16 20:02:34.381385
284	0103000020E610000001000000050000007A3881E9B44E054025E99AC9373B484008AEF204C24E054025E99AC9373B484002F1BA7EC14E05404FB0FF3A373B48404C50C3B7B04E05404FB0FF3A373B48407A3881E9B44E054025E99AC9373B4840	2020-04-16 20:02:34.383122	2020-04-16 20:02:34.383122
285	0103000020E610000001000000050000002BC0779B374E0540A4897780273B48404837C2A2224E05406F48A302273B48402BC0779B374E054064CE33F6253B48401406651A4D4E0540BDE5EAC7263B48402BC0779B374E0540A4897780273B4840	2020-04-16 20:02:34.384883	2020-04-16 20:02:34.384883
286	0103000020E61000000100000006000000365CE49EAE4E0540FDA02E52283B48400874266DAA4E0540C85F5AD4273B48408B355CE49E4E054015FDA199273B48404759BF99984E0540F8E3F6CB273B48402AA8A8FA954E0540035E66D8283B4840365CE49EAE4E0540FDA02E52283B4840	2020-04-16 20:02:34.387062	2020-04-16 20:02:34.387062
287	0103000020E610000001000000050000005778978BF84E054008CA6DFB1E3B4840FCA71B28F04E0540F52A323A203B4840CE6DC2BD324F05404E42E90B213B484046B58828264F05407FFACF9A1F3B48405778978BF84E054008CA6DFB1E3B4840	2020-04-16 20:02:34.388845	2020-04-16 20:02:34.388845
288	0103000020E61000000100000005000000B24813EF004F05401FBE4C14213B484096D1C8E7154F05407218CC5F213B484068E90AB6114F0540485167EE213B48409697FC4FFE4E0540C5724BAB213B4840B24813EF004F05401FBE4C14213B4840	2020-04-16 20:02:34.390591	2020-04-16 20:02:34.390591
289	0103000020E610000001000000050000001E8A027D224F05402A38BC20223B48404B72C0AE264F054054FF2092213B4840F6984869364F0540A759A0DD213B4840BD361B2B314F05407D923B6C223B48401E8A027D224F05402A38BC20223B4840	2020-04-16 20:02:34.392516	2020-04-16 20:02:34.392516
290	0103000020E610000001000000050000009AEAC9FCA34F054050AA7D3A1E3B4840BC92E4B9BE4F054044FCC3961E3B4840FBB1497EC44F0540AFB2B6291E3B4840B79BE09BA64F05404AED45B41D3B48409AEAC9FCA34F054050AA7D3A1E3B4840	2020-04-16 20:02:34.394361	2020-04-16 20:02:34.394361
291	0103000020E61000000100000005000000C11F7EFE7B500540BFB51325213B4840823AE5D18D5005400E87A5811F3B4840DD442DCDAD500540734C16F71F3B4840F9BB77D498500540666A12BC213B4840C11F7EFE7B500540BFB51325213B4840	2020-04-16 20:02:34.396283	2020-04-16 20:02:34.396283
292	0103000020E6100000010000000500000029B2D6506A4F0540E8BD3104003B4840BDAAB35A604F0540E8BD3104003B4840C8242367614F05404209336DFF3A48406D8E739B704F0540B37C5D86FF3A484029B2D6506A4F0540E8BD3104003B4840	2020-04-16 20:02:34.398146	2020-04-16 20:02:34.398146
293	0103000020E61000000100000007000000AB9509BFD44F0540A4E194B9F93A4840662D05A4FD4F0540EB8D5A61FA3A48404AF086342A500540EB8D5A61FA3A48408352B4722F5005403F1C2444F93A48401CCEFC6A0E500540336E6AA0F93A4840BCCCB051D64F05409E245D33F93A4840AB9509BFD44F0540A4E194B9F93A4840	2020-04-16 20:02:34.399994	2020-04-16 20:02:34.399994
294	0103000020E610000001000000070000009E5F94A0BF500540BDC282FB013B4840921FF12BD6500540E198654F023B484087DF4DB7EC500540BDC282FB013B484087DF4DB7EC5005408881AE7D013B484070B1A206D35005408881AE7D013B484093E52494BE5005409AEC9FA7013B48409E5F94A0BF500540BDC282FB013B4840	2020-04-16 20:02:34.401926	2020-04-16 20:02:34.401926
\.


--
-- Data for Name: circuits; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.circuits (id, color, created_at, updated_at) FROM stdin;
1	yellow	2020-04-16 20:02:33.505445	2020-04-16 20:02:33.505445
2	orange	2020-04-16 20:02:33.697495	2020-04-16 20:02:33.697495
3	skyblue	2020-04-16 20:02:33.796183	2020-04-16 20:02:33.796183
4	red	2020-04-16 20:02:33.813724	2020-04-16 20:02:33.813724
5	blue	2020-04-16 20:02:33.912494	2020-04-16 20:02:33.912494
6	white	2020-04-16 20:02:34.149902	2020-04-16 20:02:34.149902
\.


--
-- Data for Name: problems; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.problems (id, name, grade, created_at, updated_at, location, circuit_id, circuit_number, steepness, height) FROM stdin;
1	Poseurs	3b	2020-04-16 20:19:02.969757	2020-04-16 20:19:02.969757	0101000020E6100000884CF910544D0540F0C4AC17433B4840	1	13	slab	4
2	\N	2c	2020-04-16 20:19:02.975036	2020-04-16 20:19:02.975036	0101000020E6100000BBB72231414D054021205F42053B4840	1	48	slab	\N
3	\N	3a	2020-04-16 20:19:02.977993	2020-04-16 20:19:02.977993	0101000020E6100000BB7D5699294D05401AFB928D073B4840	1	47	slab	\N
4	\N	2a	2020-04-16 20:19:02.980786	2020-04-16 20:19:02.980786	0101000020E61000007689EAAD814D0540F624B039073B4840	1	46	traverse	\N
5	\N	2a+	2020-04-16 20:19:02.983516	2020-04-16 20:19:02.983516	0101000020E6100000266DAAEE914D054019C748F6083B4840	1	45	slab	\N
6	\N	2a	2020-04-16 20:19:02.98631	2020-04-16 20:19:02.98631	0101000020E6100000E2CAD93BA34D0540E90E62670A3B4840	1	44	traverse	\N
7	\N	2b	2020-04-16 20:19:02.988854	2020-04-16 20:19:02.988854	0101000020E61000009E62D520CC4D0540FBAD9D28093B4840	1	43	traverse	\N
8	\N	3a	2020-04-16 20:19:02.99152	2020-04-16 20:19:02.99152	0101000020E610000081EB8A19E14D0540FA4509FA0B3B4840	1	42	slab	\N
9	\N	2b	2020-04-16 20:19:02.994807	2020-04-16 20:19:02.994807	0101000020E6100000C0D02346CF4D05409B3DD00A0C3B4840	1	41	wall	\N
10	\N	2a	2020-04-16 20:19:02.997912	2020-04-16 20:19:02.997912	0101000020E6100000DC476E4DBA4D0540DBC4C9FD0E3B4840	1	40	slab	\N
11	\N	2a	2020-04-16 20:19:03.0008	2020-04-16 20:19:03.0008	0101000020E6100000B5E21B0A9F4D054093E4B9BE0F3B4840	1	39	slab	\N
12	\N	3a	2020-04-16 20:19:03.009542	2020-04-16 20:19:03.009542	0101000020E610000071581AF8514D0540172B6A300D3B4840	1	38	traverse	\N
13	\N	2a	2020-04-16 20:19:03.012177	2020-04-16 20:19:03.012177	0101000020E610000010919A76314D0540DC2C5E2C0C3B4840	1	37	\N	\N
14	\N	2a	2020-04-16 20:19:03.01478	2020-04-16 20:19:03.01478	0101000020E61000003B53E8BCC64E0540A27F828B153B4840	1	36	slab	\N
15	\N	2a	2020-04-16 20:19:03.017287	2020-04-16 20:19:03.017287	0101000020E61000004641F0F8F64E0540D828EB37133B4840	1	35	traverse	\N
16	\N	1b	2020-04-16 20:19:03.019868	2020-04-16 20:19:03.019868	0101000020E6100000A7CEA3E2FF4E054020D5B0DF133B4840	1	34	slab	\N
17	Lola	2c	2020-04-16 20:19:03.022537	2020-04-16 20:19:03.022537	0101000020E6100000E5ED08A7054F05400745F300163B4840	1	33	slab	\N
18	\N	2a	2020-04-16 20:19:03.025123	2020-04-16 20:19:03.025123	0101000020E61000002F87DD770C4F05408787307E1A3B4840	1	32	traverse	\N
19	\N	3b	2020-04-16 20:19:03.027729	2020-04-16 20:19:03.027729	0101000020E61000006D1ADB6B414F0540C2853C821B3B4840	1	31	wall	\N
20	\N	2b	2020-04-16 20:19:03.03048	2020-04-16 20:19:03.03048	0101000020E610000034DAAA24B24F0540F1A1444B1E3B4840	1	30	slab	\N
22	\N	2b	2020-04-16 20:19:03.036242	2020-04-16 20:19:03.036242	0101000020E6100000512FF834274F05400762D9CC213B4840	1	28	traverse	\N
24	\N	2a	2020-04-16 20:19:03.041946	2020-04-16 20:19:03.041946	0101000020E6100000037D224F924E0540F52A323A203B4840	1	26	slab	\N
26	\N	3a	2020-04-16 20:19:03.047543	2020-04-16 20:19:03.047543	0101000020E6100000B360E28FA24E054039D384ED273B4840	1	24	\N	\N
27	\N	2b	2020-04-16 20:19:03.050092	2020-04-16 20:19:03.050092	0101000020E61000004C16F71F994E05404B3E7617283B4840	1	23	wall	\N
28	\N	3a	2020-04-16 20:19:03.052401	2020-04-16 20:19:03.052401	0101000020E61000005E656D533C4E0540E6AC4F39263B4840	1	22	wall	\N
29	\N	2c	2020-04-16 20:19:03.056197	2020-04-16 20:19:03.056197	0101000020E6100000E1606F62484E05404B72C0AE263B4840	1	21	traverse	\N
31	Autoroute du Soleil	2c	2020-04-16 20:19:03.061908	2020-04-16 20:19:03.061908	0101000020E6100000FED7B969334E0540FB04508C2C3B4840	1	19	overhang	\N
32	\N	2a	2020-04-16 20:19:03.064545	2020-04-16 20:19:03.064545	0101000020E6100000427A8A1C224E0540CB80B3942C3B4840	1	18	wall	\N
33	\N	2b	2020-04-16 20:19:03.067215	2020-04-16 20:19:03.067215	0101000020E6100000DC2F9FAC184E05402785798F333B4840	1	17	wall	\N
34	\N	2c	2020-04-16 20:19:03.069571	2020-04-16 20:19:03.069571	0101000020E610000064E8D841254E05405B5EB9DE363B4840	1	16	traverse	\N
35	\N	1c	2020-04-16 20:19:03.071902	2020-04-16 20:19:03.071902	0101000020E6100000F3AFE595EB4D05403197546D373B4840	1	15	slab	\N
37	\N	3a	2020-04-16 20:19:03.077151	2020-04-16 20:19:03.077151	0101000020E6100000A515DF50F84C0540ADA1D45E443B4840	1	12	slab	\N
38	\N	2c	2020-04-16 20:19:03.082451	2020-04-16 20:19:03.082451	0101000020E61000009F1EDB32E04C05405D34643C4A3B4840	1	11	wall	\N
39	\N	2b	2020-04-16 20:19:03.085051	2020-04-16 20:19:03.085051	0101000020E610000055BFD2F9F04C0540C1C58A1A4C3B4840	1	10	slab	\N
42	\N	2a	2020-04-16 20:19:03.092604	2020-04-16 20:19:03.092604	0101000020E6100000C501F4FBFE4D0540A1BFD023463B4840	1	7	traverse	\N
40	Sauvetage	2a	2020-04-16 20:19:03.087615	2020-04-17 13:42:53.974581	0101000020E61000005A643BDF4F4D0540C1C58A1A4C3B4840	1	9	wall	5
36	Le Bistrot	3a	2020-04-16 20:19:03.0744	2020-04-17 13:42:54.247783	0101000020E61000000A302C7FBE4D054059C2DA183B3B4840	1	14	slab	3
30	Pseudonyme	2b	2020-04-16 20:19:03.059233	2020-04-17 13:42:54.464593	0101000020E61000002BC0779B374E054022AB5B3D273B4840	1	20	wall	2
25	Fun and Games	2a	2020-04-16 20:19:03.044576	2020-04-17 13:42:54.531615	0101000020E6100000A7E67283A14E05407D923B6C223B4840	1	25	\N	4
23	Tintin	2b	2020-04-16 20:19:03.039262	2020-04-17 13:42:54.56326	0101000020E6100000BDC282FB014F054001A5A146213B4840	1	27	wall	3
21	Magouilles	3b	2020-04-16 20:19:03.033315	2020-04-17 13:42:54.78263	0101000020E6100000EA060ABC934F05403D0B42791F3B4840	1	29	wall	5
43	\N	2b	2020-04-16 20:19:03.09497	2020-04-16 20:19:03.09497	0101000020E6100000E76F4221024E0540B35E0CE5443B4840	1	6	wall	\N
44	\N	3a	2020-04-16 20:19:03.097409	2020-04-16 20:19:03.097409	0101000020E610000025C9737D1F4E054083DA6FED443B4840	1	5	slab	\N
45	\N	2b	2020-04-16 20:19:03.099817	2020-04-16 20:19:03.099817	0101000020E6100000D6AC33BE2F4E05400DDE57E5423B4840	1	4	overhang	\N
46	\N	2c	2020-04-16 20:19:03.102135	2020-04-16 20:19:03.102135	0101000020E6100000C4AF58C3454E05402BF702B3423B4840	1	3	traverse	\N
47	\N	2a	2020-04-16 20:19:03.105104	2020-04-16 20:19:03.105104	0101000020E61000008BC1C3B46F4E05404FCDE506433B4840	1	2	slab	\N
48	\N	2c	2020-04-16 20:19:03.107744	2020-04-16 20:19:03.107744	0101000020E6100000D520CCED5E4E0540CE8AA8893E3B4840	1	1	traverse	\N
49	La Crêpe	4a	2020-04-16 20:19:03.110558	2020-04-16 20:19:03.110558	0101000020E6100000B79BE09BA64F05403F390A10053B4840	2	43	slab	5
50	La calandre	3a	2020-04-16 20:19:03.113229	2020-04-16 20:19:03.113229	0101000020E6100000D865F84F37500540B69DB646043B4840	2	42	\N	\N
51	\N	3b	2020-04-16 20:19:03.116043	2020-04-16 20:19:03.116043	0101000020E6100000CC5F217365500540566133C0053B4840	2	41	overhang	\N
52	\N	3b+	2020-04-16 20:19:03.118716	2020-04-16 20:19:03.118716	0101000020E6100000D74D29AF95500540B0AC3429053B4840	2	40	wall	\N
53	\N	4a	2020-04-16 20:19:03.121574	2020-04-16 20:19:03.121574	0101000020E610000081E84999D4500540B7D100DE023B4840	2	39	traverse	\N
54	\N	3a	2020-04-16 20:19:03.124347	2020-04-16 20:19:03.124347	0101000020E61000005B61FA5E435005405FEE93A3003B4840	2	38	wall	\N
55	La cheminée	3b	2020-04-16 20:19:03.127257	2020-04-16 20:19:03.127257	0101000020E610000072E14048165005407A1A3048FA3A4840	2	36	traverse	\N
56	\N	3a	2020-04-16 20:19:03.130012	2020-04-16 20:19:03.130012	0101000020E6100000DE74CB0EF14F05407A1A3048FA3A4840	2	35	wall	\N
57	Le Tour de Canon	2b	2020-04-16 20:19:03.13278	2020-04-16 20:19:03.13278	0101000020E610000045292158554F05405053CBD6FA3A4840	2	34	wall	\N
58	\N	4a	2020-04-16 20:19:03.135732	2020-04-16 20:19:03.135732	0101000020E6100000F65E7CD11E4F054056444DF4F93A4840	2	33	traverse	\N
61	\N	3c	2020-04-16 20:19:03.143768	2020-04-16 20:19:03.143768	0101000020E61000002CD8463CD94D05402DCE18E6043B4840	2	30	slab	\N
62	\N	3c+	2020-04-16 20:19:03.146353	2020-04-16 20:19:03.146353	0101000020E610000075E5B33C0F4E05407633A31F0D3B4840	2	28	wall	\N
63	\N	2c	2020-04-16 20:19:03.152875	2020-04-16 20:19:03.152875	0101000020E61000003D9B559FAB4D0540A54FABE80F3B4840	2	27	wall	\N
64	\N	3a	2020-04-16 20:19:03.157965	2020-04-16 20:19:03.157965	0101000020E6100000A3E5400FB54D0540B98AC56F0A3B4840	2	29	slab	\N
67	Drambruie	3a	2020-04-16 20:19:03.165587	2020-04-16 20:19:03.165587	0101000020E6100000A1116C5CFF4E0540287FF78E1A3B4840	2	24	wall	\N
71	\N	2a	2020-04-16 20:19:03.185163	2020-04-16 20:19:03.185163	0101000020E6100000FC8F4C874E4F0540D862B7CF2A3B4840	2	20	overhang	\N
73	\N	2b+	2020-04-16 20:19:03.191173	2020-04-16 20:19:03.191173	0101000020E6100000ADDD76A1B94E0540E4F90CA8373B4840	2	14	wall	\N
74	\N	3a	2020-04-16 20:19:03.193952	2020-04-16 20:19:03.193952	0101000020E6100000C3B986191A4F054078431A15383B4840	2	13	wall	\N
75	\N	3a+	2020-04-16 20:19:03.196731	2020-04-16 20:19:03.196731	0101000020E610000040BE840A0E4F05402EAA4544313B4840	2	18	overhang	\N
76	\N	1a+	2020-04-16 20:19:03.199881	2020-04-16 20:19:03.199881	0101000020E610000084D4EDEC2B4F0540EDBAB722313B4840	2	12	wall	\N
78	\N	2c	2020-04-16 20:19:03.20556	2020-04-16 20:19:03.20556	0101000020E6100000C32D1F49494F0540D009A1832E3B4840	2	10	wall	\N
79	La Contrabasse	3c+	2020-04-16 20:19:03.208392	2020-04-16 20:19:03.208392	0101000020E6100000D464C6DB4A4F054042B115342D3B4840	2	9	slab	\N
80	L'Ex Saut du Jaune	2c	2020-04-16 20:19:03.211104	2020-04-16 20:19:03.211104	0101000020E61000008A3F8A3A734F0540710168942E3B4840	2	8	other	\N
81	\N	3c	2020-04-16 20:19:03.213609	2020-04-16 20:19:03.213609	0101000020E6100000A5C00298325005409082A7902B3B4840	2	6	traverse	\N
77	Couche-Tard	3a	2020-04-16 20:19:03.202691	2020-04-17 13:42:52.768886	0101000020E6100000950B957F2D4F0540C9B08A37323B4840	2	17	wall	4
72	Tour d'Eiffel	3b	2020-04-16 20:19:03.188287	2020-04-17 13:42:52.832764	0101000020E61000004BAC8C463E4F054008E753C72A3B4840	2	19	slab	6
70	Le Bouchon	3b	2020-04-16 20:19:03.178619	2020-04-17 13:42:52.992311	0101000020E61000000D198F52094F054050C763062A3B4840	2	21	overhang	3
69	Confiance	4a	2020-04-16 20:19:03.17155	2020-04-17 13:42:53.14869	0101000020E61000001EDC9DB5DB4E0540D3D9C9E0283B4840	2	22	slab	6
68	Ninkenphoop	4b+	2020-04-16 20:19:03.168278	2020-04-17 13:42:54.652401	0101000020E61000004B72C0AE264F0540315D88D51F3B4840	2	23	traverse	4
65	Bofinger	3b	2020-04-16 20:19:03.160686	2020-04-17 13:42:55.131889	0101000020E6100000F1B913ECBF4E05402592E865143B4840	2	26	slab	4
66	L'Arête gauche du Cervin	2c+	2020-04-16 20:19:03.163135	2020-04-17 13:42:55.164957	0101000020E61000006EF8DD74CB4E05408466D7BD153B4840	2	25	slab	6
59	Candide	4a+	2020-04-16 20:19:03.138365	2020-04-17 13:42:55.790883	0101000020E61000000F0F61FC344E0540DFDFA0BDFA3A4840	2	32	overhang	4
60	Imogen	3c	2020-04-16 20:19:03.141151	2020-04-17 13:42:55.822984	0101000020E61000002BC0779B374E05407A1A3048FA3A4840	2	31	wall	5
84	La Folklorique	2a	2020-04-16 20:19:03.222079	2020-04-16 20:19:03.222079	0101000020E61000002C616D8C9D500540A47213B5343B4840	2	3	traverse	\N
85	\N	3a	2020-04-16 20:19:03.225198	2020-04-16 20:19:03.225198	0101000020E610000098A25C1ABF500540A9FB00A4363B4840	2	2	traverse	\N
87	L'Ex-Souche	3c+	2020-04-16 20:19:03.231431	2020-04-16 20:19:03.231431	0101000020E61000005073F222135005407FFACF9A1F3B4840	3	11	wall	\N
90	Le Prétoire	4c	2020-04-16 20:19:03.241177	2020-04-16 20:19:03.241177	0101000020E6100000F702B342914E05404260E5D0223B4840	3	31	wall	\N
94	La Norma	3b	2020-04-16 20:19:03.25223	2020-04-16 20:19:03.25223	0101000020E6100000D4B66114044F054008CA6DFB1E3B4840	3	33	wall	\N
95	L'Imprévue	5a+	2020-04-16 20:19:03.255305	2020-04-16 20:19:03.255305	0101000020E6100000A67C08AA464F054033F9669B1B3B4840	3	34	wall	\N
96	La Cachée	4c	2020-04-16 20:19:03.258264	2020-04-16 20:19:03.258264	0101000020E6100000856055BDFC4E054052465C001A3B4840	3	35	wall	\N
102	L'Impossible	5a+	2020-04-16 20:19:03.275219	2020-04-16 20:19:03.275219	0101000020E6100000A7E67283A14E0540C55565DF153B4840	3	38	mur	\N
105	Le Rouge et le Noir	5b+	2020-04-16 20:19:03.28409	2020-04-16 20:19:03.28409	0101000020E61000009983A0A3554D0540BDDF68C70D3B4840	4	12	wall	\N
106	Le Nain Jaune	5c+	2020-04-16 20:19:03.286851	2020-04-16 20:19:03.286851	0101000020E6100000E3E2A8DC444D05402ACAA5F10B3B4840	4	11	wall	\N
107	Adrénaline	6a	2020-04-16 20:19:03.289388	2020-04-16 20:19:03.289388	0101000020E6100000E96514CB2D4D0540A7EB89AE0B3B4840	4	10	overhang	\N
108	Coup de Poker	5c	2020-04-16 20:19:03.292023	2020-04-16 20:19:03.292023	0101000020E61000002D944C4EED4C05401E5036E50A3B4840	4	9	wall	\N
91	La Fédérale	5a+	2020-04-16 20:19:03.243833	2020-04-17 13:42:54.49828	0101000020E6100000A2293BFDA04E05407EC68503213B4840	3	32	wall	3
93	Le Whist	5c	2020-04-16 20:19:03.249386	2020-04-17 13:42:54.590717	0101000020E610000002D9EBDD1F4F05409622F94A203B4840	4	17	wall	4
89	La Queue du Dromadaire	4b+	2020-04-16 20:19:03.23842	2020-04-17 13:42:54.718302	0101000020E61000008F705AF0A24F0540E4BF4010203B4840	3	13	wall	4
88	Le Pilier du Dromadaire	4c	2020-04-16 20:19:03.234423	2020-04-17 13:42:54.750997	0101000020E6100000E449D235934F054061E124CD1F3B4840	3	14	wall	5
86	Le Beaufort	5b	2020-04-16 20:19:03.228394	2020-04-17 13:42:54.817058	0101000020E6100000782AE09EE74F054030293E3E213B4840	3	12	overhang	5
97	Le Sphinx (droite)	5c+	2020-04-16 20:19:03.261062	2020-04-17 13:42:54.878212	0101000020E61000004563EDEF6C4F0540B9A7AB3B163B4840	3	8	wall	4
98	La Golgotha (gauche)	5b+	2020-04-16 20:19:03.26406	2020-04-17 13:42:54.91164	0101000020E6100000EA58A5F44C4F0540E36E10AD153B4840	3	9	wall	4
99	Le Serpent	4c	2020-04-16 20:19:03.266975	2020-04-17 13:42:54.976756	0101000020E61000006EE00ED4294F05400D36751E153B4840	3	37	traverse	3
100	Le French Cancan	4c	2020-04-16 20:19:03.269684	2020-04-17 13:42:55.037118	0101000020E61000001E166A4DF34E05404277499C153B4840	3	36	wall	3
109	Le Smig	6a+	2020-04-16 20:19:03.295059	2020-04-17 13:42:55.066167	0101000020E61000008B6F287CB64E05404F594DD7133B4840	4	13	wall	4
103	Le Jeu de Go	5a+	2020-04-16 20:19:03.278128	2020-04-17 13:42:55.100401	0101000020E61000001FA2D11DC44E05401327F73B143B4840	3	39	wall	4
104	Superlative	6b+	2020-04-16 20:19:03.281088	2020-04-17 13:42:55.222305	0101000020E610000008AEF204C24E05405A9F724C163B4840	4	14	slab	6
101	Le Cervin	4b	2020-04-16 20:19:03.272614	2020-04-17 13:42:55.257009	0101000020E6100000B39AAE27BA4E0540FB96395D163B4840	3	40	slab	6
114	Le dévers	4b	2020-04-16 20:19:03.312006	2020-04-17 13:42:55.287965	0101000020E6100000070ABC934F4F0540467BBC900E3B4840	3	7	overhang	3
112	L'Ancien	6a	2020-04-16 20:19:03.30446	2020-04-17 13:42:55.34758	0101000020E61000005281936DE04E0540A2629CBF093B4840	4	5	overhang	4
113	Dure Limite	6b	2020-04-16 20:19:03.307868	2020-04-17 13:42:55.373792	0101000020E61000000DDFC2BAF14E0540D1E638B7093B4840	4	4	overhang	4
116	L'Atrappe-Mouche	5a+	2020-04-16 20:19:03.318314	2020-04-17 13:42:55.404908	0101000020E61000004ACE893DB44F0540A583F57F0E3B4840	3	6	wall	4
117	Le Bloc	5b	2020-04-16 20:19:03.321877	2020-04-17 13:42:55.437005	0101000020E610000072F90FE9B74F0540BE13B35E0C3B4840	3	5	wall	4
115	Le Talon d'Achille	6a+	2020-04-16 20:19:03.315145	2020-04-17 13:42:55.464779	0101000020E61000001D386744694F05401D1CEC4D0C3B4840	4	3	wall	3
118	L'Appuyette	5b	2020-04-16 20:19:03.324845	2020-04-17 13:42:55.497192	0101000020E610000089B3226AA24F0540A71FD4450A3B4840	3	4	slab	5
111	Presse Citron	6a	2020-04-16 20:19:03.301355	2020-04-17 13:42:55.850918	0101000020E6100000A4AB74779D4D0540425A63D0093B4840	4	8	wall	3
110	Jets Interdits	6a+	2020-04-16 20:19:03.29833	2020-04-17 13:42:55.877354	0101000020E61000003221E692AA4D0540AE105663093B4840	4	7	wall	3
120	Scarlatine	6b	2020-04-16 20:19:03.33075	2020-04-16 20:19:03.33075	0101000020E610000040321D3A3D4F0540384888F2053B4840	4	2	slab	\N
121	Le Bombé	5a	2020-04-16 20:19:03.333627	2020-04-16 20:19:03.333627	0101000020E6100000B7B3AF3C484F05406E895C70063B4840	3	3	overhang	\N
123	L'Intermédiaire	4a	2020-04-16 20:19:03.339222	2020-04-16 20:19:03.339222	0101000020E6100000DF52CE177B4F0540E2067C7E183B4840	3	10	wall	\N
125	\N	3c	2020-04-16 20:19:03.344473	2020-04-16 20:19:03.344473	0101000020E6100000711B0DE02D500540FB90B75CFD3A4840	2	37	wall	\N
128	Poésies	4a	2020-04-16 20:19:03.353357	2020-04-16 20:19:03.353357	0101000020E61000002D7C7DAD4B4D05409C6A2DCC423B4840	5	31	slab	\N
131	Macadam	6a	2020-04-16 20:19:03.361354	2020-04-16 20:19:03.361354	0101000020E6100000CBD6FA22A14D05404D1421753B3B4840	4	41	wall	\N
133	L'Araignée	6a	2020-04-16 20:19:03.366761	2020-04-16 20:19:03.366761	0101000020E61000001FBAA0BE654E05409F573CF5483B4840	4	38	overhang	\N
171	L'Abîme	4a+	2020-04-16 20:19:03.475224	2020-04-17 12:39:43.364818	0101000020E61000006571FF91E9500540670C7382363B4840	5	1	wall	5
195	Le Tabac	3a	2020-04-16 20:19:03.547996	2020-04-17 12:47:13.93497	0101000020E61000001BD82AC1E250054097900F7A363B4840	2	1	wall	5
138	Quatrain	4a+	2020-04-16 20:19:03.381005	2020-04-17 13:42:53.735952	0101000020E6100000BF2CEDD45C4E05406D1ADB6B413B4840	5	27	wall	4
135	La Dame de Pique	5c	2020-04-16 20:19:03.37264	2020-04-17 13:42:53.793619	0101000020E61000002046088F364E05400ADAE4F0493B4840	4	39	slab	4
134	Le Pont Mirabeau	5a	2020-04-16 20:19:03.369801	2020-04-17 13:42:53.822627	0101000020E61000008C4D2B85404E05407590D783493B4840	5	28	slab	4
136	Hôtels	4b	2020-04-16 20:19:03.375385	2020-04-17 13:42:53.85319	0101000020E610000080812040864E054025068195433B4840	5	29	wall	4
137	Le Pot de Fer	6b	2020-04-16 20:19:03.378151	2020-04-17 13:42:53.882116	0101000020E6100000F7C8E6AA794E0540D76839D0433B4840	4	40	overhang	4
129	Contemplations	5b	2020-04-16 20:19:03.356315	2020-04-17 13:42:54.035849	0101000020E61000007D5EF1D4234D054001309E41433B4840	5	30	wall	3
130	Nocturne	3c	2020-04-16 20:19:03.358913	2020-04-17 13:42:54.276185	0101000020E6100000986BD102B44D0540ED0BE8853B3B4840	5	32	wall	3
132	Saillie d'Esprit	6b+	2020-04-16 20:19:03.363868	2020-04-17 13:42:54.304215	0101000020E6100000B49080D1E54D05402FFB75A73B3B4840	4	42	wall	3
127	Faute de Frappe	5c	2020-04-16 20:19:03.350497	2020-04-17 13:42:55.00471	0101000020E610000040BE840A0E4F0540A73CBA11163B4840	4	15	wall	3
119	Le Pied Levé	4a	2020-04-16 20:19:03.327877	2020-04-17 13:42:55.532843	0101000020E610000046EF54C03D4F0540A4FE7A85053B4840	3	2	overhang	6
122	Force G	6a+	2020-04-16 20:19:03.336502	2020-04-17 13:42:55.561012	0101000020E6100000BD70E7C2484F054016A6EF35043B4840	4	1	wall	6
126	Le Cap Gap	5a	2020-04-16 20:19:03.34717	2020-04-17 13:42:55.622827	0101000020E610000001FBE8D4954F054075AE2825043B4840	3	1	slab	5
124	Quintessence	5c	2020-04-16 20:19:03.341645	2020-04-17 13:42:56.828437	0101000020E610000042CC2555DB4D0540130A1170083B4840	4	6	slab	4
220	Cadeau du Vent	7b	2020-04-16 20:19:03.620885	2020-04-17 13:42:52.381673	0101000020E6100000F3380CE6AF5005407286E28E373B4840	6	1	overhang	5
83	Le Butte	3b	2020-04-16 20:19:03.219112	2020-04-17 13:42:52.440588	0101000020E6100000B5DFDA8992500540F7CC9200353B4840	2	4	slab	3
82	Le Dalle Bleu	4c	2020-04-16 20:19:03.216232	2020-04-17 13:42:52.527297	0101000020E61000001C42959A3D5005402A55A2EC2D3B4840	2	5	slab	5
41	Champagne Frappé	2a	2020-04-16 20:19:03.090124	2020-04-17 13:42:53.941512	0101000020E6100000ED444948A44D054088635DDC463B4840	1	8	slab	4
230	Lévitation	7a+	2020-04-16 20:19:03.648415	2020-04-17 13:42:54.067674	0101000020E6100000EF74E789E74C054039F06AB9333B4840	6	10	roof	4
92	Le Bossu	6b	2020-04-16 20:19:03.246488	2020-04-17 13:42:54.620606	0101000020E610000057B26323104F054084B70721203B4840	4	16	overhang	4
157	Ode	4b+	2020-04-16 20:19:03.432134	2020-04-17 13:42:52.556336	0101000020E6100000F5A276BF0A50054084BD8921393B4840	5	7	wall	3
161	Puzzle	5c	2020-04-16 20:19:03.444224	2020-04-17 13:42:53.234122	0101000020E6100000F4FE3F4E9850054070EA03C93B3B4840	4	28	overhang	4
158	Ballade	4a+	2020-04-16 20:19:03.434597	2020-04-17 13:42:53.292928	0101000020E6100000EF1F0BD1215005401EC4CE143A3B4840	5	6	wall	4
155	Cadavre Exquis	4c	2020-04-16 20:19:03.426854	2020-04-17 13:42:53.322082	0101000020E6100000D464C6DB4A4F0540D2C26515363B4840	5	18	slab	4
156	Paysage	3b	2020-04-16 20:19:03.429431	2020-04-17 13:42:53.351369	0101000020E6100000C9B08A37324F0540AFEC82C1353B4840	5	19	wall	4
154	Mariage de Figaro	3b+	2020-04-16 20:19:03.424206	2020-04-17 13:42:53.385322	0101000020E6100000904E5DF92C4F0540AFEC82C1353B4840	2	16	traverse	4
151	L'Amour du Mensonge	4c	2020-04-16 20:19:03.416527	2020-04-17 13:42:53.414308	0101000020E6100000C3B986191A4F0540F0DB10E3353B4840	5	20	wall	4
153	Prose	4c	2020-04-16 20:19:03.421549	2020-04-17 13:42:53.4427	0101000020E6100000B8054B75014F054097900F7A363B4840	5	21	wall	4
143	Le Pion Cassé	5a	2020-04-16 20:19:03.39548	2020-04-17 13:42:53.471484	0101000020E6100000C345EEE9EA4E0540EB6F09C03F3B4840	4	32	wall	4
144	L'Astragale	6b	2020-04-16 20:19:03.39802	2020-04-17 13:42:53.529695	0101000020E6100000A1116C5CFF4E05404487C091403B4840	4	33	wall	4
145	Caprice	6a	2020-04-16 20:19:03.400619	2020-04-17 13:42:53.558557	0101000020E610000085268925E54E05401AC05B20413B4840	4	34	wall	4
140	Chanson d'Automne	4a	2020-04-16 20:19:03.387309	2020-04-17 13:42:53.617707	0101000020E610000086048C2E6F4E0540ECA353573E3B4840	5	23	wall	5
141	Bateau Ivre	4b+	2020-04-16 20:19:03.390152	2020-04-17 13:42:53.67753	0101000020E61000004128EFE3684E05400F46EC13403B4840	5	24	wall	5
139	Le Sylphe	5a	2020-04-16 20:19:03.384731	2020-04-17 13:42:53.706393	0101000020E6100000F8544E7B4A4E05402C2B4D4A413B4840	5	26	wall	4
147	L'Oeuf de Colombe	6a	2020-04-16 20:19:03.405965	2020-04-17 13:42:53.76578	0101000020E610000085B2F0F5B54E05401503249A403B4840	4	31	wall	3
142	Il va Neiger	3c	2020-04-16 20:19:03.392806	2020-04-16 20:19:03.392806	0101000020E6100000FD1186014B4E05406891ED7C3F3B4840	5	25	wall	\N
146	La Longue Marche	6b	2020-04-16 20:19:03.40327	2020-04-16 20:19:03.40327	0101000020E61000007F2F8507CD4E0540C1745AB7413B4840	4	35	traverse	\N
148	Pyramide	5c	2020-04-16 20:19:03.408707	2020-04-16 20:19:03.408707	0101000020E6100000BC92E4B9BE4F05401AC05B20413B4840	4	36	slab	\N
149	Les Temps Modernes	6b	2020-04-16 20:19:03.411405	2020-04-16 20:19:03.411405	0101000020E610000095456117454F05401C5C3AE63C3B4840	4	29	traverse	\N
150	Le Chou-Fleur	4a	2020-04-16 20:19:03.413927	2020-04-16 20:19:03.413927	0101000020E6100000622CD32F114F05403BA92F4B3B3B4840	5	22	wall	\N
152	Prison	2b	2020-04-16 20:19:03.419142	2020-04-16 20:19:03.419142	0101000020E6100000B83F170D194F054008043A93363B4840	2	15	wall	\N
159	Complainte	3b	2020-04-16 20:19:03.437792	2020-04-16 20:19:03.437792	0101000020E6100000D2A8C0C9365005408F37F92D3A3B4840	5	5	slab	\N
160	L'Hiver	4b+	2020-04-16 20:19:03.441015	2020-04-16 20:19:03.441015	0101000020E610000088F71C588E5005408DCF64FF3C3B4840	5	4	overhang	\N
165	Sonnets Posthumes	4c	2020-04-16 20:19:03.45845	2020-04-16 20:19:03.45845	0101000020E61000002FFB75A73B4F05407EE36BCF2C3B4840	5	11	wall	\N
167	Opus Dei	3c	2020-04-16 20:19:03.464213	2020-04-16 20:19:03.464213	0101000020E61000008FC2F5285C4F0540B8AD2D3C2F3B4840	2	11	wall	\N
168	Strophe	4a	2020-04-16 20:19:03.466775	2020-04-16 20:19:03.466775	0101000020E610000045292158554F0540FAD005F52D3B4840	5	12	wall	\N
169	Stances	4c	2020-04-16 20:19:03.46935	2020-04-16 20:19:03.46935	0101000020E6100000B727486C774F0540EE224C512E3B4840	5	13	overhang	\N
170	Crépuscule	4b	2020-04-16 20:19:03.472262	2020-04-16 20:19:03.472262	0101000020E610000034A0DE8C9A4F054082380F27303B4840	5	9	wall	\N
181	Le Cruciverbiste	6a	2020-04-16 20:19:03.503077	2020-04-16 20:19:03.503077	0101000020E6100000F1F3DF83D74E0540BDE5EAC7263B4840	3	16b	slab	\N
185	Styrax	5c	2020-04-16 20:19:03.513481	2020-04-16 20:19:03.513481	0101000020E61000005704FF5BC94E0540D3D9C9E0283B4840	4	22	wall	\N
186	La Dalle de Marbre	4c	2020-04-16 20:19:03.516731	2020-04-16 20:19:03.516731	0101000020E6100000BE141E34BB4E05401074B4AA253B4840	3	15	slab	\N
187	L'eunnuque	4a	2020-04-16 20:19:03.523176	2020-04-16 20:19:03.523176	0101000020E6100000952D9276A34F05408F1A13622E3B4840	3	22	wall	\N
188	La Frouch'mammouth	4c	2020-04-16 20:19:03.527786	2020-04-16 20:19:03.527786	0101000020E6100000897956D28A4F0540C4279D48303B4840	3	24	wall	\N
189	Les Plats	4b	2020-04-16 20:19:03.530687	2020-04-16 20:19:03.530687	0101000020E6100000F0FD0DDAAB4F05404DF73AA92F3B4840	3	23	wall	\N
190	\N	3c	2020-04-16 20:19:03.533414	2020-04-16 20:19:03.533414	0101000020E6100000B7D5AC33BE4F05400C3CF71E2E3B4840	2	7	overhang	\N
191	SOS Glycogène	5c	2020-04-16 20:19:03.536171	2020-04-16 20:19:03.536171	0101000020E6100000ADDD76A1B94E0540035E66D8283B4840	4	23	overhang	\N
192	Le Couloir	4b	2020-04-16 20:19:03.539036	2020-04-16 20:19:03.539036	0101000020E61000003B191C25AF4E0540DAFE9595263B4840	3	30	wall	\N
194	L'Emmenthal	4a	2020-04-16 20:19:03.544902	2020-04-16 20:19:03.544902	0101000020E6100000A794D74AE84E0540E6AC4F39263B4840	3	16	wall	\N
197	Échec et Mat	5c	2020-04-16 20:19:03.553306	2020-04-16 20:19:03.553306	0101000020E61000009D4A06802A4E05400E2F88484D3B4840	4	37	wall	\N
198	Bateau Pilote	6a	2020-04-16 20:19:03.556024	2020-04-16 20:19:03.556024	0101000020E6100000C9022670EB4E0540AB7AF99D263B4840	4	18	wall	\N
173	La Belle Vieille	3c	2020-04-16 20:19:03.48083	2020-04-17 13:42:41.116518	0101000020E6100000B55373B9C15005405B5EB9DE363B4840	5	3	wall	5
174	Solitude	4a	2020-04-16 20:19:03.483646	2020-04-17 13:42:52.322432	0101000020E6100000D1048A58C4500540DE3CD521373B4840	5	2	wall	5
172	La Prothèse	6a+	2020-04-16 20:19:03.478131	2020-04-17 13:42:52.353093	0101000020E6100000494C50C3B7500540909F8D5C373B4840	4	27	wall	5
175	Fantaisie	4a	2020-04-16 20:19:03.486351	2020-04-17 13:42:52.409598	0101000020E61000002CD505BCCC50054048BF7D1D383B4840	5	D	other	4
176	Le Damier	6b+	2020-04-16 20:19:03.489102	2020-04-17 13:42:52.46864	0101000020E6100000823AE5D18D5005401AA37554353B4840	4	26	slab	4
177	L'Espace	5a	2020-04-16 20:19:03.491804	2020-04-17 13:42:52.496025	0101000020E6100000F4C473B6805005401AA37554353B4840	5	8	wall	4
164	Égérie	4b	2020-04-16 20:19:03.455374	2020-04-17 13:42:52.798636	0101000020E6100000AC394030474F05409C3061342B3B4840	5	10	slab	4
163	La Contralto	5a	2020-04-16 20:19:03.451859	2020-04-17 13:42:52.865136	0101000020E61000008ACBF10A444F0540F67B629D2A3B4840	3	20	wall	6
166	La Bendix	5b+	2020-04-16 20:19:03.461333	2020-04-17 13:42:52.897905	0101000020E6100000CEE15AED614F0540A77686A92D3B4840	3	21	wall	5
178	Le Fourre-Tout	6a+	2020-04-16 20:19:03.494721	2020-04-17 13:42:52.927524	0101000020E6100000A1116C5CFF4E05402600FF942A3B4840	4	24	traverse	4
180	La Soprano	4a	2020-04-16 20:19:03.500527	2020-04-17 13:42:52.960347	0101000020E6100000B24813EF004F054050C763062A3B4840	3	18	overhang	5
179	La Goulotte	3c	2020-04-16 20:19:03.497705	2020-04-17 13:42:53.026796	0101000020E610000057B26323104F0540850838842A3B4840	3	19	wall	3
183	Chlorophylle	6b	2020-04-16 20:19:03.508384	2020-04-17 13:42:53.054574	0101000020E6100000191F662FDB4E054045813E91273B4840	4	20	slab	6
182	Le Cheval d'Arçon	5b+	2020-04-16 20:19:03.505746	2020-04-17 13:42:53.08796	0101000020E61000007F69519FE44E054092EA3BBF283B4840	3	17	wall	6
184	La Vieille	5c+	2020-04-16 20:19:03.511011	2020-04-17 13:42:53.117409	0101000020E6100000E0BC38F1D54E0540035E66D8283B4840	4	21	wall	6
193	Les Petits Pieds	6a	2020-04-16 20:19:03.541645	2020-04-17 13:42:53.176955	0101000020E6100000DAFF006BD54E0540698B6B7C263B4840	4	19	slab	4
162	Le Dé	5b	2020-04-16 20:19:03.447369	2020-04-17 13:42:53.646	0101000020E6100000193735D07C4E054081ED60C43E3B4840	4	30	overhang	5
196	Outrage	5b+	2020-04-16 20:19:03.550693	2020-04-17 13:42:54.09608	0101000020E6100000DDB1D826154D0540096CCEC1333B4840	4	43	wall	4
199	Le But	4a	2020-04-16 20:19:03.559041	2020-04-16 20:19:03.559041	0101000020E61000001A89D008364E0540904E5DF92C3B4840	3	26	wall	\N
200	L'Oubliée	4b	2020-04-16 20:19:03.561823	2020-04-16 20:19:03.561823	0101000020E6100000CB845FEAE74D05400ED8D5E4293B4840	3	27	wall	\N
203	Les Horloges	3b	2020-04-16 20:19:03.570915	2020-04-16 20:19:03.570915	0101000020E6100000DE770C8FFD4C05409EB5DB2E343B4840	5	33	wall	\N
204	Gravitation	4a	2020-04-16 20:19:03.573668	2020-04-16 20:19:03.573668	0101000020E610000066BCADF4DA4C0540C18BBE82343B4840	5	34	overhang	\N
205	Le Tarot	5c	2020-04-16 20:19:03.576541	2020-04-16 20:19:03.576541	0101000020E61000006C79E57ADB4C0540FDBD141E343B4840	4	44	overhang	\N
206	Boute-en-Train	4c	2020-04-16 20:19:03.57939	2020-04-16 20:19:03.57939	0101000020E6100000C18C2958E34C0540D5928E72303B4840	4	45	other	\N
207	Angoisse	4b	2020-04-16 20:19:03.58209	2020-04-16 20:19:03.58209	0101000020E61000000569C6A2E94C0540F3AB3940303B4840	5	35	wall	\N
208	Tristesse	4a	2020-04-16 20:19:03.585363	2020-04-16 20:19:03.585363	0101000020E61000008942CBBA7F4C0540BF9EAF592E3B4840	5	36	overhang	\N
210	Méditation	4c	2020-04-16 20:19:03.591445	2020-04-16 20:19:03.591445	0101000020E610000000FE2955A24C0540317A6EA12B3B4840	5	38	wall	\N
222	Lune de Fiel	7a	2020-04-16 20:19:03.626411	2020-04-16 20:19:03.626411	0101000020E6100000BDC282FB014F0540D5AF743E3C3B4840	6	3	traverse	\N
224	Les Câlins de Kim	7a	2020-04-16 20:19:03.631588	2020-04-16 20:19:03.631588	0101000020E6100000CAA65CE15D4E05408DEC4ACB483B4840	6	5	overhang	\N
225	Cocaline	7b+	2020-04-16 20:19:03.634118	2020-04-16 20:19:03.634118	0101000020E61000006953758F6C4E054016889E94493B4840	6	5b	traverse	\N
227	Canonnerie	6c	2020-04-16 20:19:03.640143	2020-04-16 20:19:03.640143	0101000020E6100000861C5BCF104E0540083E062B4E3B4840	6	7	traverse	\N
228	Pot de Terre	6c+	2020-04-16 20:19:03.642973	2020-04-16 20:19:03.642973	0101000020E61000003CA583F57F4E054066F50EB7433B4840	6	8	wall	\N
219	Nuage Blanc	6a+	2020-04-16 20:19:03.618292	2020-04-17 13:42:52.583855	0101000020E610000034F279C5534F0540DB4FC6F8303B4840	4	25	overhang	4
218	Le Surplomb du Bengale	5c	2020-04-16 20:19:03.61576	2020-04-17 13:42:52.616538	0101000020E6100000DF180280634F05403A58FFE7303B4840	3	25	overhang	4
217	Élégie	3c	2020-04-16 20:19:03.613172	2020-04-17 13:42:52.64786	0101000020E610000040A6B5696C4F0540DB4FC6F8303B4840	5	14	wall	4
216	L'Amérique	4a	2020-04-16 20:19:03.610389	2020-04-17 13:42:52.676311	0101000020E610000029B2D6506A4F0540573D601E323B4840	5	15	wall	4
215	Le Vallon	5c	2020-04-16 20:19:03.60743	2020-04-17 13:42:52.706408	0101000020E61000009B3C65355D4F0540F834272F323B4840	5	16	wall	4
214	Soleil Couchant	4b	2020-04-16 20:19:03.604353	2020-04-17 13:42:52.737788	0101000020E610000012842BA0504F0540C9B08A37323B4840	5	17	wall	4
221	Magifix	6c+	2020-04-16 20:19:03.623733	2020-04-17 13:42:53.26309	0101000020E6100000A4A833F790500540E71A66683C3B4840	6	2	overhang	4
223	L'Innominata	6c+	2020-04-16 20:19:03.629074	2020-04-17 13:42:53.502098	0101000020E61000004CFE277FF74E0540F12C4146403B4840	6	4	wall	4
226	Morphotype	6c+	2020-04-16 20:19:03.636799	2020-04-17 13:42:53.588957	0101000020E6100000A19DD32CD04E05407FA2B2614D3B4840	6	6	overhang	5
229	Beaux Mouvements sur Fonds Sableux	6c+	2020-04-16 20:19:03.64575	2020-04-17 13:42:53.911082	0101000020E6100000144031B2644E0540BF0CC688443B4840	6	9	overhang	3
209	Les Chimères	4a	2020-04-16 20:19:03.588394	2020-04-17 13:42:54.125211	0101000020E6100000501A6A14924C0540C6C37B0E2C3B4840	5	37	traverse	3
211	Anthologie	4b	2020-04-16 20:19:03.594483	2020-04-17 13:42:54.156178	0101000020E61000005CE674594C4C0540EF5696E82C3B4840	5	39	slab	4
213	Boomerang	6a	2020-04-16 20:19:03.601495	2020-04-17 13:42:54.18405	0101000020E6100000FB58C16F434C054024986A662D3B4840	4	46	wall	5
212	Fables	4a+	2020-04-16 20:19:03.597443	2020-04-17 13:42:54.212701	0101000020E6100000D9EA724A404C0540A1B94E232D3B4840	5	40	slab	5
201	La Spéciale	4a+	2020-04-16 20:19:03.564889	2020-04-17 13:42:54.398151	0101000020E610000059C0046EDD4D05402634492C293B4840	3	28	wall	4
202	La Bizuth	4b	2020-04-16 20:19:03.568045	2020-04-17 13:42:54.433065	0101000020E6100000439259BDC34D0540D3D9C9E0283B4840	3	29	wall	3
231	Sledgehammer	7a	2020-04-16 20:19:03.651288	2020-04-16 20:19:03.651288	0101000020E61000007D24253D0C4D054004E3E0D2313B4840	6	11	traverse	\N
233	Expositions retrospectives	6c+	2020-04-16 20:19:03.656695	2020-04-16 20:19:03.656695	0101000020E610000002F1BA7EC14E0540035E66D8283B4840	6	13	wall	\N
234	Les Copains d'abord	7a	2020-04-16 20:19:03.659414	2020-04-16 20:19:03.659414	0101000020E61000004F95EF19895005408A743FA7203B4840	6	14	overhang	\N
240	36.15 Power	7c	2020-04-16 20:19:03.67612	2020-04-16 20:19:03.67612	0101000020E610000062DA37F7574F0540931804560E3B4840	6	20b	overhang	\N
241	36.15 Gauche	7a	2020-04-16 20:19:03.678818	2020-04-16 20:19:03.678818	0101000020E610000079CE16105A4F054082AD122C0E3B4840	6	20	overhang	\N
232	Jour de Pluie	7b	2020-04-16 20:19:03.653963	2020-04-17 13:42:54.336368	0101000020E610000009A4C4AEED4D05405C751DAA293B4840	6	12	overhang	4
236	Gainage et Dévers	6c	2020-04-16 20:19:03.665873	2020-04-17 13:42:54.683063	0101000020E61000002F4D11E0F44E0540A5A0DB4B1A3B4840	6	16	traverse	3
235	La Singlette	6b+	2020-04-16 20:19:03.662079	2020-04-17 13:42:54.846625	0101000020E61000005CCB64389E4F05408FE046CA163B4840	6	15	traverse	4
238	La Dénoyautée	7a+	2020-04-16 20:19:03.671096	2020-04-17 13:42:54.941546	0101000020E61000007FDDE9CE134F05401A187959133B4840	6	18	wall	4
237	Délivrance / Marquis de Sade	7a+	2020-04-16 20:19:03.668523	2020-04-17 13:42:55.195156	0101000020E61000002A1C412AC54E0540D7C05609163B4840	6	17	slab	6
239	Nut's	7b	2020-04-16 20:19:03.673611	2020-04-17 13:42:55.318706	0101000020E6100000293E3E213B4F0540F8DD74CB0E3B4840	6	19	overhang	4
242	Fantasia chez les Ploucs	7a+	2020-04-16 20:19:03.682064	2020-04-17 13:42:55.590545	0101000020E610000034A0DE8C9A4F0540D93F4F03063B4840	6	21	overhang	4
243	Les Grimpeurs se Cachent pour Médire	7a	2020-04-16 20:19:03.684865	2020-04-17 13:42:55.696443	0101000020E61000000744882B674F0540D65240DAFF3A4840	6	22	\N	5
245	Chasseur de Prises	7a	2020-04-16 20:19:03.691413	2020-04-17 13:42:55.727025	0101000020E61000008D62B9A5D5500540B8054B75013B4840	6	24	wall	4
244	La Théorie du Chaos	7b	2020-04-16 20:19:03.688228	2020-04-17 13:42:55.758855	0101000020E6100000DE3AFF76D94F05403F1C2444F93A4840	6	23	overhang	4
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
4	[{"x":0.3789,"y":0.6789},{"x":0.4092,"y":0.4193},{"x":0.3592,"y":0.0684}]	77	2020-04-18 20:36:55.36101	2020-04-18 21:00:40.036039
6	[{"x":0.3882,"y":0.7123},{"x":0.3579,"y":0.5228},{"x":0.3803,"y":0.3386}]	176	2020-04-18 20:36:55.470758	2020-04-18 21:00:40.039211
10	[{"x":0.7596,"y":0.5789},{"x":0.8193,"y":0.4289},{"x":0.8596,"y":0.25}]	200	2020-04-18 20:36:55.630165	2020-04-18 21:00:40.046038
11	[{"x":0.3895,"y":0.5596},{"x":0.4,"y":0.3789},{"x":0.3895,"y":0.0491}]	201	2020-04-18 20:36:55.670284	2020-04-18 21:00:40.047494
13	[{"x":0.6724,"y":0.7632},{"x":0.7658,"y":0.6228},{"x":0.7842,"y":0.4544},{"x":0.7829,"y":0.3281},{"x":0.7487,"y":0.2842}]	229	2020-04-18 20:36:55.734295	2020-04-18 21:00:40.050616
16	[{"x":0.3211,"y":0.6263},{"x":0.3026,"y":0.4298},{"x":0.3066,"y":0.2088},{"x":0.3329,"y":0.0263}]	163	2020-04-18 20:36:55.834834	2020-04-18 21:00:40.055323
19	[{"x":0.4592,"y":0.4596},{"x":0.4289,"y":0.3193},{"x":0.4197,"y":0.1}]	74	2020-04-18 20:36:55.933529	2020-04-18 21:00:40.060004
23	[{"x":0.25,"y":0.5088},{"x":0.2289,"y":0.4},{"x":0.25,"y":0.1596}]	175	2020-04-18 20:36:56.077299	2020-04-18 21:00:40.069497
24	[{"x":0.5298,"y":0.5132},{"x":0.5123,"y":0.3421},{"x":0.5439,"y":0.1921},{"x":0.6298,"y":0.1224}]	161	2020-04-18 20:36:56.114268	2020-04-18 21:00:40.076053
27	[{"x":0.1789,"y":0.4596},{"x":0.1895,"y":0.3193},{"x":0.25,"y":0.0596}]	216	2020-04-18 20:36:56.219626	2020-04-18 21:00:40.081251
28	[{"x":0.3592,"y":0.7},{"x":0.3395,"y":0.4298},{"x":0.3697,"y":0.1684}]	202	2020-04-18 20:36:56.250382	2020-04-18 21:00:40.082763
32	[{"x":0.5895,"y":0.5684},{"x":0.5697,"y":0.3491},{"x":0.5289,"y":0.0789}]	49	2020-04-18 20:36:56.409067	2020-04-18 21:00:40.089516
33	[{"x":0.7092,"y":0.5895},{"x":0.7395,"y":0.0789}]	61	2020-04-18 20:36:56.437838	2020-04-18 21:00:40.090972
35	[{"x":0.2092,"y":0.6},{"x":0.2197,"y":0.4088},{"x":0.2289,"y":0.1684}]	59	2020-04-18 20:36:56.514756	2020-04-18 21:00:40.093683
37	[{"x":0.3592,"y":0.6491},{"x":0.4197,"y":0.2},{"x":0.4592,"y":0.0491}]	65	2020-04-18 20:36:56.59497	2020-04-18 21:00:40.09649
40	[{"x":0.5,"y":0.6298},{"x":0.55,"y":0.4193},{"x":0.6289,"y":0.2789},{"x":0.6395,"y":0.1789},{"x":0.6197,"y":0.0298}]	158	2020-04-18 20:36:56.726179	2020-04-18 21:00:40.101082
43	[{"x":0.3395,"y":0.6491},{"x":0.3697,"y":0.3789},{"x":0.3197,"y":0.0298}]	213	2020-04-18 20:36:56.842231	2020-04-18 21:00:40.105718
45	[{"x":0.3092,"y":0.5895},{"x":0.35,"y":0.4},{"x":0.3395,"y":0.0596}]	159	2020-04-18 20:36:56.929777	2020-04-18 21:00:40.109013
48	[{"x":0.4684,"y":0.5395},{"x":0.5,"y":0.3697},{"x":0.6088,"y":0.15}]	64	2020-04-18 20:36:57.044109	2020-04-18 21:00:40.11371
51	[{"x":0.2526,"y":0.614},{"x":0.2947,"y":0.3333},{"x":0.3579,"y":0.2211},{"x":0.4026,"y":0.0544}]	198	2020-04-18 20:36:57.165773	2020-04-18 21:00:40.118371
53	[{"x":0.6526,"y":0.6333},{"x":0.6763,"y":0.3526},{"x":0.6763,"y":0.0667}]	72	2020-04-18 20:36:57.24196	2020-04-18 21:00:40.12159
56	[{"x":0.45,"y":0.7},{"x":0.5092,"y":0.3193},{"x":0.5789,"y":0.0684}]	211	2020-04-18 20:36:57.358564	2020-04-18 21:00:40.126213
58	[{"x":0.7421,"y":0.5351},{"x":0.7171,"y":0.414},{"x":0.7434,"y":0.2719},{"x":0.7158,"y":0.186}]	239	2020-04-18 20:36:57.438395	2020-04-18 21:00:40.129172
60	[{"x":0.1592,"y":0.6193},{"x":0.1092,"y":0.5},{"x":0.1289,"y":0.3491},{"x":0.1592,"y":0.2386}]	204	2020-04-18 20:36:57.522941	2020-04-18 21:00:40.132178
64	[{"x":0.2947,"y":0.5596},{"x":0.3039,"y":0.3737},{"x":0.3724,"y":0.1211}]	98	2020-04-18 20:36:57.702249	2020-04-18 21:00:40.138124
65	[{"x":0.4092,"y":0.6895},{"x":0.4,"y":0.1088}]	73	2020-04-18 20:36:57.737684	2020-04-18 21:00:40.139445
67	[{"x":0.4895,"y":0.6386},{"x":0.4895,"y":0.4088},{"x":0.5092,"y":0.1789}]	67	2020-04-18 20:36:57.823657	2020-04-18 21:00:40.142871
70	[{"x":0.6289,"y":0.5088},{"x":0.6092,"y":0.2895},{"x":0.5895,"y":0.1}]	28	2020-04-18 20:36:57.949455	2020-04-18 21:00:40.147648
72	[{"x":0.6281,"y":0.5671},{"x":0.6035,"y":0.3921},{"x":0.5719,"y":0.2184}]	115	2020-04-18 20:36:58.032896	2020-04-18 21:00:40.15061
75	[{"x":0.8592,"y":0.6491},{"x":0.85,"y":0.4491},{"x":0.7895,"y":0.2596}]	128	2020-04-18 20:36:58.149081	2020-04-18 21:00:40.155596
77	[{"x":0.75,"y":0.6088},{"x":0.6789,"y":0.2088}]	17	2020-04-18 20:36:58.231256	2020-04-18 21:00:40.158725
78	[{"x":0.5053,"y":0.5702},{"x":0.4579,"y":0.2789},{"x":0.4487,"y":0.0105}]	116	2020-04-18 20:36:58.267143	2020-04-18 21:00:40.160174
81	[{"x":0.2193,"y":0.5789},{"x":0.2684,"y":0.4092},{"x":0.3491,"y":0.2}]	117	2020-04-18 20:36:58.382356	2020-04-18 21:00:40.164613
83	[{"x":0.6934,"y":0.6088},{"x":0.6303,"y":0.4386},{"x":0.5895,"y":0.2825},{"x":0.6,"y":0.0825}]	113	2020-04-18 20:36:58.472796	2020-04-18 21:00:40.170358
86	[{"x":0.4053,"y":0.6491},{"x":0.4763,"y":0.4228},{"x":0.5342,"y":0.2386},{"x":0.5592,"y":0.0509}]	112	2020-04-18 20:36:58.589598	2020-04-18 21:00:40.175858
90	[{"x":0.4895,"y":0.6298},{"x":0.55,"y":0.2491}]	110	2020-04-18 20:36:58.761552	2020-04-18 21:00:40.182548
91	[{"x":0.1,"y":0.5197},{"x":0.1088,"y":0.3289},{"x":0.1491,"y":0.2092}]	138	2020-04-18 20:36:58.806167	2020-04-18 21:00:40.184184
93	[{"x":0.0895,"y":0.7193},{"x":0.1289,"y":0.5491},{"x":0.2092,"y":0.2684},{"x":0.2092,"y":0.1684}]	111	2020-04-18 20:36:58.889003	2020-04-18 21:00:40.187401
96	[{"x":0.7395,"y":0.5386},{"x":0.6092,"y":0.3386},{"x":0.55,"y":0.1491}]	21	2020-04-18 20:36:59.010758	2020-04-18 21:00:40.191709
98	[{"x":0.3974,"y":0.607},{"x":0.4039,"y":0.4544},{"x":0.3197,"y":0.3333},{"x":0.3053,"y":0.186}]	120	2020-04-18 20:36:59.095596	2020-04-18 21:00:40.19438
102	[{"x":0.114,"y":0.5158},{"x":0.1579,"y":0.4197},{"x":0.2456,"y":0.2697},{"x":0.2684,"y":0.2487}]	135	2020-04-18 20:36:59.257692	2020-04-18 21:00:40.199921
103	[{"x":0.5298,"y":0.6197},{"x":0.5,"y":0.4789},{"x":0.5491,"y":0.15}]	121	2020-04-18 20:36:59.295566	2020-04-18 21:00:40.201354
106	[{"x":0.4092,"y":0.5298},{"x":0.3895,"y":0.3088},{"x":0.4092,"y":0.1684}]	36	2020-04-18 20:36:59.424191	2020-04-18 21:00:40.205761
109	[{"x":0.4395,"y":0.5},{"x":0.4395,"y":0.2684},{"x":0.4697,"y":0.0193}]	123	2020-04-18 20:36:59.583821	2020-04-18 21:00:40.210887
111	[{"x":0.2456,"y":0.4329},{"x":0.2509,"y":0.275},{"x":0.314,"y":0.1592}]	240	2020-04-18 20:36:59.668278	2020-04-18 21:00:40.214418
113	[{"x":0.25,"y":0.4684},{"x":0.2789,"y":0.2895},{"x":0.3395,"y":0.1386}]	136	2020-04-18 20:36:59.740272	2020-04-18 21:00:40.217436
116	[{"x":0.3329,"y":0.5281},{"x":0.3553,"y":0.2912},{"x":0.3829,"y":0.1123}]	132	2020-04-18 20:36:59.860067	2020-04-18 21:00:40.22191
119	[{"x":0.2724,"y":0.7298},{"x":0.4184,"y":0.5088},{"x":0.4171,"y":0.2947},{"x":0.3947,"y":0.1965},{"x":0.3316,"y":0.0123}]	245	2020-04-18 20:36:59.981833	2020-04-18 21:00:40.226373
122	[{"x":0.8092,"y":0.6491},{"x":0.7289,"y":0.5491},{"x":0.7,"y":0.3789},{"x":0.6895,"y":0.1895},{"x":0.6789,"y":0.1088}]	32	2020-04-18 20:37:00.094688	2020-04-18 21:00:40.230612
124	[{"x":0.5395,"y":0.6},{"x":0.5697,"y":0.4491},{"x":0.6197,"y":0.2}]	30	2020-04-18 20:37:00.175966	2020-04-18 21:00:40.233337
1	[{"x":0.1789,"y":0.4596},{"x":0.25,"y":0.4088},{"x":0.35,"y":0.4298},{"x":0.5,"y":0.4298},{"x":0.5895,"y":0.2684},{"x":0.5697,"y":0.1596}]	1	2020-04-18 19:51:17.374644	2020-04-18 21:00:40.237833
129	[{"x":0.4789,"y":0.6},{"x":0.4395,"y":0.4298},{"x":0.45,"y":0.1193}]	130	2020-04-18 20:37:00.356404	2020-04-18 21:00:40.242583
132	[{"x":0.2697,"y":0.5526},{"x":0.2618,"y":0.3},{"x":0.2842,"y":0.1825}]	25	2020-04-18 20:37:00.470415	2020-04-18 21:00:40.246864
134	[{"x":0.6895,"y":0.4491},{"x":0.5395,"y":0.2684}]	42	2020-04-18 20:37:00.539647	2020-04-18 21:00:40.249573
136	[{"x":0.5092,"y":0.5298},{"x":0.4592,"y":0.2895},{"x":0.45,"y":0.0684}]	56	2020-04-18 20:37:00.616095	2020-04-18 21:00:40.252466
138	[{"x":0.4618,"y":0.5982},{"x":0.4961,"y":0.3842},{"x":0.5118,"y":0.2474},{"x":0.5368,"y":0.1}]	194	2020-04-18 20:37:00.681426	2020-04-18 21:00:40.255586
141	[{"x":0.5461,"y":0.4702},{"x":0.5645,"y":0.2702},{"x":0.5276,"y":0.0509}]	143	2020-04-18 20:37:00.793299	2020-04-18 21:00:40.259951
145	[{"x":0.4382,"y":0.6561},{"x":0.5197,"y":0.5368},{"x":0.5316,"y":0.3614},{"x":0.4697,"y":0.2474},{"x":0.2658,"y":0.1316},{"x":0.2539,"y":0.0754},{"x":0.2632,"y":0.0456}]	221	2020-04-18 20:37:00.939492	2020-04-18 21:00:40.265736
148	[{"x":0.5592,"y":0.5193},{"x":0.5197,"y":0.3386},{"x":0.4697,"y":0.1386},{"x":0.4789,"y":0.1193}]	208	2020-04-18 20:37:01.06601	2020-04-18 21:00:40.270508
151	[{"x":0.4,"y":0.5684},{"x":0.4289,"y":0.1789}]	94	2020-04-18 20:37:01.170633	2020-04-18 21:00:40.275228
153	[{"x":0.6697,"y":0.5491},{"x":0.6724,"y":0.4281},{"x":0.6171,"y":0.2807},{"x":0.5605,"y":0.1263}]	181	2020-04-18 20:37:01.243795	2020-04-18 21:00:40.278699
156	[{"x":0.5895,"y":0.5789},{"x":0.5697,"y":0.3491},{"x":0.5697,"y":0.2386}]	43	2020-04-18 20:37:01.362609	2020-04-18 21:00:40.283257
158	[{"x":0.5895,"y":0.4684},{"x":0.5895,"y":0.2684},{"x":0.55,"y":0.0684}]	41	2020-04-18 20:37:01.442855	2020-04-18 21:00:40.286186
160	[{"x":0.4013,"y":0.5684},{"x":0.3618,"y":0.3754},{"x":0.3461,"y":0.1772},{"x":0.3513,"y":0.0825}]	197	2020-04-18 20:37:01.521857	2020-04-18 21:00:40.289188
162	[{"x":0.5298,"y":0.5697},{"x":0.4895,"y":0.4},{"x":0.4789,"y":0.1197}]	96	2020-04-18 20:37:01.58881	2020-04-18 21:00:40.295546
165	[{"x":0.8197,"y":0.6088},{"x":0.7697,"y":0.5},{"x":0.7289,"y":0.3088}]	154	2020-04-18 20:37:01.717044	2020-04-18 21:00:40.300266
169	[{"x":0.3368,"y":0.6658},{"x":0.4298,"y":0.5368},{"x":0.4228,"y":0.4382},{"x":0.3491,"y":0.375},{"x":0.3105,"y":0.2618},{"x":0.3404,"y":0.1763}]	237	2020-04-18 20:37:01.877461	2020-04-18 21:00:40.30676
172	[{"x":0.55,"y":0.5596},{"x":0.5395,"y":0.3684},{"x":0.5092,"y":0.1}]	155	2020-04-18 20:37:02.015801	2020-04-18 21:00:40.311608
173	[{"x":0.2197,"y":0.5895},{"x":0.2395,"y":0.4},{"x":0.3197,"y":0.1895},{"x":0.4,"y":0.1193}]	83	2020-04-18 20:37:02.053489	2020-04-18 21:00:40.31305
177	[{"x":0.1,"y":0.5789},{"x":0.1092,"y":0.4193},{"x":0.15,"y":0.2}]	196	2020-04-18 20:37:02.203214	2020-04-18 21:00:40.319029
178	[{"x":0.7386,"y":0.5197},{"x":0.6386,"y":0.3895},{"x":0.6298,"y":0.2289}]	54	2020-04-18 20:37:02.240658	2020-04-18 21:00:40.320461
181	[{"x":0.7197,"y":0.5193},{"x":0.7,"y":0.3088},{"x":0.6395,"y":0.0193}]	186	2020-04-18 20:37:02.357726	2020-04-18 21:00:40.32541
183	[{"x":0.4298,"y":0.5395},{"x":0.4088,"y":0.4},{"x":0.4386,"y":0.2789}]	50	2020-04-18 20:37:02.43824	2020-04-18 21:00:40.328215
185	[{"x":0.4789,"y":0.6},{"x":0.4697,"y":0.4},{"x":0.4895,"y":0.2298},{"x":0.4697,"y":0.1}]	151	2020-04-18 20:37:02.527586	2020-04-18 21:00:40.331066
188	[{"x":0.5386,"y":0.4895},{"x":0.5386,"y":0.3092},{"x":0.5298,"y":0.0895}]	87	2020-04-18 20:37:02.634556	2020-04-18 21:00:40.335492
191	[{"x":0.5737,"y":0.5754},{"x":0.6737,"y":0.4579},{"x":0.7184,"y":0.2825},{"x":0.7026,"y":0.1772}]	233	2020-04-18 20:37:02.742198	2020-04-18 21:00:40.340011
194	[{"x":0.4355,"y":0.5246},{"x":0.5013,"y":0.3},{"x":0.5316,"y":0.1316},{"x":0.5237,"y":0.0333}]	86	2020-04-18 20:37:02.863059	2020-04-18 21:00:40.344863
197	[{"x":0.3066,"y":0.5526},{"x":0.3776,"y":0.3947},{"x":0.3855,"y":0.286},{"x":0.3816,"y":0.2088},{"x":0.375,"y":0.1158}]	144	2020-04-18 20:37:02.996215	2020-04-18 21:00:40.349483
199	[{"x":0.5789,"y":0.5684},{"x":0.5895,"y":0.3298},{"x":0.6395,"y":0.1088}]	3	2020-04-18 20:37:03.096536	2020-04-18 21:00:40.354461
202	[{"x":0.525,"y":0.5947},{"x":0.5118,"y":0.3053},{"x":0.4566,"y":0.0737}]	193	2020-04-18 20:37:03.240685	2020-04-18 21:00:40.362294
205	[{"x":0.5289,"y":0.5684},{"x":0.5289,"y":0.3789},{"x":0.5697,"y":0.2}]	47	2020-04-18 20:37:03.3901	2020-04-18 21:00:40.371855
208	[{"x":0.5395,"y":0.1684},{"x":0.5395,"y":0.4491},{"x":0.4697,"y":0.5684},{"x":0.3697,"y":0.6684}]	152	2020-04-18 20:37:03.608045	2020-04-18 21:00:40.381952
210	[{"x":0.5895,"y":0.5789},{"x":0.6197,"y":0.4088},{"x":0.5789,"y":0.2}]	90	2020-04-18 20:37:03.70411	2020-04-18 21:00:40.38786
212	[{"x":0.4719,"y":0.5697},{"x":0.5018,"y":0.4697},{"x":0.593,"y":0.3513},{"x":0.6246,"y":0.2697},{"x":0.5772,"y":0.2276}]	224	2020-04-18 20:37:03.793979	2020-04-18 21:00:40.39441
217	[{"x":0.5289,"y":0.5088},{"x":0.55,"y":0.3298},{"x":0.5197,"y":0.1193}]	91	2020-04-18 20:37:04.016163	2020-04-18 21:00:40.407184
218	[{"x":0.7,"y":0.6491},{"x":0.5789,"y":0.5789},{"x":0.3895,"y":0.5088},{"x":0.3197,"y":0.3789},{"x":0.3,"y":0.2386},{"x":0.3092,"y":0.1684},{"x":0.4197,"y":0.0386}]	85	2020-04-18 20:37:04.067592	2020-04-18 21:00:40.409969
221	[{"x":0.3386,"y":0.5092},{"x":0.3596,"y":0.3395},{"x":0.4298,"y":0.1697}]	52	2020-04-18 20:37:04.229757	2020-04-18 21:00:40.417312
223	[{"x":0.2592,"y":0.5596},{"x":0.2592,"y":0.3596},{"x":0.2289,"y":0.1386}]	190	2020-04-18 20:37:04.316844	2020-04-18 21:00:40.42218
2	[{"x":0.4895,"y":0.6491},{"x":0.4697,"y":0.4088},{"x":0.4895,"y":0.0596}]	63	2020-04-18 20:36:55.239653	2020-04-18 21:00:40.028551
3	[{"x":0.7053,"y":0.6228},{"x":0.7316,"y":0.4754},{"x":0.7303,"y":0.3825},{"x":0.7224,"y":0.3368}]	189	2020-04-18 20:36:55.332313	2020-04-18 21:00:40.034127
5	[{"x":0.5697,"y":0.5491},{"x":0.5895,"y":0.3193},{"x":0.5697,"y":0.0491}]	162	2020-04-18 20:36:55.415765	2020-04-18 21:00:40.037658
7	[{"x":0.5092,"y":0.5895},{"x":0.4789,"y":0.3684},{"x":0.4395,"y":0.1}]	88	2020-04-18 20:36:55.537502	2020-04-18 21:00:40.040885
8	[{"x":0.3895,"y":0.5474},{"x":0.3592,"y":0.3526},{"x":0.4211,"y":0.2807},{"x":0.4618,"y":0.1877},{"x":0.4645,"y":0.0965}]	228	2020-04-18 20:36:55.565201	2020-04-18 21:00:40.042611
9	[{"x":0.2118,"y":0.5579},{"x":0.2118,"y":0.5579},{"x":0.1724,"y":0.3825},{"x":0.1105,"y":0.2263},{"x":0.1197,"y":0.1175},{"x":0.125,"y":0.0491},{"x":0.1026,"y":0.0211}]	214	2020-04-18 20:36:55.602905	2020-04-18 21:00:40.044358
12	[{"x":0.5276,"y":0.5386},{"x":0.4987,"y":0.4228},{"x":0.4921,"y":0.2754},{"x":0.5079,"y":0.1719}]	215	2020-04-18 20:36:55.708032	2020-04-18 21:00:40.049031
14	[{"x":0.5158,"y":0.5158},{"x":0.5105,"y":0.3697},{"x":0.5298,"y":0.2487},{"x":0.5596,"y":0.1684}]	177	2020-04-18 20:36:55.767721	2020-04-18 21:00:40.052067
15	[{"x":0.2961,"y":0.4982},{"x":0.2908,"y":0.407},{"x":0.2645,"y":0.2}]	89	2020-04-18 20:36:55.80428	2020-04-18 21:00:40.053502
17	[{"x":0.5,"y":0.6},{"x":0.4895,"y":0.4},{"x":0.5289,"y":0}]	188	2020-04-18 20:36:55.868135	2020-04-18 21:00:40.057024
18	[{"x":0.5193,"y":0.6092},{"x":0.5386,"y":0.3895},{"x":0.5,"y":0.1697}]	62	2020-04-18 20:36:55.907439	2020-04-18 21:00:40.058522
20	[{"x":0.9197,"y":0.6298},{"x":0.9092,"y":0.4193},{"x":0.8697,"y":0.1298}]	60	2020-04-18 20:36:55.965327	2020-04-18 21:00:40.061427
21	[{"x":0.1289,"y":0.5491},{"x":0.25,"y":0.5193},{"x":0.3895,"y":0.5},{"x":0.5197,"y":0.5193},{"x":0.6197,"y":0.4895},{"x":0.6395,"y":0.3386},{"x":0.6697,"y":0.1895}]	48	2020-04-18 20:36:56.005996	2020-04-18 21:00:40.062905
22	[{"x":0.4158,"y":0.6474},{"x":0.2513,"y":0.6596},{"x":0.1145,"y":0.6386},{"x":0.0408,"y":0.5281},{"x":0.0237,"y":0.393},{"x":0.0605,"y":0.3211},{"x":0.1658,"y":0.2175}]	149	2020-04-18 20:36:56.039619	2020-04-18 21:00:40.064778
25	[{"x":0.2895,"y":0.5395},{"x":0.2895,"y":0.3289},{"x":0.3386,"y":0.1395}]	203	2020-04-18 20:36:56.142631	2020-04-18 21:00:40.078128
26	[{"x":0.3474,"y":0.5386},{"x":0.3158,"y":0.2895},{"x":0.3092,"y":0.1614},{"x":0.3197,"y":0.0877}]	217	2020-04-18 20:36:56.179514	2020-04-18 21:00:40.079744
29	[{"x":0.6,"y":0.6263},{"x":0.6118,"y":0.4772},{"x":0.5908,"y":0.3298},{"x":0.5316,"y":0.1807},{"x":0.5132,"y":0.0614}]	160	2020-04-18 20:36:56.293222	2020-04-18 21:00:40.084318
30	[{"x":0.4474,"y":0.6035},{"x":0.4276,"y":0.4614},{"x":0.4461,"y":0.3053},{"x":0.4882,"y":0.186}]	174	2020-04-18 20:36:56.329741	2020-04-18 21:00:40.085963
31	[{"x":0.4298,"y":0.6013},{"x":0.3526,"y":0.4395},{"x":0.3298,"y":0.2961},{"x":0.3579,"y":0.1882},{"x":0.4333,"y":0.0829},{"x":0.4912,"y":0.0737}]	148	2020-04-18 20:36:56.364656	2020-04-18 21:00:40.087854
34	[{"x":0.4592,"y":0.6193},{"x":0.35,"y":0.3895},{"x":0.2289,"y":0.0596}]	75	2020-04-18 20:36:56.477018	2020-04-18 21:00:40.092327
36	[{"x":0.6895,"y":0.0684},{"x":0.6895,"y":0.2491},{"x":0.6289,"y":0.3895},{"x":0.6592,"y":0.5684}]	71	2020-04-18 20:36:56.548958	2020-04-18 21:00:40.095104
38	[{"x":0.5789,"y":0.6491},{"x":0.6092,"y":0.4684},{"x":0.5092,"y":0.1491}]	170	2020-04-18 20:36:56.636095	2020-04-18 21:00:40.09784
39	[{"x":0.35,"y":0.6},{"x":0.3816,"y":0.4561},{"x":0.4145,"y":0.3456},{"x":0.4434,"y":0.1772}]	164	2020-04-18 20:36:56.676968	2020-04-18 21:00:40.099409
41	[{"x":0.6776,"y":0.586},{"x":0.6803,"y":0.2667},{"x":0.6566,"y":0.0772}]	206	2020-04-18 20:36:56.762915	2020-04-18 21:00:40.102746
42	[{"x":0.6789,"y":0.6193},{"x":0.6395,"y":0.3895},{"x":0.5697,"y":0.1491}]	212	2020-04-18 20:36:56.812715	2020-04-18 21:00:40.104182
44	[{"x":0.2789,"y":0.5386},{"x":0.3895,"y":0.1193}]	207	2020-04-18 20:36:56.891662	2020-04-18 21:00:40.107213
46	[{"x":0.5895,"y":0.5789},{"x":0.55,"y":0.4491},{"x":0.55,"y":0.2895},{"x":0.5395,"y":0.1193}]	165	2020-04-18 20:36:56.963857	2020-04-18 21:00:40.110786
47	[{"x":0.3,"y":0.4158},{"x":0.2855,"y":0.2807},{"x":0.2987,"y":0.2123},{"x":0.3158,"y":0.1404}]	171	2020-04-18 20:36:57.006742	2020-04-18 21:00:40.112307
49	[{"x":0.5618,"y":0.5842},{"x":0.5645,"y":0.4246},{"x":0.5724,"y":0.2474},{"x":0.5855,"y":0.1333},{"x":0.5697,"y":0.0825}]	70	2020-04-18 20:36:57.09079	2020-04-18 21:00:40.115106
50	[{"x":0.4789,"y":0.6197},{"x":0.3386,"y":0.5},{"x":0.3,"y":0.4092},{"x":0.3491,"y":0.2592},{"x":0.4596,"y":0.1592}]	8	2020-04-18 20:36:57.13078	2020-04-18 21:00:40.116757
52	[{"x":0.6789,"y":0.5895},{"x":0.6193,"y":0.4},{"x":0.6298,"y":0.2289},{"x":0.6596,"y":0.0789}]	66	2020-04-18 20:36:57.208816	2020-04-18 21:00:40.119811
54	[{"x":0.3,"y":0.5088},{"x":0.4197,"y":0.5298},{"x":0.65,"y":0.5386},{"x":0.7289,"y":0.4386},{"x":0.7395,"y":0.2298},{"x":0.7092,"y":0.1386}]	99	2020-04-18 20:36:57.278584	2020-04-18 21:00:40.123121
55	[{"x":0.1974,"y":0.5754},{"x":0.2013,"y":0.4263},{"x":0.1987,"y":0.2912},{"x":0.2132,"y":0.2123}]	173	2020-04-18 20:36:57.324444	2020-04-18 21:00:40.124715
57	[{"x":0.2184,"y":0.4088},{"x":0.2039,"y":0.2737},{"x":0.2211,"y":0.2053},{"x":0.2526,"y":0.1526}]	205	2020-04-18 20:36:57.40939	2020-04-18 21:00:40.127746
59	[{"x":0.5566,"y":0.5351},{"x":0.4329,"y":0.3807},{"x":0.3737,"y":0.2404},{"x":0.3461,"y":0.0947},{"x":0.3355,"y":0.0193}]	238	2020-04-18 20:36:57.477727	2020-04-18 21:00:40.130622
61	[{"x":0.7,"y":0.5789},{"x":0.6789,"y":0.2789},{"x":0.6592,"y":0.0895}]	210	2020-04-18 20:36:57.55429	2020-04-18 21:00:40.133736
62	[{"x":0.6145,"y":0.5737},{"x":0.6158,"y":0.4807},{"x":0.6618,"y":0.2789},{"x":0.6553,"y":0.214},{"x":0.6237,"y":0.1895}]	172	2020-04-18 20:36:57.608789	2020-04-18 21:00:40.135133
63	[{"x":0.4434,"y":0.6105},{"x":0.4158,"y":0.4211},{"x":0.4184,"y":0.2649},{"x":0.4908,"y":0.1105},{"x":0.4987,"y":0.0333}]	166	2020-04-18 20:36:57.645884	2020-04-18 21:00:40.136639
66	[{"x":0.45,"y":0.6193},{"x":0.4092,"y":0.4193},{"x":0.4197,"y":0.2596},{"x":0.3789,"y":0.0386}]	199	2020-04-18 20:36:57.776354	2020-04-18 21:00:40.141086
68	[{"x":0.4197,"y":0.5596},{"x":0.4395,"y":0.3298},{"x":0.4895,"y":0.0789}]	9	2020-04-18 20:36:57.869007	2020-04-18 21:00:40.144444
69	[{"x":0.5386,"y":0.5592},{"x":0.4386,"y":0.4592},{"x":0.3895,"y":0.3395},{"x":0.3789,"y":0.2789}]	14	2020-04-18 20:36:57.917624	2020-04-18 21:00:40.145868
71	[{"x":0.4197,"y":0.5},{"x":0.4092,"y":0.2684},{"x":0.4289,"y":0.0491}]	129	2020-04-18 20:36:57.994555	2020-04-18 21:00:40.148967
73	[{"x":0.3829,"y":0.5421},{"x":0.3474,"y":0.3193},{"x":0.3658,"y":0.1789},{"x":0.3737,"y":0.0947}]	114	2020-04-18 20:36:58.06937	2020-04-18 21:00:40.15211
74	[{"x":0.3408,"y":0.5421},{"x":0.2513,"y":0.3702},{"x":0.2632,"y":0.2544},{"x":0.3355,"y":0.1316},{"x":0.3934,"y":0.0386}]	100	2020-04-18 20:36:58.1157	2020-04-18 21:00:40.153729
76	[{"x":0.8395,"y":0.2},{"x":0.85,"y":0.3298},{"x":0.6697,"y":0.3684},{"x":0.4289,"y":0.4088},{"x":0.2592,"y":0.4},{"x":0.1592,"y":0.4386},{"x":0.1092,"y":0.5684}]	29	2020-04-18 20:36:58.189541	2020-04-18 21:00:40.157106
79	[{"x":0.7895,"y":0.6684},{"x":0.8184,"y":0.5667},{"x":0.8118,"y":0.5158},{"x":0.7711,"y":0.414}]	102	2020-04-18 20:36:58.312885	2020-04-18 21:00:40.161634
80	[{"x":0.7395,"y":0.5789},{"x":0.6789,"y":0.2684},{"x":0.5895,"y":0.0684}]	103	2020-04-18 20:36:58.3403	2020-04-18 21:00:40.163118
82	[{"x":0.2289,"y":0.4895},{"x":0.1197,"y":0.4789},{"x":0.0395,"y":0.5684}]	16	2020-04-18 20:36:58.429653	2020-04-18 21:00:40.16602
84	[{"x":0.4895,"y":0.5386},{"x":0.4789,"y":0.4088},{"x":0.5289,"y":0.2491},{"x":0.6,"y":0.1088}]	107	2020-04-18 20:36:58.512773	2020-04-18 21:00:40.172293
85	[{"x":0.5092,"y":0.5491},{"x":0.5395,"y":0.3895},{"x":0.5092,"y":0.1895}]	106	2020-04-18 20:36:58.546359	2020-04-18 21:00:40.173997
87	[{"x":0.5697,"y":0.6},{"x":0.5697,"y":0.3684},{"x":0.5197,"y":0.2298}]	13	2020-04-18 20:36:58.632095	2020-04-18 21:00:40.17761
88	[{"x":0.7395,"y":0.6386},{"x":0.55,"y":0.5},{"x":0.3789,"y":0.3298},{"x":0.3,"y":0.1789}]	11	2020-04-18 20:36:58.676284	2020-04-18 21:00:40.179071
89	[{"x":0.6123,"y":0.6855},{"x":0.5947,"y":0.5276},{"x":0.5018,"y":0.4382},{"x":0.3684,"y":0.3684},{"x":0.3316,"y":0.2763},{"x":0.3316,"y":0.2197},{"x":0.3456,"y":0.1671}]	104	2020-04-18 20:36:58.719967	2020-04-18 21:00:40.180599
92	[{"x":0.5684,"y":0.5592},{"x":0.5596,"y":0.3789},{"x":0.5298,"y":0.0895}]	139	2020-04-18 20:36:58.84357	2020-04-18 21:00:40.185877
94	[{"x":0.4789,"y":0.7395},{"x":0.5596,"y":0.4789},{"x":0.5684,"y":0.2395},{"x":0.5,"y":0.1289}]	105	2020-04-18 20:36:58.933692	2020-04-18 21:00:40.18898
95	[{"x":0.6,"y":0.6088},{"x":0.6092,"y":0.3684},{"x":0.5789,"y":0.1}]	38	2020-04-18 20:36:58.969379	2020-04-18 21:00:40.19036
97	[{"x":0.4596,"y":0.55},{"x":0.4789,"y":0.3197},{"x":0.4298,"y":0.1}]	108	2020-04-18 20:36:59.048247	2020-04-18 21:00:40.193048
99	[{"x":0.6395,"y":0.6491},{"x":0.7197,"y":0.4491},{"x":0.7895,"y":0.1596}]	134	2020-04-18 20:36:59.136377	2020-04-18 21:00:40.195744
100	[{"x":0.7816,"y":0.493},{"x":0.8289,"y":0.2474},{"x":0.8342,"y":0.1649},{"x":0.8092,"y":0.1263}]	242	2020-04-18 20:36:59.180781	2020-04-18 21:00:40.197061
101	[{"x":0.4724,"y":0.8316},{"x":0.5632,"y":0.5807},{"x":0.5789,"y":0.3684},{"x":0.5684,"y":0.193},{"x":0.5342,"y":0.0298}]	243	2020-04-18 20:36:59.221288	2020-04-18 21:00:40.198459
104	[{"x":0.3526,"y":0.614},{"x":0.325,"y":0.386},{"x":0.3237,"y":0.1982},{"x":0.35,"y":0.1351}]	109	2020-04-18 20:36:59.337064	2020-04-18 21:00:40.202839
105	[{"x":0.5395,"y":0.6684},{"x":0.5197,"y":0.4},{"x":0.4789,"y":0.0789}]	20	2020-04-18 20:36:59.377541	2020-04-18 21:00:40.204322
107	[{"x":0.5895,"y":0.5298},{"x":0.4895,"y":0.4088},{"x":0.4092,"y":0.2684},{"x":0.4092,"y":0.1596},{"x":0.4289,"y":0.0789}]	22	2020-04-18 20:36:59.462889	2020-04-18 21:00:40.20722
108	[{"x":0.6658,"y":0.4421},{"x":0.6592,"y":0.3509},{"x":0.6329,"y":0.2526},{"x":0.5961,"y":0.1509}]	137	2020-04-18 20:36:59.511006	2020-04-18 21:00:40.209225
110	[{"x":0.2982,"y":0.4632},{"x":0.1333,"y":0.3724},{"x":0.1491,"y":0.3197},{"x":0.2105,"y":0.2618}]	241	2020-04-18 20:36:59.62738	2020-04-18 21:00:40.212901
112	[{"x":0.2461,"y":0.6158},{"x":0.2697,"y":0.4491},{"x":0.3197,"y":0.3333},{"x":0.3803,"y":0.207},{"x":0.4421,"y":0.1351},{"x":0.525,"y":0.0895}]	122	2020-04-18 20:36:59.707148	2020-04-18 21:00:40.215864
114	[{"x":0.3,"y":0.6088},{"x":0.2789,"y":0.4},{"x":0.3197,"y":0.1386}]	23	2020-04-18 20:36:59.778806	2020-04-18 21:00:40.218874
115	[{"x":0.4592,"y":0.6193},{"x":0.5592,"y":0.4684},{"x":0.6,"y":0.3},{"x":0.5789,"y":0.1684},{"x":0.55,"y":0.0088}]	37	2020-04-18 20:36:59.827503	2020-04-18 21:00:40.220316
117	[{"x":0.3842,"y":0.6649},{"x":0.3553,"y":0.3965},{"x":0.3474,"y":0.1895}]	126	2020-04-18 20:36:59.899503	2020-04-18 21:00:40.223315
118	[{"x":0.5737,"y":0.5145},{"x":0.3561,"y":0.4224},{"x":0.2544,"y":0.2816},{"x":0.2561,"y":0.1882},{"x":0.2877,"y":0.1447},{"x":0.3596,"y":0.1316}]	244	2020-04-18 20:36:59.937785	2020-04-18 21:00:40.224776
120	[{"x":0.3316,"y":0.6018},{"x":0.3776,"y":0.3649},{"x":0.3908,"y":0.1772},{"x":0.3921,"y":0.093}]	127	2020-04-18 20:37:00.023369	2020-04-18 21:00:40.227799
121	[{"x":0.4961,"y":0.5246},{"x":0.5224,"y":0.3053},{"x":0.5105,"y":0.1842},{"x":0.4026,"y":0.1421},{"x":0.3947,"y":0.1105},{"x":0.4211,"y":0.086}]	133	2020-04-18 20:37:00.059559	2020-04-18 21:00:40.229209
123	[{"x":0.3592,"y":0.6298},{"x":0.3895,"y":0.4491},{"x":0.4197,"y":0.1386}]	24	2020-04-18 20:37:00.141466	2020-04-18 21:00:40.232014
125	[{"x":0.7,"y":0.5092},{"x":0.6684,"y":0.35},{"x":0.6088,"y":0.15}]	125	2020-04-18 20:37:00.214023	2020-04-18 21:00:40.234847
126	[{"x":0.7487,"y":0.5947},{"x":0.7934,"y":0.4018},{"x":0.7803,"y":0.3105},{"x":0.7474,"y":0.1877}]	131	2020-04-18 20:37:00.242728	2020-04-18 21:00:40.23623
127	[{"x":0.5789,"y":0.6895},{"x":0.5895,"y":0.4},{"x":0.6289,"y":0.1}]	119	2020-04-18 20:37:00.277291	2020-04-18 21:00:40.239464
128	[{"x":0.4224,"y":0.6018},{"x":0.4408,"y":0.3544},{"x":0.4461,"y":0.1421}]	118	2020-04-18 20:37:00.32277	2020-04-18 21:00:40.240951
130	[{"x":0.4395,"y":0.6193},{"x":0.4395,"y":0.3596},{"x":0.4592,"y":0.0298}]	124	2020-04-18 20:37:00.390445	2020-04-18 21:00:40.244148
131	[{"x":0.3592,"y":0.7},{"x":0.2789,"y":0.5596},{"x":0.25,"y":0.3789},{"x":0.2395,"y":0.2491},{"x":0.3,"y":0.0386}]	31	2020-04-18 20:37:00.435148	2020-04-18 21:00:40.245499
133	[{"x":0.3197,"y":0.5684},{"x":0.2895,"y":0.4386},{"x":0.3092,"y":0.2895},{"x":0.35,"y":0.1895}]	19	2020-04-18 20:37:00.508484	2020-04-18 21:00:40.248141
135	[{"x":0.5092,"y":0.5895},{"x":0.35,"y":0.5193},{"x":0.2197,"y":0.4684},{"x":0.1395,"y":0.3386},{"x":0.0895,"y":0.2596}]	4	2020-04-18 20:37:00.574293	2020-04-18 21:00:40.251057
137	[{"x":0.35,"y":0.5789},{"x":0.3197,"y":0.4491},{"x":0.3289,"y":0.2}]	180	2020-04-18 20:37:00.644319	2020-04-18 21:00:40.254007
139	[{"x":0.5592,"y":0.6895},{"x":0.5,"y":0.3596}]	81	2020-04-18 20:37:00.724581	2020-04-18 21:00:40.257133
140	[{"x":0.5013,"y":0.5526},{"x":0.5079,"y":0.3632},{"x":0.4855,"y":0.1632}]	95	2020-04-18 20:37:00.75431	2020-04-18 21:00:40.258523
142	[{"x":0.4092,"y":0.5684},{"x":0.3697,"y":0.3596},{"x":0.3789,"y":0.0684}]	157	2020-04-18 20:37:00.833463	2020-04-18 21:00:40.261295
143	[{"x":0.4289,"y":0.5789},{"x":0.4395,"y":0.5},{"x":0.5592,"y":0.4789},{"x":0.6697,"y":0.4491},{"x":0.7197,"y":0.2789},{"x":0.7289,"y":0.1684},{"x":0.6895,"y":0.0789}]	209	2020-04-18 20:37:00.867425	2020-04-18 21:00:40.26271
144	[{"x":0.8982,"y":0.5184},{"x":0.786,"y":0.5342},{"x":0.6474,"y":0.5026},{"x":0.4263,"y":0.4776},{"x":0.2596,"y":0.4342},{"x":0.1316,"y":0.3763},{"x":0.1456,"y":0.2592},{"x":0.2474,"y":0.1105}]	235	2020-04-18 20:37:00.903547	2020-04-18 21:00:40.264149
146	[{"x":0.7737,"y":0.5754},{"x":0.7632,"y":0.4474},{"x":0.7724,"y":0.293},{"x":0.7289,"y":0.1825}]	220	2020-04-18 20:37:00.976245	2020-04-18 21:00:40.267434
147	[{"x":0.4807,"y":0.7487},{"x":0.4842,"y":0.6039},{"x":0.3632,"y":0.5013},{"x":0.3175,"y":0.3579},{"x":0.3439,"y":0.2579},{"x":0.4351,"y":0.1513}]	234	2020-04-18 20:37:01.020426	2020-04-18 21:00:40.268936
149	[{"x":0.5789,"y":0.5684},{"x":0.5289,"y":0.4895},{"x":0.4789,"y":0.3789},{"x":0.3789,"y":0.3596},{"x":0.35,"y":0.3193},{"x":0.35,"y":0.2596}]	156	2020-04-18 20:37:01.10395	2020-04-18 21:00:40.271967
150	[{"x":0.3596,"y":0.6289},{"x":0.5,"y":0.55},{"x":0.5,"y":0.3895},{"x":0.4895,"y":0.2},{"x":0.4088,"y":0.0895}]	142	2020-04-18 20:37:01.136938	2020-04-18 21:00:40.273481
152	[{"x":0.7592,"y":0.5789},{"x":0.6895,"y":0.4193},{"x":0.6592,"y":0.2895},{"x":0.6197,"y":0.1684}]	195	2020-04-18 20:37:01.206705	2020-04-18 21:00:40.276891
154	[{"x":0.6,"y":0.6289},{"x":0.5088,"y":0.4395},{"x":0.4,"y":0.1895},{"x":0.3386,"y":0.1092}]	5	2020-04-18 20:37:01.28052	2020-04-18 21:00:40.280269
155	[{"x":0.5,"y":0.8684},{"x":0.4697,"y":0.6596},{"x":0.3,"y":0.6088},{"x":0.1197,"y":0.5386},{"x":0.0697,"y":0.4088}]	57	2020-04-18 20:37:01.321264	2020-04-18 21:00:40.281803
157	[{"x":0.5895,"y":0.5697},{"x":0.6193,"y":0.4289},{"x":0.7298,"y":0.3197},{"x":0.8088,"y":0.2697}]	7	2020-04-18 20:37:01.395994	2020-04-18 21:00:40.2848
159	[{"x":0.3053,"y":0.6719},{"x":0.2711,"y":0.5561},{"x":0.2092,"y":0.3965},{"x":0.1961,"y":0.1526},{"x":0.2079,"y":0.0035}]	69	2020-04-18 20:37:01.480908	2020-04-18 21:00:40.287627
161	[{"x":0.7737,"y":0.5561},{"x":0.8276,"y":0.3684},{"x":0.8434,"y":0.1965},{"x":0.8026,"y":0.1404}]	183	2020-04-18 20:37:01.555363	2020-04-18 21:00:40.293606
163	[{"x":0.5697,"y":0.5},{"x":0.5,"y":0.3193},{"x":0.4697,"y":0.1895},{"x":0.4592,"y":0.0491}]	168	2020-04-18 20:37:01.633238	2020-04-18 21:00:40.297078
164	[{"x":0.2592,"y":0.7386},{"x":0.2697,"y":0.6088},{"x":0.3092,"y":0.4298},{"x":0.3789,"y":0.2895}]	82	2020-04-18 20:37:01.678052	2020-04-18 21:00:40.2986
166	[{"x":0.3184,"y":0.5737},{"x":0.3145,"y":0.4018},{"x":0.3434,"y":0.2246},{"x":0.3697,"y":0.0632},{"x":0.375,"y":0.0211}]	140	2020-04-18 20:37:01.758745	2020-04-18 21:00:40.301797
167	[{"x":0.8961,"y":0.5035},{"x":0.8368,"y":0.4789},{"x":0.7382,"y":0.4509},{"x":0.6579,"y":0.4632},{"x":0.5171,"y":0.4281},{"x":0.4289,"y":0.4123},{"x":0.3461,"y":0.3614},{"x":0.1934,"y":0.3596},{"x":0.1,"y":0.3807},{"x":0.05,"y":0.3807}]	222	2020-04-18 20:37:01.793838	2020-04-18 21:00:40.3035
168	[{"x":0.1987,"y":0.5333},{"x":0.2816,"y":0.5053},{"x":0.3908,"y":0.5053},{"x":0.5039,"y":0.5228},{"x":0.6526,"y":0.5123},{"x":0.7934,"y":0.5211},{"x":0.8908,"y":0.4947},{"x":0.9382,"y":0.5316},{"x":0.9579,"y":0.5333},{"x":0.9408,"y":0.5123}]	236	2020-04-18 20:37:01.838319	2020-04-18 21:00:40.305133
170	[{"x":0.6895,"y":0.5105},{"x":0.7026,"y":0.2807},{"x":0.7105,"y":0.114},{"x":0.6895,"y":0.0491}]	223	2020-04-18 20:37:01.917484	2020-04-18 21:00:40.308409
171	[{"x":0.5592,"y":0.6175},{"x":0.5671,"y":0.4667},{"x":0.5605,"y":0.2579},{"x":0.5355,"y":0.1316},{"x":0.5197,"y":0.0211}]	141	2020-04-18 20:37:01.957603	2020-04-18 21:00:40.31014
174	[{"x":0.4803,"y":0.5491},{"x":0.4895,"y":0.3649},{"x":0.5684,"y":0.1123}]	97	2020-04-18 20:37:02.087672	2020-04-18 21:00:40.314448
175	[{"x":0.4974,"y":0.5965},{"x":0.4763,"y":0.4825},{"x":0.4658,"y":0.3439},{"x":0.4171,"y":0.1667},{"x":0.3987,"y":0.086}]	182	2020-04-18 20:37:02.133861	2020-04-18 21:00:40.315937
176	[{"x":0.5632,"y":0.1807},{"x":0.4645,"y":0.1842},{"x":0.4303,"y":0.486},{"x":0.2605,"y":0.5193},{"x":0.0039,"y":0.4702}]	68	2020-04-18 20:37:02.167926	2020-04-18 21:00:40.317518
179	[{"x":0.5092,"y":0.4596},{"x":0.4895,"y":0.2298},{"x":0.4789,"y":0.1193},{"x":0.5289,"y":0.0088}]	192	2020-04-18 20:37:02.279234	2020-04-18 21:00:40.322257
180	[{"x":0.4092,"y":0.5491},{"x":0.4,"y":0.4088},{"x":0.4,"y":0.2789},{"x":0.4289,"y":0.1684}]	78	2020-04-18 20:37:02.323557	2020-04-18 21:00:40.323813
182	[{"x":0.2697,"y":0.5491},{"x":0.4197,"y":0.5386},{"x":0.5197,"y":0.4298},{"x":0.6197,"y":0.1386}]	2	2020-04-18 20:37:02.392176	2020-04-18 21:00:40.326802
184	[{"x":0.3395,"y":0.6},{"x":0.3197,"y":0.3895},{"x":0.35,"y":0.1298}]	44	2020-04-18 20:37:02.476536	2020-04-18 21:00:40.329608
186	[{"x":0.5539,"y":0.5789},{"x":0.5197,"y":0.3982},{"x":0.5039,"y":0.2491},{"x":0.5092,"y":0.1561}]	145	2020-04-18 20:37:02.559485	2020-04-18 21:00:40.332526
187	[{"x":0.5289,"y":0.5193},{"x":0.5,"y":0.3088},{"x":0.4895,"y":0.1088}]	93	2020-04-18 20:37:02.59408	2020-04-18 21:00:40.334028
189	[{"x":0.7092,"y":0.5298},{"x":0.7671,"y":0.3632},{"x":0.7842,"y":0.2193},{"x":0.7539,"y":0.1702}]	179	2020-04-18 20:37:02.66842	2020-04-18 21:00:40.336931
190	[{"x":0.8772,"y":0.475},{"x":0.8912,"y":0.4934},{"x":0.7614,"y":0.525},{"x":0.4474,"y":0.5224},{"x":0.314,"y":0.4447},{"x":0.2895,"y":0.3145},{"x":0.3544,"y":0.2224}]	227	2020-04-18 20:37:02.700822	2020-04-18 21:00:40.338498
192	[{"x":0.1965,"y":0.7671},{"x":0.2421,"y":0.7066},{"x":0.4386,"y":0.6803},{"x":0.5719,"y":0.5895},{"x":0.5351,"y":0.4592},{"x":0.3719,"y":0.3724},{"x":0.2491,"y":0.3066},{"x":0.2421,"y":0.25},{"x":0.3228,"y":0.1816}]	232	2020-04-18 20:37:02.78092	2020-04-18 21:00:40.341594
193	[{"x":0.7351,"y":0.6184},{"x":0.6175,"y":0.4237},{"x":0.593,"y":0.2697},{"x":0.5737,"y":0.1724},{"x":0.5719,"y":0.0474}]	226	2020-04-18 20:37:02.825696	2020-04-18 21:00:40.343353
195	[{"x":0.2395,"y":0.6895},{"x":0.2395,"y":0.5895},{"x":0.3395,"y":0.4895},{"x":0.5197,"y":0.5088},{"x":0.7395,"y":0.5596},{"x":0.8697,"y":0.4789},{"x":0.8789,"y":0.3596},{"x":0.8395,"y":0.1684}]	178	2020-04-18 20:37:02.900519	2020-04-18 21:00:40.346436
196	[{"x":0.6632,"y":0.5474},{"x":0.7013,"y":0.3895},{"x":0.7013,"y":0.3035},{"x":0.6526,"y":0.2316},{"x":0.6171,"y":0.1509},{"x":0.6118,"y":0.1035}]	92	2020-04-18 20:37:02.947674	2020-04-18 21:00:40.34795
198	[{"x":0.65,"y":0.6596},{"x":0.6789,"y":0.4},{"x":0.6697,"y":0.0789}]	150	2020-04-18 20:37:03.056544	2020-04-18 21:00:40.352499
200	[{"x":0.35,"y":0.5596},{"x":0.4197,"y":0.3491},{"x":0.4592,"y":0.0491}]	51	2020-04-18 20:37:03.141585	2020-04-18 21:00:40.356835
201	[{"x":0.4039,"y":0.5912},{"x":0.3895,"y":0.3649},{"x":0.3171,"y":0.1561},{"x":0.3039,"y":0.0509}]	187	2020-04-18 20:37:03.190245	2020-04-18 21:00:40.359687
203	[{"x":0.4,"y":0.5404},{"x":0.3289,"y":0.2596},{"x":0.3474,"y":0.1158},{"x":0.3724,"y":0.0193}]	185	2020-04-18 20:37:03.285476	2020-04-18 21:00:40.365005
204	[{"x":0.4526,"y":0.5539},{"x":0.5088,"y":0.4039},{"x":0.5719,"y":0.2447},{"x":0.5965,"y":0.1447},{"x":0.5719,"y":0.0803}]	191	2020-04-18 20:37:03.340594	2020-04-18 21:00:40.368086
206	[{"x":0.1697,"y":0.4895},{"x":0.35,"y":0.5},{"x":0.5697,"y":0.5193},{"x":0.7197,"y":0.5},{"x":0.8289,"y":0.4491},{"x":0.9289,"y":0.3193}]	53	2020-04-18 20:37:03.438698	2020-04-18 21:00:40.37482
207	[{"x":0.9421,"y":0.5474},{"x":0.8408,"y":0.5632},{"x":0.7237,"y":0.5333},{"x":0.5961,"y":0.5263},{"x":0.4737,"y":0.5439},{"x":0.3908,"y":0.6053},{"x":0.2868,"y":0.5895},{"x":0.1711,"y":0.5386},{"x":0.0882,"y":0.5404},{"x":0.05,"y":0.5456}]	146	2020-04-18 20:37:03.54561	2020-04-18 21:00:40.378204
209	[{"x":0.6289,"y":0.5596},{"x":0.65,"y":0.4684},{"x":0.7592,"y":0.4491},{"x":0.8697,"y":0.4193},{"x":0.9289,"y":0.3684},{"x":0.9395,"y":0.3386},{"x":0.9,"y":0.3193}]	84	2020-04-18 20:37:03.659325	2020-04-18 21:00:40.384897
211	[{"x":0.4829,"y":0.7614},{"x":0.4921,"y":0.7561},{"x":0.5276,"y":0.7263},{"x":0.5395,"y":0.6947},{"x":0.5447,"y":0.6509},{"x":0.5592,"y":0.6158},{"x":0.5961,"y":0.5579},{"x":0.6079,"y":0.5439},{"x":0.6237,"y":0.4561},{"x":0.6211,"y":0.3579},{"x":0.6079,"y":0.2667},{"x":0.5789,"y":0.1614},{"x":0.5645,"y":0.1053}]	230	2020-04-18 20:37:03.757978	2020-04-18 21:00:40.391042
213	[{"x":0.6066,"y":0.5702},{"x":0.575,"y":0.3842},{"x":0.5303,"y":0.1982},{"x":0.4645,"y":0.0421}]	218	2020-04-18 20:37:03.840809	2020-04-18 21:00:40.396744
214	[{"x":0.3671,"y":0.5579},{"x":0.2803,"y":0.3877},{"x":0.2618,"y":0.2421},{"x":0.3,"y":0.1807}]	219	2020-04-18 20:37:03.878065	2020-04-18 21:00:40.398733
215	[{"x":0.8711,"y":0.507},{"x":0.7961,"y":0.5333},{"x":0.6026,"y":0.5246},{"x":0.4316,"y":0.4632},{"x":0.2763,"y":0.4807},{"x":0.1829,"y":0.4491},{"x":0.1658,"y":0.3018},{"x":0.1855,"y":0.1772},{"x":0.1974,"y":0.1316},{"x":0.2211,"y":0.1035}]	225	2020-04-18 20:37:03.924789	2020-04-18 21:00:40.401858
216	[{"x":0.7961,"y":0.5053},{"x":0.7316,"y":0.4526},{"x":0.6711,"y":0.414},{"x":0.5737,"y":0.414},{"x":0.4474,"y":0.4123},{"x":0.3461,"y":0.4263},{"x":0.2671,"y":0.4719},{"x":0.1724,"y":0.4702},{"x":0.1395,"y":0.4193},{"x":0.1592,"y":0.4}]	231	2020-04-18 20:37:03.972043	2020-04-18 21:00:40.404725
219	[{"x":0.5395,"y":0.5789},{"x":0.55,"y":0.3491},{"x":0.6197,"y":0.1088}]	153	2020-04-18 20:37:04.125333	2020-04-18 21:00:40.412828
220	[{"x":0.4566,"y":0.5228},{"x":0.4671,"y":0.3684},{"x":0.5316,"y":0.1175}]	147	2020-04-18 20:37:04.18197	2020-04-18 21:00:40.415486
222	[{"x":0.3596,"y":0.4592},{"x":0.4895,"y":0.4895},{"x":0.6684,"y":0.4395},{"x":0.7491,"y":0.3592},{"x":0.7193,"y":0.2789},{"x":0.6596,"y":0.2197}]	46	2020-04-18 20:37:04.272266	2020-04-18 21:00:40.419583
224	[{"x":0.4719,"y":0.5145},{"x":0.5421,"y":0.2342},{"x":0.5386,"y":0.0632}]	184	2020-04-18 20:37:04.370683	2020-04-18 21:00:40.424325
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
-- Name: boulders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.boulders_id_seq', 294, true);


--
-- Name: circuits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.circuits_id_seq', 6, true);


--
-- Name: problems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.problems_id_seq', 1, false);


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
-- Name: index_problems_on_circuit_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_problems_on_circuit_id ON public.problems USING btree (circuit_id);


--
-- Name: index_problems_on_location; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_problems_on_location ON public.problems USING gist (location);


--
-- Name: index_topos_on_problem_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_topos_on_problem_id ON public.topos USING btree (problem_id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

