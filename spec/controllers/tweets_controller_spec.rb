require 'rails_helper'

describe TweetsController, type: :controller do
  describe 'GET #new' do
    it "tweetのnew画面に遷移できた" do
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'GET #edit' do
    it "編集の際のインスタンス変数が正しく渡された" do
      tweet = create(:tweet)
      get :edit, params: { id: tweet }
      expect(assigns(:tweet)).to eq tweet
    end

    it "tweetのedit画面に遷移できた" do
      tweet = create(:tweet)
      get :edit, params: { id: tweet }
      expect(response).to render_template :edit
    end
  end
  describe 'GET #index' do
    it "indexにtweetの情報を配列で渡せた" do
      tweets = create_list(:tweet, 5) 
      get :index
      expect(assigns(:tweets)).to match(tweets)
    end

    it "tweetのindex画面に遷移できた" do
      get :index
      expect(response).to render_template :index
    end
  end
  describe 'GET #show' do
    it "詳細の際のインスタンス変数が正しく渡された" do
      tweet = create(:tweet)
      get :show, params: { id: tweet }
      expect(assigns(:tweet)).to eq tweet
    end

    it "tweetのshow画面に遷移できた" do
      tweet = create(:tweet)
      get :show, params: { id: tweet }
      expect(response).to render_template :show
    end
  end

  describe 'DELETE #destroy' do
    it "tweet情報は正しく消すことができた" do
      tweet = create(:tweet)
      delete :destroy, params: { id: tweet }
      expect(assigns(:tweet)).to eq tweet
    end
  end

end