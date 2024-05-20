
  create or replace view
    "osc_datacommons_dev"."rmi"."assets_earnings_investments"
  security invoker
  as
    
with source_data as (
    select parent_name, utility_name, respondent_id, year, asset, sub_asset, asset_value, earnings_value, investment_value
    from osc_datacommons_dev.rmi.assets_earnings_investments_source
)
select * from source_data
  ;
