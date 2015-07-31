class Question < ActiveRecord::Base
    has_many :responses
    belongs_to :application_type
    belongs_to :question,:foreign_key => "parent_id"
end
