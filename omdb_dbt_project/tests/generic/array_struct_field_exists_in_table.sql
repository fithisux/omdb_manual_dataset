{% test array_struct_field_exists_in_table(model1, column1, field, model2, column2) %}

with exploded as (
    select unnest({{column1}}) as temp
    from {{model1}}
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