require 'rails_helper'

describe SessionsController, type: :controller do
  describe 'GET #new' do
    it 'renders #new' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with correct parameters' do
      let(:user) { create :user }

      before { post :create, login: user.login, password: user.password }

      it 'stores user in session' do
        # expect(set_session[:user_id]).to eq user.id
        should set_session[:user_id].to(user.id)
      end

      it 'redirects to root_path' do
        expect(response).to redirect_to root_path
      end

      it 'sets success flash notice' do
        should set_flash[:notice].to('Вход успешно выполнен')
      end
    end

    context 'with incorrect parameters' do
      before { post :create, login: nil }

      it 're-renders #new' do
        expect(response).to render_template :new
      end

      it 'sets error flash message' do
        should set_flash.now[:alert].to('Неправильный логин/пароль')
      end
    end
  end

  describe 'GET #destroy' do
    let(:user) { create :user }

    before do
      session[:user_id] = user.id
      get :destroy, id: user
    end

    it 'unset session\'s user' do
      should_not set_session[:user_id]
    end

    it 'redirects to root_path' do
      expect(response).to redirect_to root_path
    end

    it 'set flash' do
      should set_flash[:notice].to('Выход выполнен успешно')
    end
  end
end