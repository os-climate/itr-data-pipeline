# RMI Utility Transition Hub Ingestion Pipeline

This pipeline processes [data published by the RMI Utility Transition Data Hub](https://utilitytransitionhub.rmi.org/data-download/) team. It aligns named corporate entities with [Global Legal Entity Idenitifiers](https://www.gleif.org/en), performs some minor data cleaning, and adds metadata.

If you have questions, please file [Issues](https://github.com/os-climate/rmi-utility-transition-hub-ingestion-pipeline/issues). If you have answers, please contribute [Pull Requests](https://github.com/os-climate/rmi-utility-transition-hub-ingestion-pipeline/pulls)!

The principal ingestion code can be found in the [notebooks](notebooks) directory. At present there are two steps in the pipeline:

1. Extract and Load (which loads data into Trino, builds the DBT transformas, and initializes metadata for Open Metadata). We do not use `Pachyderm` at the moment because it has fallen behind in terms of dependency pins that interferes with recent (since May 2022) versions of `dbt` and that holds back other progress we want to make.
2. dbt data transformation (documented here).
   a. Remember to connect dbt with `profiles.yml` (which defaults to ~/.dbt/profiles.yml)
   b. From CLI, `dbt run --profiles-dir=XYZZY` will dig profiles.yml out of XYZZY
   c. With a profiles.yml file in a master directory above the OS-Climate repos, one can run `dbt run --profiles-dir=../.. --project-dir=dbt/rmi_transform` from the `itr-data-pipeline` repo directory.
   c. `dbt test --profiles-dir=XYZZY` currently does nothing

Remember also that Jupyter Notebooks create checkpoint files, which disturbs `dbt` if they appear within the dbt folder hierarchy.
The best work-around is to run the Jupyter notebook environment like so: `jupyter lab --FileContentsManager.checkpoints_kwargs="root_dir"="/tmp"`
A chaotic-neutral work-around is to frequently and liberally execute `find ../.. -name \*checkpoint\* -exec rm -rf {} \;`

## Resources

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

Metadata for the tables we have ingested can be viewed from our [OpenMetadata portal](https://openmetadata-openmetadata.apps.odh-cl2.apps.os-climate.org/explore/tables/?searchFilter=databaseschema%3Drmi) (GitHub User ID and ODH User access tokens required).

If you have questions, please file [Issues](https://github.com/os-climate/itr-data-pipeline/issues). If you have answers, please contribute [Pull Requests](https://github.com/os-climate/itr-data-pipeline/pulls)!
