class ApplicationController < ActionController::Base
  protect_from_forgery

  unless ENV['username'] == nil
    http_basic_authenticate_with :name => ENV['username'], :password => ENV['password']
  end
end
