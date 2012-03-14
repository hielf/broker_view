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
      sign_in @user
      redirect_to @user, :flash => {:success => "欢迎注册"}
    else  
      @title = "注册"
      render 'new'
    end
  end

  def edit
    @user  = User.find(params[:id])
    @title = "用户设置"
    
  end
  
  def update
    @user  = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :flash => { :success => "用户资料更新成功" }
    else  
      @title = "用户设置"
      render 'edit'
    end 
    
  end
end
