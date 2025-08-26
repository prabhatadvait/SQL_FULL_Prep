select lp.title,lp.budget,CEIL(sum(((end_date::date - start_date::date)*salary)/365.0)) as duration_salary from linkedin_projects lp join linkedin_emp_projects lep on lp.id = lep.project_id
 join linkedin_employees le on le.id=lep.emp_id
 group by lp.title,lp.budget
 having sum(((end_date::date - start_date::date)*salary)/365.0)>lp.budget
 order by title;