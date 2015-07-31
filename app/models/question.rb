class Question < ActiveRecord::Base
    has_many :responses
    belongs_to :application_type
end
