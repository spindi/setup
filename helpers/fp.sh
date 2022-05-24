# fp - fastly purge
curl -k -X PURGE -H "Fastly-Key:$FASTLY_PURGE_API_KEY" $1
