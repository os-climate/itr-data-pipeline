{{ config(materialized='view', view_security='invoker') }}
with source_data as (
    select state, year, year_type, legal_standard, enforcement_standard, target_type, target_value
    from osc_datacommons_dev.rmi.state_targets_source
)
select * from source_data
