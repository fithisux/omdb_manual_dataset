with source_movie_abstracts_de as (

    select

    movie_id::bigint,
    (case when abstract='\N' then NULL else abstract end)::varchar as abstract
    
    FROM {{ ref('bronze_movie_abstracts_de') }}

)

select * from source_movie_abstracts_de