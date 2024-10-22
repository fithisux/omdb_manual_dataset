{% test array_struct_3fields_are_not_null(model, column_name, field_name1, field_name2, field_name3) %}

with exploded as (
    select unnest({{column_name}}) as temp
    from {{model}}
)
select *
from exploded
where ((temp).{{field_name1}} is null) or ((temp).{{field_name2}} is null) or ((temp).{{field_name3}} is null)
{% endtest %}