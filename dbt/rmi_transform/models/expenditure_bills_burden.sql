{{ config(materialized='view', view_security='invoker') }}
with source_data as (
    select parent_name, utility_name, respondent_id, year, percent_ami, ownership, electricity_gas_other, technology, expenditure, bill, burden
    from osc_datacommons_dev.rmi.expenditure_bills_burden_source
)
select * from source_data
