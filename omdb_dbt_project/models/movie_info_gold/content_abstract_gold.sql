{{ config(materialized='table') }}

with source_content_abstract_gold as (

    select

    movie_id as content_id, abstract, 'de' as language_iso_639_1
    
    FROM {{ ref('movie_abstracts_de_cleansed') }}

    UNION

    select

    movie_id as content_id, abstract, 'fr' as language_iso_639_1
    
    FROM {{ ref('movie_abstracts_fr_cleansed') }}

    UNION

    select

    movie_id as content_id, abstract, 'en' as language_iso_639_1
    
    FROM {{ ref('movie_abstracts_en_cleansed') }}

    UNION

    select

    movie_id as content_id, abstract, 'es' as language_iso_639_1
    
    FROM {{ ref('movie_abstracts_es_cleansed') }}

)

select * from source_content_abstract_gold