CREATE TABLE BRAND_GROUP 
( b_id INTEGER, b_name CHAR(50), b_yr_b DATE, b_yr_e DATE, b_notes CHAR(100), b_url CHAR(30), pub_id INTEGER, 
PRIMARY KEY (b_id), FOREIGN KEY (pub_id) REFERENCES PUBLISHER );

CREATE TABLE COUNTRY 
( c_id INTEGER, c_code CHAR (4), c_name CHAR (50), 
PRIMARY KEY (c_id) );

CREATE TABLE INDICIA_PUBLISHER 
( ind_id INTEGER, ind_name CHAR(50), pub_id INTEGER, c_id INTEGER, ind_yr_b DATE, ind_yr_e DATE, sur BOOLEAN, ind_notes CHAR(100), ind_url CHAR(100), 
PRIMARY KEY (ind_id), FOREIGN KEY (pub_id) REFERENCES PUBLISHER, FOREIGN KEY (c_id) REFERENCES COUNTRY );

CREATE TABLE ISSUE 
(iss_id INTEGER, iss_num INTEGER, s_id INTEGER, ind_id INTEGER, pub_date CHAR(20), price CHAR(30), page_count FLOAT, ind_freq CHAR(30), iss_editing CHAR(100), iss_notes CHAR(300), isbn char(10), valid_isbn INTEGER, bcode CHAR(20), iss_title CHAR(100), on_sale_date DATE, rating CHAR(50), 
PRIMARY KEY (iss_id), FOREIGN KEY (s_id) REFERENCES SERIES, FOREIGN KEY (ind_id) REFERENCES INDICIA_PUBLISHER );

CREATE TABLE ISSUEREPRINT
(re_id INTEGER, iss_origin_id INTEGER, iss_target_id INTEGER,
PRIMARY KEY (re_id), FOREIGN KEY(iss_origin_id) REFERENCES ISSUE, FOREIGN KEY (iss_target_id) REFERENCES ISSUE );
/*FOREIGN KEY(iss_origin_id) FOREIGN KEY (iss_target_id) separately??? */

CREATE TABLE LANG 
( l_id INTEGER, lang_code CHAR(4), lang_name CHAR(25),
PRIMARY KEY (l_id) );

CREATE TABLE PUBLISHER 
( pub_id INTEGER, pub_name CHAR(50), c_id INTEGER, pub_yr_b DATE, pub_yr_e DATE, pub_notes CHAR(300), pub_url CHAR(100),
PRIMARY KEY (pub_id), FOREIGN KEY (c_id) REFERENCES COUNTRY );

CREATE TABLE SERIES_PUBLICATION_TYPE
( ser_type_id INTEGER, ser_name CHAR(8) ,
PRIMARY KEY(ser_type_id) );

CREATE TABLE SERIES
( s_id INTEGER, s_name CHAR(100), format CHAR(20), series_yr_b DATE, series_yr_e DATE, pub_dates CHAR(50), fiss_id INTEGER, liss_id INTEGER, pub_id INTEGER, c_id INTEGER, langid INTEGER, series_notes CHAR(300), color CHAR(100), dimensions CHAR(50), paper_stock CHAR(50), binding CHAR(100), format CHAR(50), pub_type_id INTEGER,
PRIMARY KEY(s_id, s_name), FOREIGN KEY (fiss_id, liss_id) REFERENCES ISSUE, FOREIGN KEY (pub_id) REFERENCES PUBLISHER, FOREIGN KEY (c_id) REFERENCES COUNTRY, FOREIGN KEY (langid) REFERENCES LANG, FOREIGN KEY (pub_type_id) REFERENCES SERIES_PUBLICATION_TYPE );

 CREATE TABLE STORY_REPRINT
( sr_id INTEGER, st_origin_id INTEGER, st_target_id INTEGER, 
PRIMARY KEY (sr_id), FOREIGN KEY (st_origin_id, st_target_id) REFERENCES STORY );

CREATE TABLE STORY_TYPE
( stp_id INTEGER, stp_name CHAR( 40 ),
PRIMARY KEY(stp_id) );

CREATE TABLE STORY 
( st_id INTEGER, st_title CHAR( 200 ), feature CHAR( 50 ), iss_id INTEGER, script CHAR(50), pencils CHAR(20), inks CHAR(20), colors CHAR(20), letters CHAR(20), story_editing CHAR(20), genre CHAR(20), characters CHAR(30), synopsis CHAR(100), reprint_note CHAR(100), st_note CHAR(100), stp_id INTEGER, 
PRIMARY KEY (st_id), FOREIGN KEY (iss_id) REFERENCES ISSUE, FOREIGN KEY (stp_id) REFERENCES STORY_TYPE );



