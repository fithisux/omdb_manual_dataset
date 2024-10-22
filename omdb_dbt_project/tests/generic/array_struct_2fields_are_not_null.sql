{% test array_struct_2fields_are_not_null(model, column, field1, field2) %}

with exploded as (
    select unnest({{column}}) as temp
)
select *
from exploded
where ((temp).{{field1}} is null) or ((temp).{{field2}} is null)
{% endtest %}