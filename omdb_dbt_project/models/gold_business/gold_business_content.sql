{{ config(materialized='table') }}

with source_source_all_content as (

    select *
    FROM {{ref('gold_normalized_content')}}
), content_abstracts as (
    select content_id, array_agg(ROW(abstract, language_iso_639_1)::content_abstract_type) as abstracts
    FROM {{ref('gold_normalized_content_abstract')}}
    group by content_id
), content_content_links as (
    select content_id, array_agg(ROW(source, key, language_iso_639_1)::content_link_type) as content_links
    FROM {{ref('gold_normalized_content_content_link')}}
    group by content_id
), content_person_links as (
    select content_id, array_agg(ROW(source, key, language_iso_639_1)::content_link_type) as person_links
    FROM {{ref('gold_normalized_content_person_link')}}
    group by content_id
), content_references as (
    select content_id, array_agg(ROW(type, referenced_id)::content_reference_type) as refs
    FROM {{ref('gold_normalized_content_reference')}}
    group by content_id
), content_trailers as (
    select content_id, array_agg(ROW(source, key, language_iso_639_1)::content_link_type) as trailers
    FROM {{ref('gold_normalized_content_trailer')}}
    group by content_id
), content_aliases as (
    select content_id, array_agg(ROW(name, language_iso_639_1, official_translation)::content_alias_type) as aliasings
    FROM {{ref('gold_normalized_content_alias')}}
    group by content_id
)

select 
aa.*,
bb.abstracts, ff.content_links, gg.person_links, hh.refs, ii.trailers, jj.aliasings
from source_source_all_content aa
left join content_abstracts bb on aa.content_id=bb.content_id
left join content_content_links ff on aa.content_id=ff.content_id
left join content_person_links gg on aa.content_id=gg.content_id
left join content_references hh on aa.content_id=hh.content_id
left join content_trailers ii on aa.content_id=ii.content_id
left join content_aliases jj on aa.content_id=jj.content_id