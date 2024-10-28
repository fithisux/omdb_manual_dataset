{{ config(materialized='table') }}

with source_has_season as (

    select

    aa.content_id as from, bb.parent_id as to
    
    FROM {{ ref('gold_business_content') }} aa
    inner join {{ ref('gold_business_content') }} bb
    on aa.parent_id=bb.content_id
    where aa.parent_id is not null 
    and aa.content_type='episode'
    and bb.content_type='season'

)

select * from source_has_season