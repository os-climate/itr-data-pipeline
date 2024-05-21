
with source_data as (
    select parent_name, utility_name, respondent_id, year, state, state_abbr, capacity_owned_in_state, capacity_operated_in_state, mwh_sales_in_state
    from osc_datacommons_dev.rmi.utility_state_map_source
)
select * from source_data
