select distinct h.host_id, g.guest_id
from airbnb_hosts h
join airbnb_guests g
  on h.gender = g.gender
 and h.nationality = g.nationality order by h.host_id;