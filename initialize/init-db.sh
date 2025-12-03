set -euo pipefail

SQLCMD="sqlcmd -C TrustServerCertificate=yes"

until $SQLCMD -S 127.0.0.1 -U SA -P "${MSSQL_SA_PASSWORD}" -Q "SELECT 1" >/dev/null 2>&1; do
  sleep 5
done

$SQLCMD -S 127.0.0.1 -U SA -P "${MSSQL_SA_PASSWORD}" -i /bikestores-sql/initialize/create-tables.sql
$SQLCMD -S 127.0.0.1 -U SA -P "${MSSQL_SA_PASSWORD}" -i /bikestores-sql/initialize/insert-data.sql
$SQLCMD -S 127.0.0.1 -U SA -P "${MSSQL_SA_PASSWORD}" -i /bikestores-sql/analyze.sql
