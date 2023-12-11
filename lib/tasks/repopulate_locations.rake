namespace :geocoding do
  task :repopulate_locations => :environment do
    Location.find_each do |location|
      location.update_geocoding_info
    end
  end
end
