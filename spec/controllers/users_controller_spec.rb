# encoding: utf-8
require 'spec_helper'

describe UsersController do
  render_views
  
  describe "GET 'index'" do
 
    describe "for non-signed-in users" do
      it "should deny access" do
        get :index
        response.should redirect_to(signin_path) 
      end
    end
    
    describe "for signed-in users" do
      
      before(:each) do
        @user = Factory(:user)
        test_sign_in(@user)
        Factory(:user, :email => "seconduser@test.org") 
        Factory(:user, :email => "seconduser@test.com")
        
        20.times do
           Factory(:user, :name => Factory.next(:name),
                   :email => Factory.next(:email))
        end
      end
      
      it "should be success" do
        get :index
        response.should be_success
      end
      
      it "should have the right title" do
        get :index
        response.should have_selector('title', :content => "用户")
      end
      
      it "should have an element for each user" do
        get :index
        User.order("name").paginate(:page => 1).per_page(20).each do |user|
          response.should have_selector('td', :content => user.name)
        end
      end
      
      it "should paginate users" do
        get :index
        response.should have_selector('div.pagination')
        response.should have_selector('li.prev', :content => "<")
        response.should have_selector('a', :href => "/users?page=2",
                                                    :content => "2")
        response.should have_selector('a', :href => "/users?page=2", 
                                                    :content => ">")                    
      end     
      
      it "should have a delete link for admins" do
        @user.toggle!(:admin)
        other_user = User.all.second
        get :index
        response.should have_selector('a', :href => user_path(other_user),
                                           :content => "删除")
      end
      
      it "should not have a delete link for non-admins" do
        other_user = User.all.second
        get :index
        response.should_not have_selector('a', :href => user_path(other_user),
                                               :content => "删除")
      end
    end
  end
  
  describe "GET 'show'" do
    before(:each) do
      @user = Factory(:user)
    end
    
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
    
    it "should have the right title" do
      get :show, :id => @user
      response.should have_selector('title', :content => @user.name)
    end
    
    it "should have the user's name" do
      get :show, :id => @user
      response.should have_selector('h2', :content => @user.name)
    end
    
    # it "should have a profile image" do
    #   get :show, :id => @user
    #   response.should have_selector('h1>img', :class => "proflie_image")
    # end
    
    # it "should have the right URL" do
    #   get :show, :id => @user
    #   response.should have_selector('td>a', :content => user_path(@user),
    #                                         :href    => user_path(@user))
    # end
  end
  
  describe "GET 'new'" do
    
    it "returns http success" do
      get :new
      response.should be_success
    end
    
    it "should have the right title" do
      get :new
      response.should have_selector("title", 
                                    :content => "注册")
    end
  end
  
  describe "POST 'create'" do
    
    describe "failure" do
      
      before(:each) do
        @attr = { :name => "", :email => "", :password => "", 
                   :password_confirmation => ""  }
      end
    
      it "should have the right title" do
         post :create, :user => @attr
         response.should have_selector("title", :content => "注册" )
      end  
       
      it "should render the new page" do
         post :create, :user => @attr
         response.should render_template('new' )
      end
      
      it "should not create user" do
         lambda do
          post :create, :user => @attr
         end.should_not change(User, :count)
      end  
    end
    
    describe "success" do
      
      before(:each) do
        @attr = { :name => "新用户", :email => "t@abc.cn", :password => "123456", 
                   :password_confirmation => "123456"  }
      end      
      
      it "should create user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by 1
      end
      
      it "should redirect to the show page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end
      
      it "should have a welcome message" do
        post :create, :user => @attr
        flash[:success].should =~ /欢迎注册/i
      end
      
      it "should sign user in" do
        post :create, :user => @attr
        controller.should be_signed_in
      end
    end
  end
  
  describe "GET 'edit'" do
       
       before(:each) do
         @user = Factory(:user)
         test_sign_in(@user)
       end
       
       it "should be successful" do
         get :edit, :id => @user
         response.should be_success 
       end
       
       it "should have the right title" do
         get :edit, :id => @user
         response.should have_selector('title', :content => "设置")
       end
       
       # it "should have a link to edit gravatar" do
       #    get :eidt, :id => @user
       #    response.should have_selector('a', :href => 'http://gravatar.com/emails', 
       #                                       :content => "change")
       #  end
  end

  describe "PUT 'update'" do
       
       before(:each) do
         @user = Factory(:user)
         test_sign_in(@user)
       end
       
       describe "failure" do
         
         before(:each) do
           @attr = { :name => "", :email => "", :password => "", 
                      :password_confirmation => ""  }
         end 
         
         it "should render the 'edit' page" do
           put :update, :id => @user, :user => @attr
           response.should render_template('edit')
         end
         
         it "should have the right title" do
           put :update, :id => @user, :user => @attr
           response.should have_selector('title', :content => "设置")
         end
         
       end
       
       describe "success" do
         before(:each) do
           @attr = { :name => "新用户", :email => "new_mail@test.org", 
                     :password => "654321", :password_confirmation => "654321" }
         end
         
         it "should change user's attributes" do
           put :update, :id => @user, :user => @attr
           user = assigns(:user)
           @user.reload #重要
           @user.name.should == user.name
           @user.email.should == user.email
           @user.encrypted_password.should == user.encrypted_password
         end
         
         it "should have a flash message" do
          put :update, :id => @user, :user => @attr
          flash[:success].should =~ /成功/
         end
         
       end
  end
  
  describe "authentication of edit/update actions" do
      
      before(:each) do
        @user = Factory(:user)
        # test_sign_in(@user)
      end
      
      describe "for non-signed-in users" do
        it "should deny access to 'edit'" do
          get :edit, :id => @user
          response.should redirect_to(signin_path)
          flash[:notice].should =~ /登录/i
        end

        it "should deny access to 'update'" do
          put :edit, :id => @user, :user => {}
          response.should redirect_to(signin_path)
        end
      end
      
      describe "for signed-in users" do
       
        before(:each) do
          wrong_user = Factory(:user, :email => "wrong@mail.net")
          test_sign_in(wrong_user)
        end
       
       it "should require matching users for 'edit'" do
         get :edit, :id => @user
         response.should redirect_to(root_path)
       end
       
       it "should require matching users for 'update'" do
          put :update, :id => @user, :user => {}
          response.should redirect_to(root_path)
       end
      end
  end
  
  describe "DELETE 'destroy'" do
    
    before(:each) do
      @user = Factory(:user)
    end
    
    describe "as a non-signed-in user" do
      it "should deny access" do
        delete :destroy, :id => @user
        response.should redirect_to(signin_path)
      end
    end
    
    describe "as a non-admin-user" do
      it "should protect the action" do
        test_sign_in(@user)
        delete :destroy, :id => @user
        response.should redirect_to(root_path)
      end
    end
    
    describe "as an admin user" do
      
      before(:each) do
        @admin = Factory(:user, :email => "admin@test.org", :admin => true)
        test_sign_in(@admin)
      end
      
      it "should destroy the user" do
        lambda do
          delete :destroy, :id => @user
        end.should change(User, :count).by(-1)
      end
      
      it "should redirect to the user's page" do
        delete :destroy, :id => @user
        flash[:success].should =~ /已删除/i
        response.should redirect_to(users_path)
      end
      
      it "should protect the admin" do
        lambda do
          delete :destroy, :id => @admin
        end.should_not change(User, :count)
      end
    end
  end
end
