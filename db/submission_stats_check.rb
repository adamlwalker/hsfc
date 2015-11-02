# run from the command line with:  rails runner -e development db/submission_stats_check.rb

puts "---------------------------------"
puts "Responses:                   #{Response.count}"
puts "Submissions:                 #{Submission.count}"
puts "SubmissionTemplateQuestions: #{SubmissionTemplateQuestion.count}"
puts "Questions:                   #{Question.count}"
puts "SubmissionTemplates:         #{SubmissionTemplate.count}"
puts "PetTypes:                    #{PetType.count}"
puts "Applicants:                  #{Applicant.count}"
puts "---------------------------------"