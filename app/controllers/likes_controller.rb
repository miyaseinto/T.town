class LikesController < ApplicationController

  def index
    @like_tweets = current_user.like_tweets
  end

  def create
    like = Like.new 
    like.user_id = current_user.id 
    like.tweet_id = params[:tweet_id]

    if like.save 
      redirect_to tweets_path, success: 'いいねしました'
    else
      redirect_to tweets_path, danger: 'いいねに失敗しました'
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    @like.destroy
    redirect_to tweets_path, success: 'いいねを取り消しました'
  end
end
