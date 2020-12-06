require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }

  describe 'GET #show' do
    before do
      get :show, params: { id: user }
    end
    it "user詳細の際のインスタンス変数が正しく渡された" do
      expect(assigns(:user)).to eq user
    end
    it "userのshow画面に遷移できた" do
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    before do
      get :edit, params: { id: user }
    end
    it "user編集の際のインスタンス変数が正しく渡された" do
      expect(assigns(:user)).to eq user
    end
    it "userのedit画面に遷移できた" do
      expect(response).to render_template :edit
    end
  end

end