select from_user,count(*) as email_sent,ROW_NUMBER() over(order by count(*) desc, 
from_user asc) as rank from google_gmail_emails
group by from_user;