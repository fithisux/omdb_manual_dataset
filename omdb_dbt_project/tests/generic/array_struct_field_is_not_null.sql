{% test array_struct_field_is_not_null(model, column, field) %}

with exploded as (
    select unnest({{column}}) as temp
    from {{model}}
)
select *
from exploded
where (temp).{{field}} is null
{% endtest %}