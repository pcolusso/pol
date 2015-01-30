class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    
    
    @user.level = 0 #all new users start out at level 0
    if @user.save
      #handle success
    else
      render 'new'
    end
  end
end
