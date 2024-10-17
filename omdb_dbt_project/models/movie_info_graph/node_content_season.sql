{{ config(materialized='table') }}

with source_content_season_nodes as (

    select

    *
    
    FROM {{ ref('content_season_gold') }}


)

select * from source_content_season_nodes