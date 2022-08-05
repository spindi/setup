#!/home/linuxbrew/.linuxbrew/bin/fish
# fps - fastly purge service
set SERVICE_ID $argv[1]

curl -X POST -H "Fastly-Key:$FASTLY_PURGE_API_KEY" "https://api.fastly.com/service/$SERVICE_ID/purge_all" 
