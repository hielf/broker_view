# encoding: utf-8
module SessionsHelper
  
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
  def deny_access
    redirect_to signin_path, :notice => "您无权访问此页,请先登录"
  end
  
  private 
  
    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end
    
    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
end

# 
# cookies[:rember_token] = { :value => user.id,
#                            :expires => 20.years.from.now.utc }
# User.find_by_id(cookies[:rember_token])