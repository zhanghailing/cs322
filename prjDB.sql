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
( c_id INTEGER NOT NULL, 
c_code VARCHAR2 (4), 
c_name VARCHAR2 (50), 
PRIMARY KEY (c_id) );


CREATE TABLE INDICIA_PUBLISHER
( ind_id INTEGER NOT NULL, 
ind_name VARCHAR2(200), 
pub_id INTEGER NOT NULL, 
c_id INTEGER NOT NULL, 
ind_yr_b INTEGER, 
ind_yr_e INTEGER, 
sur NUMBER(1), 
ind_notes VARCHAR2(3000), 
ind_url VARCHAR2(200), 
PRIMARY KEY (ind_id));

/* Foreign key needs to be done */


CREATE TABLE PUBLISHER 
( pub_id INTEGER NOT NULL, 
pub_name VARCHAR2(200), 
c_id INTEGER NOT NULL, 
pub_yr_b INTEGER, 
pub_yr_e INTEGER, 
pub_notes VARCHAR2(3202), 
pub_url VARCHAR2(300),
PRIMARY KEY (pub_id), 
FOREIGN KEY (c_id) REFERENCES COUNTRY );


CREATE TABLE LANG 
( l_id INTEGER, 
lang_code VARCHAR2(4), 
lang_name VARCHAR2(27),
PRIMARY KEY (l_id) );

CREATE TABLE SERIES_PUBLICATION_TYPE
( ser_type_id INTEGER NOT NULL, 
ser_name VARCHAR2(8) ,
PRIMARY KEY(ser_type_id) );


CREATE TABLE ISSUE 
(iss_id INTEGER NOT NULL, 
iss_num VARCHAR2(50), 
s_id INTEGER, 
ind_id INTEGER, 
pub_date VARCHAR2(64), 
price VARCHAR2(256), 
page_count FLOAT, 
ind_freq VARCHAR2(256), 
iss_editing VARCHAR2(1600), 
iss_notes VARCHAR2(1000), 
isbn VARCHAR2(40), 
valid_isbn VARCHAR2(20), 
bcode VARCHAR2(64), 
iss_title VARCHAR2(128), 
on_sale_date VARCHAR2(32), 
rating VARCHAR2(125), 
PRIMARY KEY (iss_id)
--FOREIGN KEY (s_id) REFERENCES SERIES(s_id), 
--FOREIGN KEY (ind_id) REFERENCES INDICIA_PUBLISHER 
);




--ALTER TABLE ISSUE
--MODIFY (price VARCHAR2(256));
--ALTER TABLE ISSUE
--MODIFY (iss_notes VARCHAR2(4000));


CREATE TABLE SERIES
(s_id INTEGER NOT NULL, 
s_name VARCHAR2(256), 
s_format VARCHAR2(256),
series_yr_b DATE, 
series_yr_e DATE, 
pub_dates VARCHAR2(128), 
fiss_id INTEGER, 
liss_id INTEGER, 
--pub_id INTEGER NOT NULL, 
pub_id INTEGER, 
c_id INTEGER, 
langid INTEGER, 
series_notes VARCHAR2(4000), 
color VARCHAR2(256), 
dimensions VARCHAR2(256), 
paper_stock VARCHAR2(256), 
s_binding VARCHAR2(128), 
pub_format VARCHAR2(256), 
pub_type_id INTEGER,
--PRIMARY KEY(s_id, s_name), 
PRIMARY KEY(s_id)
--FOREIGN KEY (fiss_id) REFERENCES ISSUE(iss_id), 
--FOREIGN KEY (liss_id) REFERENCES ISSUE(iss_id), 
--FOREIGN KEY (pub_id) REFERENCES PUBLISHER, 
--FOREIGN KEY (c_id) REFERENCES COUNTRY, 
--FOREIGN KEY (langid) REFERENCES LANG, 
--FOREIGN KEY (pub_type_id) REFERENCES SERIES_PUBLICATION_TYPE
);


ALTER TABLE ISSUE
ADD FOREIGN KEY(s_id) REFERENCES SERIES;

ALTER TABLE ISSUE
ADD FOREIGN KEY (ind_id) REFERENCES INDICIA_PUBLISHER ;

--ALTER TABLE ISSUE
--MODIFY (on_sale_date VARCHAR2(32));

--ALTER TABLE SERIES
--MODIFY (s_format VARCHAR2(256));
--
--ALTER TABLE SERIES
--MODIFY (pub_dates VARCHAR2(128));
--
--ALTER TABLE SERIES
--MODIFY (s_notes VARCHAR2(2000));

--ALTER TABLE ISSUE
--ADD CONSTRAINT fk_issueSeries FOREIGN KEY(s_id,s_name) REFERENCES SERIES(s_id, s_name);


ALTER TABLE SERIES
ADD FOREIGN KEY (fiss_id) REFERENCES ISSUE;

ALTER TABLE SERIES
ADD FOREIGN KEY (liss_id) REFERENCES ISSUE;

ALTER TABLE SERIES
ADD FOREIGN KEY (pub_id) REFERENCES PUBLISHER;

ALTER TABLE SERIES
ADD FOREIGN KEY (c_id) REFERENCES COUNTRY;

ALTER TABLE SERIES
ADD FOREIGN KEY (langid) REFERENCES LANG;

ALTER TABLE SERIES
ADD FOREIGN KEY (pub_type_id) REFERENCES SERIES_PUBLICATION_TYPE;

ALTER TABLE STORY
ADD FOREIGN KEY (iss_id) REFERENCES ISSUE;


--CREATE TABLE ISSUEREPRINT
--(iss_origin_id INTEGER, 
--iss_target_id INTEGER,
--re_id INTEGER,
--PRIMARY KEY (iss_origin_id,iss_target_id), 
--CONSTRAINT orginin
--FOREIGN KEY(iss_origin_id) REFERENCES ISSUE, 
--CONSTRAINT target
--FOREIGN KEY (iss_target_id) REFERENCES ISSUE );

CREATE TABLE ISSUEREPRINT
(iss_origin_id INTEGER, 
iss_target_id INTEGER,
CONSTRAINT issue_reprint_pk PRIMARY KEY (iss_origin_id, iss_target_id),
CONSTRAINT FK_origin 
      FOREIGN KEY (iss_origin_id) REFERENCES ISSUE,
  CONSTRAINT FK_target 
      FOREIGN KEY (iss_target_id) REFERENCES ISSUE
--FOREIGN KEY(iss_origin_id) REFERENCES ISSUE,
--FOREIGN KEY (iss_target_id) REFERENCES ISSUE  
);

CREATE TABLE STORYREPRINT
(st_origin_id INTEGER, 
st_target_id INTEGER,
CONSTRAINT st_reprint_pk PRIMARY KEY (st_origin_id, st_target_id),
CONSTRAINT FK_st_origin 
      FOREIGN KEY (st_origin_id) REFERENCES STORY,
  CONSTRAINT FK_st_target 
      FOREIGN KEY (st_target_id) REFERENCES STORY
--FOREIGN KEY(iss_origin_id) REFERENCES ISSUE,
--FOREIGN KEY (iss_target_id) REFERENCES ISSUE  
);

SELECT s.colors, s.st_id
FROM STORY s
where s.colors is not null;

SELECT s.colors as colordist
FROM STORY s
GROUP BY s.colors;

SELECT COUNT(colordist) as countcolordist FROM (
  SELECT s.colors as colordist
  FROM STORY s
  GROUP BY s.colors
);

  SELECT scriptdist FROM (
      SELECT s.pencils as scriptdist
      FROM STORY s
      GROUP BY s.pencils
    )
    WHERE scriptdist is not null;
  
SELECT COUNT(colordist) as countcolordist FROM (
  SELECT colordist FROM (
    SELECT s.colors as colordist
    FROM STORY s
    GROUP BY s.colors
  )
  WHERE colordist is not null
  
);
CREATE TABLE SCRIPTBY
(st_id INTEGER, 
artist_id INTEGER,
CONSTRAINT st_script_artist_pk PRIMARY KEY (st_id, artist_id),
CONSTRAINT FK_st_scipt 
      FOREIGN KEY (st_id) REFERENCES STORY,
  CONSTRAINT FK_st_script_artist 
      FOREIGN KEY (artist_id) REFERENCES ARTIST 
);

CREATE TABLE COLORBY
(st_id INTEGER, 
artist_id INTEGER,
CONSTRAINT st_color_artist_pk PRIMARY KEY (st_id, artist_id),
CONSTRAINT FK_st_color 
      FOREIGN KEY (st_id) REFERENCES STORY,
  CONSTRAINT FK_st_color_artist 
      FOREIGN KEY (artist_id) REFERENCES ARTIST 
);

CREATE TABLE INKBY
(st_id INTEGER, 
artist_id INTEGER,
CONSTRAINT st_ink_artist_pk PRIMARY KEY (st_id, artist_id),
CONSTRAINT FK_st_ink 
      FOREIGN KEY (st_id) REFERENCES STORY,
  CONSTRAINT FK_st_ink_artist 
      FOREIGN KEY (artist_id) REFERENCES ARTIST 
);

CREATE TABLE PENCILBY
(st_id INTEGER, 
artist_id INTEGER,
CONSTRAINT st_pencil_artist_pk PRIMARY KEY (st_id, artist_id),
CONSTRAINT FK_st_pencil 
      FOREIGN KEY (st_id) REFERENCES STORY,
  CONSTRAINT FK_st_pencil_artist 
      FOREIGN KEY (artist_id) REFERENCES ARTIST 
);

SELECT s.artist_id as artist_script, s.st_id as story_id_s, c.artist_id as artist_color, c.st_id as story_id_c
FROM SCRIPTBY s INNER JOIN COLORBY c
ON s.artist_id=c.artist_id;


SELECT *
FROM PENCILBY p INNER JOIN
    (
    SELECT s.artist_id as script, s.st_id as story_id_s, c.artist_id as color, c.st_id as story_id_c
    FROM SCRIPTBY s INNER JOIN COLORBY c
    ON s.artist_id=c.artist_id
    )
ON p.artist_id=script;


--story that is scripted and colored by same artist

SELECT s.artist_id as script, s.st_id as story_id_s, c.artist_id as color, c.st_id as story_id_c
FROM SCRIPTBY s INNER JOIN COLORBY c
ON s.artist_id=c.artist_id AND s.st_id=c.st_id ;


SELECT artist_id,st_id
FROM
        (SELECT p.artist_id as artist_id,p.st_id as st_id
        FROM PENCILBY p INNER JOIN
            (
            SELECT story_id_s,script
            FROM(
                  SELECT s.artist_id as script, s.st_id as story_id_s, c.artist_id as color, c.st_id as story_id_c
                  FROM SCRIPTBY s INNER JOIN COLORBY c
                  ON s.artist_id=c.artist_id AND s.st_id=c.st_id
                  )
            GROUP BY (story_id_s,script)
            )
        ON p.artist_id=script AND p.st_id=story_id_s
        )
GROUP BY (st_id,artist_id);

/*
ALTER TABLE PENCILBY
DROP CONSTRAINT FK_st_pencil_artist;

ALTER TABLE PENCILBY
ADD CONSTRAINT FK_st_pencil_artist FOREIGN KEY (artist_id) REFERENCES ARTIST;







 CREATE TABLE STORY_REPRINT
( sr_id INTEGER, st_origin_id INTEGER, st_target_id INTEGER, 
PRIMARY KEY (sr_id), FOREIGN KEY (st_origin_id, st_target_id) REFERENCES STORY );

CREATE TABLE STORY_TYPE
( stp_id INTEGER, stp_name VARCHAR( 40 ),
PRIMARY KEY(stp_id) );

CREATE TABLE STORY 
( st_id INTEGER, 
st_title VARCHAR( 200 ), 
feature VARCHAR( 50 ), 
iss_id INTEGER, 
letters VARCHAR(20), 
story_editing VARCHAR(20), 
genre VARCHAR(20), 
synopsis VARCHAR(100), 
reprint_note VARCHAR(100), 
st_note VARCHAR(100), 
stp_id INTEGER, 
PRIMARY KEY (st_id), 
FOREIGN KEY (iss_id) REFERENCES ISSUE, 
FOREIGN KEY (stp_id) REFERENCES STORY_TYPE );
*/

SELECT s.feature
FROM STORY s
where s.feature ='Batman';

CREATE TABLE CHARA_IN_STORY
(st_id INTEGER, 
character_id INTEGER,
CONSTRAINT st_character_pk PRIMARY KEY (st_id, character_id),
CONSTRAINT FK_in_st 
      FOREIGN KEY (st_id) REFERENCES STORY,
  CONSTRAINT FK_chara_in 
      FOREIGN KEY (character_id) REFERENCES CHARACTER 
);


SELECT s.feature, s.st_id
FROM STORY s
WHERE s.feature LIKE '%Batman%';


SELECT s.st_id,c.character_name
FROM STORY s, CHARA_IN_STORY cst,CHARACTER c
WHERE c.character_name like '%Batman%' AND c.character_id=cst.character_id AND cst.st_id=s.st_id;



SELECT character_st_id
FROM (
  SELECT s.st_id as character_st_id
  FROM STORY s, CHARA_IN_STORY cst,CHARACTER c
  WHERE c.character_name like '%Batman%' AND c.character_id=cst.character_id AND cst.st_id=s.st_id
  
) MINUS (
  SELECT s.st_id as feature_st_id
  FROM STORY s
  WHERE s.feature LIKE '%Batman%'
);

SELECT s.st_id as feature_st_id, s.feature as feature
FROM STORY s
WHERE s.feature LIKE '%Batman%';


SELECT s.st_id as character_st_id,c.character_name as character_name
FROM STORY s, CHARA_IN_STORY cst,CHARACTER c
WHERE c.character_name like '%Batman%' AND c.character_id=cst.character_id AND cst.st_id=s.st_id;


SELECT s.st_id,re.ST_ORIGIN_ID
FROM STORY s,STORYREPRINT re
WHERE s.st_id = re.st_origin_id;


SELECT re_st_id
FROM (
    SELECT s.st_id as re_st_id
    FROM STORY s,STORYREPRINT re
    WHERE s.st_id = re.st_origin_id
) INNER JOIN (
    SELECT character_st_id
    FROM (
      SELECT s.st_id as character_st_id
      FROM STORY s, CHARA_IN_STORY cst,CHARACTER c
      WHERE c.character_name like '%Batman%' AND c.character_id=cst.character_id AND cst.st_id=s.st_id
      
    ) MINUS (
      SELECT s.st_id as feature_st_id
      FROM STORY s
      WHERE s.feature LIKE '%Batman%'
    )
)
ON re_st_id=character_st_id;



--ids that fulfill h
SELECT character_st_id
FROM (
      SELECT character_st_id
      FROM (
        SELECT s.st_id as character_st_id
        FROM STORY s, CHARA_IN_STORY cst,CHARACTER c
        WHERE c.character_name like '%Batman%' AND c.character_id=cst.character_id AND cst.st_id=s.st_id
        
      ) MINUS (
        SELECT s.st_id as feature_st_id
        FROM STORY s
        WHERE s.feature LIKE '%Batman%'
      )
  
) MINUS (
    SELECT s.st_id as re_st_id
    FROM STORY s,STORYREPRINT re
    WHERE s.st_id = re.st_origin_id
);

--2h
SELECT s.st_title
FROM STORY s, (
    SELECT character_st_id
    FROM (
          SELECT character_st_id
          FROM (
            SELECT s.st_id as character_st_id
            FROM STORY s, CHARA_IN_STORY cst,CHARACTER c
            WHERE (c.character_name like '%Batman%' OR c.character_name LIKE '%Bat-Man%' OR c.character_name LIKE '%Bruce Wayne%')AND c.character_id=cst.character_id AND cst.st_id=s.st_id
            
          ) MINUS (
            SELECT s.st_id as feature_st_id
            FROM STORY s
            WHERE s.feature LIKE '%Batman%' OR s.feature LIKE '%Bat-Man%' OR s.feature LIKE '%Bruce Wayne%'
          )
      
    ) MINUS (
        SELECT s.st_id as re_st_id
        FROM STORY s,STORYREPRINT re
        WHERE s.st_id = re.st_origin_id
    )
)WHERE s.st_id=character_st_id AND s.st_title is not null;

--2h same result
SELECT s.st_title
FROM STORY s, (
    SELECT character_st_id
    FROM (
          SELECT character_st_id
          FROM (
            SELECT s.st_id as character_st_id
            FROM STORY s, CHARA_IN_STORY cst,CHARACTER c
            WHERE (c.character_name like '%Batman%' OR c.character_name LIKE '%Bat-Man%' OR c.character_name LIKE '%Bruce Wayne%')AND c.character_id=cst.character_id AND cst.st_id=s.st_id
            
          ) MINUS (
            SELECT s.st_id as feature_st_id
            FROM STORY s
            WHERE s.feature LIKE '%Batman%' OR s.feature LIKE '%Bat-Man%' OR s.feature LIKE '%Bruce Wayne%'
          )
      
    ) MINUS (
        SELECT re.st_origin_id as re_st_id
        FROM STORYREPRINT re
    )
)WHERE s.st_id=character_st_id AND s.st_title is not null;

select n from
( select rownum n from dual connect by level <= 2017)
where n >= 1990;



SELECT n AS years
FROM
( 
    SELECT ROWNUM n 
    FROM dual 
    CONNECT BY LEVEL <= 2017
)
WHERE n >= 1990;


SELECT i.iss_id,i.pub_date,years
FROM ISSUE i CROSS JOIN (
                        SELECT n AS years
                        FROM
                        ( 
                            SELECT ROWNUM n 
                            FROM dual 
                            CONNECT BY LEVEL <= 2017
                        )
                        WHERE n >= 1990
)
where regexp_like(i.pub_date,years);



SELECT count(*),years
FROM (
        SELECT i.iss_id,i.pub_date,years
        FROM ISSUE i CROSS JOIN (
                                SELECT n AS years
                                FROM
                                ( 
                                    SELECT ROWNUM n 
                                    FROM dual 
                                    CONNECT BY LEVEL <= 2017
                                )
                                WHERE n >= 1990
        )
        where regexp_like(i.pub_date,years)
)
GROUP BY years;


SELECT count(*),years
FROM (
        SELECT i.iss_id,i.pub_date,years
        FROM ISSUE i CROSS JOIN (
                                SELECT n AS years
                                FROM
                                ( 
                                    SELECT ROWNUM n 
                                    FROM dual 
                                    CONNECT BY LEVEL <= 2017
                                )
                                WHERE n >= 1990
        )
        where regexp_like(i.pub_date,years)
)
GROUP BY years
ORDER BY years;