require "#{Rails.root}/app/helpers/application_helper.rb"
include ApplicationHelper

class PublicController < ActionController::Base
  respond_to :html, :json

  layout "public"

  protect_from_forgery with: :exception

  def new
    if params[:submission_template_id]
      @submission_template_id = params[:submission_template_id]
    end

    #redirect_to root_path if (submission_template_id) == nil

    @submission_templates = SubmissionTemplate.all

    @applicant = Applicant.new_with_submissions(@submission_template_id)
    @submission = @applicant.submissions.last
    @parent_questions = Question.where(id: Question.pluck(:parent_id).uniq)

  end

  def create
    @applicant = Applicant.new(applicant_params)

    respond_to do |format|
      if @applicant.valid?
        @applicant.save
        @submission = @applicant.submissions.last
        @submission.save
        @submission.responses.each do |response|
          response.save
        end

        format.html {redirect_to :submission_thank_you}
      else
        format.html {render :new}
      end
    end
  end

  def submission_thank_you
    if params[:applicant] &&
      params[:applicant][:submissions_attributes] &&
      params[:applicant][:submissions_attributes]["0"][:submission_template_id]

      submission_template_id =
        params[:applicant][:submissions_attributes]["0"][:submission_template_id].to_i
      @submission_template = SubmissionTemplate.find(submission_template_id)
    end

  end

  def applicant_params
    params.require(:applicant).permit(:last_name,
                                      :first_name,
                                      :under_18,
                                      :home_telephone_number,
                                      :mobile_telephone_number,
                                      :work_telephone_number,
                                      :email_address,
                                      :address_1,
                                      :address_2,
                                      :city,
                                      :state,
                                      :zip_code,
                                      { submissions_attributes:
                                         [ :id,
                                           :applicant_id,
                                           :submission_template_id,
                                           :_destroy,
                                           { responses_attributes:
                                              [ :id,
                                                :applicant_id,
                                                { :array_response => [] },
                                                :boolean_response,
                                                :date_response,
                                                :datetime_response,
                                                :integer_response,
                                                :question_id,
                                                :string_response,
                                                :submission_id,
                                                :text_response,
                                                :created_at,
                                                :updated_at,
                                                :_destroy ] },
                                      ] })
  end
end

