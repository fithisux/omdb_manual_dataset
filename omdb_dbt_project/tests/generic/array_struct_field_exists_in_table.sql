{% test array_struct_field_exists_in_table(model, column_name, field_name, model2, column_name2) %}

with exploded as (
    select unnest({{column_name}}) as temp
    from {{model}}
), selection as (
    select (temp).{{field}} as left_id
    from exploded
), relational as (
    select {{column2}} as right_id
    from {{model2}}
)
select *
from selection
left join relational
on left_id=right_id
where left_id is not null and right_id is null
{% endtest %}