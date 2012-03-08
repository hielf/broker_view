# encoding: utf-8
class UsersController < ApplicationController

  def show
    @user  = User.find(params[:id])
    @title = @user.name
  end

  def new
    @title = "注册"
  end
  

end
