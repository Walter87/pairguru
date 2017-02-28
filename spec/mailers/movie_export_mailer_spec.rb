require 'rails_helper'

describe MovieExportMailer, type: :mailer do
  user = FactoryGirl.build(:user)

  before { expect(File).to receive(:read).with("file_path").and_return :stubbed_file }

  let(:mail) { described_class.send_file(user, 'file_path').deliver_now }

  subject { mail }

  its(:subject) { should eq "Your export is ready" }

  its(:to) { should eq ["user@example.com"] }
end
