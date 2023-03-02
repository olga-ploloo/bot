--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)

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
-- Name: btree_gin; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gin WITH SCHEMA public;


--
-- Name: EXTENSION btree_gin; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gin IS 'support for indexing common datatypes in GIN';


--
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: cube; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


--
-- Name: EXTENSION cube; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


--
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


--
-- Name: dict_int; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_int WITH SCHEMA public;


--
-- Name: EXTENSION dict_int; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dict_int IS 'text search dictionary template for integers';


--
-- Name: dict_xsyn; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_xsyn WITH SCHEMA public;


--
-- Name: EXTENSION dict_xsyn; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dict_xsyn IS 'text search dictionary template for extended synonym processing';


--
-- Name: earthdistance; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS earthdistance WITH SCHEMA public;


--
-- Name: EXTENSION earthdistance; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION earthdistance IS 'calculate great-circle distances on the surface of the Earth';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: intarray; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS intarray WITH SCHEMA public;


--
-- Name: EXTENSION intarray; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION intarray IS 'functions, operators, and index support for 1-D arrays of integers';


--
-- Name: ltree; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;


--
-- Name: EXTENSION ltree; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgrowlocks; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrowlocks WITH SCHEMA public;


--
-- Name: EXTENSION pgrowlocks; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgrowlocks IS 'show row-level locking information';


--
-- Name: pgstattuple; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgstattuple WITH SCHEMA public;


--
-- Name: EXTENSION pgstattuple; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgstattuple IS 'show tuple-level statistics';


--
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: xml2; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS xml2 WITH SCHEMA public;


--
-- Name: EXTENSION xml2; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION xml2 IS 'XPath querying and XSLT';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: first; Type: TABLE; Schema: public; Owner: xqdubwmh
--

CREATE TABLE public.first (
    c1 text,
    c2 text,
    c3 text,
    c4 text,
    c5 text,
    c6 text
);


ALTER TABLE public.first OWNER TO xqdubwmh;

--
-- Name: movie; Type: TABLE; Schema: public; Owner: xqdubwmh
--

CREATE TABLE public.movie (
    id bigint,
    name text,
    link text,
    style text
);


ALTER TABLE public.movie OWNER TO xqdubwmh;

--
-- Data for Name: first; Type: TABLE DATA; Schema: public; Owner: xqdubwmh
--

COPY public.first (c1, c2, c3, c4, c5, c6) FROM stdin;
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: xqdubwmh
--

COPY public.movie (id, name, link, style) FROM stdin;
0	Люди в черном	/films/fiction/3401-lyudi-v-chernom-1997.html	adventure
1	Валериан и город тысячи планет	/films/fiction/23415-valerian-i-gorod-tysyachi-planet-2017.html	adventure
2	Люси	/films/fiction/2057-lyusi-2014.html	thriller
3	Хроники хищных городов	/films/action/29373-hroniki-hischnyh-gorodov-2018.html	adventure
4	Анна	/films/action/31932-anna-2019.html	thriller
5	Малавита	/films/action/804-malavita-2013.html	humor
6	Такси	/films/action/1123-taksi-1998.html	humor
7	Из Парижа с любовью	/films/action/1142-iz-parizha-s-lyubovyu-2009.html	thriller
8	Курск	/films/drama/30024-kursk-2018.html	dram
9	Затерянные в космосе	/series/fiction/27461-zateryannye-v-kosmose-2018.html	space
10	Дикий дикий Запад	/films/action/5759-dikiy-dikiy-zapad-1999.html	adventure
11	Стражи Галактики	/films/fiction/2031-strazhi-galaktiki-2014.html	adventure
12	Гоголь. Начало	/films/adventures/25043-gogol-nachalo-2017.html	thriller
13	Доктор Сон	/films/drama/32355-doktor-son-2019.html	thriller
14	Большой куш	/films/crime/762-bolshoy-kush-2000.html	criminall
15	Карты  деньги  два ствола	/films/thriller/819-karty-dengi-dva-stvola-1998.html	criminall
16	Рок-н-рольщик	/films/action/1497-rok-n-rolschik-2008.html	criminall
17	Шерлок Холмс	/films/action/256-sherlok-holms-2009.html	adventure
18	Агенты А.Н.К.Л.	/films/action/10787-agenty-ankl-2015.html	criminall
19	Меч короля Артура	/films/fantasy/17831-mech-korolya-artura-2017.html	adventure
20	Джентльмены	/films/action/33026-dzhentlmeny-2020.html	criminall
21	Я иду искать	/films/thriller/31884-ya-idu-iskat-2019.html	thriller
22	Парадокс Кловерфилда	/films/fiction/26926-paradoks-kloverfilda-2018.html	space
23	И гаснет свет…	/films/horror/16853-i-gasnet-svet-2016.html	horror
24	Астрал	/films/fantasy/866-astral-2010.html	horror
25	Омен	/films/thriller/3599-omen-2006.html	horror
26	Омен 4: Пробуждение	/films/horror/22010-omen-4-probuzhdenie-1991.html	horror
27	Заклятие	/films/horror/740-zaklyatie-2013.html	horror
28	Платформа	/films/thriller/33823-platforma-2019.html	brainstorm
29	Прочь	/films/thriller/23443-proch-2017.html	thriller
30	Последнее изгнание дьявола	/films/horror/1625-poslednee-izgnanie-dyavola-2010.html	horror
31	Kingsman: Секретная служба	/films/action/7787-kingsman-sekretnaya-sluzhba-2014.html	criminall
32	Призраки войны	/films/thriller/34875-prizraki-voyny-2020.html	horror
33	Большой Лебовски	/films/comedy/4322-bolshoy-lebovski-1998.html	humor
34	Пляжный бездельник	/films/comedy/30423-plyazhnyy-bezdelnik-2019.html	humor
35	Железное небо	/films/fiction/3268-zheleznoe-nebo-2012.html	humor
36	Мир Юрского периода	/films/fiction/10694-mir-yurskogo-perioda-2015.html	adventure
37	Смерть Сталина	/films/comedy/26944-smert-stalina-2017.html	humor
38	Годзилла	/films/fiction/1671-godzilla-2014.html	adventure
39	Годзилла против Конга	/films/fiction/37064-godzilla-protiv-konga-2021.html	adventure
40	Машина времени	/films/fiction/6718-mashina-vremeni-2002.html	adventure
41	Аэронавты	/films/adventures/32655-aeronavty-2019.html	adventure
42	Довод	/films/fiction/34878-dovod-2020.html	brainstorm
43	Даун Хаус	/films/comedy/13552-daun-haus-2001.html	humor
44	Не грози южному централу, попивая сок у себя в квартале	/films/comedy/5529-ne-grozi-yuzhnomu-centralu-popivaya-sok-u-sebya-v-kvartale-1996.html	humor
45	1917	/films/drama/32828-1917-2019.html	dram
46	Апгрейд	/films/action/28234-apgreyd-2018.html	thriller
47	Нелепая шестёрка	/films/comedy/21959-nelepaya-shesterka-2015.html	humor
48	Солдаты неудачи	/films/action/1665-soldaty-neudachi-2008.html	humor
49	Оцепеневшие от страха	/films/horror/28884-ocepenevshie-ot-straha-2018.html	horror
50	Помутнение	/films/drama/1711-pomutnenie-2006.html	thriller
51	Пекло	/films/fiction/6904-peklo-2007.html	space
52	День независимости	/films/fiction/3500-den-nezavisimosti.html	space
53	Избави нас от лукавого	/films/horror/2261-izbavi-nas-ot-lukavogo-2014.html	horror
54	Космос: Пространство и время	/series/documentary/1261-kosmos-prostranstvo-i-vremya-2014.html	educational
55	Человечество: История всех нас	/series/historical/11956-chelovechestvo-istoriya-vseh-nas-2012.html	educational
56	Черное зеркало	/series/fiction/77-chernoe-zerkalo-2011.html	brainstorm
57	Судья	/films/drama/7640-sudya-2014.html	thriller
58	Зодиак	/films/drama/1697-zodiak-2007.html	thriller
59	Темный рыцарь	/films/action/703-temnyy-rycar-2008.html	thriller
60	Престиж	/films/drama/795-prestizh-2006.html	thriller
61	Ford против Ferrari	/films/drama/32558-ford-protiv-ferrari-2019.html	adventure
62	Интерстеллар	/films/fiction/2259-interstellar-2014.html	space
63	Отступники	/films/detective/824-otstupniki-2006.html	thriller
64	Марсианин	/films/fiction/11116-marsianin-2015.html	space
65	Догма	/films/adventures/4417-dogma-1999.html	humor
66	Джей и молчаливый Боб наносят ответный удар	/films/comedy/2949-dzhey-i-molchalivyy-bob-nanosyat-otvetnyy-udar-2001.html	humor
67	Меняющие реальность	/films/fiction/302-menyayuschie-realnost-2011.html	thriller
68	Константин: Повелитель тьмы	/films/fantasy/1492-konstantin-povelitel-tmy-2005.html	thriller
69	Адвокат дьявола	/films/detective/807-advokat-dyavola-1997.html	thriller
70	Матрица	/films/fiction/981-matrica-1999.html	thriller
71	День, когда Земля остановилась	/films/fiction/1674-den-kogda-zemlya-ostanovilas-2008.html	thriller
72	Репродукция	/films/fiction/28911-reprodukciya-2018.html	thriller
73	Линкольн для адвоката	/films/thriller/264-linkoln-dlya-advokata-2011.html	thriller
74	Золото	/films/thriller/23375-zoloto-2016.html	thriller
75	Малхолланд Драйв	/films/thriller/4581-malholland-drayv-2001.html	brainstorm
76	Заводной апельсин	/films/fiction/3235-zavodnoy-apelsin-1971.html	brainstorm
77	2001 год: Космическая одиссея	/films/adventures/2647-2001-god-kosmicheskaya-odisseya-1968.html	space
78	Шоссе в никуда	/films/horror/5240-shosse-v-nikuda-1997.html	brainstorm
79	Меланхолия	/films/fiction/467-melanholiya-2011.html	brainstorm
80	Криминальное чтиво	/films/drama/822-kriminalnoe-chtivo-1994.html	criminall
81	Бегущий по лезвию 2049	/films/fiction/24952-beguschiy-po-lezviyu-2049-2017.html	thriller
82	Бойцовский клуб	/films/drama/787-boycovskiy-klub-1999.html	thriller
83	Реквием по мечте	/films/drama/2886-rekviem-po-mechte-2000.html	brainstorm
84	Господин Никто	/films/fiction/5266-gospodin-nikto-2009.html	brainstorm
85	Далласский клуб покупателей	/films/drama/1301-dallasskiy-klub-pokupateley-2013.html	dram
86	Аннигиляция	/films/fiction/27275-annigilyaciya-2018.html	thriller
87	Планета Ка-Пэкс	/films/fiction/1064-planeta-ka-peks-2001.html	dram
88	Она	/films/melodrama/1571-ona-2013.html	dram
89	Монстро	/films/action/4622-monstro-2008.html	thriller
90	Автостопом по галактике	/films/fiction/3259-avtostopom-po-galaktike-2005.html	humor
91	Исходный код	/films/fiction/259-ishodnyy-kod-2011.html	thriller
92	Пандорум	/films/action/5466-pandorum-2009.html	space
93	Прометей	/films/fiction/179-prometey-2012.html	space
94	Луна 2112	/films/fiction/5744-luna-2112-2009.html	space
95	Дэдпул	/films/fiction/11147-dedpul-2016.html	humor
96	Сплит	/films/thriller/18045-split-2017.html	dram
97	Чужой: Завет	/films/horror/23540-chuzhoy-zavet-2017.html	space
98	Лабиринт Фавна	/films/fantasy/1375-labirint-favna-2006.html	thriller
99	Из ада	/films/detective/1727-iz-ada-2001.html	thriller
100	Бесславные ублюдки	/films/action/3079-besslavnye-ublyudki-2009.html	dram
101	Омерзительная восьмерка	/films/thriller/11352-omerzitelnaya-vosmerka-2015.html	criminall
102	Ярость	/films/action/7737-yarost-2014.html	dram
103	Всевидящее око	/films/detective/53552-vsevidyaschee-oko-2022.html	thriller
104	Мидуэй	/films/action/32496-miduey-2019.html	dram
105	Глубоководный горизонт	/films/drama/14128-glubokovodnyy-gorizont-2016.html	dram
106	Человек-паук	/films/action/1481-chelovek-pauk-2002.html	adventure
107	Гнев человеческий	/films/thriller/38508-gnev-chelovecheskiy-2021.html	thriller
108	Гренландия	/films/drama/34891-grenlandiya-2020.html	dram
109	Быстрее пули	/films/action/47246-bystree-puli-2022.html	thriller
110	Топ Ган: Мэверик	/films/action/47946-top-gan-meverik-2022.html	dram
111	Дюна	/films/fiction/40288-dyuna-2021.html	adventure
112	В сердце моря	/films/action/7950-v-serdce-morya-2015.html	adventure
113	К-19	/films/military/1491-k-19-2002.html	dram
114	Пришельцы	/films/fantasy/6803-prishelcy-1993.html	humor
115	Бабло	/films/crime/529-bablo-2011.html	criminall
116	Геошторм	/films/fiction/24209-geoshtorm-2017.html	thriller
117	Светоч / Яркость	/films/action/26386-svetoch-2017.html	thriller
118	Убийство в Восточном экспрессе\n	/films/detective/25699-ubiystvo-v-vostochnom-ekspresse-2017.html	thriller
119	Отчаянный	/films/action/2684-otchayannyy-1995.html	criminall
\.


--
-- Name: ix_movie_id; Type: INDEX; Schema: public; Owner: xqdubwmh
--

CREATE INDEX ix_movie_id ON public.movie USING btree (id);


--
-- PostgreSQL database dump complete
--

