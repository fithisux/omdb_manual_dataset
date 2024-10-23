with source_all_characters as (

    select

    (case when name='\N' then NULL else name end)::varchar as name,
    id::bigint
    
    FROM {{ ref('bronze_all_characters') }}

)

select * from source_all_characters