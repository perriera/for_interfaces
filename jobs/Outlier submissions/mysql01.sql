
-- Create BroadcastSMS table
CREATE TABLE BroadcastSMS (
 BroadcastSendDate DATETIME,
 CompanyID INT,
 IsBroadcastCanceled BIT,
 IsTestBroadcast BIT,
 IsBroadcastSent BIT,
 MessageStatusID INT
);


-- Insert data into BroadcastSMS table
INSERT INTO BroadcastSMS (BroadcastSendDate, CompanyID, IsBroadcastCanceled, IsTestBroadcast, IsBroadcastSent, MessageStatusID)
VALUES
 ('2024-03-07 10:00:00', 1, 0, 0, 1, 5),
 ('2024-03-05 15:30:00', 2, 0, 0, 1, 5),
 ('2024-03-10 09:15:00', 3, 0, 0, 1, 5),
 ('2024-02-28 18:45:00', 1, 0, 0, 1, 5),
 ('2024-03-12 11:20:00', 4, 0, 1, 1, 5),
 ('2024-03-01 14:00:00', 2, 1, 0, 1, 5);


-- Create Company table
CREATE TABLE Company (
 CompanyID INT,
 CompanyName VARCHAR(50)
);


-- Insert data into Company table
INSERT INTO Company (CompanyID, CompanyName)
VALUES
 (1, 'Acne Corporation'),
 (2, 'Aime Inc.'),
 (3, 'Supreme Industries'),
 (4, 'Internal Testing Company'),
 (5, 'Umbrella Corporation');

CompanyID CompanyName         BroadcastSendDate
1         Acne Corporation    2024-03-07 10:00:00
2         Aime Inc. 2024-03-05 15:30:00
3         Supreme Industries  2024-03-10 09:15:00
4         Internal Testing Company      2024-03-12 11:20:00


Status: ok                                          
Time: 0.03                                          
Score: 0                                            




WITH most_recent_broadcasts AS (
SELECT CompanyID, BroadcastSendDate, ROW_NUMBER() OVER (PARTITION BY CompanyID ORDER BY BroadcastSendDate DESC) AS most_recent
FROM BroadcastSMS
)
SELECT c.CompanyID, c.CompanyName, mrb.BroadcastSendDate
FROM Company c
JOIN most_recent_broadcasts mrb ON c.CompanyID = mrb.CompanyID
WHERE mrb.most_recent = 1




-- Define CTE to select relevant information from BroadcastSMS
WITH BroadcastStats AS (
 SELECT
 CompanyID,
 COUNT(*) AS TotalBroadcasts
 FROM
 BroadcastSMS
 WHERE
 IsBroadcastCanceled = 0 AND IsTestBroadcast = 0
 GROUP BY
 CompanyID
)
-- Use the CTE in a main query to join with the Company table
SELECT
 c.CompanyName,
 COALESCE(bs.TotalBroadcasts, 0) AS TotalBroadcasts
FROM
 Company c
 LEFT JOIN BroadcastStats bs ON c.CompanyID = bs.CompanyID
ORDER BY
 TotalBroadcasts DESC;