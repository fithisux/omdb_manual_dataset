{{ config(materialized='table') }}

with source_all_episodes_cleansed as (

    select

    *
    
    FROM {{ ref('all_episodes_with_types') }}

)

select * from source_all_episodes_cleansed