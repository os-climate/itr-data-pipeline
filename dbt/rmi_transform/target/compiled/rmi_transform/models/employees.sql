
with source_data as (
    select parent_name, utility_name, respondent_id, year, technology, employees
    from osc_datacommons_dev.rmi.employees_source
)
select * from source_data
