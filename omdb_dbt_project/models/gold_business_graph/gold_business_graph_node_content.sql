{{ config(materialized='table') }}

with source_content as (

    select *
    FROM {{ref('gold_business_content')}}
)
   
select * from source_content