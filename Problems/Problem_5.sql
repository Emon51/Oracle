

/* Write an SQL query to display the correct message (meaningful message) from the input
comments_and_translation table. */

CREATE TABLE comments_and_translations
(
    comment_id      INT,
    comments         VARCHAR2(100),
    translations     VARCHAR2(100)
);


--------------------------------------------------------------------------------
insert into comments_and_translations values (1, 'very good', null);
insert into comments_and_translations values (2, 'good', null);
insert into comments_and_translations values (3, 'bad', null);
insert into comments_and_translations values (4, 'ordinary', null);
insert into comments_and_translations values (5, 'cdcdcdcd', 'very bad');
insert into comments_and_translations values (6, 'excellent', null);
insert into comments_and_translations values (7, 'ababab', 'not satisfied');
insert into comments_and_translations values (8, 'satisfied', null);
insert into comments_and_translations values (9, 'aabbaabb', 'extraordinary');
insert into comments_and_translations values (10, 'ccddccbb', 'medium');
--------------------------------------------------------------------------------

ALTER TABLE comments_and_translations
RENAME TO temp;
--------------------------------------------------------------------------------
SELECT * FROM temp;


/* Write an SQL query to display the correct message (meaningful message) from the input
comments_and_translation table. */

CREATE TABLE comments_and_translations
(
    comment_id      INT,
    comments         VARCHAR2(100),
    translations     VARCHAR2(100)
);


--------------------------------------------------------------------------------
insert into comments_and_translations values (1, 'very good', null);
insert into comments_and_translations values (2, 'good', null);
insert into comments_and_translations values (3, 'bad', null);
insert into comments_and_translations values (4, 'ordinary', null);
insert into comments_and_translations values (5, 'cdcdcdcd', 'very bad');
insert into comments_and_translations values (6, 'excellent', null);
insert into comments_and_translations values (7, 'ababab', 'not satisfied');
insert into comments_and_translations values (8, 'satisfied', null);
insert into comments_and_translations values (9, 'aabbaabb', 'extraordinary');
insert into comments_and_translations values (10, 'ccddccbb', 'medium');
--------------------------------------------------------------------------------

ALTER TABLE comments_and_translations
RENAME TO temp;
--------------------------------------------------------------------------------
SELECT * FROM temp;

--Solution_1

SELECT CASE WHEN translations IS NULL THEN comments ELSE translations END AS output
FROM temp;

--Solution_2

SELECT COALESCE(translations, comments) AS output --If translations is null then select comments else translations.
FROM temp;




































