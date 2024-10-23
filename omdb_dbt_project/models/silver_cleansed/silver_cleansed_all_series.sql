{{ config(materialized='table') }}

with source_all_series as (

    select

    *
    
    FROM {{ ref('silver_casted_all_series') }}

    UNION

    select

    id, name, parent_id, date
    
    FROM {{ ref('silver_casted_all_movies') }}

    where id in (select parent_id from {{ ref('silver_casted_all_seasons') }} ) 

)

select * from source_all_series