CREATE TABLE contract_values (
	PlayerID INT AUTO_INCREMENT PRIMARY KEY,
    PlayerName VARCHAR(255),
    PlayerTeam VARCHAR(255),
    PlayerPosition VARCHAR(255),
    ContractLength VARCHAR(255),
    ContractValue VARCHAR(255)
);

SELECT * FROM contract_values cv ;



WITH YearlyContractValues AS (
    SELECT
        PlayerPosition,
        (ContractValue / ContractLength) AS YearlyContractValue
    FROM contract_values
)
SELECT
    PlayerPosition,
    AVG(YearlyContractValue) AS AvgYearlyContractValue
FROM YearlyContractValues
GROUP BY
    PlayerPosition;
    
SELECT
	PlayerPosition,
    (ContractValue / ContractLength) AS YearlyContractValue
FROM contract_values;


WITH YearlyContractValues AS (
    SELECT
        PlayerPosition,
        CAST(REPLACE(REPLACE(ContractValue, '$', ''), ',', '') AS DECIMAL(10, 2)) AS NumericContractValue,
        CAST(ContractLength AS UNSIGNED) AS NumericContractLength
    FROM contract_values
    WHERE ContractValue LIKE '$%' 
)
SELECT
    PlayerPosition,
    AVG(NumericContractValue / NumericContractLength) AS AvgYearlyContractValue
FROM YearlyContractValues
GROUP BY
    PlayerPosition;



SELECT
    ps.PlayerName,
    cv.PlayerPosition,
    ps.BattingAverage,
    cv.ContractValue,
    AVG(ps.BattingAverage) OVER (PARTITION BY cv.PlayerPosition) AS AvgPositionBattingAvg
FROM player_stats ps
JOIN contract_values cv ON ps.PlayerName = cv.PlayerName
ORDER BY cv.PlayerPosition, cv.PlayerName;




   