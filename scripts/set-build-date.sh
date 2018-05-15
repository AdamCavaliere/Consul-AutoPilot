VAULT_BUILD=$(date '+%Y%m%d%H%M%S')
sudo cat <<EOF | sudo tee /etc/consul.d/version.json
{
"node_meta": {"cluster_version": "$VAULT_BUILD"}
}
EOF
sudo chown -R consul:consul /etc/consul.d /opt/consul
sudo chmod -R 0644 /etc/consul.d/*
