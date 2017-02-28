require 'rails_helper'

describe HomeController, type: :controller do
  describe '#welcome' do
    before { get :welcome }

    it { should render_template :welcome }
  end
end
