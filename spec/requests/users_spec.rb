# encoding: utf-8
require 'spec_helper'

describe "Users" do
  
  describe "signup" do
    
    describe "failure" do
      it "should not make a new user" do
        lambda do 
          visit signup_path
          fill_in "姓名",           :with => ""
          fill_in "Email",        :with => ""
          fill_in "密码",           :with => ""
          fill_in "确认",           :with => ""
          click_button
          response.should render_template('users/new') 
          response.should have_selector('div#error_explanation')         
        end.should_not change(User, :count)
      end
    end
    
    describe "success" do
      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in "姓名",           :with => "Test User" 
          fill_in "Email",        :with => "user@mail.com"
          fill_in "密码",           :with => "aaaaaa"
          fill_in "确认",           :with => "aaaaaa"
          click_button
          response.should have_selector('div.flash.success', :content => "欢迎")
          response.should render_template('users/show') 
        end.should change(User, :count).by(1)
      end
    end
    
  end
  
end
