## ons-data-export

This repo is a temporary place to keep track of the extraction of data between the PMD3 backed alpha for the COGS project, and the PMD4 staging server.

Currently, datasets are published by ONS to the alpha site, a summary of the datasets relating to Trade is available here - https://gss-cogs.github.io/family-trade/datasets/

The list of trade datasets on that page is used to retrieve the dataset URIs in order to run a manual extraction of the data.

The goal is to make this process as automated as possible, however the extraction process currently requires a number of manual adjustments before the data is in a fit state to be published on the `cogs-staging` PMD4 platform.

A number of these issues can be addressed by fixing or adjusting configuraion options, others may require adjustment to the source data: all issues are being tracked in this repo and [flagged with the FAO-ONS label](https://github.com/Swirrl/ons-data-export/issues?q=is%3Aopen+is%3Aissue+label%3Afao-ons).

### Dataset extraction details


| Extraction Date | Details | Live on PMD4|
|--|--|--|
|2020-04-27  | Addition of dataset `ons_cpa` - "UK trade in goods by classification of product by activity time series"  | 2020-04-27 |
|2020-04-23  | Complete refresh off all datasets on cogs-staging with those listed on ONS Trade Dataset Family list. Details: https://github.com/Swirrl/ons-data-export/issues/33  | 2020-04-27 |
2020-04-16 | - | - |
2020-04-08 | - | - |
2020-03-30 | - | - |
2020-03-12 | - | - |