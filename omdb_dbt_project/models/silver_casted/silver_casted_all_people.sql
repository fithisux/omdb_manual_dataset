with source_all_people as (

    select

    id::bigint,
    (case when name='\N' then NULL else name end)::varchar as name,
    (case when birthday='\N' then NULL else birthday end)::date as birthday,
    (case when deathday='\N' then NULL else deathday end)::date as deathday,
    (case when gender='\N' then NULL else gender end)::integer as gender
    
    FROM {{ ref('bronze_all_people') }}

)

select * from source_all_people