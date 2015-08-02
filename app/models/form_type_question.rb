class FormTypeQuestion < ActiveRecord::Base
    belongs_to :question
    belongs_to :form_type
end
