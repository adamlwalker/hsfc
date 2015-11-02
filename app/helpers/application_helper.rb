module ApplicationHelper

  require "#{Rails.root}/app/helpers/submissions_helper.rb"
  include SubmissionsHelper

  require "#{Rails.root}/app/helpers/us_states_helper.rb"
  include UsStatesHelper

  def params_controller_name
    params[:controller]
  end
end
