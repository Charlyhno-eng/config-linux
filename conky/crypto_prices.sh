#!/bin/bash
curl -s "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,solana&vs_currencies=usd" | \
jq -r '"Bitcoin (BTC): \(.bitcoin.usd) USD\nEthereum (ETH): \(.ethereum.usd) USD\nSolana (SOL): \(.solana.usd) USD"'
