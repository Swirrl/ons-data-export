Dataset: UK trade in goods by industry, country and commodity, imports and exports
Dimension: SIC Industry

Problem: Modal filter had no concepts that were active (not greyed out)


Reason: Dimension was pointing at the code list `http://gss-data.org.uk/def/concept-scheme/sic-industry`, but the actual values in the data were from the concept scheme: `http://business.data.gov.uk/companies/def/sic-2007/scheme`

Workaround: have modified the data (see query) to point at the code list where the actual dataset values are from.

Todo: ONS to check the RDF tranform configuration to make sure the component config and column value templates are as they expect 