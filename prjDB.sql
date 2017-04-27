CREATE TABLE BRAND_GROUP
( b_id INTEGER NOT NULL,
b_name VARCHAR2(100),
b_yr_b INTEGER,
b_yr_e INTEGER,
b_notes VARCHAR2(800),
b_url VARCHAR2(200),
pub_id INTEGER NOT NULL);
/*
Foreign key needs to be done
*/

CREATE TABLE COUNTRY 
( c_id INTEGER NOT NULL, c_code VARCHAR2 (4), c_name VARCHAR2 (50), 
PRIMARY KEY (c_id) );


CREATE TABLE INDICIA_PUBLISHER
( ind_id INTEGER NOT NULL, ind_name VARCHAR2(200), pub_id INTEGER NOT NULL, c_id INTEGER NOT NULL, ind_yr_b INTEGER, ind_yr_e INTEGER, sur NUMBER(1), ind_notes VARCHAR2(3000), ind_url VARCHAR2(200), 
PRIMARY KEY (ind_id));

/* Foreign key needs to be done */


CREATE TABLE PUBLISHER 
( pub_id INTEGER NOT NULL, pub_name VARCHAR2(200), c_id INTEGER NOT NULL, pub_yr_b INTEGER, pub_yr_e INTEGER, pub_notes VARCHAR2(3000), pub_url VARCHAR2(300),
PRIMARY KEY (pub_id), FOREIGN KEY (c_id) REFERENCES COUNTRY );



/*


CREATE TABLE ISSUE 
(iss_id INTEGER, iss_num INTEGER, s_id INTEGER, ind_id INTEGER, pub_date VARCHAR(20), price VARCHAR(30), page_count FLOAT, ind_freq VARCHAR(30), iss_editing VARCHAR(100), iss_notes VARCHAR(300), isbn VARCHAR(10), valid_isbn INTEGER, bcode VARCHAR(20), iss_title VARCHAR(100), on_sale_date DATE, rating VARCHAR(50), 
PRIMARY KEY (iss_id), FOREIGN KEY (s_id) REFERENCES SERIES, FOREIGN KEY (ind_id) REFERENCES INDICIA_PUBLISHER );

CREATE TABLE ISSUEREPRINT
(re_id INTEGER, iss_origin_id INTEGER, iss_target_id INTEGER,
PRIMARY KEY (re_id), FOREIGN KEY(iss_origin_id) REFERENCES ISSUE, FOREIGN KEY (iss_target_id) REFERENCES ISSUE );

CREATE TABLE LANG 
( l_id INTEGER, lang_code VARCHAR(4), lang_name VARCHAR(25),
PRIMARY KEY (l_id) );


CREATE TABLE SERIES_PUBLICATION_TYPE
( ser_type_id INTEGER, ser_name VARCHAR(8) ,
PRIMARY KEY(ser_type_id) );

CREATE TABLE SERIES
( s_id INTEGER, s_name VARCHAR(100), format VARCHAR(20), series_yr_b DATE, series_yr_e DATE, pub_dates VARCHAR(50), fiss_id INTEGER, liss_id INTEGER, pub_id INTEGER, c_id INTEGER, langid INTEGER, series_notes VARCHAR(300), color VARCHAR(100), dimensions VARCHAR(50), paper_stock VARCHAR(50), binding VARCHAR(100), format VARCHAR(50), pub_type_id INTEGER,
PRIMARY KEY(s_id, s_name), FOREIGN KEY (fiss_id, liss_id) REFERENCES ISSUE, FOREIGN KEY (pub_id) REFERENCES PUBLISHER, FOREIGN KEY (c_id) REFERENCES COUNTRY, FOREIGN KEY (langid) REFERENCES LANG, FOREIGN KEY (pub_type_id) REFERENCES SERIES_PUBLICATION_TYPE );

 CREATE TABLE STORY_REPRINT
( sr_id INTEGER, st_origin_id INTEGER, st_target_id INTEGER, 
PRIMARY KEY (sr_id), FOREIGN KEY (st_origin_id, st_target_id) REFERENCES STORY );

CREATE TABLE STORY_TYPE
( stp_id INTEGER, stp_name VARCHAR( 40 ),
PRIMARY KEY(stp_id) );

CREATE TABLE STORY 
( st_id INTEGER, st_title VARCHAR( 200 ), feature VARCHAR( 50 ), iss_id INTEGER, script VARCHAR(50), pencils VARCHAR(20), inks VARCHAR(20), colors VARCHAR(20), letters VARCHAR(20), story_editing VARCHAR(20), genre VARCHAR(20), VARCHARacters VARCHAR(30), synopsis VARCHAR(100), reprint_note VARCHAR(100), st_note VARCHAR(100), stp_id INTEGER, 
PRIMARY KEY (st_id), FOREIGN KEY (iss_id) REFERENCES ISSUE, FOREIGN KEY (stp_id) REFERENCES STORY_TYPE );
*/

