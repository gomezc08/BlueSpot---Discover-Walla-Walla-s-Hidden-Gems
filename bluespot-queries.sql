USE bluespot;

DELIMITER $$

-- display all the photos that match 1 or more tags (s)
DROP PROCEDURE IF EXISTS SearchPhotosByTags$$
CREATE PROCEDURE SearchPhotosByTags(IN tag_list VARCHAR(200))
BEGIN
    DECLARE tag_condition VARCHAR(200);
    SET tag_condition = CONCAT('SELECT DISTINCT p.* 
                                FROM Photo p 
                                JOIN Tags t ON p.PID = t.PID 
                                WHERE t.Tag IN (', tag_list, ')');
    PREPARE stmt FROM tag_condition;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
$$

-- display all the photos of a user (c)

DROP PROCEDURE IF EXISTS DisplayUserPhotos$$
CREATE PROCEDURE DisplayUserPhotos(IN user_name VARCHAR(50))
BEGIN
    SELECT *
    FROM Photo
    WHERE Username = user_name;
END$$

-- display most popular picture locations (s)

DROP PROCEDURE IF EXISTS MostPopularLocation$$
CREATE PROCEDURE MostPopularLocation()
BEGIN
    SELECT PicLocation, COUNT(*) AS NumPhotos
    FROM Photo
    GROUP BY PicLocation
    ORDER BY NumPhotos DESC
    LIMIT 1;
END;
$$

-- display most popular users (based on ratings and number of photos) (c)

DROP PROCEDURE IF EXISTS DisplayPopularUsers$$
CREATE PROCEDURE DisplayPopularUsers()
BEGIN
    SELECT bu.Username, bu.FirstName, bu.LastName, bu.AvgRating, COUNT(p.PID) AS NumPhotos,
           SUM(p.AvgRating) AS TotalPhotoRating,
           (COUNT(p.PID) + IFNULL(SUM(p.AvgRating), 0)) AS PopularityScore
    FROM BluespotUser bu
    LEFT JOIN Photo p ON bu.Username = p.Username
    GROUP BY bu.Username
    ORDER BY PopularityScore DESC;
END$$

-- Reset delimiter
DELIMITER ;