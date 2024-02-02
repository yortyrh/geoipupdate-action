# MaxMind GeoIP Updater

This action downloads the latest version of a MaxMind GeoIP database

## Inputs

## `account-id`

**Required** Account ID associated with your MaxMind account. This are available from https://www.maxmind.com/en/my_license_key

## `license-key`

**Required** License key associated with your MaxMind account. This are available from https://www.maxmind.com/en/my_license_key

## `edition-ids`

**Required** Enter the edition IDs of the databases you would like to update. Multiple edition IDs are separated by spaces.

## `dp-path`

**Required** Enter the workspace path to save databases in.

## Example usage
```yaml
uses: actions/geoipupdate-action@v2
with:
  account-id: 'some account id'
  license-key: 'some license key'
  edition-ids: 'GeoLite2-Country GeoLite2-City'
  db-path: 'dbs'
```
