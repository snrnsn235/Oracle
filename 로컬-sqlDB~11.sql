select u.userid, u.username, sum(price*amount) as "�ѱ��ž�", 
        case
            when (sum(price*amount) >= 1500) then '�ֿ����'
            when (sum(price*amount) >= 1000) then '�����'
            when (sum(price*amount) >= 1) then '�Ϲݰ�'
            else '���ɰ�'
        end
from buytbl B
    right outer join usertbl u
        on b.userid = u.userid
group by u.userid, u.username
order by sum(price*amount) desc nulls last;

