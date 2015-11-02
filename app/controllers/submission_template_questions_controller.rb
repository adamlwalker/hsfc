class SubmissionTemplateQuestionsController < ApplicationController

  respond_to :html, :json

  before_action :find_submission_template_question, only: [:index, :update, :destroy]

  def index
    @submission_template_questions = SubmissionTemplateQuestion.
        includes({ :submission_template => :pet_type }, :question).
        order("pet_types.id, submission_templates.id, questions.position, questions.name")

    @submission_templates_array = SubmissionTemplate.all.map{ |st| [st.id, st.name] }
    @questions_array = Question.all.map{ |q| [q.id,  q.name.truncate(75) + " (" + q.position.to_s + ")"] }
  end

  def update
    @submission_template_question.update(submission_template_question_params)
    respond_with @submission_template_question
  end

  def destroy
    @submission_template_question.destroy
    respond_to do |format|
      format.html { redirect_to questions_path, notice: "Your action completed successfully." }
      format.json { head :no_content }
    end
  end


  private
  def find_submission_template_question
    if params && params[:id]
      @submission_template_question = SubmissionTemplateQuestion.find(params[:id])
    else
      @submission_template_question = SubmissionTemplateQuestion.new
    end

  end

  def submission_template_question_params
    params.require(:submission_template_question).permit(:question_id,
                                                         :submission_template_id)
  end
end
