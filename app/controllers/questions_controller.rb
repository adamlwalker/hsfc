class QuestionsController < ApplicationController

  respond_to :html, :json

  before_action :find_question, only: [:index, :update, :destroy]

  def index
    @questions = Question.order(:position, :name)
    @input_types_array = ["checkbox",
                          "date",
                          "datetime",
                          "info_text",
                          "integer",
                          "multiselect",
                          "radio",
                          "select",
                          "string",
                          "text",
                          "textarea"]
  end

  def update
    @question = Question.find(params[:id]) if params[:id]
    @question.update(question_params)
    respond_with @question
  end

  def destroy
      @question.destroy
      respond_to do |format|
        format.html { redirect_to questions_path,
                      notice: "Your action completed successfully." }
        format.json { head :no_content }
      end
  end

  private
  def find_question
    @question = Question.find(params[:id]) if params[:id]
  end


  def question_params
    params.require(:question).permit(:active,
                                     :admin_only_question,
                                     :answer_type,
                                     :hint_text,
                                     :input_type,
                                     :is_required,
                                     :name,
                                     :option_list,
                                     :parent_id,
                                     :position,
                                     :short_name,
    )
  end
end
