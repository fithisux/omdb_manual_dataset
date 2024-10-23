with source_all_categories as (

    select

    id::bigint,
    (case when parent_id='\N' then NULL else parent_id end)::bigint as parent_id,
    root_id::bigint
    
    FROM {{ref('bronze_all_categories')}}
)

select * from source_all_categories