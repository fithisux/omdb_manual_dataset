{{ config(materialized='table') }}

with source_all_votes_cleansed as (

    select

    *
    
    FROM {{ ref('all_votes_with_types') }}

)

select * from source_all_votes_cleansed