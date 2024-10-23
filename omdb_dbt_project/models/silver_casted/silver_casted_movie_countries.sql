with source_movie_countries as (

    select

    movie_id::bigint,
    (case when country_code='\N' then NULL else country_code end)::varchar as country_code
    
    FROM {{ ref('bronze_movie_countries') }}

)

select * from source_movie_countries