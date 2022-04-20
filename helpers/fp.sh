# fp - fastly purge
curl -X PURGE -H "Fastly-Key:$FASTLY_PURGE_API_KEY" $1
