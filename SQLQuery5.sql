---Order all colunms by age
Select * from PortfolioProject..[premier-league]
Order by 2

---Select all players who play for Arsenal
Select * from PortfolioProject..[EPL-players]
where [Current Club]= 'Arsenal';

---Select all top goal scores for each club
Select Distinct [Current Club],Full_name, max(goals_overall) 
from PortfolioProject..[EPL-players]
Group by [Current Club], full_name

---Select a play's fullname whose name first name is Mesut 
Select full_name, [Current Club] from PortfolioProject..[premier-league]
where full_name like 'Mesut %'

---Number of players per club
Select count(full_name) as NumberOfPlayers, [Current Club] From PortfolioProject..[premier-league]
Group by [Current Club]

---Goals and assists per player
Select full_name, (goals_overall + assists_overall) as GA From [EPL-players] 
Order by GA DESC

--England National team callup based on most minutes
Select full_name, [Current club], minutes_played_overall From [EPL-players]
Where nationality ='England' and minutes_played_overall>2000;

---Players who got more than 5 yellowcards are suspended
Select full_name, yellow_cards_overall, red_cards_overall,
Case 
When yellow_cards_overall >= 5 Then 'Suspended For Atleast 1 Game'
When red_cards_overall = 1 Then 'Suspended For 3 Games'
Else 'Elgible To Play' 
end As AvailabilityPlay
from [premier-league]

Select * from [EPL-players]
Select * from [premier-league]

Select EP.full_name, EP.position, PL.goals_involved_per_90_overall,
MAX(goals_involved_per_90_overall) over (partition by EP.Full_name) from [premier-league] as PL
join [EPL-players] AS EP
on PL.birthday_GMT= EP.birthday_GMT



