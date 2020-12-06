require 'rails_helper'

describe MessagesController, type: :controller do

  describe 'GET #index' do
    let(:message) { create(:message) }
    it "indexにmessageの情報を配列で渡せた" do
      create_list(:message, 2) 
      get :index
    end
    it "messageのindex画面に遷移できた" do
      get :index
      expect(response).to render_template :index
    end
  end
end