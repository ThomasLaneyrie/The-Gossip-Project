class ApplicationController < ActionController::Base
  add_flash_types :success, :error, :info, :danger, :warning
end
