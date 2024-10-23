with source_all_votes as (

    select

    movie_id::bigint,
    vote_average::float,
    votes_count::bigint

    FROM {{ ref('bronze_all_votes') }}

)

select * from source_all_votes