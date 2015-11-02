# To load production data on empty database, use $ rails r db/hsfc_submission_data_load.rb
# -OR- rake db:submission_data_load -OR- rake db:seed

connection = ActiveRecord::Base.connection

max_applicant_id = Applicant.maximum('id') || 0
Applicant.where(id: max_applicant_id + 1,  first_name:"Valerie", last_name: "Woolard").first_or_create
Applicant.where(id: max_applicant_id + 2,  first_name: "Mae", last_name: "Beale").first_or_create!

max_pet_type_id = PetType.maximum('id') || 0
PetType.where(id: max_pet_type_id + 1, name: 'dog').first_or_create!
PetType.where(id: max_pet_type_id + 2, name: 'cat').first_or_create!
PetType.where(id: max_pet_type_id + 3, name: 'horse').first_or_create!
PetType.where(id: max_pet_type_id + 4, name: 'small mammal').first_or_create!
PetType.where(id: max_pet_type_id + 5, name: 'rabbit').first_or_create!
PetType.where(id: max_pet_type_id + 6, name: 'bird').first_or_create!

# set sequence to continue after creating the above records
sql = "ALTER SEQUENCE pet_types_id_seq RESTART WITH #{PetType.maximum('id') + 1}"
connection.execute(sql)

max_submission_template_id = SubmissionTemplate.maximum('id') || 0
SubmissionTemplate.where(id: max_submission_template_id + 1, pet_type_id: max_pet_type_id + 1, name: "Pet Adoption Form: Dog").first_or_create!
SubmissionTemplate.where(id: max_submission_template_id + 2, pet_type_id: max_pet_type_id + 2, name: "Pet Adoption Form: Cat").first_or_create!
SubmissionTemplate.where(id: max_submission_template_id + 3, pet_type_id: max_pet_type_id + 3, name: "Pet Adoption Form: Horse").first_or_create!
SubmissionTemplate.where(id: max_submission_template_id + 4, pet_type_id: max_pet_type_id + 4, name: "Pet Adoption Form: Small Mammal").first_or_create!
SubmissionTemplate.where(id: max_submission_template_id + 5, pet_type_id: max_pet_type_id + 5, name: "Pet Adoption Form: Rabbit").first_or_create!
SubmissionTemplate.where(id: max_submission_template_id + 6, pet_type_id: max_pet_type_id + 6, name: "Pet Adoption Form: Bird").first_or_create!
SubmissionTemplate.where(id: max_submission_template_id + 7, name: "Auction Volunteer Form").first_or_create!

# set sequence to continue after creating the above records
sql = "ALTER SEQUENCE submission_templates_id_seq RESTART WITH #{SubmissionTemplate.maximum('id') + 1}"
connection.execute(sql)

Question.reset_column_information
max_question_id = Question.maximum('id') || 0
yes_no = "{Yes, No}"

Question.where(id: max_question_id + 1, 
               position:5,
               input_type: "text",
               admin_only_question: TRUE,
               short_name: "Reviewer INITS",
               name: "Reviewer's initials").first_or_create!
Question.where(id: max_question_id + 3, 
               position:20,
               input_type: "text",
               admin_only_question: FALSE,
               short_name: "Pet Name",
               name: "Name of animal you wish you adopt (if you have one in mind)").first_or_create!
Question.where(id: max_question_id + 132, 
               position:21,
               input_type: "info_text",
               admin_only_question: TRUE,
               short_name: "Pet info",
               name: "Information on requested pet (if pets, please list complete for each)").first_or_create!
Question.where(id: max_question_id + 133, 
               position:22,
               input_type: "text",
               admin_only_question: TRUE,
               parent_id: max_question_id + 132,
               short_name: "Names&Ages",
               name: "Name(s) & Age(s)").first_or_create!
Question.where(id: max_question_id + 135).first_or_create!(
               position: 24,
               input_type: "radio",
               admin_only_question: TRUE,
               parent_id: max_question_id + 132,
               option_list: "{Female, Male}",
               short_name: "Sex",
               name: "Sex")
Question.where(id: max_question_id + 136, 
               position:25,
               input_type: "radio",
               admin_only_question: TRUE,
               parent_id: max_question_id + 132,
               option_list: yes_no,
               short_name: "Spayed/Neutered?",
               name: "Spayed or Neutered").first_or_create!
Question.where(id: max_question_id + 137, 
               position:26,
               input_type: "text",
               admin_only_question: TRUE,
               parent_id: max_question_id + 132,
               short_name: "Descrip",
               name: "Description").first_or_create!
Question.where(id: max_question_id + 138, 
               position:27,
               input_type: "text",
               admin_only_question: TRUE,
               parent_id: max_question_id + 132,
               short_name: "Med Hist",
               name: "Medical history").first_or_create!
Question.where(id: max_question_id + 139, 
               position:28,
               input_type: "text",
               admin_only_question: TRUE,
               parent_id: max_question_id + 132,
               short_name: "Med Pending",
               name: "Medical work pending").first_or_create!
Question.where(id: max_question_id + 140, 
               position:29,
               input_type: "textarea",
               admin_only_question: TRUE,
               parent_id: max_question_id + 132,
               short_name: "Other Info",
               name: "Other information").first_or_create!
Question.where(id: max_question_id + 4,
               position: 30,
               input_type: "radio",
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Ok to Visit?",
               name: "Do we have permission to visit your home using the address you provided above?").first_or_create!
Question.where(id: max_question_id + 5,
               position: 40,
               input_type: "textarea",
               admin_only_question: FALSE,
               parent_id: 30,
               short_name: "Directions?",
               name: "If so, are there any helpful directions you'd like to share?").first_or_create!
Question.where(id: max_question_id + 6, 
               position:50,   
               input_type: "radio",
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Prior App?",
               name: "Have you ever applied for or adopted an animal from HSFC?").first_or_create!
Question.where(id: max_question_id + 7, 
               position:60,   
               input_type: "date",
               admin_only_question: FALSE,
               parent_id: max_question_id + 6,
               short_name: "Prior App Date",
               name: "If yes, what was the date you applied?").first_or_create!
Question.where(id: max_question_id + 8, 
               position:70,   
               input_type: "textarea",
               admin_only_question: FALSE,
               parent_id: max_question_id + 6,
               short_name: "Prior App Outcome",
               name: "If yes, what was the outcome of the application?").first_or_create!
Question.where(id: max_question_id + 9, 
               position:80,   
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Know Regs?",
               name: "Are you familiar with the Humane Society's adoption regulations?").first_or_create!
Question.where(id: max_question_id + 10, 
               position:90,   
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Know Return Policy?",
               name: "Are you familiar with the Humane Society's return policy?").first_or_create!
Question.where(id: max_question_id + 11, 
               position:100,  
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Know Check Procedure?",
               name: "Are your familiar with the Humane Society's barn/home check procedure?").first_or_create!
Question.where(id: max_question_id + 12, 
               position:140,  
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Had Pet < 5 yrs?",
               name: "Have you owned or lived with an animal in the past five years? (If you answer yes, you'll be prompted to share details for each of the pets.) ").first_or_create!
Question.where(id: max_question_id + 13, 
               position:150,  
               input_type: "info_text",      
               admin_only_question: FALSE, 
               parent_id: max_question_id + 12,
               short_name: "Pet Info",
               name: "PET").first_or_create!
Question.where(id: max_question_id + 14, 
               position:160,  
               input_type: "text",      
               admin_only_question: FALSE, 
               parent_id: max_question_id + 13,
               name: "Breed").first_or_create!
Question.where(id: max_question_id + 15, 
               position:170,  
               input_type: "text",      
               admin_only_question: FALSE, 
               parent_id: max_question_id + 13,
               name: "Name & Age").first_or_create!
Question.where(id: max_question_id + 17).first_or_create!(
               position: 190,
               input_type: "radio",
               admin_only_question: FALSE,
               option_list: "{Female, Male}",
               parent_id: max_question_id + 13,
               name: "Sex")
Question.where(id: max_question_id + 18, 
               position:200,  
               input_type: "text",      
               admin_only_question: FALSE, 
               parent_id: max_question_id + 13,
               short_name: "Where housed?",
               name: "Where was/is it housed?").first_or_create!
Question.where(id: max_question_id + 19, 
               position:202,  
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Own a Farm?",
               name: "Do you own a farm/facility?").first_or_create!
Question.where(id: max_question_id + 20, 
               position:204,  
               input_type: "textarea",  
               admin_only_question: FALSE,
               short_name: "Address",
               name: "Address of location horse will be stabled.").first_or_create!
Question.where(id: max_question_id + 21, 
               position:206,  
               input_type: "textarea",  
               admin_only_question: FALSE,
               short_name: "Facility Descrip",
               name: "Describe your facility, ie. run-in-shed, 4-stall barn, wire fencing").first_or_create!
Question.where(id: max_question_id + 22, 
               position:220,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 27,
               short_name: "Horse Descrip",
               name: "If so, describe your horse").first_or_create!
Question.where(id: max_question_id + 23, 
               position:230,  
               input_type: "radio",     
               admin_only_question: FALSE, 
               parent_id: max_question_id + 27,
               option_list: "{Spayed, Neutered}",
               short_name: "Spayed/Neutered?",
               name: "If so, is it spayed or Neutered?").first_or_create!
Question.where(id: max_question_id + 24, 
               position:240,  
               input_type: "radio",     
               admin_only_question: FALSE, 
               parent_id: max_question_id + 27,
               option_list: yes_no,
               short_name: "License ok?",
               name: "If so, is it properly licensed?").first_or_create!
Question.where(id: max_question_id + 25, 
               position:250,  
               input_type: "radio",     
               admin_only_question: FALSE, 
               parent_id: max_question_id + 27,
               option_list: yes_no,
               short_name: "Vaccinated this yr?",
               name: "If so, was it vaccinated this year?").first_or_create!
Question.where(id: max_question_id + 26, 
               position:260,  
               input_type: "integer",   
               admin_only_question: FALSE, 
               parent_id: max_question_id + 27,
               short_name: "Years had pet",
               name: "If not, how many years did you own that animal? (Round down to the nearest year.)").first_or_create!
Question.where(id: max_question_id + 27, 
               position:210,  
               input_type: "radio",     
               admin_only_question: FALSE, 
               parent_id: max_question_id + 13,
               option_list: yes_no,
               short_name: "Still own pet?",
               name: "Do you still own the animal?").first_or_create!
Question.where(id: max_question_id + 28, 
               position:270,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 27,
               short_name: "What happened?",
               name: "If not, what happened to the animal?").first_or_create!
Question.where(id: max_question_id + 29, 
               position:280,  
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Have Vet?",
               hint_text: "If so, PLEASE INFORM YOUR VET THAT HSFC WILL CONTACT THEM TO VERIFY YOU PET'S TREATMENT RECORDS.",
               name: "Do you have a veterinarian?").first_or_create!
Question.where(id: max_question_id + 30, 
               position:290,
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 29,
               short_name: "Vet Name",
               name: "If so, Vet's name").first_or_create!
Question.where(id: max_question_id + 31, 
               position:300,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 29,
               short_name: "Vet Phone#",
               name: "If so, Veterinary clinic/hospital phone number").first_or_create!
Question.where(id: max_question_id + 32, 
               position:310,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 29,
               short_name: "Vet Address",
               name: "If so, Veterinary clinic/hospital address").first_or_create!
Question.where(id: max_question_id + 33, 
               position:320,  
               input_type: "radio",     
               admin_only_question: FALSE, 
               parent_id: max_question_id + 29,
               option_list: yes_no,
               short_name: "Ok to Contact Vet?",
               name: "If so, may we have your permission to contact them?").first_or_create!
Question.where(id: max_question_id + 141,
               position:1270, 
               input_type: "info_text",      
               admin_only_question: TRUE,
               short_name: "(Pet Health Check)",
               name: "Health check on applicant’s pet(s)").first_or_create!
Question.where(id: max_question_id + 142, 
               position:1280, 
               input_type: "radio",     
               admin_only_question: TRUE, 
               parent_id: max_question_id + 141,
               option_list: yes_no,
               short_name: "Pet Records Current?",
               name: "Are the medical records current for all their pets?").first_or_create!
Question.where(id: max_question_id + 143, 
               position:1290, 
               input_type: "text",      
               admin_only_question: TRUE, 
               parent_id: max_question_id + 141,
               short_name: "Vet Comments",
               name: "Comments from discussion with Veterinarian").first_or_create!
Question.where(id: max_question_id + 144, 
               position:1300, 
               input_type: "date",      
               admin_only_question: TRUE, 
               parent_id: max_question_id + 141,
               short_name: "Date Check Completed",
               name: "Date health check completed").first_or_create!
Question.where(id: max_question_id + 35, 
               position:340,  
               input_type: "textarea",  
               admin_only_question: FALSE,
               short_name: "Why Adopt?",
               name: "Why do you want to adopt an animal?").first_or_create!
Question.where(id: max_question_id + 36).first_or_create!(
               position: 350,
               input_type: "radio",
               admin_only_question: FALSE,
               option_list: "{House, Apartment, Condo, Townhouse, Duplex}",
               short_name: "Home Type",
               hint_text: "PLEASE INFORM YOUR LANDLORD/HOA/MANAGER THAT HSFC WILL CONTACT THEM TO DISCUSS ANY BREED OR SIZE RESTRICTIONS THEY HAVE FOR PETS.",
               name: "Living arrangement")
Question.where(id: max_question_id + 37,
               position:360,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 36,
               short_name: "Fence Info",
               name: "If you have an enclosed fence, please list type and height.").first_or_create!
Question.where(id: max_question_id + 38).first_or_create!(
               position: 370,
               input_type: "radio",
               admin_only_question: FALSE,
               option_list: "{Own, Rent}",
               parent_id: max_question_id + 350,
               short_name: "Own or Rent?",
               name: "Do you (or your parents/roomates) own or rent your home?")
Question.where(id: max_question_id + 39, 
               position:380,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 36,
               short_name: "Pet Restrictions",
               name: "Please detail any restrictions on pets, such as weight, type or number of pets.").first_or_create!
Question.where(id: max_question_id + 40, 
               position:390,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 36,
               short_name: "Housing Name",
               name: "Name of Development, Apartment or Condo Complex, if applicable").first_or_create!
Question.where(id: max_question_id + 41, 
               position:400,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 36,
               short_name: "Landlord/POC Name",
               name: "Landlord/HOA/Manager’s Name (if applicable)").first_or_create!
Question.where(id: max_question_id + 42, 
               position:410,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 36,
               short_name: "Landlord/POC Phone #",
               name: "Landlord/HOA/Manager’s Phone # (if applicable)").first_or_create!
Question.where(id: max_question_id + 43, 
               position:420,  
               input_type: "radio",     
               admin_only_question: FALSE, 
               parent_id: max_question_id + 36,
               short_name: "Ok to Contact POC?",
               option_list: yes_no,
               name: "May we have your permission to call your Development, Apartment or Condo Complex?  (if applicable)").first_or_create!
Question.where(id: max_question_id + 45,
               position:440,  
               input_type: "integer",   
               admin_only_question: FALSE, 
               parent_id: max_question_id + 36,
               short_name: "# Adults in Home",
               name: "How many adults live in your home? ").first_or_create!
Question.where(id: max_question_id + 46, 
               position:445,  
               input_type: "textarea",  
               admin_only_question: FALSE,
               short_name: "Others in Home",
               name: "List other persons at this address not adopting this animal:").first_or_create!
Question.where(id: max_question_id + 47, 
               position:450,  
               input_type: "integer",   
               admin_only_question: FALSE, 
               parent_id: max_question_id + 36,
               short_name: "# Children in Home",
               name: "How many children live in your home? ").first_or_create!
Question.where(id: max_question_id + 48, 
               position:460,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 36,
               short_name: "Children's Ages",
               name: "If there are any children, what are their ages?").first_or_create!
Question.where(id: max_question_id + 49, 
               position:470,  
               input_type: "radio",     
               admin_only_question: FALSE, 
               parent_id: max_question_id + 36,
               short_name: "Daytime Hours",
               option_list: yes_no,
               name: "Is anyone home during the day?").first_or_create!
Question.where(id: max_question_id + 50, 
               position:480,  
               input_type: "radio",     
               admin_only_question: FALSE, 
               parent_id: max_question_id + 36,
               short_name: "Evening Hours",
               option_list: yes_no,
               name: "Is anyone home during the night?").first_or_create!
Question.where(id: max_question_id + 51, 
               position:490,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 36,
               short_name: "Living Arrangement Info",
               name: "Are there any other details you'd like to share about your living arrangement?").first_or_create!
Question.where(id: max_question_id + 145, 
               position:491,  
               input_type: "info_text",      
               admin_only_question: TRUE,
               short_name: "(Home Check)",
               name: "Home check").first_or_create!
Question.where(id: max_question_id + 146, 
               position:492,  
               input_type: "text",      
               admin_only_question: TRUE, 
               parent_id: max_question_id + 145,
               short_name: "License Info",
               name: "Applicant’s driver's license number and state of licensure").first_or_create!
Question.where(id: max_question_id + 147, 
               position:493,  
               input_type: "text",      
               admin_only_question: TRUE, 
               parent_id: max_question_id + 145,
               short_name: "POC Approval?",
               name: "Landlord/apartment approval (name of person and date spoken with)").first_or_create!
Question.where(id: max_question_id + 148, 
               position:494,  
               input_type: "text",      
               admin_only_question: TRUE, 
               parent_id: max_question_id + 145,
               short_name: "Home Check By",
               name: "Name and initials of who completed the home check").first_or_create!
Question.where(id: max_question_id + 149, 
               position:495,  
               input_type: "date",      
               admin_only_question: TRUE, 
               parent_id: max_question_id + 145,
               short_name: "Home Check Date",
               name: "Date home check was completed").first_or_create!
Question.where(id: max_question_id + 150, 
               position:496,  
               input_type: "text",      
               admin_only_question: TRUE, 
               parent_id: max_question_id + 145,
               short_name: "Home Check By",
               name: "Name and initials of who completed the home check").first_or_create!
Question.where(id: max_question_id + 52, 
               position:500,  
               input_type: "info_text",      
               admin_only_question: FALSE,
               short_name: "References",
               name: "References (please list two) ").first_or_create!
Question.where(id: max_question_id + 53, 
               position:510,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 52,
               name: "Name").first_or_create!
Question.where(id: max_question_id + 54, 
               position:520,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 52,
               name: "Address").first_or_create!
Question.where(id: max_question_id + 55, 
               position:530,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 52,
               name: "Phone Number").first_or_create!
Question.where(id: max_question_id + 56, 
               position:540,  
               input_type: "radio",     
               admin_only_question: FALSE,
               short_name: "Rabbits Outside?",
               option_list: yes_no,
               name: "Do you think rabbits should go outside?").first_or_create!
Question.where(id: max_question_id + 57, 
               position:550,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 56,
               name: "Please explain.").first_or_create!
Question.where(id: max_question_id + 58, 
               position:560,  
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Sm Mammals Outside?",
               name: "Do you think small mammals should go outside?").first_or_create!
Question.where(id: max_question_id + 59, 
               position:570,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 58,
               name: "Please explain.").first_or_create!
Question.where(id: max_question_id + 60, 
               position:580,  
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Birds Outside?",
               name: "Do you think birds should go outside?").first_or_create!
Question.where(id: max_question_id + 61, 
               position:590,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 60,
               name: "Please explain.").first_or_create!
Question.where(id: max_question_id + 62, 
               position:594,  
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Cats Outside?",
               name: "Do you think cats should go outside?").first_or_create!
Question.where(id: max_question_id + 63, 
               position:598,  
               input_type: "textarea",  
               admin_only_question: FALSE,
               name: "Please explain.").first_or_create!
Question.where(id: max_question_id + 64, 
               position:600,  
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Dogs Outside?",
               name: "Do you think dogs should live outside?").first_or_create!
Question.where(id: max_question_id + 65, 
               position:610,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 64,
               name: "Please explain.").first_or_create!
Question.where(id: max_question_id + 66, 
               position:620,  
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Dog Outside for more than Recreation",
               name: "Will this dog be going outside for more than recreation?").first_or_create!
Question.where(id: max_question_id + 67, 
               position:630,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 66,
               short_name: "Why?",
               name: "If so, why?").first_or_create!
Question.where(id: max_question_id + 68, 
               position:640,  
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Animal Outdoors?",
               name: "Will this animal be going outdoors?").first_or_create!
Question.where(id: max_question_id + 69, 
               position:650,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 68,
               short_name: "Why?",
               name: "If so, why?").first_or_create!
Question.where(id: max_question_id + 16,
               position:655,
               input_type: "info_text",
               admin_only_question: FALSE,
               short_name: "Responsibilities",
               name: "Who will have responsibility for the following?").first_or_create!
Question.where(id: max_question_id + 70, 
               position:660,  
               input_type: "text",      
               admin_only_question: FALSE,
               parent_id: max_question_id + 16,
               short_name: "Who will Care & Feed?",
               name: "Care and feeding of the adopted horse?").first_or_create!
Question.where(id: max_question_id + 71, 
               position:670,  
               input_type: "text",      
               admin_only_question: FALSE,
               parent_id: max_question_id + 16,
               short_name: "Who will Feed?",
               name: "Feeding?").first_or_create!
Question.where(id: max_question_id + 72, 
               position:680,  
               input_type: "text",      
               admin_only_question: FALSE,
               parent_id: max_question_id + 16,
               short_name: "Exercise?",
               name: "Exercise?").first_or_create!
Question.where(id: max_question_id + 73, 
               position:690,  
               input_type: "text",      
               admin_only_question: FALSE,
               parent_id: max_question_id + 16,
               short_name: "Grooming?",
               name: "Grooming?").first_or_create!
Question.where(id: max_question_id + 74, 
               position:700,  
               input_type: "text",      
               admin_only_question: FALSE,
               parent_id: max_question_id + 16,
               short_name: "Who will Train?",
               name: "Training?").first_or_create!
Question.where(id: max_question_id + 75, 
               position:710,  
               input_type: "text",      
               admin_only_question: FALSE,
               parent_id: max_question_id + 16,
               short_name: "Who will Pay?",
               name: "Pet-related Expenses?").first_or_create!
Question.where(id: max_question_id + 76, 
               position:705,  
               input_type: "textarea",  
               admin_only_question: FALSE,
               short_name: "Declawing Viewpoint",
               name: "What is Your Viewpoint on Declawing?").first_or_create!
Question.where(id: max_question_id + 77, 
               position:720,  
               input_type: "textarea",  
               admin_only_question: FALSE,
               short_name: "How Referred to HSFC",
               name: "How were you referred to The Humane Society of Fairfax County?").first_or_create!
Question.where(id: max_question_id + 78, 
               position:730,  
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "(FYI re Expenses)",
               name: "This animal may require spay/neuter surgery or other medical expenses following adoption. Are you prepared to take on these expenses?").first_or_create!
Question.where(id: max_question_id + 79, 
               position:740,  
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "You Prepared to Commit?",
               name: "Because it is very stressful for an animal to go from home to home, we hope to place each one in a caring home for the rest of its life. Are you prepared to make this commitment?").first_or_create!
Question.where(id: max_question_id + 80, 
               position:750,  
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "You Prepared to Commit?",
               name: "Because it is very stressful for a dog to go from home to home, we hope to place each one in a caring home for the rest of its life, which could be up to 20 years. Are you prepared to make this commitment?").first_or_create!
Question.where(id: max_question_id + 81, 
               position:760,  
               input_type: "textarea",  
               admin_only_question: FALSE,
               short_name: "What Happens if you Move?",
               name: "What will happen to the animal if you have to move?").first_or_create!
Question.where(id: max_question_id + 82, 
               position:770,  
               input_type: "textarea",  
               admin_only_question: FALSE,
               short_name: "Feelings re Returning the Animal",
               name: "In an effort to ensure the lifelong well-being of these animals, we screen our adopters very carefully and sign a legal contract with them. If at some point you can no longer care for the animal, we require that you return it to HSFC. This way, the animal may be readopted by other qualified applicants, and once again protected by a legal contract. How do you feel about this?").first_or_create!
Question.where(id: max_question_id + 83, 
               position:780,  
               input_type: "textarea",  
               admin_only_question: FALSE,
               short_name: "Adjustments",
               name: "This animal may take several weeks or months to fully adjust to you and your home (and your other animals, if applicable). How would you ease the adjustment?").first_or_create!
Question.where(id: max_question_id + 84, 
               position:790,  
               input_type: "textarea",  
               admin_only_question: FALSE,
               short_name: "Exercise Method",
               name: "How will you exercise this dog?").first_or_create!
Question.where(id: max_question_id + 85, 
               position:800,  
               input_type: "textarea",  
               admin_only_question: FALSE,
               short_name: "Discipline Method",
               name: "How would you correct or discipline this dog?").first_or_create!
Question.where(id: max_question_id + 86, 
               position:810,  
               input_type: "textarea",  
               admin_only_question: FALSE,
               short_name: "Unacceptable Behavior",
               name: "What kind of dog behavior do you find unacceptable?").first_or_create!
Question.where(id: max_question_id + 87, 
               position:820,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 86,
               short_name: "How Handle Behaviors",
               name: "How would you handle these behaviors?").first_or_create!
Question.where(id: max_question_id + 88, 
               position:830,  
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Believe in Spaying/Neutering?",
               name: "Do you believe in spaying or neutering?").first_or_create!
Question.where(id: max_question_id + 89, 
               position:840,  
               input_type: "textarea",  
               admin_only_question: FALSE, 
               parent_id: max_question_id + 88,
               short_name: "Why?",
               name: "If so, why?").first_or_create!
Question.where(id: max_question_id + 90, 
               position:844,  
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Pets Licensed Ok?",
               name: "Are your current pets properly licensed?").first_or_create!
Question.where(id: max_question_id + 91, 
               position:848,  
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Pets Vaccinated?",
               name: "Have they been vaccinated?").first_or_create!
Question.where(id: max_question_id + 92, 
               position:850,  
               input_type: "date",      
               admin_only_question: FALSE,
               short_name: "When take Pet Home?",
               name: "If approved, when would you like to take your pet home?").first_or_create!
Question.where(id: max_question_id + 93, 
               position:860,  
               input_type: "info_text",      
               admin_only_question: FALSE,
               short_name: "(Which Subjects)",
               name: "Which of these subjects would you like to learn more about?").first_or_create!
Question.where(id: max_question_id + 94 ).first_or_create!(
               position: 880, #dog
               input_type: "checkbox",
               admin_only_question: FALSE,
               short_name: "(Which Subjects)",
               name: "Which of these subjects would you like to learn more about?",
               option_list: "{House Training,Heartworm prevention,Obedience,Behavioral problems,Feeding,Introducing new pets to pets at home,Grooming,Fleas,Household dangers,Other}")
Question.where(id: max_question_id + 95 ).first_or_create!(
               position: 870, #cat
               input_type: "checkbox",
               admin_only_question: FALSE,
               short_name: "(Which Subjects)",
               name: "Which of these subjects would you like to learn more about?",
               option_list: "{House Training, Litter,
                              Scratching/Declawing, Feeding, Upper Respiratory Infections, Feline Leukemia, Feline Aids, Urinary Problems,
                              Introducing new pets to pets at home, Household dangers, Other}")
Question.where(id: max_question_id + 96 ).first_or_create!(
               position: 890, #horse
               input_type: "checkbox",
               admin_only_question: FALSE,
               short_name: "(Which Subjects)",
               name: "Which of these subjects would you like to learn more about?",
               option_list: "{Grooming, Other}")
Question.where(id: max_question_id + 97 ).first_or_create!(
               position: 900, #small mammal
               input_type: "checkbox",
               admin_only_question: FALSE,
               short_name: "(Which Subjects)",
               name: "Which of these subjects would you like to learn more about?",
               option_list: "{Litter,
                              Feeding,
                              Introducing new pets to pets at home, Grooming, Household dangers, Other}")
Question.where(id: max_question_id + 98 ).first_or_create!(
               position: 910, #rabbit
               input_type: "checkbox",
               admin_only_question: FALSE,
               short_name: "(Which Subjects)",
               name: "Which of these subjects would you like to learn more about?",
               option_list: "{Litter,
                              Feeding,
                              Introducing new pets to pets at home, Grooming, Household dangers, Other}")
Question.where(id: max_question_id + 99 ).first_or_create!(
               position: 920, #bird
               input_type: "checkbox",
               admin_only_question: FALSE,
               short_name: "(Which Subjects)",
               name: "Which of these subjects would you like to learn more about?",
               option_list: "{Obedience,
                              Feeding,
                              Introducing new pets to pets at home, Grooming, Household dangers, Other}")
Question.where(id: max_question_id + 109, 
               position:870,  
               input_type: "textarea", 
               admin_only_question: FALSE, 
               parent_id: max_question_id + 110,
               short_name: "Other Description",
               name: "If other, please describe").first_or_create!
Question.where(id: max_question_id + 110 ).first_or_create!(
               position: 970, #dog
               input_type: "checkbox",
               admin_only_question: FALSE,
               short_name: "Pet Types Desired",
               name: "Please check the type of pet(s) you'd like",
               option_list: "{Adult animal, Young animal, Companion for another pet, Two new compatible pets, Particular breed,
                              Children’s pet, Short hair, Long hair, Affectionate lap animal}")
Question.where(id: max_question_id + 111 ).first_or_create!(
               position: 980, #cat
               input_type: "checkbox",
               admin_only_question: FALSE,
               short_name: "Pet Types Desired",
               name: "Please check the type of pet(s) you'd like",
               option_list: "{Adult animal, Young animal, Companion for another pet, Two new compatible pets, Particular breed,
                              Children’s pet, Short hair, Long hair, Affectionate lap animal, Affectionate animal,
                              Inside Cat, Outside Cat, Declawed Cat}")
Question.where(id: max_question_id + 112 ).first_or_create!(
               position: 990, #horse
               input_type: "checkbox",
               admin_only_question: FALSE,
               short_name: "Pet Types Desired",
               name: "Please check the type of pet(s) you'd like",
               option_list: "{Adult animal, Young animal, Companion for another pet, Two new compatible pets, Particular breed,
                              Children’s pet, Affectionate animal}")
Question.where(id: max_question_id + 113 ).first_or_create!(
               position: 1000, #small mammal
               input_type: "checkbox",
               admin_only_question: FALSE,
               short_name: "Pet Types Desired",
               name: "Please check the type of pet(s) you'd like",
               option_list: "{Adult animal, Young animal, Companion for another pet, Two new compatible pets, Particular breed,
                              Children’s pet, Short hair, Long hair, Affectionate lap animal, Affectionate animal}")
Question.where(id: max_question_id + 114 ).first_or_create!(
               position: 1010, #rabbit
               input_type: "checkbox",
               admin_only_question: FALSE,
               short_name: "Pet Types Desired",
               name: "Please check the type of pet(s) you'd like",
               option_list: "{Adult animal, Young animal, Companion for another pet, Two new compatible pets, Particular breed,
                              Children’s pet, Short hair, Long hair, Affectionate animal}")
Question.where(id: max_question_id + 115 ).first_or_create!(
               position: 1020, #bird
               input_type: "checkbox",
               admin_only_question: FALSE,
               short_name: "Pet Types Desired",
               name: "Please check the type of pet(s) you'd like",
               option_list: "{Adult animal, Young animal, Companion for another pet, Two new compatible pets, Particular breed,
                              Children’s pet, Affectionate animal}")
Question.where(id: max_question_id + 124, 
               position:1070, 
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Agree",
               name: "I understand HSFC is looking for the best possible home for this companion animal. I further understand HSFC can and will use its sole discretion to determine the best qualified candidate for this animal.").first_or_create!
Question.where(id: max_question_id + 125, 
               position:1080, 
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Vet Info Release",
               name: "I understand you will be contacting my veterinarian for the vaccination and health history of the pets I currently own or have owned in the past. I release, through submission of this application, my veterinarian to provide that information to you. I am aware that prior to placement of a pet from the HSFC, my currently owned pets, for their protection, must be up-to-date on needed vaccinations.").first_or_create!
Question.where(id: max_question_id + 126, 
               position:1090, 
               input_type: "radio",     
               admin_only_question: FALSE,
               option_list: yes_no,
               short_name: "Certify Application",
               name: "I certify that all the information in this application is true, and I understand that false information may void this application.").first_or_create!
Question.where(id: max_question_id + 151, 
               position:1360, 
               input_type: "radio",     
               admin_only_question: TRUE,
               option_list: yes_no,
               short_name: "Approve of Adoption?",
               name: "Do you approve of this adoption?").first_or_create!
Question.where(id: max_question_id + 152, 
               position:1370, 
               input_type: "text",      
               admin_only_question: TRUE, 
               parent_id: max_question_id + 151,
               short_name: "Why",
               name: "Why?").first_or_create!
Question.where(id: max_question_id + 153, 
               position:1380, 
               input_type: "text",      
               admin_only_question: TRUE,
               short_name: "Comments",
               name: "Comments").first_or_create!

# set sequence to continue after creating the above records
sql = "ALTER SEQUENCE questions_id_seq RESTART WITH #{Question.maximum('id') + 1}"
connection.execute(sql)

SubmissionTemplateQuestion.where(question_id: max_question_id + 1,   submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 1,   submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 1,   submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 1,   submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 1,   submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 1,   submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 3,   submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 4,   submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 4,   submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 4,   submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 4,   submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 4,   submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 6,   submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 6,   submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 6,   submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 6,   submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 6,   submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 7,   submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 7,   submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 7,   submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 7,   submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 7,   submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 8,   submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 8,   submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 8,   submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 8,   submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 8,   submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 9,   submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 10,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 11,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 12,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 12,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 12,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 12,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 12,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 12,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 14,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 14,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 14,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 14,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 14,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 15,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 15,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 15,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 15,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 15,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 16,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 16,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 16,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 16,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 16,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 17,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 17,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 17,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 17,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 17,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 18,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 18,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 18,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 18,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 19,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 20,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 21,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 22,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 23,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 23,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 23,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 23,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 23,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 24,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 24,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 24,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 26,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 26,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 26,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 26,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 26,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 27,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 27,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 27,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 27,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 27,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 28,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 28,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 28,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 28,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 28,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 29,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 29,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 29,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 29,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 29,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 30,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 30,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 30,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 30,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 30,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 30,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 31,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 31,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 31,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 31,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 31,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 31,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 32,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 32,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 33,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 33,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 35,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 35,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 35,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 35,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 35,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 36,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 36,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 36,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 36,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 36,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 37,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 38,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 38,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 38,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 38,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 39,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 39,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 39,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 39,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 39,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 40,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 40,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 40,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 40,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 40,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 41,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 41,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 41,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 41,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 41,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 42,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 42,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 42,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 42,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 42,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 43,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 43,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 45,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 45,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 45,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 45,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 45,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 46,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 47,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 47,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 47,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 47,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 47,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 48,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 48,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 48,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 48,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 48,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 49,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 49,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 49,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 49,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 49,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 50,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 50,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 50,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 50,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 50,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 51,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 52,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 53,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 54,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 55,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 56,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 57,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 58,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 59,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 60,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 61,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 62,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 63,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 64,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 65,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 66,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 67,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 68,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 68,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 68,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 68,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 69,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 69,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 69,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 69,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 70,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 71,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 71,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 71,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 71,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 71,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 71,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 72,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 72,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 72,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 72,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 73,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 73,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 73,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 73,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 73,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 74,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 74,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 74,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 74,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 74,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 75,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 75,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 75,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 75,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 75,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 76,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 77,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 77,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 77,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 77,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 77,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 78,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 78,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 78,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 78,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 78,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 79,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 79,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 79,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 79,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 80,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 81,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 81,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 81,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 81,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 81,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 82,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 82,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 82,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 82,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 82,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 83,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 83,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 83,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 83,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 83,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 84,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 85,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 85,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 86,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 86,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 87,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 87,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 88,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 88,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 88,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 88,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 89,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 89,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 89,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 89,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 90,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 90,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 90,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 91,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 91,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 91,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 92,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 92,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 92,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 92,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 92,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 94,  submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 95,  submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 96,  submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 97,  submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 98,  submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 99,  submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 110, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 111, submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 112, submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 113, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 114, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 115, submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 124, submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 124, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 124, submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 124, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 124, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 125, submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 125, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 125, submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 125, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 125, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 126, submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 126, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 126, submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 126, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 126, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 126, submission_template_id: max_submission_template_id + 3).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 132, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 132, submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 132, submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 132, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 132, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 133, submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 133, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 133, submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 133, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 133, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 135, submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 135, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 135, submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 135, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 135, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 136, submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 136, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 136, submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 136, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 136, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 137, submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 137, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 137, submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 137, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 137, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 138, submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 138, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 138, submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 138, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 138, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 139, submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 139, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 139, submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 139, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 139, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 140, submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 140, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 140, submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 140, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 140, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 141, submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 141, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 141, submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 141, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 141, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 142, submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 142, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 142, submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 142, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 142, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 143, submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 143, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 143, submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 143, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 143, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 144, submission_template_id: max_submission_template_id + 6).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 144, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 144, submission_template_id: max_submission_template_id + 2).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 144, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 144, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 146, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 146, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 146, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 147, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 147, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 147, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 148, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 148, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 148, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 149, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 149, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 149, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 151, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 151, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 151, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 152, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 152, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 152, submission_template_id: max_submission_template_id + 4).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 153, submission_template_id: max_submission_template_id + 1).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 153, submission_template_id: max_submission_template_id + 5).first_or_create!
SubmissionTemplateQuestion.where(question_id: max_question_id + 153, submission_template_id: max_submission_template_id + 4).first_or_create!

max_submission_id = Submission.maximum('id') || 0
Submission.where(id: max_submission_id + 1).first_or_create!(applicant_id: max_applicant_id + 1, submission_template_id: max_submission_template_id + 2)
Submission.where(id: max_submission_id + 2).first_or_create!(applicant_id: max_applicant_id + 2, submission_template_id: max_submission_template_id + 3)

# set sequence to continue after creating the above records
sql = "ALTER SEQUENCE submissions_id_seq RESTART WITH #{Submission.maximum('id') + 1}"
connection.execute(sql)

# set sequence to continue after creating the above records
sql = "ALTER SEQUENCE applicants_id_seq RESTART WITH #{Applicant.maximum('id') + 1}"
connection.execute(sql)

Response.where(submission_id: max_submission_id + 1, question_id: max_question_id + 151, boolean_response: TRUE).first_or_create!
Response.where(submission_id: max_submission_id + 1, question_id: max_question_id + 152, string_response: "Wonderful person!").first_or_create!
Response.where(submission_id: max_submission_id + 1, question_id: max_question_id + 153, text_response:   "She loves kittens!").first_or_create!
Response.where(submission_id: max_submission_id + 2, question_id: max_question_id + 70,  string_response: "Mae Beale will.").first_or_create!
Response.where(submission_id: max_submission_id + 2, question_id: max_question_id + 71,  string_response: "Mae Beale will.").first_or_create!