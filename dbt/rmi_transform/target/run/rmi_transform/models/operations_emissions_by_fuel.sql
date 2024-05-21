
  create or replace view
    osc_datacommons_dev.rmi.operations_emissions_by_fuel
  security invoker
  as

with source_data as (
    select year, parent_name, utility_name, utility_id_eia, utility_type_rmi, plant_id_eia, plant_name_eia, generator_id, state, city, county, latitude, longitude, balancing_authority_code_eia, balancing_authority_name_eia, iso_rto_code, nerc_region, operational_status_code, operating_month, operating_year, retirement_month, retirement_year, energy_source, owned_energy_source, technology_eia, technology_rmi, energy_source_code, fuel_type_category, net_generation, fuel_consumed, emissions_co2, emissions_nox, emissions_sox
    from osc_datacommons_dev.rmi.operations_emissions_by_fuel_source
)
select * from source_data
  ;
