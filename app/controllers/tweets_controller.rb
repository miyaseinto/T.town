class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index
  
  def index
    @tweets = Tweet.all
    @tags = Tweet.all_tags.order("taggings_count DESC").pluck(:name)

    @tweets = Tweet.tagged_with(params[:tag_name].to_s) if params[:tag_name]
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    user = @tweet.user_id
    @user = User.find(user)
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      render 'edit'
    end
  end

  def destroy
    if @tweet.destroy
      redirect_to tweets_path
    else
      render 'destroy'
    end
  end

  def search
    @tweets = Tweet.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:name, :tag_list, :image, :text, :address, :latitude, :longitude).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
