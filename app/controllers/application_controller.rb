class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout proc{|c| c.request.xhr? ? false : "application" }
end
