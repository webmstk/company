require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it 'assigns all people to @people' do
      expect(assigns(:people)).to eq create_list(:person, 2)
    end

    it 'renders #index view' do
      expect(response).to render_template :index
    end
  end


  describe 'GET #show' do
    let(:person) { create :person }

    before { get :show, id: person }

    it 'assigns requested person to @person' do
      expect(assigns(:person)).to eq person
    end

    it 'renders #show view' do
      expect(response).to render_template :show
    end
  end


  describe 'GET #new' do
    before { get :new }

    it 'assigns new Person to @person' do
      expect(assigns(:person)).to be_a_new Person
    end

    it 'renders #new view' do
      expect(response).to render_template :new
    end
  end


  describe 'POST #create' do
    let(:person) { build :person }

    context 'with valid parameters' do
      it 'creates new Person' do
        expect { post :create, person: attributes_for(:person) }.to change(Person, :count).by(1)
      end

      it 'redirects to created person' do
        post :create, person: attributes_for(:person)
        expect(response).to redirect_to person_path(assigns(:person))
      end
    end

    context 'with invalid parameters' do
      it 'does not create new Person' do
        expect { post :create, person: attributes_for(:invalid_person) }.to_not change(Person, :count)
      end

      it 're-renders #new view' do
        post :create, person: attributes_for(:invalid_person)
        expect(response).to render_template :new
      end
    end
  end


  describe 'DELETE #destroy' do
    let!(:person) { create :person }

    it 'deletes the person from the database' do
      expect { delete :destroy, id: person }.to change(Person, :count).by(-1)
    end

    it 'redirects to people_path' do
      delete :destroy, id: person
      expect(response).to redirect_to people_path
    end
  end
end
