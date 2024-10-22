{{ config(materialized='table') }}

with source_source_all_content_gold as (

    select *
    FROM {{ref('content_gold')}}
), content_abstracts as (
    select content_id, array_agg(ROW(abstract, language_iso_639_1)::content_abstract_type) as abstracts
    FROM {{ref('content_abstract_gold')}}
    group by content_id
), content_countries as (
    select content_id, array_agg(country_code) as countries
    FROM {{ref('content_has_country_gold')}}
    group by content_id
), content_keywords as (
    select content_id, array_agg(category_id) as keywords
    FROM {{ref('content_has_keyword_gold')}}
    group by content_id
), content_categories as (
    select content_id, array_agg(category_id) as categories
    FROM {{ref('content_has_category_gold')}}
    group by content_id
), content_content_links as (
    select content_id, array_agg(ROW(source, key, language_iso_639_1)::content_link_type) as content_links
    FROM {{ref('content_content_link_gold')}}
    group by content_id
), content_person_links as (
    select content_id, array_agg(ROW(source, key, language_iso_639_1)::content_link_type) as person_links
    FROM {{ref('content_person_link_gold')}}
    group by content_id
), content_references as (
    select content_id, array_agg(ROW(type, referenced_id)::content_reference_type) as references
    FROM {{ref('content_reference_gold')}}
    group by content_id
), content_trailers as (
    select content_id, array_agg(ROW(source, key, language_iso_639_1)::content_link_type) as trailers
    FROM {{ref('content_trailer_gold')}}
    group by content_id
), content_aliases as (
    select content_id, array_agg(ROW(name, language_iso_639_1, official_translation)::content_alias_type) as aliases
    FROM {{ref('content_alias_gold')}}
    group by content_id
)

select aa.*, bb.abstracts, cc.countries, dd.keywords, ee.categories, ff.content_links, gg.person_links, hh.references, ii.trailers, jj.aliases
from source_source_all_content_gold aa
left join content_abstracts bb on aa.content_id=bb.content_id
left join content_countries cc on aa.content_id=cc.content_id
left join content_keywords dd on aa.content_id=dd.content_id
left join content_categories ee on aa.content_id=ee.content_id
left join content_content_links ff on aa.content_id=ff.content_id
left join content_person_links gg on aa.content_id=gg.content_id
left join content_references hh on aa.content_id=hh.content_id
left join content_trailers ii on aa.content_id=ii.content_id
left join content_aliases jj on aa.content_id=jj.content_id