every 30.seconds do
  runner 'AirPollutionImporter.import_data_for_all_locations'
end

# , at: '4:30 am'
every 1.minute do
  sidekiq 'GeocodingWorker.perform_async(Location.pluck(:id))'
end
