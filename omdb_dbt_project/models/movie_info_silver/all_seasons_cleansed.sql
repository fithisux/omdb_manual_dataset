{{ config(materialized='table') }}

with source_all_seasons_cleansed as (

    select

    *
    
    FROM {{ ref('all_seasons_with_types') }}

    where (parent_id is null or parent_id not in (select id from {{ ref('all_seasons_with_types') }} ))
     

    UNION

    select

    xx1.id, xx1.name, xx2.parent_id, xx1.date
    
    FROM {{ ref('all_seasons_with_types') }} xx1

    inner join {{ ref('all_seasons_with_types') }} xx2 on xx1.parent_id=xx2.id  

)

select * from source_all_seasons_cleansed