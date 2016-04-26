-- Kim Coterwas
-- Lab 10

-- 1. 'PreReqsFor' returns the immediate prerequisites for the passed-in course number
CREATE OR REPLACE FUNCTION PreReqsFor(INT, REFCURSOR) RETURNS refcursor AS 
$$
DECLARE
   num_credits INT       := $1;
   resultset   REFCURSOR := $2;
BEGIN
   OPEN resultset FOR 
      SELECT preReqNum
      FROM   prerequisites
      WHERE courseNum = num_credits;
   RETURN resultset;
END;
$$ 
LANGUAGE plpgsql;

SELECT PreReqsFor(499, 'results');
FETCH ALL FROM results;

-- 2. 'IsPreReqFor' returns the courses for which the passed-in course number is an immediate prerequisite
CREATE OR REPLACE FUNCTION IsPreReqFor(INT, REFCURSOR) RETURNS refcursor AS 
$$
DECLARE
   num_course INT       := $1;
   resultset   REFCURSOR := $2;
BEGIN
   OPEN resultset FOR 
      SELECT courseNum
      FROM   prerequisites
      WHERE  preReqNum = num_course;
   RETURN resultset;
END;
$$ 
LANGUAGE plpgsql;

SELECT IsPreReqFor(120, 'results');
FETCH ALL FROM results;