# To delete production data, use $ rails r db/hsfc_submission_data_destroy.rb
# -OR- rake db:submission_data_destroy

connection = ActiveRecord::Base.connection

Response.destroy_all
Submission.destroy_all
SubmissionTemplateQuestion.destroy_all
Question.destroy_all
SubmissionTemplate.destroy_all
PetType.destroy_all
Applicant.destroy_all