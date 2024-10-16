-- Bluespot: Chris Gomez, Shahrom Dehoti
-- Data generated by ChatGPT

USE bluespot;

-- More data for BluespotUser table
INSERT INTO BluespotUser (Username, Email, FirstName, LastName, AvgRating) VALUES
    ('user3', 'user3@example.com', 'Emily', 'Johnson', 0),
    ('user4', 'user4@example.com', 'Michael', 'Williams', 0),
    ('user5', 'user5@example.com', 'Sarah', 'Brown', 0),
    ('user6', 'user6@example.com', 'David', 'Miller', 0),
    ('user7', 'user7@example.com', 'Emma', 'Wilson', 0),
    ('user8', 'user8@example.com', 'Matthew', 'Jones', 0),
    ('user9', 'user9@example.com', 'Olivia', 'Davis', 0),
    ('user10', 'user10@example.com', 'Daniel', 'Garcia', 0),
    ('user11', 'user11@example.com', 'Ava', 'Martinez', 0),
    ('user12', 'user12@example.com', 'William', 'Hernandez', 0),
    ('user13', 'user13@example.com', 'Sophia', 'Lopez', 0),
    ('user14', 'user14@example.com', 'James', 'Gonzalez', 0),
    ('user15', 'user15@example.com', 'Isabella', 'Wilson', 0),
    ('user16', 'user16@example.com', 'Alexander', 'Anderson', 0),
    ('user17', 'user17@example.com', 'Mia', 'Taylor', 0),
    ('user18', 'user18@example.com', 'Benjamin', 'Moore', 0),
    ('user19', 'user19@example.com', 'Charlotte', 'Jackson', 0),
    ('user20', 'user20@example.com', 'Ethan', 'Thomas', 0);

-- More data for Photo table
INSERT INTO Photo (Username, Title, PhotoDescription, DateUploaded, PicImage, PicLocation, AvgRating) VALUES
    ('user3', 'Palouse Falls', 'Gorgeous waterfall in southeastern Washington', '2023-05-20 12:00:00', '54455356', 'Palouse Falls State Park', 0),
    ('user4', 'Mount Rainier', 'Iconic peak of the Cascade Range', '2023-05-21 15:30:00', '54455357', 'Mount Rainier National Park', 0),
    ('user5', 'Washington Coast', 'Dramatic cliffs and crashing waves along the coast', '2023-05-22 18:45:00', '54455358', 'Olympic National Park', 0),
    ('user6', 'Snoqualmie Falls', 'Powerful waterfall surrounded by lush greenery', '2023-05-23 09:15:00', '54455359', 'Snoqualmie', 0),
    ('user7', 'Space Needle', 'Iconic landmark of Seattle', '2023-05-24 14:20:00', '54455360', 'Seattle', 0),
    ('user8', 'Hoh Rainforest', 'Lush and mossy rainforest in the Olympic Peninsula', '2023-05-25 10:00:00', '54455361', 'Olympic National Park', 0),
    ('user9', 'Lake Chelan', 'Serene lake surrounded by mountains', '2023-05-26 23:00:00', '54455362', 'Lake Chelan', 0),
    ('user10', 'San Juan Islands', 'Scenic islands perfect for kayaking and whale watching', '2023-05-27 08:45:00', '54455363', 'San Juan Islands', 0),
    ('user11', 'Walla Vineyard', 'Vibrant vineyard in the heart of wine country', '2023-05-28 17:00:00', '54455364', 'Walla Walla', 0),
    ('user12', 'Deception Pass', 'Strait separating Whidbey Island from Fidalgo Island', '2023-05-29 11:30:00', '54455365', 'Deception Pass State Park', 0),
    ('user13', 'Alki Beach', 'Popular beach with views of downtown Seattle', '2023-05-30 13:45:00', '54455366', 'Seattle', 0),
    ('user14', 'Mount St. Helens', 'Volcano in the Cascade Range known for its 1980 eruption', '2023-06-01 10:20:00', '54455367', 'Mount St. Helens National Volcanic Monument', 0),
    ('user15', 'Columbia Gorge', 'Scenic canyon along the Columbia River', '2023-06-02 14:00:00', '54455368', 'Columbia River Gorge', 0),
    ('user16', 'WA Capitol', 'Seat of government in Olympia', '2023-06-03 09:30:00', '54455369', 'Olympia', 0),
    ('user17', 'Leavenworth', 'Bavarian-style village in the Cascade Mountains', '2023-06-04 16:00:00', '54455370', 'Leavenworth', 0),
    ('user18', 'Cherry Blossoms', 'Beautiful cherry blossoms in full bloom', '2023-06-05 12:45:00', '54455371', 'University of Washington', 0),
    ('user19', 'Columbia River', 'Majestic river flowing through the Pacific Northwest', '2023-06-06 08:00:00', '54455372', 'Columbia River', 0),
    ('user20', 'Mount Baker', 'Snow-capped volcano in the North Cascades', '2023-06-07 14:30:00', '54455373', 'Mount Baker-Snoqualmie National Forest', 0);

-- More data for Comments table
INSERT INTO Comments (PID, DayTime, Username, Content) VALUES
    (3, '2023-05-20 12:30:00', 'user1', 'Nature at its best!'),
    (4, '2023-05-21 16:00:00', 'user2', 'Must visit spot!'),
    (5, '2023-05-22 19:00:00', 'user3', 'Washington beauty never disappoints.'),
    (6, '2023-05-23 09:45:00', 'user4', 'Incredible sight!'),
    (7, '2023-05-24 14:45:00', 'user5', 'Love the view from up there!'),
    (8, '2023-05-25 10:30:00', 'user6', 'One with nature.'),
    (9, '2023-05-26 23:30:00', 'user7', 'Bucket list checked!'),
    (10, '2023-05-27 09:00:00', 'user8', 'Breath-taking.'),
    (11, '2023-05-28 17:30:00', 'user9', 'Love Walla Walla wines!'),
    (12, '2023-05-29 12:00:00', 'user10', 'Winter beauty.'),
    (13, '2023-05-30 14:15:00', 'user11', 'Springtime favorite!'),
    (14, '2023-06-01 10:30:00', 'user12', 'Picturesque!'),
    (15, '2023-06-02 14:15:00', 'user13', 'Historical landmark.'),
    (16, '2023-06-03 09:45:00', 'user14', 'Snowy paradise.'),
    (17, '2023-06-04 16:15:00', 'user15', 'Autumn vibes.'),
    (18, '2023-06-05 13:00:00', 'user16', 'Nature at its finest.'),
    (19, '2023-06-06 08:15:00', 'user17', 'Washington state love.'),
    (20, '2023-06-07 15:00:00', 'user18', 'Gorgeous view!');

-- More data for Tags table
INSERT INTO Tags (PID, Tag) VALUES
    (3, '#Waterfalls'),
    (3, '#Nature'),
    (4, '#Mountains'),
    (4, '#Hiking'),
    (5, '#Beach'),
    (5, '#Coast'),
    (6, '#Waterfalls'),
    (6, '#Nature'),
    (7, '#Landmarks'),
    (7, '#Cityscape'),
    (8, '#Rainforest'),
    (8, '#Nature'),
    (9, '#Lakes'),
    (9, '#Nature'),
    (10, '#Islands'),
    (10, '#Adventure'),
    (11, '#Wine'),
    (11, '#Vineyard'),
    (12, '#Winter'),
    (12, '#Snow'),
    (13, '#Spring'),
    (13, '#Flowers'),
    (14, '#Mountains'),
    (14, '#Volcano'),
    (15, '#Scenic'),
    (15, '#Canyon'),
    (16, '#Snow'),
    (16, '#Winter'),
    (17, '#Autumn'),
    (17, '#Fall'),
    (18, '#Nature'),
    (18, '#Scenic'),
    (19, '#Washington'),
    (19, '#Nature'),
    (20, '#Mountain'),
    (20, '#Nature');

-- More data for Ratings table
INSERT INTO Ratings (PID, Rating, DayTime) VALUES
    (3, 4.8, '2023-05-20 13:00:00'),
    (3, 4.5, '2023-05-20 13:30:00'),
    (3, 5, '2023-05-20 14:00:00'),
    (4, 4.3, '2023-05-21 16:30:00'),
    (4, 4.7, '2023-05-21 17:00:00'),
    (5, 4.9, '2023-05-22 19:30:00'),
    (5, 5, '2023-05-22 20:00:00'),
    (6, 4.6, '2023-05-23 10:00:00'),
    (6, 4.8, '2023-05-23 10:30:00'),
    (7, 4.4, '2023-05-24 15:00:00'),
    (7, 4.7, '2023-05-24 15:30:00'),
    (8, 4.2, '2023-05-25 11:00:00'),
    (8, 4.6, '2023-05-25 11:30:00'),
    (9, 4.7, '2023-05-26 23:45:00'),
    (9, 4.9, '2023-05-27 00:00:00'),
    (10, 4.5, '2023-05-27 09:30:00'),
    (10, 4.8, '2023-05-27 10:00:00'),
    (11, 4.7, '2023-05-28 18:00:00'),
    (11, 4.9, '2023-05-28 18:30:00'),
    (12, 4.5, '2023-05-29 12:30:00'),
    (12, 4.8, '2023-05-29 13:00:00'),
    (13, 4.7, '2023-05-30 14:30:00'),
    (13, 4.9, '2023-05-30 15:00:00'),
    (14, 4.4, '2023-06-01 11:00:00'),
    (14, 4.7, '2023-06-01 11:30:00'),
    (15, 4.6, '2023-06-02 14:30:00'),
    (15, 4.8, '2023-06-02 15:00:00'),
    (16, 4.5, '2023-06-03 10:00:00'),
    (16, 4.7, '2023-06-03 10:30:00'),
    (17, 4.6, '2023-06-04 16:30:00'),
    (17, 4.8, '2023-06-04 17:00:00'),
    (18, 4.7, '2023-06-05 13:30:00'),
    (18, 4.9, '2023-06-05 14:00:00'),
    (19, 4.5, '2023-06-06 08:30:00'),
    (19, 4.8, '2023-06-06 09:00:00'),
    (20, 4.7, '2023-06-07 15:30:00'),
    (20, 4.9, '2023-06-07 16:00:00');