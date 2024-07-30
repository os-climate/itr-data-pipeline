<!-- markdownlint-disable -->
<!-- prettier-ignore-start -->
> [!IMPORTANT]
> On June 26 2024, Linux Foundation announced the merger of its financial services umbrella, the Fintech Open Source Foundation ([FINOS](https://finos.org)), with OS-Climate, an open source community dedicated to building data technologies, modeling, and analytic tools that will drive global capital flows into climate change mitigation and resilience; OS-Climate projects are in the process of transitioning to the [FINOS governance framework](https://community.finos.org/docs/governance); read more on [finos.org/press/finos-join-forces-os-open-source-climate-sustainability-esg](https://finos.org/press/finos-join-forces-os-open-source-climate-sustainability-esg)
<!-- prettier-ignore-end -->
<!-- markdownlint-enable -->

# ITR Data Pipeline

The OS-Climate project is building a suite of Portfolio Alignment tools, the
first of which is an [Implied Temperature Rise (ITR)](https://github.com/os-climate/ITR)
tool. The need for climate-aligned investment tools has been obvious for some time
and is articulated clearly in this [Manifesto]
(<https://www.bankofengland.co.uk/news/2019/april/open-letter-on-climate-related-financial-risks>)
published by Governor of Bank of England Mark Carney, Governor of Banque de France
François Villeroy de Galhau and Chair of the Network for Greening the Financial Services
Frank Elderson. Subsequently a working group developed methodology for creating a
Temperature Alignment score based on a company's usage of their fair (or not) share
of the remaining global carbon budget. The ITR tool calculates those scores based
on sector benchmarks, corporate production, emissions, emissions targets, and other
factors.

This repository contains code for generating data that can be used to demonstrate
and evaluate the ITR tool using public data. (The tool is designed so that users
can use their own data, including privately developed and proprietary data.)

The notebook [OECM-benchmark-ingest](notebooks/OECM-benchmark-ingest.ipynb) transforms
source data from the [OECM version 2 benchmark]
(<https://www.oneearth.org/updated-one-earth-climate-model/>) into JSON source that
can be ingested by the ITR tool. Presently 14 sectors are supported (with more coming):

- Energy (Oil & Gas)
- Utilities (Power, Gas, Combined)
- Buildings (Commercial and Residential)
- Construction
- Materials (Concrete, Aluminum, Steel)
- Road Transport (Passenger Vehicles and Freight)
- Chemical Industry
- Textiles and Leather

The notebook [osc-ingest-rmi_utility_transition_hub]
(osc-ingest-rmi_utility_transition_hub.ipynb) follows the [Data Mesh pattern]
(<https://github.com/opendatahub-io-contrib/datamesh-platform>) to ingest and transform
RMI utility data published in 2022, 2023, and 2024
(with data dating back to before 2019) into reference corporate data.
See instructions in the `dbt/rmi_transform/README.md`
file for more information on activating the Data Mesh pattern.

The notebook [ITR-data-production](ITR-data-production.ipynb) synthesizes a set of
corporate data from a variety of public sources, including [GLEIF]
(<https://www.gleif.org/en>) legal entity identifiers, [SEC financial disclosures]
(<https://www.sec.gov/edgar/searchedgar/companysearch>), [US Census data]
(<https://www.census.gov/data.html>), [RMI-curated production data]
(<https://utilitytransitionhub.rmi.org/data-download/>), and some hand-curated
sources as well.

Most importantly, this pipeline puts the financial, production, emissions, and
other data into Trino so that the ITR can access it via the [Data Commons]
(<https://github.com/os-climate/os_c_data_commons>).

A logical (and welcomed) next step would be to curate this data within our Trino
database (with proper metedata descriptions for all data, not just RMI Utility
Transition Hub data).

If you have questions, please file [Issues]
(<https://github.com/os-climate/itr-data-pipeline/issues>). If you have answers,
please contribute [Pull
Requests](https://github.com/os-climate/itr-data-pipeline/pulls)!
