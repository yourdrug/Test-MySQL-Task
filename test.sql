/* запрос для предостаавления кол-ва побед и поражений*/ 

SELECT client_number as client, 
       SUM(outcome = "win") as win, 
       SUM(outcome = "lose") AS lose 
           FROM bid
           INNER JOIN event_value
           ON bid.play_id = event_value.play_id
           GROUP BY client_number;
           
/* запрос для предостаавления кол-ва игр между командами*/      

SELECT least(home_team, away_team) AS A, 
       greatest(home_team, away_team) AS B, 
       COUNT(*)
              FROM event_entity
              GROUP BY A, B
              HAVING COUNT(*) >= 1
              ORDER BY A, B; /* или ORDER BY COUNT(*) DESC; для сортировки по кол-ву игр*/
