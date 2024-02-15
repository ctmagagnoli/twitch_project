/*
NAME:
    Twitch Gaming Trends
    
PURPOSE:
    Analyzes Twitch data (downloadable from Codecademy's Github at :https://github.com/Codecademy-Curriculum/Codecademy-Learn-SQL-from-Scratch/tree/master/Twitch) to look for trends, which can then be plotted elsewhere.
*/
SELECT DISTINCT game
FROM stream;

SELECT DISTINCT channel
FROM stream; 

SELECT game, COUNT(*)
FROM stream
GROUP BY game
ORDER BY COUNT(*) DESC; --LoL is definitely the most popular

SELECT country, COUNT(*)
FROM stream
WHERE game = 'League of Legends'
GROUP BY country
ORDER BY COUNT(*) DESC; --Overwhelming majority of viewers in the US

SELECT player, COUNT(*)
FROM stream
GROUP BY player
ORDER BY COUNT(*) DESC; --most use the website, very few use xbox360, roku, or chromecast (makes sense given Twitch's audience)

SELECT game,
CASE
  WHEN game = 'League of Legends' or game = 'Dota 2' or game = 'Heroes of the Storm'
    THEN 'MOBA'
  WHEN game = 'Counter-Strike: Global Offensive'
    THEN 'FPS'
  WHEN game = 'DayZ' or game = 'ARK: Survival Evolved'
    THEN 'Survival'
  ELSE 'Other'
  END AS 'genre',
COUNT(*)
FROM stream
GROUP BY game
ORDER BY COUNT(*) DESC; --This chunk gives a genre to each game, then sorts the games by number of entries and displays genre 

SELECT strftime('%H', time),
COUNT(*)
FROM stream
WHERE country = 'US'
GROUP BY 1; --When do American viewers watch?

SELECT * FROM stream
JOIN chat
ON stream.device_id = chat.device_id; --This combines the two tables.

