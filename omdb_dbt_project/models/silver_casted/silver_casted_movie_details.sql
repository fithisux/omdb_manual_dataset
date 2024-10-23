with source_movie_details as (

    select

    movie_id::bigint,
    runtime::bigint,
    (case when budget='\N' then NULL else budget end)::bigint as budget,
    (case when revenue='\N' then NULL else revenue end)::bigint as revenue,
    (case when homepage='\N' then NULL else homepage end)::varchar as homepage
    
    FROM {{ ref('bronze_movie_details') }}

)

select * from source_movie_details