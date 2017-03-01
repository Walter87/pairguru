require 'rails_helper'

RSpec.describe ExportMoviesJob, type: :job do
  it { is_expected.to be_processed_in :exports }

  describe '#perform' do
    let(:user) { stub_model User }

    before { expect(MovieExporter).to receive_message_chain(:new, :call).with(no_args).with(user, 'tmp/movies.csv')}

    it do
      expect{ subject.perform(user) }.not_to raise_error
    end
  end
end
