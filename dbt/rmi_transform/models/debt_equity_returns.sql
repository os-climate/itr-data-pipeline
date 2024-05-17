{{ config(materialized='view', view_security='invoker') }}
with source_data as (
    select parent_name, utility_name, respondent_id, year, rate_base_actual, equity_actual, debt_actual, equity_ratio_actual, returns_actual, earnings_actual, interest_actual, fed_tax_expense_actual, pre_tax_net_income_actual, ror_actual, roe_actual, interest_rate_actual, equity_ratio, ror, roe, interest_rate, effective_fed_tax_rate, equity_authorized, debt_authorized, returns_authorized, earnings_authorized, interest_authorized, interest_rate_authorized
    from osc_datacommons_dev.rmi.debt_equity_returns_source
)
select * from source_data
