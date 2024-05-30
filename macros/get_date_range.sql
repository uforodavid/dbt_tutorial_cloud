
{% macro get_date_range(start_date, end_date) %}
    WHERE first_order BETWEEN '{{start_date}}' AND '{{end_date}}'
    
{% endmacro %}
