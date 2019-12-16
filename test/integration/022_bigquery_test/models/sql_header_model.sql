{# This will fail if it is not extracted correctly #}
{% call set_sql_header(config) %}
  	CREATE TEMPORARY FUNCTION a_to_b(str STRING)
	RETURNS STRING AS (
	  CASE
	  WHEN LOWER(str) = 'a' THEN 'b'
	  ELSE str
	  END
	);
{% endcall %}

select a_to_b(dupe) from {{ ref('view_model') }}