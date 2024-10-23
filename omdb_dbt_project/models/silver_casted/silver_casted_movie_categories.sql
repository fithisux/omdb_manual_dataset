with source_movie_categories as (

    select

    movie_id::bigint,
    category_id::bigint
    
    FROM {{ ref('bronze_movie_categories') }}

)

select * from source_movie_categories