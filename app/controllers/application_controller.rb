class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, if: :admin_url

  def after_sign_up_path_for(resource)
    public_customers_path
  end
  
  def after_sign_in_path_for(resource)
    root_path
  end

  def admin_url
    request.fullpath.include?("/admin")
  end
  

end
