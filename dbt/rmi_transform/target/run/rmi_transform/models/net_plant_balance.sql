
  create or replace view
    "osc_datacommons_dev"."rmi"."net_plant_balance"
  security invoker
  as
    
with source_data as (
    select parent_name, utility_name, respondent_id, year, ferc_class, original_cost, accum_depr, net_plant_balance, arc, arc_accum_depr, net_arc
    from osc_datacommons_dev.rmi.net_plant_balance_source
)
select * from source_data
  ;
