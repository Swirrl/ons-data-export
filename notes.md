
### cmds
```
./scripts/export-data.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/graph/gss_data/trade/ons-fdi ons-fdi
./scripts/export-components.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-fdi ons-fdi
./scripts/export-codelists.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-fdi ons-fdi

./scripts/export-data.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/graph/gss_data/trade/ons-international-trade-in-services ons-international-trade-in-services
./scripts/export-components.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-international-trade-in-services ons-international-trade-in-services
./scripts/export-codelists.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-international-trade-in-services ons-international-trade-in-services

./scripts/export-data.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/graph/gss_data/trade/ons-uk-sa-trade-in-goods ons-uk-sa-trade-in-goods
./scripts/export-components.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-uk-sa-trade-in-goods ons-uk-sa-trade-in-goods
./scripts/export-codelists.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-uk-sa-trade-in-goods ons-uk-sa-trade-in-goods

./scripts/export-data.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/graph/gss_data/trade/ons-uk-total-trade ons-uk-total-trade
./scripts/export-components.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-uk-total-trade ons-uk-total-trade
./scripts/export-codelists.sh http://localhost:9820/gss_alpha http://gss-data.org.uk/data/gss_data/trade/ons-uk-total-trade ons-uk-total-trade

```

```
~/Documents/GitHub/ons-data-export/scripts/import-all.sh gss_export ons-fdi
~/Documents/GitHub/ons-data-export/scripts/import-all.sh gss_export ons-international-trade-in-services
~/Documents/GitHub/ons-data-export/scripts/import-all.sh gss_export hmrc-rts-small-area
~/Documents/GitHub/ons-data-export/scripts/import-all.sh gss_export ons-uk-sa-trade-in-goods
BIGUN ~/Documents/GitHub/ons-data-export/scripts/import-all.sh gss_export ons-uk-total-trade
~/Documents/GitHub/ons-data-export/scripts/import-all.sh gss_export ons-uk-trade-in-goods-by-industry-country-and-commodity
~/Documents/GitHub/ons-data-export/scripts/import-all.sh gss_export ons-uk-trade-in-services
```

## TODO

 - `ons-international-trade-in-services/codelist-international-trade-basis.trig` -> 0 triples updated in 00:00:00.108
 - `ons-uk-sa-trade-in-goods/codelist-flow-directions.trig` -> 0 triples updated in 00:00:00.111
 - `ons-uk-sa-trade-in-goods/codelist-migration-directions.trig` -> 0 triples updated in 00:00:00.106
 - `ons-uk-sa-trade-in-goods/codelist-ons-trade-areas-cord.trig` -> 0 triples updated in 00:00:00.125
 - `ons-uk-sa-trade-in-goods/components.trig` -> 0 triples updated in 00:00:00.106
 - `ons-uk-total-trade/codelist-flow-directions.trig` -> 0 triples updated in 00:00:00.117
 - `ons-uk-total-trade/codelist-migration-directions.trig` -> 0 triples updated in 00:00:00.101
 - `ons-uk-total-trade/codelist-ons-trade-areas-cord.trig` -> 0 triples updated in 00:00:00.129
 - `ons-uk-total-trade/components.trig` -> 0 triples updated in 00:00:00.103
