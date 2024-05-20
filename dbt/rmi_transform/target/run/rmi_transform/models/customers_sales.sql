
  create or replace view
    "osc_datacommons_dev"."rmi"."customers_sales"
  security invoker
  as
    
with source_data as (
    select parent_name, utility_name, respondent_id, year, customer_type, customer_type_rmi, customers, sales, revenues
    from osc_datacommons_dev.rmi.customers_sales_source
)
select * from source_data
  ;
