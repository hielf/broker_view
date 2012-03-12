# encoding: utf-8
class SessionsController < ApplicationController
  def new
    @title = "登录"
  end
 
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "用户名/密码错误"
      @title = "登录"
      render 'new'
    else
      # handle successful signin
      
    end
  end
  
  def destroy
    
  end
end
