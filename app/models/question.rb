class Question < ActiveRecord::Base
    belongs_to :question, :foreign_key => "parent_id"
    has_many   :responses
    has_many   :form_type_questions
    has_many   :form_types, through: :form_types_questions
end
