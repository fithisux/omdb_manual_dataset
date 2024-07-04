{{ config(materialized='table') }}

with source_trailers_cleansed as (

    select

    *
    
    FROM {{ ref('trailers_with_types') }}

)

select * from source_trailers_cleansed