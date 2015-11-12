require 'rails_helper'

RSpec.describe PersonsController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it 'assigns all persons to @persons' do
      expect(assigns(:persons)).to eq create_list(:person, 2)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
