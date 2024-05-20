
with source_data as (
    select state, state_abbr, securitization_policy, market_indexing_policy, fuel_pass_through, governor_party, legislation_majority_party
    from osc_datacommons_dev.rmi.state_policies_source
)
select * from source_data