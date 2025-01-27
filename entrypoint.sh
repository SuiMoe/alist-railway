mkdir -p /opt/alist/data/

nohup status-client -dsn="${DSN}" > status.log &

cat >/opt/alist/data/config.json <<EOF
{
  "address": "0.0.0.0",
  "port": 5244,
  "assets": "https://npm.elemecdn.com/alist-ipc@latest/",
  "database": {
    "type": "$DB_TYPE",
    "user": "$MYSQLUSER",
    "password": "$MYSQLPASSWORD",
    "host": "$MYSQLHOST",
    "port": $MYSQLPORT,
    "name": "$MYSQLDATABASE",
    "table_prefix": "alist_",
    "db_file": "/opt/alist/data/data.db"
  },
  "scheme": {
    "https": false,
    "cert_file": "",
    "key_file": ""
  },
  "cache": {
    "expiration": $CACHE_EXPIRATION,
    "cleanup_interval": $CACHE_CLEANUP_INTERVAL
  },
  "temp_dir": "data/temp"
}
EOF

cd /opt/alist
./alist -conf data/config.json
