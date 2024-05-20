
  create or replace view
    "osc_datacommons_dev"."rmi"."utility_state_map_2023"
  security invoker
  as
    
with source_data as (
    select parent_name, utility_name, utility_id_eia, year, state, state_abbr, capacity_owned_in_state, capacity_operated_in_state, mwh_sales_in_state
    from osc_datacommons_dev.rmi.utility_state_map_2023_source
)
select * from source_data
  ;
