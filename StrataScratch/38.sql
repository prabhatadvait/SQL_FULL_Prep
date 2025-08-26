SELECT 
    DENSE_RANK() OVER (ORDER BY sum(n_messages) DESC) AS rk,
    id_guest,
    sum(n_messages) AS total_count
FROM airbnb_contacts
GROUP BY id_guest;