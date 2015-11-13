require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it 'assigns all people to @people' do
      expect(assigns(:people)).to eq create_list(:person, 2)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns new Person to @person' do
      expect(assigns(:person)).to be_a_new Person
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end
end
