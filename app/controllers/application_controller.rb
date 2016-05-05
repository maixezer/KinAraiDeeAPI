class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  include ActionController::Serialization
end
