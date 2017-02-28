require 'rails_helper'

describe MovieDecorator, type: :decorator do
  movie = FactoryGirl.build(:movie, id: 1, title: 'Lorem' )

  subject { movie.decorate }

  describe '#as_json' do
    subject { movie.decorate.as_json }

    its([:id]) { should eq(1) }

    its([:title]) { should eq('Lorem') }
  end
end
