select u.userid, u.username, sum(price*amount) as "√—±∏∏≈æ◊", 
        case
            when (sum(price*amount) >= 1500) then '√÷øÏºˆ∞Ì∞¥'
            when (sum(price*amount) >= 1000) then 'øÏºˆ∞Ì∞¥'
            when (sum(price*amount) >= 1) then '¿œπ›∞Ì∞¥'
            else '¿Ø∑…∞Ì∞¥'
        end
from buytbl B
    right outer join usertbl u
        on b.userid = u.userid
group by u.userid, u.username
order by sum(price*amount) desc nulls last;

