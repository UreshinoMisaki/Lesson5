require 'bcrypt'
class UsersController < ApplicationController
    def index
        @users = User.all
        logger.debug("*****")
        render
    end
    
    def new
        @user = User.new
    end
    
    def create
    @user = User.new(
        uid: params[:user][:uid], 
        password: params[:user][:password], 
        password_confirmation: params[:user][:password_confirmation])
    if @user.save
        redirect_to users_path
    else
        render 'new'
    end
    end
    
    def destroy
        user = User.find(params[:id])
        user.destroy
        logger.debug("delete")
        flash[:success] = "ユーザーが削除されました"
        redirect_to root_path
    end
end
