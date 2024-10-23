{{ config(materialized='table') }}

with source_content_abstract as (

    select

    movie_id as content_id, abstract, 'de' as language_iso_639_1
    
    FROM {{ ref('silver_cleansed_movie_abstracts_de') }}

    UNION

    select

    movie_id as content_id, abstract, 'fr' as language_iso_639_1
    
    FROM {{ ref('silver_cleansed_movie_abstracts_fr') }}

    UNION

    select

    movie_id as content_id, abstract, 'en' as language_iso_639_1
    
    FROM {{ ref('silver_cleansed_movie_abstracts_en') }}

    UNION

    select

    movie_id as content_id, abstract, 'es' as language_iso_639_1
    
    FROM {{ ref('silver_cleansed_movie_abstracts_es') }}

)

select * from source_content_abstract