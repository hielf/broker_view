# encoding: utf-8
class SessionsController < ApplicationController
  def new
    @title = "登录"
  end
 
  def create
    render 'new'
  end
  
  def destroy
    
  end
end
