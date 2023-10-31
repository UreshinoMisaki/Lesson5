class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all
        logger.debug("*****")
        render
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
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        flash[:notice] = '1レコード削除しました'
        redirect_to root_path
    end
    def show
      @tweet = Tweet.find(params[:id])
    end
    private
    def tweet_params
        params.require(:tweet).permit(:message)
    end
end
