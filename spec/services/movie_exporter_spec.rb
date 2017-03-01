require 'rails_helper'

describe MovieExporter, type: :service do
  let(:csv_options) { { write_headers: true, headers: ['title', 'description'], col_sep: ';' } }

  describe '.call' do
    user = FactoryGirl.build(:user)
    movie_one = FactoryGirl.build(:movie)
    movie_two = FactoryGirl.build(:movie)

    let(:csv) { double }

    before do
      expect(CSV).to receive(:open).with('Lorem', 'wb', csv_options).and_yield(csv)

      expect(Movie).to receive(:all).and_return([movie_one, movie_two])

      expect(csv).to receive(:<<).twice
    end

    before { expect(subject).to receive(:sleep) }

    before { expect(MovieExportMailer).to receive_message_chain(:send_file, :deliver_now).with(user, 'Lorem').with(no_args) { :call } }

    it do
      expect(subject.call(user, 'Lorem')).to eq :call
    end
  end

  #private_methods

  its(:csv_options) { should eq csv_options }
end
