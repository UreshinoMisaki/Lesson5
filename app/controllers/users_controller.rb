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
    signup_password = BCrypt::Password.create(params[:pass])
    @user = User.new(uid: params[:uid], pass: signup_password)
        if @user.save
            redirect_to root_path
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
