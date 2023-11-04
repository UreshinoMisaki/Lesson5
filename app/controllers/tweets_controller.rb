class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all
        logger.debug("*****")
    end
    def new
        @tweet = Tweet.new
    end
    def create
        tweet = Tweet.new(message: params[:tweet][:message])
        tweet.save
        redirect_to root_path
    end
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        flash[:notice] = '1レコード削除しました'
        redirect_to root_path
    end
end
