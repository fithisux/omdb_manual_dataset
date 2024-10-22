{% test both_null_or_not_null(model, column1, column2) %}

select *
from {{model}}
where ( {{column1}} is not null and {{column2}} is null) or ({{column2}} is not null and {{column1}} is null)
{% endtest %}