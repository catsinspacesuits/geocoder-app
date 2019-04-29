require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  context 'GET locations#search' do
    it 'renders the search template' do
      user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
  	  sign_in user	
      get :search
      expect(response).to be_ok
      expect(response).to render_template('locations/search')
    end
  end
end
