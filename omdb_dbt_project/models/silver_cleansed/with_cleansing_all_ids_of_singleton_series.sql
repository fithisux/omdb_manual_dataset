{{ config(materialized='table') }}

with source_all_series_ids as (


    select id from {{ ref('silver_cleansed_all_series') }}
    where id not in (select parent_id from {{ ref('silver_cleansed_all_seasons') }} where parent_id is not null)

)

select * from source_all_series_ids