# MaxMind GeoIP Updater

This action downloads the latest version of a MaxMind GeoIP database

## Inputs

## `account-id`

Your MaxMind account ID. This was formerly known as `UserId`.
This is available from https://www.maxmind.com/en/my_license_key

## `account-id-file`

Your MaxMind account ID. This was formerly known as `UserId`.
This in particular uses the `GEOIPUPDATE_ACCOUNT_ID_FILE` environment variable.
This is available from https://www.maxmind.com/en/my_license_key

## `license-key`

Your case-sensitive MaxMind license key.
This is available from https://www.maxmind.com/en/my_license_key

## `license-key-file`

Your case-sensitive MaxMind license key.
This in particular uses the `GEOIPUPDATE_LICENSE_KEY_FILE` environment variable.
This is available from https://www.maxmind.com/en/my_license_key

## `edition-ids`

List of space-separated database edition IDs.
Edition IDs may consist of letters, digits, and dashes.
For example, `GeoIP2-City` would download the GeoIP2 City database (`GeoIP2-City`).
Multiple edition IDs are separated by spaces.
Note: this was formerly called `ProductIds`.

## `dp-path`

Enter the workspace path to save databases in.

## `host`

The host name of the server to use. The default is `https://updates.maxmind.com`.

## `proxy`

The proxy host name or IP address. You may optionally specify a port
number, e.g., `127.0.0.1:8888`. If no port number is specified, 1080
will be used.

## `proxy-user-password`

The proxy username and password, separated by a colon. For instance,
`username:password`.

## `preserve-file-times`

Whether to preserve modification times of files downloaded from the
server. This option is either `0` or `1`. The default is `0`.

## `lock-file`

The lock file to use. This ensures only one `geoipupdate` process can run
at a time. Note: Once created, this lockfile is not removed from the
filesystem. The default is `.geoipupdate.lock` under the
`dp-path`.

## `retry-for`

The amount of time to retry for when errors during HTTP transactions are
encountered. It can be specified as a (possibly fractional) decimal number
followed by a unit suffix. Valid time units are `ns`, `us` (or `µs`), `ms`,
`s`, `m`, `h`. The default is `5m` (5 minutes).

## `parallelism`

The maximum number of parallel database downloads. The default is
1, which means that databases will be downloaded sequentially.

## Example usage
```yaml
on:
  schedule:
    # Deploy every day at midnight to keep the maxmind db up to date
    - cron: '0 0 * * *'
...
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: MaxMind GeoIP Updater
        uses: yortyrh/geoipupdate-action@v7
        with:
          account-id: ${{ secrets.GEOIPUPDATE_ACCOUNT_ID }}
          license-key: ${{ secrets.GEOIPUPDATE_LICENSE_KEY }}
          edition-ids: 'GeoLite2-City'
          db-path: 'dbs'

      - name: List files
        run: |
          ls -l dbs
```
