# ITR Data Pipeline

The OS-Climate project is building a suite of Portfolio Alignment tools, the first of which is an [Implied Temperature Rise (ITR)](https://github.com/os-climate/ITR) tool. The need for climate-aligned
investment tools has been obvious for some time and is articulated clearly in this [Manifesto](https://www.bankofengland.co.uk/news/2019/april/open-letter-on-climate-related-financial-risks) published
by Governor of Bank of England Mark Carney, Governor of Banque de France François Villeroy de Galhau and Chair of the Network for Greening the Financial Services Frank Elderson. Subsequently a working
group developed methodology for creating a Temperature Alignment score based on a company's usage of their fair (or not) share of the remaining global carbon budget. The ITR tool calculates those
scores based on sector benchmarks, corporate production, emissions, emissions targets, and other factors.

This repository contains code for generating data that can be used to demonstrate and evaluate the ITR tool using public data. (The tool is designed so that users can use their own data, including
privately developed and proprietary data.)

The notebook [OECM-benchmark-ingest](notebooks/OECM-benchmark-ingest.ipynb) transforms source data from the [OECM version 2 benchmark](https://www.oneearth.org/updated-one-earth-climate-model/) into
JSON source that can be ingested by the ITR tool. Presently 14 sectors are supported (with more coming):

- Energy (Oil & Gas)
- Utilities (Power, Gas, Combined)
- Buildings (Commercial and Residential)
- Construction
- Materials (Concrete, Aluminum, Steel)
- Road Transport (Passenger Vehicles and Freight)
- Chemical Industry
- Textiles and Leather

A logical (and welcomed) next step would be to curate this data within our Trino database (with proper metedata descriptions).

The notebook [ITR-data-production](ITR-data-production.ipynb) synthesizes a set of corporate data from a variety of public sources, including [GLEIF](https://www.gleif.org/en) legal entity
identifiers, [SEC financial disclosures](https://www.sec.gov/edgar/searchedgar/companysearch), [US Census data](https://www.census.gov/data.html), [RMI-curated production
data](https://utilitytransitionhub.rmi.org/data-download/), and some hand-curated sources as well.

Most importantly, this pipeline puts the financial, production, emissions, and other data into Trino so that the ITR can access it via the [Data Commons](https://github.com/os-climate/os_c_data_commons).

If you have questions, please file [Issues](https://github.com/os-climate/itr-data-pipeline/issues). If you have answers, please contribute [Pull
Requests](https://github.com/os-climate/itr-data-pipeline/pulls)!
