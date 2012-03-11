# encoding: utf-8
class UsersController < ApplicationController

  def show
    @user  = User.find(params[:id])
    @title = @user.name
  end

  def new
    @user  = User.new
    @title = "注册"
  end
  
  def create
    # raise params[:user].inspect
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, :flash => {:success => "欢迎注册"}
    else  
      @title = "注册"
      render 'new'
    end
  end

end
