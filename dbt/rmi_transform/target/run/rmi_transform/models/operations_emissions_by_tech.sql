
  create or replace view
    osc_datacommons_dev.rmi.operations_emissions_by_tech
  security invoker
  as

with source_data as (
    select year, parent_name, utility_name, utility_id_eia, utility_type_rmi, plant_id_eia, plant_name_eia, generator_id, state, city, county, latitude, longitude, balancing_authority_code_eia, balancing_authority_name_eia, iso_rto_code, nerc_region, operational_status_code, operating_month, operating_year, retirement_month, retirement_year, energy_source, owned_energy_source, technology_eia, technology_rmi, capacity, year_end_capacity, net_generation, potential_generation, capacity_factor, fuel_consumed, emissions_co2, emissions_nox, emissions_sox
    from osc_datacommons_dev.rmi.operations_emissions_by_tech_source
)
select * from source_data
  ;
