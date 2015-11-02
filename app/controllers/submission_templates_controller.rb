class SubmissionTemplatesController < ApplicationController

  respond_to :html, :json

  def index
    @submission_templates = SubmissionTemplate.includes(:pet_type).order("submission_templates.id desc")
  end

  def update
    @submission_template = SubmissionTemplate.find(params[:id]) if params[:id]
    @submission_template.update(submission_template_params)
    respond_with @submission_template
  end


  private
  def submission_template_params
    params.require(:submission_template).permit(:name,
                                                :pet_type_id,
                                                :submission_thank_you_text,
    )
  end
end
