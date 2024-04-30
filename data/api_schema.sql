CREATE DATABASE sql_project



CREATE TABLE player_stats(
	PlayerID INT AUTO_INCREMENT PRIMARY KEY,
	PlayerName VARCHAR(255),
	SeasonYear VARCHAR(255),
	TotalAtBats VARCHAR(255),
	TotalRBIS VARCHAR(255),
	OnBasePercentage VARCHAR(255),
	OPSPercentage VARCHAR(255),
	BattingAverage VARCHAR(255),
	TotalRuns VARCHAR(255),
	TotalStolenBases VARCHAR(255)
);


SELECT * FROM contract_values cv  ;



ALTER TABLE player_stats  RENAME COLUMN PlayerID TO UniqueSeasonID;

UPDATE player_stats
SET PlayerName = 'Ke''Bryan Hayes'
WHERE PlayerName  = '  Ke''Bryan Hayes';

SELECT * FROM player_stats ps ;

SELECT 
	ps.PlayerName,
	AVG(TotalAtBats),
	AVG(TotalRBIS),
	AVG(OnBasePercentage),
	AVG(OPSPercentage),
	AVG(BattingAverage),
	AVG(TotalRuns),
	AVG(TotalStolenBases),
	PlayerPosition
FROM player_stats ps
JOIN contract_values cv 
	ON ps.PlayerName = cv.PlayerName 
GROUP BY ps.PlayerName;


WITH player_yearly_stats AS (
    SELECT 
        ps.PlayerName,
        AVG(TotalAtBats) AS AvgTotalAtBats,
        AVG(TotalRBIs) AS AvgTotalRBIs,
        AVG(OnBasePercentage) AS AvgOnBasePercentage,
        AVG(OPSPercentage) AS AvgOPSPercentage,
        AVG(BattingAverage) AS AvgBattingAverage,
        AVG(TotalRuns) AS AvgTotalRuns,
        AVG(TotalStolenBases) AS AvgTotalStolenBases,
        PlayerPosition
    FROM player_stats ps
	JOIN contract_values cv 
		ON ps.PlayerName = cv.PlayerName 
	GROUP BY ps.PlayerName
)
SELECT 
    pys.PlayerPosition,
    AVG(pys.AvgTotalAtBats),
    AVG(pys.AvgTotalRBIs),
    AVG(pys.AvgOnBasePercentage),
    AVG(pys.AvgOPSPercentage),
    AVG(pys.AvgBattingAverage),
    AVG(pys.AvgTotalRuns),
    AVG(pys.AvgTotalStolenBases),
FROM player_yearly_stats pys;


WITH player_yearly_stats AS (
    SELECT 
        ps.PlayerName,
        AVG(ps.TotalAtBats) AS AvgTotalAtBats,
        AVG(ps.TotalRBIs) AS AvgTotalRBIs,
        AVG(ps.OnBasePercentage) AS AvgOnBasePercentage,
        AVG(ps.OPSPercentage) AS AvgOPSPercentage,
        AVG(ps.BattingAverage) AS AvgBattingAverage,
        AVG(ps.TotalRuns) AS AvgTotalRuns,
        AVG(ps.TotalStolenBases) AS AvgTotalStolenBases,
        cv.PlayerPosition  
    FROM player_stats ps
    JOIN contract_values cv 
        ON ps.PlayerName = cv.PlayerName 
    GROUP BY ps.PlayerName 
)
SELECT 
    pys.PlayerPosition,
    AVG(pys.AvgTotalAtBats) AS PositionAvgTotalAtBats,
    AVG(pys.AvgTotalRBIs) AS PositionAvgTotalRBIs,
    AVG(pys.AvgOnBasePercentage) AS PositionAvgOnBasePercentage,
    AVG(pys.AvgOPSPercentage) AS PositionAvgOPSPercentage,
    AVG(pys.AvgBattingAverage) AS PositionAvgBattingAverage,
    AVG(pys.AvgTotalRuns) AS PositionAvgTotalRuns,
    AVG(pys.AvgTotalStolenBases) AS PositionAvgTotalStolenBases
FROM player_yearly_stats pys
GROUP BY pys.PlayerPosition;  

SELECT 
    PlayerName,
    SeasonYear,
    BattingAverage,
    RANK() OVER (PARTITION BY SeasonYear ORDER BY BattingAverage DESC) AS BattingRank
FROM player_stats;
