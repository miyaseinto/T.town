class TweetsController < ApplicationController

  def index
  end

  def new
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.new
  end

  def edit
  end
end
