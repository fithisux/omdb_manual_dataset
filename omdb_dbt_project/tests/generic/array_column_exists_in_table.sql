{% test array_column_exists_in_table(model1, array_column1, model2, column2) %}

with exploded as (
    select unnest({{array_column1}}) as left_id
    from {{model1}}
), relational as (
    select {{column2}} as right_id
    from {{model2}}
)
select *
from exploded
left join relational
on left_id=right_id
where left_id is not null and right_id is null
{% endtest %}