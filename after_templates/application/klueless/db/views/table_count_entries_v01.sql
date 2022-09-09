WITH

denormalized AS (
  SELECT
    jsonb_array_elements(data)->>'table_name' as table_name,
    jsonb_array_elements(data)->>'au' as au,
    jsonb_array_elements(data)->>'eu' as eu,
    jsonb_array_elements(data)->>'us' as us
  FROM table_counts
)
select * from denormalized order by table_name
