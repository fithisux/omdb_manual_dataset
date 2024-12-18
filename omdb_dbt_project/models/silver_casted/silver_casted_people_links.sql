with source_people_links as (

    select

    movie_id::bigint,
    (case when language_iso_639_1='\N' then NULL when language_iso_639_1='xx' then NULL else language_iso_639_1 end)::varchar as language_iso_639_1,
    (case when source='\N' then NULL else source end)::varchar as source,
    (case when key='\N' then NULL else key end)::varchar as key

    FROM {{ ref('bronze_people_links') }}

)

select * from source_people_links