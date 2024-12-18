with source_category_names as (

    select

    category_id::bigint,
    (case when name='\N' then NULL else name end)::varchar as name,
    case when language_iso_639_1='\N' then NULL when language_iso_639_1='xx' then NULL  else language_iso_639_1 end as language_iso_639_1
    
    FROM {{ ref('bronze_category_names') }}

)

select * from source_category_names