
  create or replace view
    osc_datacommons_dev.rmi.housing_units_income
  security invoker
  as
    
with source_data as (
    select parent_name, utility_name, respondent_id, year, percent_ami, ownership, housing_units, income
    from osc_datacommons_dev.rmi.housing_units_income_source
)
select * from source_data
  ;
