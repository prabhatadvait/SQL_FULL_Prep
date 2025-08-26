SELECT ABS(
    (SELECT MAX(salary) 
     FROM db_employee e 
     JOIN db_dept d ON e.department_id = d.id 
     WHERE LOWER(d.department) = 'marketing')
    -
    (SELECT MAX(salary) 
     FROM db_employee e 
     JOIN db_dept d ON e.department_id = d.id 
     WHERE LOWER(d.department) = 'engineering')
) AS salary_difference;
