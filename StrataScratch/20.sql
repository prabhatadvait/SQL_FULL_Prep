select count(*) * 100.0 / (select count(*) from fb_active_users) as percent_user from
 fb_active_users where country='USA' and status = 'open';