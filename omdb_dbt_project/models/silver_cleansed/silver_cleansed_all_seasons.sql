{{ config(materialized='table') }}

with source_all_seasons as (

    select

    *
    
    FROM {{ ref('silver_casted_all_seasons') }}

    where (parent_id is null or parent_id not in (select id from {{ ref('silver_casted_all_seasons') }} ))
     

    UNION

    select

    xx1.id, xx1.name, xx2.parent_id, xx1.date
    
    FROM {{ ref('silver_casted_all_seasons') }} xx1

    inner join {{ ref('silver_casted_all_seasons') }} xx2 on xx1.parent_id=xx2.id  

)

select * from source_all_seasons