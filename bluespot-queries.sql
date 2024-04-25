USE bluespot;


-- trigger for photo avg rating (s)


-- display all the photos that match 1 or more tags (s)


-- display all the photos of a user (c)

DROP PROCEDURE IF EXISTS DisplayUserPhotos;
CREATE PROCEDURE DisplayUserPhotos(IN user_name VARCHAR(50))
BEGIN
    SELECT *
    FROM Photo
    WHERE Username = user_name;
END;


-- display most popular users (based on ratings and number of photos) (c)

DROP PROCEDURE IF EXISTS DisplayPopularUsers;
CREATE PROCEDURE DisplayPopularUsers()
BEGIN
    SELECT bu.Username, bu.FirstName, bu.LastName, bu.AvgRating, COUNT(p.PID) AS NumPhotos,
           SUM(p.AvgRating) AS TotalPhotoRating,
           (COUNT(p.PID) + IFNULL(SUM(p.AvgRating), 0)) AS PopularityScore
    FROM BluespotUser bu
    LEFT JOIN Photo p ON bu.Username = p.Username
    GROUP BY bu.Username
    ORDER BY PopularityScore DESC;
END;
