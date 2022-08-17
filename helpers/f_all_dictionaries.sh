#!/home/linuxbrew/.linuxbrew/bin/fish
# services
for service_id in (./f_all_services.sh)
  # versions
  #for service_id_version in (f /service/$service_id/version | jq .[].number | tail -n 1)
  for service_id_version in (f /service/$service_id/version | jq .[].number)
    # dictionaries
    for dictionary in (f /service/$service_id/version/$service_id_version/dictionary)
      echo "{ \"service_id\": \"$service_id\", \"service_id_version\": \"$service_id_version\" }"
      echo $dictionary
    end
  end
end
