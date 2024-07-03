with source_image_ids_with_types as (

    select

    image_id::bigint,
    (case when object_id='\N' then NULL else object_id end)::bigint as object_id,
    (case when object_type='\N' then NULL else object_type end),
    (case when image_version='\N' then NULL else image_version end)::integer
    
    FROM {{ ref('image_ids') }}
)

select * from source_image_ids_with_types