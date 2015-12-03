require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it 'assigns all people to @people' do
      expect(assigns :people).to match_array create_list(:person, 2)
    end

    it 'renders #index view' do
      expect(response).to render_template :index
    end
  end


  describe 'GET #show' do
    let(:person) { create :person }

    before { get :show, id: person }

    it 'assigns requested person to @person' do
      expect(assigns :person).to eq person
    end

    it 'renders #show view' do
      expect(response).to render_template :show
    end
  end


  describe 'GET #new' do
    sign_in_user
    before { get :new }

    it 'assigns new Person to @person' do
      expect(assigns :person).to be_a_new Person
    end

    it 'renders #new view' do
      expect(response).to render_template :new
    end
  end


  describe 'POST #create' do
    let(:person) { build :person }

    sign_in_user

    context 'with valid parameters' do
      it 'creates new Person' do
        expect { post :create, person: attributes_for(:person) }.to change(Person, :count).by(1)
      end

      it 'redirects to created person' do
        post :create, person: attributes_for(:person)
        expect(response).to redirect_to people_path
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


  describe 'GET #edit' do
    let(:person) { create :person }

    sign_in_user
    before { get :edit, id: person }

    it 'assigns @person' do
      expect(assigns :person).to eq person
    end

    it 'renders #edit view' do
      expect(response).to render_template :edit
    end
  end


  describe 'PATCH #update' do
    let(:person) { create :person }

    sign_in_user

    context 'with valid attributes' do
      it 'assigns @person' do
        patch :update, id: person, person: attributes_for(:person)
        expect(assigns :person).to eq person
      end

      it 'updates person\'s attributes' do
        patch :update, id: person, person: { name: 'имя', lastname: 'фамилия' }
        person.reload
        expect(person.name).to eq 'Имя'
        expect(person.lastname).to eq 'Фамилия'
      end

      it 'redirects to the people_path' do
        patch :update, id: person, person: attributes_for(:person)
        expect(response).to redirect_to people_path
      end
    end

    context 'with invalid attributes' do
      before { patch :update, id: person, person: { name: nil, lastname: 'фамилия' } }

      it 'does not change attributes' do
        person.reload
        expect(person.phone).to eq person.phone
        expect(person.lastname).to_not eq 'lastname'
      end

      it 're-renders #edit view' do
        expect(response).to render_template :edit
      end
    end
  end


  describe 'DELETE #destroy' do
    let!(:person) { create :person }

    sign_in_user

    it 'deletes the person from the database' do
      expect { delete :destroy, id: person }.to change(Person, :count).by(-1)
    end

    it 'redirects to people_path' do
      delete :destroy, id: person
      expect(response).to redirect_to people_path
    end
  end
end
