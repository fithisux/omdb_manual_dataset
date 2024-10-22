{% test array_struct_3fields_are_not_null(model, column, field1, field2, field3) %}

with exploded as (
    select unnest({{column}}) as temp
)
select *
from exploded
where ((temp).{{field1}} is null) or ((temp).{{field2}} is null) or ((temp).{{field3}} is null)
{% endtest %}