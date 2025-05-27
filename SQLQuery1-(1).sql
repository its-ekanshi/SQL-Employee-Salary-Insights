with cte as (
select *,
rank() over (partition by employee_id order by change_date desc) as rn_desc,
rank() over (partition by employee_id order by change_date asc) as rn_asc,
lead(salary, 1) over (partition by employee_id order by change_date desc) as prev_salary,
lead(change_date, 1) over (partition by employee_id order by change_date desc) as prev_change_date
from salary_history
)
, salary_ratio_cte as (
select employee_id,
max(case when rn_desc = 1 then salary end) / max(case when rn_asc = 1 then salary end) as salary_growth_ratio,
min(change_date) as join_date
from cte
group by employee_id
)
select cte.employee_id, 
max(case when rn_desc = 1 then salary end) as latest_salary,
sum(case when promotion = 'Yes' then 1 else 0 end) as no_of_promotions,
max(cast((salary-prev_salary)*100.0/prev_salary AS decimal(4,2))) as salary_growth,
case when max(case when salary < prev_salary then 1 else 0 end) = 0 then 'Y' else 'N' end as NeverDecreased,
avg(DATEDIFF(MONTH, prev_change_date, change_date)) as avg_months_between_changes,
rank() over (order by sr.salary_growth_ratio desc, sr.join_date asc) as RankByGrowth
from cte
left join salary_ratio_cte sr on cte.employee_id = sr.employee_id
group by cte.employee_id, sr.salary_growth_ratio, sr.join_date
order by cte.employee_id;
/*
select e.employee_id, name, isnull(p.no_of_promotions, 0) as no_of_promotions, msg.salary_growth,
isnull(sd.never_decreased, 'Y') as never_decreased, am.avg_months_between_changes,rbg.RankByGrowth
from employees e
left join latest_salary_cte s on e.employee_id = s.employee_id
left join promotions_cte p on e.employee_id = p.employee_id
left join salary_growth_cte msg on e.employee_id = msg.employee_id
left join salary_decreased_cte sd on e.employee_id = sd.employee_id
left join avg_months_cte am on e.employee_id = am.employee_id
left join salary_growth_rank_cte rbg on e.employee_id = rbg.employee_id */