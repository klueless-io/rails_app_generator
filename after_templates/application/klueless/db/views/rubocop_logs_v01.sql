WITH

files AS (
  SELECT jsonb_array_elements(data->'files') FROM rubocops
),
lines AS (
  SELECT 
    jsonb_array_elements(files)->>'file' as file,
    jsonb_array_elements(files)->'lines' as lines
  FROM files 
),
rubocop_log AS (
  SELECT
    jsonb_array_elements(lines)->>'position' as position,
    jsonb_array_elements(lines)->>'status' as status,
    jsonb_array_elements(lines)->>'status_message' as status_message,
    jsonb_array_elements(lines)->>'cop' as cop,
    jsonb_array_elements(lines)->>'message' as message,
    jsonb_array_elements(lines)->>'full_line' as full_line,
    jsonb_array_elements(lines)->>'file_name' as file_name
  FROM lines
)
select * from rubocop_log
