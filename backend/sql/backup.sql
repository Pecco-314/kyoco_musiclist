--
-- PostgreSQL database dump
--

-- Dumped from database version 10.21 (Ubuntu 10.21-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.21 (Ubuntu 10.21-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: music; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.music (
    id integer NOT NULL,
    name text,
    description text
);


ALTER TABLE public.music OWNER TO postgres;

--
-- Name: music_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.music_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.music_id_seq OWNER TO postgres;

--
-- Name: music_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.music_id_seq OWNED BY public.music.id;


--
-- Name: music_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.music_tag (
    id integer NOT NULL,
    music_id integer,
    tag_name text,
    tag_type text
);


ALTER TABLE public.music_tag OWNER TO postgres;

--
-- Name: music_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.music_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.music_tags_id_seq OWNER TO postgres;

--
-- Name: music_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.music_tags_id_seq OWNED BY public.music_tag.id;


--
-- Name: music id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.music ALTER COLUMN id SET DEFAULT nextval('public.music_id_seq'::regclass);


--
-- Name: music_tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.music_tag ALTER COLUMN id SET DEFAULT nextval('public.music_tags_id_seq'::regclass);


--
-- Data for Name: music; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.music (id, name, description) FROM stdin;
306	恶作剧	
311	字和句关于你	
316	珊瑚海	
321	夏天	
326	倒数	
331	月牙湾	
341	做我老婆好不好	
342	灯火里的中国	
343	恋爱告急	
344	血腥爱情故事	
345	一个	
346	万有引力	
347	乡情曲	
348	我爱洗澡	
349	偏爱	
350	海芋恋	
336	全是爱	
353	九万字	
357	有何不可	
361	一笑倾城	
365	花海	
370	字正腔圆	
371	人质	
375	啷个哩个啷	
380	季风	
382	刺猬法则	
2	瞬	超温柔
1	了	
3	囍	
4	藏	
8	〇	
14	鱼仔	
13	大鱼	
15	海底	
25	赤伶	
29	后来	
41	暖暖	
35	不枉	
42	姗姗	
26	谓剑	
307	三月雨	
317	不该	
322	骑士	
327	天下无双	
332	一样的月光	
337	白鸽	
351	侧脸	
312	少女作妖日记	可爱捏
354	大笨钟	
36	不染	三无翻过的那个
358	不负人间	
362	童年	
372	余生皆是你	
376	错位时空	
381	呼吸决定	
30	懒人	主播人设
5	画	
6	寻	
7	醉	
9	36.5°c	
10	刁钻	
11	月球	
12	田螺	
16	大眠	
17	东西	
18	冬眠	
19	飞机	
20	苍蝇	
21	善变	
22	风缘	
23	茶汤	
24	归寻	
27	红豆	
28	骗我	
31	凉城	
32	听花	
33	听闻	
34	故梦	
37	离人	
38	笑看	
39	幸甚	
40	借我	
295	爱你	
62	mojito	
76	处处吻	塑料粤语不过还是可爱的
83	关键词	假音魔鬼
117	桃花笑	超甜的
122	喜欢你	无敌甜
127	有点甜	超甜
166	好字唯之	超攻解锁
308	在树上唱歌	
313	悠哉日常~悠哉~悠哉~	
318	失眠飞行	
323	不完美小孩	
328	歌者	
333	苏幕遮	
338	如愿	
352	奇妙能力歌	
355	本色	
359	我乐意	
363	栖枝	
367	同花顺	主播超喜欢
373	宁夏	
377	不问天	
123	小白船	阴间歌曲，慎点
148	百万个吻	节日限定
153	大碗宽面	电晕你不负责哟~
47	栖凰	
53	晴天	
54	温泉	
227	九九八十一	口胡的超萌
189	兔子先生	温柔max
217	左手指月	作死限定
247	易燃易爆炸	老攻老攻
309	小半	
314	危险派对	
319	青柠	
324	时光洪流	
329	我不难过	
334	熬夜上瘾	
304	人间烂漫	
339	我的世界	电电电电电
269	正月十五是元宵	限定歌曲
263	比你更爱我的人	老扎心了
248	得了吧张小姐	口哨专享
356	小小	
360	枫	
364	你一定要幸福	
368	岁月神偷	
374	引路的风筝	
378	爱啦啦	
225	单身狗之歌	没事别点，何必扎自己
242	生日快乐歌	生日的宝贝快乐呀
43	虚传	
44	酒家	
45	芊芊	
46	参商	
48	青丝	
49	琴师	
50	情歌	
51	嚣张	
52	过客	
55	鸽子	
56	影子	
57	夜樱	
58	遇见	
59	遇到	
60	走马	
63	小青呱	
64	小情歌	
65	花雨落	
69	难生恨	
70	你之外	
71	拜无忧	
73	半壶纱	
74	忆江南	
75	百利甜	
77	长安忆	
78	丁香花	
79	鱼玄机	
81	多情岸	
82	飞机场	
85	故人泪	
86	女儿情	
88	红尘嗔	
89	红叶寺	
91	将厌离	
93	竹枝词	
94	锦中客	
98	衩头凤	
99	寄明月	
100	猜不透	
101	典狱司	
103	虞兮叹	
110	贺新婚	
111	浮生辞	
112	笑笑生	
113	三清序	
114	燕无歇	
115	扇子舞	
120	心上秋	
125	追光者	
126	谈恋爱	
128	有狐说	
130	醉千年	
131	一步之遥	
133	一介书生	
135	心似烟火	
136	片羽吉光	
138	不知所措	
139	不醉不会	
141	独家记忆	
142	生而为匠	
143	说了再见	
144	枫林残忆	
146	爱过的人	
147	白衣被告	
149	不安小姐	
150	吴江锦时	
154	独享甜蜜	
156	大城小爱	
160	浮生未歇	
164	南郭先生	
165	感官先生	
169	怀梦之泽	
170	海绵宝宝	
171	理想三旬	
172	浪人琵琶	
173	美好事物	
174	你啊你啊	
175	牛奶香槟	
176	伴宅日记	
181	群居动物	
186	山止川行	
190	棠梨煎雪	
192	无人之岛	
193	南部小城	
194	外婆的话	
197	我爱学习	
199	星空剪影	
200	香水有毒	
201	秋殇别恋	
202	新星计划	
204	恶人是我	
206	烟雨行舟	
61	葬歌	
68	云与海	
66	外婆桥	
67	安河桥	
80	对玄机	
87	红昭愿	
84	广寒宫	
90	红蜻蜓	
96	僵尸舞	
152	等你下课	
95	锦鲤抄	
97	庐州月	
104	洛阳怀	
105	木兰行	
106	虫儿飞	
92	童话镇	
108	青花瓷	
109	牵丝戏	
116	天下局	
151	流年如歌	
119	小嫦娥	
121	下雨天	
124	易水诀	
129	竹林间	
132	一路向北	
137	水叙湖风	
134	四季予你	
140	词不达意	
145	爱的魔法	
161	钢铁直男	
155	达拉崩吧	
158	百变奶精	
168	你的猫咪	
159	飞鸟和蝉	
182	如见青山	
162	告白气球	
163	勾指起誓	
167	花儿纳吉	
177	破晓将至	
178	青鸟衔风	
118	万神纪	
179	权御天下	
180	千里邀月	
183	霜雪千年	
185	世末歌者	
184	深夜诗人	
187	身骑白马	
188	社畜烧酒	
191	万古生香	
195	我怀念的	
196	我很快乐	
198	星之回响	
205	阴阳先生	
203	夏天的风	
157	繁华唱遍	
72	不谓侠	
107	孽海记	
102	流光记	
207	烟火莲灯	
208	盐甜汽水	
209	骁浪吾归	
211	云烟成雨	
212	第三人称	
219	123木头人	
221	我们结婚吧	
224	辞九门回忆	
235	这就是爱吗	
236	醒不来的梦	
264	倒霉孩子养成记	
281	大小姐和大少爷的反派生涯	
283	Summertime	
282	Lemon	
231	横竖撇点折	
226	第二杯半价	
216	知否知否	
210	夜宴风波	
228	今天没吃药	
239	提灯照河山	
265	得过且过的勇者	
270	世界上的另一个我	
272	我的悲伤是水做的	
276	恋爱吧☆魔法少女	
277	傲娇系男孩的告白日	
278	圈圈点点圈圈点点圈圈点点	
305	我的猫狂奔了一整夜	
310	虚拟	
315	不可言说	
320	阿司匹林	
325	泡沫	
233	爱要坦荡荡	
340	溯	
244	人间不值得	
330	牡丹江	
335	真没睡	奶味rap
274	好像掉进爱情海里	很甜
214	簪花人间	
230	空山新雨后	
240	所念皆星河	
261	蒲公英的约定	
280	我喜欢上你时的内心活动	
279	世界这么大还是遇见你	
275	心生七面 善恶难辨	
273	请踢断我的肋骨吧	
262	谜一样的生活	
271	我的一个道姑朋友	
266	何日重到苏澜桥	
267	如果这就是爱情	
253	那女孩对我说	
257	外婆的澎湖湾	
258	贝多芬的悲伤	
259	我想我不够好	
256	芋泥啵啵奶茶	
255	想要你在身边	
254	男孩们的旅行	
252	将我葬于梦魇	
251	永不失联的爱	
250	十二号诛杀者	
249	天亮以前说再见	
246	小丑的品格	
245	最长的电影	
243	山楂树之恋	
241	湖光水色调	
238	燃尽人间色	
237	你好陌生人	
232	你曾是少年	
234	日常喜欢您	
229	岁月旧曾谙	
223	还是会寂寞	
222	安娜的橱窗	
220	吻得太逼真	
218	18爱不爱	
215	蒸汽金鱼	
213	昨日青空	
268	山外小楼夜听雨	
369	成全	
379	飞云之下	
\.


--
-- Data for Name: music_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.music_tag (id, music_id, tag_name, tag_type) FROM stdin;
1	5	邓紫棋	singer
3	16	王心凌	singer
4	81	古风	normal
5	81	忘川风华录	normal
6	81	洛天依	singer
7	281	洛天依	singer
8	281	JUSF周存	normal
15	2	谢春花	singer
16	1	一支榴莲	singer
17	3	葛东琪	singer
18	4	徐梦圆	singer
19	4	双笙	singer
20	8	洛天依	singer
21	8	ilem	normal
22	13	周深	singer
24	14	卢广仲	singer
25	15	一支榴莲	singer
26	25	HITA	singer
27	25	古风	normal
28	25	戏腔	normal
29	295	王心凌	singer
39	29	刘若英	singer
40	283	cinnamons	singer
41	283	evening cinema	singer
42	283	日语	normal
43	282	米津玄師	singer
44	282	日语	normal
45	41	梁静茹	singer
46	35	汪小敏	singer
47	42	金玟岐	singer
48	47	星尘	singer
49	47	忘川风华录	normal
50	47	古风	normal
51	53	周杰伦	singer
52	54	许嵩	singer
53	54	刘美麟	singer
54	54	男女合唱	normal
55	62	周杰伦	singer
56	61	洛天依	singer
57	61	言和	singer
58	61	ilem	normal
60	68	阿YueYue	singer
61	26	赤羽	singer
62	26	叁琏	singer
63	26	忘川风华录	normal
64	26	古风	normal
65	66	任然	singer
66	67	宋冬野	singer
67	67	民谣	normal
68	76	杨千嬅	singer
69	76	粤语	normal
70	80	任然	singer
71	80	王梓钰	singer
72	80	古风	normal
73	83	林俊杰	singer
74	87	王梓钰	singer
75	87	音阕诗听	normal
76	87	古风	normal
77	84	花僮	singer
78	90	小虎队	singer
80	96	洛天依	singer
81	96	言和	singer
82	96	ilem	normal
83	95	银临	singer
84	95	古风	normal
85	97	许嵩	singer
86	104	洛天依	singer
87	104	忘川风华录	normal
88	104	古风	normal
89	105	苍穹	singer
90	105	忘川风华录	normal
91	105	古风	normal
93	107	黄诗扶	singer
94	108	周杰伦	singer
95	109	银临	singer
96	109	Aki阿杰	singer
97	109	古风	normal
98	109	戏腔	normal
99	116	赤羽	singer
100	116	忘川风华录	normal
101	116	古风	normal
102	117	洛天依	singer
103	117	言和	singer
104	117	乐正绫	singer
105	118	星尘	singer
106	119	安子与九妹	singer
107	121	南拳妈妈	singer
108	122	陈洁仪	singer
109	124	洛天依	singer
110	124	言和	singer
111	124	忘川风华录	normal
112	124	古风	normal
113	127	汪苏泷	singer
114	127	By2	singer
115	129	初音未来	singer
116	129	忘川风华录	normal
117	129	古风	normal
118	132	周杰伦	singer
119	134	程响	singer
120	137	星尘Minus	singer
121	137	忘川风华录	normal
122	137	古风	normal
123	140	林忆莲	singer
124	145	金莎	singer
125	151	苍穹	singer
126	155	洛天依	singer
127	155	言和	singer
128	155	ilem	normal
129	157	乐正绫	singer
130	157	古风	normal
131	157	戏腔	normal
133	158	说唱	normal
134	158	hanser	singer
135	159	任然	singer
136	161	真栗	singer
137	162	周杰伦	singer
138	163	洛天依	singer
139	163	ilem	normal
140	166	海依	singer
141	166	忘川风华录	normal
142	166	古风	normal
143	167	洛天依	singer
144	167	言和	singer
145	167	ilem	normal
146	177	云の泣	singer
147	177	时之歌Project	normal
148	178	海依	singer
149	178	诗岸	singer
150	178	忘川风华录	normal
151	178	古风	normal
152	179	洛天依	singer
153	179	拜年祭	normal
154	118	拜年祭	normal
155	231	米白	singer
156	231	拜年祭	normal
157	151	拜年祭	normal
158	161	拜年祭	normal
159	227	乐正绫	singer
160	227	拜年祭	normal
161	180	乐正绫	singer
162	180	纯白	normal
163	182	心华	singer
164	182	忘川风华录	normal
165	182	古风	normal
166	183	洛天依	singer
167	183	乐正绫	singer
168	183	COP	normal
169	183	古风	normal
170	184	洛天依	singer
171	184	ilem	normal
172	184	言和	singer
173	185	乐正绫	singer
174	185	COP	normal
175	187	徐佳莹	singer
176	188	洛天依	singer
177	188	ChiliChill	normal
178	189	洛天依	singer
179	189	民谣	normal
180	191	洛天依	singer
181	191	拜年祭	normal
182	195	孙燕姿	singer
183	196	刘惜君	singer
184	198	琉绮Ruki	singer
185	198	泠鸢yousa	singer
186	198	鹿乃	singer
187	198	花丸晴琉	singer
188	198	神楽Mea	singer
189	198	物述有栖	singer
190	198	白上吹雪	singer
191	198	夏色祭	singer
192	198	拜年祭	normal
193	226	纳豆nado	singer
194	216	胡夏	singer
195	216	郁可唯	singer
196	210	王梓钰	singer
197	210	音阕诗听	normal
198	210	古风	normal
199	205	洛天依	singer
200	205	言和	singer
201	205	ilem	normal
202	217	萨顶顶	singer
203	228	洛天依	singer
204	228	言和	singer
205	228	ilem	normal
206	239	西国的海妖	singer
207	239	洛天依	singer
208	239	litterzy	normal
209	239	古风	normal
210	247	陈粒	singer
211	265	洛天依	singer
212	265	言和	singer
213	265	ilem	normal
214	270	阿肆	singer
215	270	郭采洁	singer
216	272	洛天依	singer
217	272	ChiliChill	normal
218	274	谷嘉诚	singer
219	274	赵露思	singer
220	276	洛天依	singer
221	276	潜移默化P	normal
222	277	乐正绫	singer
223	277	ilem	normal
224	278	洛天依	singer
225	278	T2o	normal
226	203	温岚	singer
227	304	hanser	singer
229	305	hanser	singer
230	306	王蓝茵	singer
231	307	洛天依	singer
232	307	古风	normal
233	308	郭静	singer
234	309	陈粒	singer
235	310	陈粒	singer
236	311	高睿	singer
237	312	纳豆nado	singer
238	313	泠鸢yousa	singer
239	313	悠哉日常大王	normal
240	314	王以太	singer
241	314	刘至佳	singer
242	314	男女合唱	normal
243	315	王以太	singer
244	315	刘美麟	singer
245	315	男女合唱	normal
246	316	周杰伦	singer
247	316	梁心颐	singer
248	316	男女合唱	normal
249	317	周杰伦	singer
250	317	张惠妹	singer
251	317	男女合唱	normal
252	318	沈以诚 	singer
253	318	薛明媛	singer
254	318	男女合唱	normal
255	319	徐秉龙	singer
256	319	桃十五	singer
257	319	男女合唱	normal
258	320	王以太	singer
259	320	说唱	normal
260	321	李玖哲	singer
261	322	黄龄	singer
262	323	TFBoys	singer
263	324	程响	singer
264	325	邓紫棋	singer
265	326	邓紫棋	singer
266	327	张靓颖	singer
267	327	神雕侠侣	normal
268	328	谭维维	singer
269	328	三体	normal
270	157	拜年祭	normal
271	233	萧潇	singer
272	329	孙燕姿	singer
273	330	南拳妈妈	singer
274	331	飞儿乐团	singer
275	332	徐佳莹	singer
276	333	张晓棠	singer
277	333	古风	normal
278	334	刘亦心	singer
279	335	姜云升	singer
280	335	说唱	normal
281	336	凤凰传奇	singer
282	337	你的上好佳	singer
283	338	王菲	singer
284	339	陈姿彤	singer
285	340	马吟吟	singer
286	340	胡梦周	singer
287	341	徐誉滕	singer
288	342	张也	singer
289	342	周深	singer
290	343	鞠婧祎	singer
291	344	张惠妹	singer
292	345	陈壹千	singer
293	346	汪苏泷	singer
294	347	洛天依	singer
295	347	泠鸢yousa	singer
297	348	范晓萱	singer
298	348	儿歌	normal
299	349	张芸京	singer
300	349	仙剑奇侠传三	normal
301	350	萧敬腾	singer
302	351	于果	singer
303	244	黄诗扶	singer
304	244	古风	normal
305	352	陈粒	singer
306	330	男女合唱	normal
307	336	男女合唱	normal
308	214	星尘	singer
309	214	忘川风华录	normal
310	214	古风	normal
311	168	hanser	singer
312	168	著小生zoki	normal
313	230	锦零	singer
314	230	音阙诗听	normal
315	230	古风	normal
316	72	萧忆情Alex	singer
317	353	黄诗扶	singer
318	353	古风	normal
319	107	古风	normal
320	106	儿歌	normal
321	354	周杰伦	singer
322	355	洛天依	singer
323	240	房东的猫	singer
324	280	陈绮贞	singer
325	279	陈响	singer
326	275	三无MarBlue	singer
327	273	镜音铃	singer
328	273	JUSF周存	normal
329	271	双笙	singer
331	269	洛天依	singer
332	269	毛毛虫P	normal
333	266	泠鸢yousa	singer
334	267	张靓颖	singer
335	263	陈壹千	singer
336	253	黄义达	singer
337	257	潘安邦	singer
340	261	周杰伦	singer
342	262	张茜	singer
343	258	郑毅	singer
344	258	萧风	singer
345	259	单色凌	singer
346	256	hanser	singer
347	256	著小生zoki	normal
348	255	王梓钰	singer
349	255	锦零	singer
350	255	音阙诗听	normal
351	254	泠鸢yousa	singer
352	248	李响	singer
353	252	三无Marblue	singer
354	252	言和	singer
355	252	著小生zoki	normal
356	251	周兴哲	singer
357	250	洛天依	singer
358	250	JUSF周存	normal
359	249	何野	singer
360	246	泠鸢yousa	singer
361	245	周杰伦	singer
362	243	程佳佳	singer
363	241	i2star	singer
364	238	慕寒	singer
365	238	司夏	singer
366	238	河图	singer
367	238	Midaho	singer
368	238	古风	normal
369	237	任然	singer
370	232	S.H.E	singer
371	234	王欣宇	singer
372	229	三无Marblue	singer
373	229	魔道祖师	normal
374	229	双笙	singer
375	223	陈绮贞	singer
376	222	洛天依	singer
377	222	著小生zoki	normal
378	220	张敬轩	singer
379	218	企鹅	singer
380	218	翼势力	singer
381	215	三无Marblue	singer
382	215	著小生zoki	normal
383	213	尤长靖	singer
384	36	河图	singer
385	92	暗杠	singer
386	356	容祖儿	singer
387	357	许嵩	singer
388	358	阿YueYue	singer
389	359	许嵩	singer
390	360	周杰伦	singer
391	361	汪苏泷	singer
392	362	罗大佑	singer
393	363	双笙	singer
394	268	任然	singer
395	268	xun	singer
396	268	古风	normal
397	364	何洁	singer
398	365	周杰伦	singer
400	367	林倛玉	singer
401	368	金玟岐	singer
402	369	刘若英	singer
403	370	张晓涵	singer
404	370	伦桑	singer
405	370	说唱	normal
406	370	戏腔	normal
407	371	张惠妹	singer
408	152	周杰伦	singer
409	372	小蓝背心	singer
410	373	梁静茹	singer
411	374	张韶涵	singer
412	375	鹏泊	singer
413	376	艾辰	singer
414	377	说说Crystal	singer
415	377	拜年祭	normal
416	378	海楠	singer
417	379	林俊杰	singer
418	379	韩红	singer
419	380	方言	singer
420	381	Fine乐团	singer
421	102	银临	singer
422	102	古风	normal
423	382	三无	singer
\.


--
-- Name: music_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.music_id_seq', 382, true);


--
-- Name: music_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.music_tags_id_seq', 423, true);


--
-- Name: music_tag music_id_name_type_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.music_tag
    ADD CONSTRAINT music_id_name_type_unique UNIQUE (music_id, tag_name, tag_type);


--
-- Name: music music_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.music
    ADD CONSTRAINT music_pkey PRIMARY KEY (id);


--
-- Name: music_tag music_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.music_tag
    ADD CONSTRAINT music_tags_pkey PRIMARY KEY (id);


--
-- Name: music_tag fk_music_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.music_tag
    ADD CONSTRAINT fk_music_id FOREIGN KEY (music_id) REFERENCES public.music(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

