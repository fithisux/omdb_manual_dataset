with source_movie_content_updates as (

    select

    movie_id::bigint,
    (case when last_update='\N' then NULL else last_update end)::timestamp as last_update
    
    FROM {{ ref('bronze_movie_content_updates') }}

)

select * from source_movie_content_updates