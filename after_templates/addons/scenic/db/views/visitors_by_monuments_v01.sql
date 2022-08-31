select
  monuments.name as monument,
  countries.name as country,
  count(*) as visits
from visitors
join monuments on visitors.monument_id = monuments.id
join countries on monuments.country_id = countries.id
group by monument, country