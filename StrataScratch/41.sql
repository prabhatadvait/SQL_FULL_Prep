select company_name,(sum(case when year=2020 THEN 1 ELSE 0 END) - sum(case when year=2019 THEN 1 ELSE 0 END)) 
as netdifference from car_launches group by company_name;