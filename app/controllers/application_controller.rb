class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include DepartmentsHelper
  include DeptindicesHelper
  # include BranchesHelper
end
