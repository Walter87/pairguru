require 'rails_helper'

describe MovieInfoMailer, type: :mailer do
  user = FactoryGirl.build(:user)

  let(:movie) { stub_model Movie, title: 'Lorem Ipsum' }

  let(:mail) { described_class.send_info(user, movie).deliver_now }

  subject { mail }

  its(:subject) { should eq "Info about movie Lorem Ipsum" }

  its(:to) { should eq ["user@example.com"] }
end
