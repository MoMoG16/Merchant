class AdminController <ApplicationController
  before_action :authenticate_user!
  nefore_action :require_admin_user
end