require "#{Rails.root}/app/helpers/application_helper.rb"
include ApplicationHelper

class SubmissionsController < ApplicationController
  # TODO add the logic for admin_only questions in the form

  respond_to :html, :json

  def index
    @submissions = Submission.includes(:applicant,
                                       {responses: :question},
                                       :submission_template).
                                        references(:applicant,
                                                   :questions,
                                                   :responses).
                                        order("submissions.id desc,
                                               questions.position,
                                               responses.id")
    @answered_question_names_array = Question.answered_question_names if Question.any?
  end

  def new
    @submission = Submission.new_with_responses(params[""])
    @submission.applicant.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @submission = Submission.new(submission_params)

    respond_to do |format|
      if @submission.save
        format.html { redirect_to submissions_path,
                                  notice: 'Submission successfully created.' }
        format.json { render :new,
                             status: :created,
                             location: @submission }
      else
        format.html { render :new }
        format.json { render json: @submission.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  def edit
    @submission = Submission.find(params[:id]) if params[:id]
    @applicant = @submission.applicant

    @parent_questions = Question.where(id: Question.pluck(:parent_id).uniq)
  end

  def update
    @submission = Submission.find(params[:id]) if params[:id]
    @submission.update(submission_params)
    respond_with @submission
  end

  def show
    set_submission_template_variables
    @applicant = @submission.applicant if @submission
  end

  private def find_submission
    @submission = Submission.
        includes(submission_template: :pet_type).
        find(params[:id]) if params[:id]
  end

  private def set_submission_template_headers
    @submissions = Submission.includes({responses: :question}).
      references(:responses, :questions).
      order("submissions.id desc, questions.position, responses.id")
    @submission_template_headers =
      @submissions.last.submission_template.questions.
                                            order("questions.position").
                                            pluck(:name, :short_name)
  end

  private def set_submission_template_variables
    find_submission
    if @submission
      @submission_template = @submission.submission_template
    else
      @submission_template = SubmissionTemplate.first
    end
    @submission_template_form_name = @submission_template.name
    @submission_template_pet_type_name = @submission_template.pet_type.name
  end

  private def submission_params
    params.require(:submission).(:applicant_id,
                                 :submission_template_id,
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
                                       :_destroy ]
                                 },
    )
  end
end
