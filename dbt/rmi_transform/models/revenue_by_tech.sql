{{ config(materialized='view', view_security='invoker') }}
with source_data as (
    select parent_name, utility_name, respondent_id, year, technology, component, detail, revenue_total, revenue_residential
    from osc_datacommons_dev.rmi.revenue_by_tech_source
)
select * from source_data
