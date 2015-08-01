class Question < ActiveRecord::Base
    has_many :responses
    has_many :question_options
    has_many :adoption_form_types, through: :question_adoption_form_types
    belongs_to :question,:foreign_key => "parent_id"
end
