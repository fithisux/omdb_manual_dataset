{% test array_column_nonempty(model, column_name) %}

select *
from {{model}}
where ({{column_name}} is not null) and (array_length({{column_name}}, 1) is null)
{% endtest %}