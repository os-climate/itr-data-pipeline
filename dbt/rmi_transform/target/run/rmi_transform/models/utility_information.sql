
  create or replace view
    "osc_datacommons_dev"."rmi"."utility_information"
  security invoker
  as
    
with source_data as (
    select parent_name, parent_lei, parent_ticker, parent_isin, utility_name, respondent_id, entity_id, utility_id_eia, utility_lei, entity_type_eia, utility_type_rmi, first_report_year, last_report_year, duplicate_utility_id_eia
    from osc_datacommons_dev.rmi.utility_information_source
)
select * from source_data
  ;
