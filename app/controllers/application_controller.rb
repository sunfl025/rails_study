class ApplicationController < ActionController::Base
    #include ApplicationHelper
     protected

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path   # => /admins/sign_in
    else
      super
    end
  end
     
end
