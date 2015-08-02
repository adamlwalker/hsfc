class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new(form_type_id: 1)
    @questions = @submission.form_type.questions
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
