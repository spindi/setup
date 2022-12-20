#!/home/linuxbrew/.linuxbrew/bin/fish
# f_domain_move - delete domain form one service and add to another, activating new versions
argparse --name=f_domain_move 'd/domain=' 's/source=' 't/target=' -- $argv 
if not set -q _flag_d || not set -q _flag_s || not set -q _flag_t
  echo "USAGE: f_domain_move -d DOMAIN -s SERVICE_ID_SOURCE -t SERVICE_ID_TARGET" 
  exit 1
end

set DOMAIN $_flag_d
set SERVICE_ID_SOURCE $_flag_s
set SERVICE_ID_TARGET $_flag_t

# DELETE
# delete the domain to the service as a new draft version
fastly --token=$FASTLY_API_KEY domain delete -n $DOMAIN --version latest --service-id $SERVICE_ID_SOURCE --autoclone
# activate the new version
fastly --token=$FASTLY_API_KEY service-version activate --version latest --service-id $SERVICE_ID_SOURCE

# ADD
# add the domain to the service as a new draft version
fastly --token=$FASTLY_API_KEY domain create -n $DOMAIN --version latest --service-id $SERVICE_ID_TARGET --autoclone
# activate the new version
fastly --token=$FASTLY_API_KEY service-version activate --version latest --service-id $SERVICE_ID_TARGET
