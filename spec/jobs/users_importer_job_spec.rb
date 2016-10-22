require 'rails_helper'

RSpec.describe UsersImporterJob, type: :job do
  describe '#perform' do
    it 'call user_importer_service' do
      expect(UserImporterService).to receive(:call)
      described_class.perform_now
    end
  end
end
