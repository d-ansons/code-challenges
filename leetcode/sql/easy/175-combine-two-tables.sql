/*
Write a solution to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.

Return the result table in any order.

The result format is in the following example.
*/
SELECT 
    p.firstName AS firstName,
    p.lastName AS lastName,
    a.city AS city,
    a.state AS state
FROM Person p
LEFT JOIN Address a
    ON p.personId = a.personId
;
