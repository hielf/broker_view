# encoding: utf-8
class UsersController < ApplicationController
  def new
    @title = "注册"
  end
  
  def show
    @user = User.find(params[:id])
  end
end
