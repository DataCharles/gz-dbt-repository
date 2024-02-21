WITH int_campaigns AS 
(SELECT *
FROM {{ref('stg_raw__adwords')}}
UNION ALL 
SELECT *
FROM {{ref('stg_raw__bing')}}
UNION ALL 
SELECT *
FROM {{ref('stg_raw__criteo')}}
UNION ALL 
SELECT *
FROM {{ref('stg_raw__facebook')}})

SELECT
date_date AS date,
ROUND(SUM(ads_cost),2) AS ads_cost,
ROUND(SUM(impression),2) AS ads_impressions,
ROUND(SUM(click),2) AS ads_click

FROM int_campaigns AS int_campaigns_day

GROUP BY date_date

ORDER BY date_date DESC

LIMIT 3