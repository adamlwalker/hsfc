class SubmissionsController < ApplicationController
  # TODO add the 'rest' of the controller actions
  # TODO add the logic for admin_only questions in the form

  def new
    @submission = Submission.new_with_responses( params[:form_type_id] )
  end

  def create
    @submission = Submission.new(submission_params)
    if @submission.save
      redirect_to root_path
    else
      render :new
    end
  end


  private def submission_params
    # FIXME add 'response attributes'
    params.require(:submission).permit! # (:date, :title, :description)
  end
end
