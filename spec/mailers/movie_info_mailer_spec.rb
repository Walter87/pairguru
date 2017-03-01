require 'rails_helper'

describe MovieInfoMailer, type: :mailer do
  user = FactoryGirl.build(:user)

  let(:movie) { stub_model Movie, title: 'Lorem Ipsum' }

  let(:mail) { described_class.send_info(user, movie).deliver_now }

  before { expect_any_instance_of(MovieInfoMailer).to receive(:sleep) }

  subject { mail }

  its(:subject) { should eq "Info about movie Lorem Ipsum" }

  its(:to) { should eq ["user@example.com"] }
end
