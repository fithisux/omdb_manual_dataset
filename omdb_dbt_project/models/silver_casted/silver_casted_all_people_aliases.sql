with source_all_people_aliases as (

    select

    person_id::bigint,
    (case when name='\N' then NULL else name end)::varchar as name
    
    FROM {{ ref('bronze_all_people_aliases') }}

)

select * from source_all_people_aliases