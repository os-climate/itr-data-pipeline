
with source_data as (
    select parent_name, parent_lei, ticker, isin, utility_name, utility_id_ferc1, utility_id_ferc1_dbf, utility_id_ferc1_xbrl, utility_id_eia, utility_lei, fraction_owned_utility, entity_type_eia, utility_type_rmi, public_private_unmapped, duplicate_utility_id_eia
    from osc_datacommons_dev.rmi.utility_information_2023_source
)
select * from source_data
