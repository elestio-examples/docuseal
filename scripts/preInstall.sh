#set env vars
set -o allexport; source .env; set +o allexport;

mkdir -p ./docuseal_data;
chown -R 1001:1001 ./docuseal_data;

mkdir -p ./pg_data;
chown -R 1001:1001 ./pg_data;