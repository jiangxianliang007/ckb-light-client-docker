# ckb-light-client-docker

## download config
```
wget https://raw.githubusercontent.com/nervosnetwork/ckb-light-client/develop/config/testnet.toml
```

## run 
```
docker run \
 -d -it -p 9000:9000 \
 --name ckb-light-client \
 -v $PWD/testnet.toml:/config/testnet.toml \
 -v $PWD/ckb-light-client-data:/data/ \
 jiangxianliang/ckb-light-client:v0.2.1 run --config-file /config/testnet.toml
```

## get_tip_header
```
curl http://localhost:9000/ -X POST -H "Content-Type: application/json" -d '{"jsonrpc": "2.0", "method": "get_tip_header", "params": [], "id": 1}'
```

https://github.com/nervosnetwork/ckb-light-client