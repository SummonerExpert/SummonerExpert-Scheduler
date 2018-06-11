# Schedule riot champion/item/spells storage and champion gg aggregate data storage
every 1.day, at: "07:40 am" do
  command "docker exec -it app rake champion_gg:all"
  command "docker exec -it app rake riot:daily"
end

# Schedule riot solo queue match storage
every 1.hour do
  command "docker exec -it app rake riot:hourly"
end

# Schedule champion similarity ML job
every 1.day, at: "6:00 am" do
  command "docker exec -it app rake ml:similarity:pre"
  command "docker exec -it ml python /app/scripts/similarity/similarity.py"
  command "docker exec -it app rake ml:similarity:post"
end
