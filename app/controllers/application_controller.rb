class ApplicationController < ActionController::Base
  include ApplicationHelper
  add_flash_types :success, :error, :info, :danger, :warning

end
