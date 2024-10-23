with source_all_movie_aliases_iso as (

    select

    movie_id::bigint,
    (case when name='\N' then NULL else name end)::varchar as name,
    (case when language_iso_639_1='\N' then NULL when language_iso_639_1='xx' then NULL else language_iso_639_1 end)::varchar as language_iso_639_1,
    case when official_translation = 0 then false else true end as official_translation
    
    FROM {{ ref('bronze_all_movie_aliases_iso') }}

)

select * from source_all_movie_aliases_iso