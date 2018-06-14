# Schedule riot champion/item/spells storage and champion gg aggregate data storage
every 1.day, at: "07:40 am" do
  command "docker exec -t app rake champion_gg:all"
  command "docker exec -t app rake riot:daily"
end

# Schedule riot solo queue match storage
every 1.hour do
  command "docker exec -t app rake riot:hourly"
end

# Schedule champion similarity ML job
every 1.day, at: "6:00 am" do
  command "/app/jobs/similarity.sh"
end
