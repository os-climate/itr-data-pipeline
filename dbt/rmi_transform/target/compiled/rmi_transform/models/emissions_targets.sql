
with source_data as (
    select parent_name, utility_name, respondent_id, year, target_scope, target_type, state, co2_historical, co2_target, co2_target_all_years, co2_1point5c, generation_historical, generation_projected, generation_1point5c, co2_intensity_historical, co2_intensity_target, co2_intensity_target_all_years, co2_intensity_1point5c
    from osc_datacommons_dev.rmi.emissions_targets_source
)
select * from source_data
