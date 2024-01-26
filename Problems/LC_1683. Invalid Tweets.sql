/* Write your PL/SQL query statement below */

select t.tweet_id
from Tweets t
where length(t.content) > 15;
----------------------------------------------

CREATE PROCEDURE FindInvalidTweets AS
BEGIN
  SELECT tweet_id
  FROM Tweets
  WHERE LENGTH(content) > 15;
END;

EXEC FindInvalidTweets;
