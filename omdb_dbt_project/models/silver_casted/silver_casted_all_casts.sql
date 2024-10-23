with source_all_casts as (

    select

    movie_id::bigint,
    person_id::bigint,
    job_id::bigint,
    case when role='\N' then NULL else role end as role,
    "position"::bigint
    
    FROM {{ref('bronze_all_casts')}}
)

select * from source_all_casts