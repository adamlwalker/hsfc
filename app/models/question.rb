class Question < ActiveRecord::Base
    has_many :responses
    belongs_to :adoption_form_type
    belongs_to :question,:foreign_key => "parent_id"
end
