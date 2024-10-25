{{ config(materialized='table') }}

with source_content_season as (

    select

    id as season_id, parent_id as series_id
    
    FROM {{ ref('silver_cleansed_all_seasons') }}

)

select * from source_content_season