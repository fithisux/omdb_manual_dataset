with source_movie_keywords as (

    select

    movie_id::bigint,
    category_id::bigint

    FROM {{ ref('bronze_movie_keywords') }}

)

select * from source_movie_keywords