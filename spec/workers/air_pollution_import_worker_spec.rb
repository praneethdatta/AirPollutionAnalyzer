require 'rails_helper'

RSpec.describe AirPollutionImportWorker, type: :worker do
  it 'imports air pollution data' do
    allow(AirPollutionImporter).to receive(:import_data_for_all_locations)

    subject.perform

    expect(AirPollutionImporter).to have_received(:import_data_for_all_locations)
  end
end
