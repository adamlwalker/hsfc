class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new_with_build_answers( 1 )
    # @submission = Submission.new(form_type_id: 1)
    # @submission.responses.build
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
    params.require(:submission).permit! # (:date, :title, :description)
  end
end
