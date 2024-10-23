with source_movie_references as (

    select

    movie_id::bigint,
    referenced_id::bigint,
    (case when type='\N' then NULL else type end)::varchar as type

    FROM {{ ref('bronze_movie_references') }}

)

select * from source_movie_references