class AirPollutionImportWorker
  include Sidekiq::Worker

  def perform
    AirPollutionImporter.import_data_for_all_locations
  end
end
