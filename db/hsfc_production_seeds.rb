# To load production data on empty database at app launch, use $ rails r db/hsfc_production_seeds.rb

connection = ActiveRecord::Base.connection

Applicant.where(id: 1,  first_name: "Valerie", last_name: "Woolard").first_or_create!
Applicant.where(id: 2,  first_name: "Mae",     last_name: "Beale").first_or_create!

# set sequence to continue after creating the above records
sql = "ALTER SEQUENCE applicants_id_seq RESTART WITH #{Applicant.maximum('id') + 1}"
connection.execute(sql)

PetType.where(id: 1,    name: 'dog').first_or_create!
PetType.where(id: 2,    name: 'cat').first_or_create!
PetType.where(id: 3,    name: 'horse').first_or_create!
PetType.where(id: 4,    name: 'small mammal').first_or_create!
PetType.where(id: 5,    name: 'rabbit').first_or_create!
PetType.where(id: 6,    name: 'bird').first_or_create!

# set sequence to continue after creating the above records
sql = "ALTER SEQUENCE pet_types_id_seq RESTART WITH #{PetType.maximum('id') + 1}"
connection.execute(sql)

FormType.where(id: 1,   pet_type_id: 1).first_or_create!
FormType.where(id: 2,   pet_type_id: 2).first_or_create!
FormType.where(id: 3,   pet_type_id: 3).first_or_create!
FormType.where(id: 4,   pet_type_id: 4).first_or_create!
FormType.where(id: 5,   pet_type_id: 5).first_or_create!
FormType.where(id: 6,   pet_type_id: 6).first_or_create!

# set sequence to continue after creating the above records
sql = "ALTER SEQUENCE form_types_id_seq RESTART WITH #{FormType.maximum('id') + 1}"
connection.execute(sql)

Question.reset_column_information
Question.where(id: 1,   position: 5,    input_type: "text",      admin_only_question: TRUE, content: "Reviewer's initials").first_or_create!
Question.where(id: 3,   position: 20,   input_type: "textarea",  admin_only_question: FALSE, content: "Name of animal you wish you adopt (if you have one in mind)").first_or_create!
Question.where(id: 132, position: 21,   input_type: "none",      admin_only_question: TRUE, content: "Information on requested pet (if pets, please list complete for each)").first_or_create!
Question.where(id: 133, position: 22,   input_type: "text",      admin_only_question: TRUE, parent_id: 132, content: "Name(s)").first_or_create!
Question.where(id: 134, position: 23,   input_type: "integer",   admin_only_question: TRUE, parent_id: 132, content: "Age").first_or_create!
Question.where(id: 135).first_or_create!(position: 24,
                                         input_type: "select",
                                         admin_only_question: TRUE,
                                         parent_id: 132,
                                         option_list: "{Female, Male}",
                                         content: "Sex")
Question.where(id: 136, position: 25,   input_type: "radio",     admin_only_question: TRUE, parent_id: 132, content: "Spayed or Neutered").first_or_create!
Question.where(id: 137, position: 26,   input_type: "text",      admin_only_question: TRUE, parent_id: 132, content: "Description").first_or_create!
Question.where(id: 138, position: 27,   input_type: "text",      admin_only_question: TRUE, parent_id: 132, content: "Medical history").first_or_create!
Question.where(id: 139, position: 28,   input_type: "text",      admin_only_question: TRUE, parent_id: 132, content: "Medical work pending").first_or_create!
Question.where(id: 140, position: 29,   input_type: "text",      admin_only_question: TRUE, parent_id: 132, content: "Other information").first_or_create!
Question.where(id: 4,   position: 30,   input_type: "radio",     admin_only_question: FALSE, content: "Do we have permission to visit your home using the address you provided above?").first_or_create!
Question.where(id: 5,   position: 40,   input_type: "textarea",  admin_only_question: FALSE, parent_id: 30, content: "If so, are there any helpful directions you'd like to share?").first_or_create!
Question.where(id: 6,   position: 50,   input_type: "radio",     admin_only_question: FALSE, content: "Have you ever applied for or adopted an animal from HSFC?").first_or_create!
Question.where(id: 7,   position: 60,   input_type: "date",      admin_only_question: FALSE, parent_id: 50, content: "If yes, what was the date you applied?").first_or_create!
Question.where(id: 8,   position: 70,   input_type: "textarea",  admin_only_question: FALSE, parent_id: 50, content: "If yes, what was the outcome of the application?").first_or_create!
Question.where(id: 9,   position: 80,   input_type: "radio",     admin_only_question: FALSE, content: "Are you familiar with the Humane Society's adoption regulations?").first_or_create!
Question.where(id: 10,  position: 90,   input_type: "radio",     admin_only_question: FALSE, content: "Are you familiar with the Humane Society's return policy?").first_or_create!
Question.where(id: 11,  position: 100,  input_type: "radio",     admin_only_question: FALSE, content: "Are your familiar with the Humane Society's barn/home check procedure?").first_or_create!
Question.where(id: 12,  position: 140,  input_type: "radio",     admin_only_question: FALSE, content: "Have you owned or lived with an animal in the past five years? (If you answer yes, you'll be prompted to share details for each of the pets.) ").first_or_create!
Question.where(id: 13,  position: 150,  input_type: "none",      admin_only_question: FALSE, parent_id: 12, content: "PET").first_or_create!
Question.where(id: 14,  position: 160,  input_type: "text",      admin_only_question: FALSE, parent_id: 13, content: "Breed").first_or_create!
Question.where(id: 15,  position: 170,  input_type: "text",      admin_only_question: FALSE, parent_id: 13, content: "Name").first_or_create!
Question.where(id: 16,  position: 180,  input_type: "integer",   admin_only_question: FALSE, parent_id: 13, content: "Age").first_or_create!
Question.where(id: 17).first_or_create!(position: 190,
                                        input_type: "select",
                                        admin_only_question: FALSE,
                                        option_list: "{Female, Male}",
                                        parent_id: 13,
                                        content: "Sex")
Question.where(id: 18,  position: 200,  input_type: "text",      admin_only_question: FALSE, parent_id: 13, content: "Where was/is it housed?").first_or_create!
Question.where(id: 19,  position: 202,  input_type: "radio",     admin_only_question: FALSE, content: "Do you own a farm/facility?").first_or_create!
Question.where(id: 20,  position: 204,  input_type: "textarea",  admin_only_question: FALSE, content: "Address of location horse will be stabled.").first_or_create!
Question.where(id: 21,  position: 206,  input_type: "textarea",  admin_only_question: FALSE, content: "Describe your facility, ie. run-in-shed, 4-stall barn, wire fencing").first_or_create!
Question.where(id: 22,  position: 220,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 27, content: "If so, describe your horse").first_or_create!
Question.where(id: 23,  position: 230,  input_type: "radio",     admin_only_question: FALSE, parent_id: 27, content: "If so, is it spayed or Neutered?").first_or_create!
Question.where(id: 24,  position: 240,  input_type: "radio",     admin_only_question: FALSE, parent_id: 27, content: "If so, is it properly licensed?").first_or_create!
Question.where(id: 25,  position: 250,  input_type: "radio",     admin_only_question: FALSE, parent_id: 27, content: "If so, was it vaccinated this year?").first_or_create!
Question.where(id: 26,  position: 260,  input_type: "integer",   admin_only_question: FALSE, parent_id: 27, content: "If not, how many years did you own that animal? (Round down to the nearest year.)").first_or_create!
Question.where(id: 27,  position: 210,  input_type: "radio",     admin_only_question: FALSE, parent_id: 13, content: "Do you still own the animal?").first_or_create!
Question.where(id: 28,  position: 270,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 27, content: "If not, what happened to the animal?").first_or_create!
Question.where(id: 29,  position: 280,  input_type: "radio",     admin_only_question: FALSE, content: "Do you have a veterinarian?").first_or_create!
Question.where(id: 30,  position: 290,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 29, content: "If so, Vet's name").first_or_create!
Question.where(id: 31,  position: 300,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 29, content: "If so, Veterinary clinic/hospital phone number").first_or_create!
Question.where(id: 32,  position: 310,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 29, content: "If so, Veterinary clinic/hospital address").first_or_create!
Question.where(id: 33,  position: 320,  input_type: "radio",     admin_only_question: FALSE, parent_id: 29, content: "If so, may we have your permission to contact them?").first_or_create!
Question.where(id: 34,  position: 330,  input_type: "none",      admin_only_question: FALSE, parent_id: 29, content: "If so, PLEASE INFORM YOUR VET THAT HSFC WILL CONTACT THEM TO VERIFY YOU PET'S TREATMENT RECORDS").first_or_create!
Question.where(id: 141, position: 1270, input_type: "none",      admin_only_question: TRUE, content: "Health check on applicant’s pet(s)").first_or_create!
Question.where(id: 142, position: 1280, input_type: "radio",     admin_only_question: TRUE, parent_id: 141, content: "Are the medical records current for all their pets?").first_or_create!
Question.where(id: 143, position: 1290, input_type: "text",      admin_only_question: TRUE, parent_id: 141, content: "Comments from discussion with Veterinarian").first_or_create!
Question.where(id: 144, position: 1300, input_type: "date",      admin_only_question: TRUE, parent_id: 141, content: "Date health check completed").first_or_create!
Question.where(id: 35,  position: 340,  input_type: "textarea",  admin_only_question: FALSE, content: "Why do you want to adopt an animal?").first_or_create!
Question.where(id: 36).first_or_create!(position: 350,
                                        input_type: "select",
                                        admin_only_question: FALSE,
                                        option_list: "{House, Apartment, Condo, Townhouse, Duplex}",
                                        content: "Living arrangement")
Question.where(id: 37,  position: 360,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 36, content: "If you have an enclosed fence, please list type and height.").first_or_create!
Question.where(id: 38).first_or_create!(position: 370,
                                        input_type: "select",
                                        admin_only_question: FALSE,
                                        option_list: "{Own, Rent}",
                                        parent_id: 350,
                                        content: "Do you (or your parents/roomates) own or rent your home?")
Question.where(id: 39,  position: 380,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 36, content: "Please detail any restrictions on pets, such as weight, type or number of pets.").first_or_create!
Question.where(id: 40,  position: 390,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 36, content: "Name of Development, Apartment or Condo Complex, if applicable").first_or_create!
Question.where(id: 41,  position: 400,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 36, content: "Landlord/HOA/Manager’s Name (if applicable)").first_or_create!
Question.where(id: 42,  position: 410,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 36, content: "Landlord/HOA/Manager’s Phone # (if applicable)").first_or_create!
Question.where(id: 43,  position: 420,  input_type: "radio",     admin_only_question: FALSE, parent_id: 36, content: "May we have your permission to call your Development, Apartment or Condo Complex?  (if applicable)").first_or_create!
Question.where(id: 44,  position: 430,  input_type: "none",      admin_only_question: FALSE, parent_id: 36, content: "PLEASE INFORM YOUR LANDLORD/HOA/MANAGER THAT HSFC WILL CONTACT THEM TO DISCUSS ANY BREED OR SIZE RESTRICTIONS THEY HAVE FOR PETS.").first_or_create!
Question.where(id: 45,  position: 440,  input_type: "integer",   admin_only_question: FALSE, parent_id: 36, content: "How many adults live in your home? ").first_or_create!
Question.where(id: 46,  position: 445,  input_type: "textarea",  admin_only_question: FALSE, content: "List other persons at this address not adopting this animal:").first_or_create!
Question.where(id: 47,  position: 450,  input_type: "integer",   admin_only_question: FALSE, parent_id: 36, content: "How many children live in your home? ").first_or_create!
Question.where(id: 48,  position: 460,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 36, content: "If there are any children, what are their ages?").first_or_create!
Question.where(id: 49,  position: 470,  input_type: "radio",     admin_only_question: FALSE, parent_id: 36, content: "Is anyone home during the day?").first_or_create!
Question.where(id: 50,  position: 480,  input_type: "radio",     admin_only_question: FALSE, parent_id: 36, content: "Is anyone home during the night?").first_or_create!
Question.where(id: 51,  position: 490,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 36, content: "Are there any other details you'd like to share about your living arrangement?").first_or_create!
Question.where(id: 145, position: 491,  input_type: "none",      admin_only_question: TRUE, content: "Home check").first_or_create!
Question.where(id: 146, position: 492,  input_type: "text",      admin_only_question: TRUE, parent_id: 145, content: "Applicant’s driver's license number and state of licensure").first_or_create!
Question.where(id: 147, position: 493,  input_type: "text",      admin_only_question: TRUE, parent_id: 145, content: "Landlord/apartment approval (name of person and date spoken with)").first_or_create!
Question.where(id: 148, position: 494,  input_type: "text",      admin_only_question: TRUE, parent_id: 145, content: "Name and initials of who completed the home check").first_or_create!
Question.where(id: 149, position: 495,  input_type: "date",      admin_only_question: TRUE, parent_id: 145, content: "Date home check was completed").first_or_create!
Question.where(id: 150, position: 496,  input_type: "text",      admin_only_question: TRUE, parent_id: 145, content: "Name and initials of who completed the home check").first_or_create!
Question.where(id: 52,  position: 500,  input_type: "none",      admin_only_question: FALSE, content: "Reference (please list two) ").first_or_create!
Question.where(id: 53,  position: 510,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 52, content: "Name").first_or_create!
Question.where(id: 54,  position: 520,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 52, content: "Address").first_or_create!
Question.where(id: 55,  position: 530,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 52, content: "Phone Number").first_or_create!
Question.where(id: 56,  position: 540,  input_type: "radio",     admin_only_question: FALSE, content: "Do you think rabbits should go outside?").first_or_create!
Question.where(id: 57,  position: 550,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 56, content: "Please explain.").first_or_create!
Question.where(id: 58,  position: 560,  input_type: "radio",     admin_only_question: FALSE, content: "Do you think small mammals should go outside?").first_or_create!
Question.where(id: 59,  position: 570,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 58, content: "Please explain.").first_or_create!
Question.where(id: 60,  position: 580,  input_type: "radio",     admin_only_question: FALSE, content: "Do you think birds should go outside?").first_or_create!
Question.where(id: 61,  position: 590,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 60, content: "Please explain.").first_or_create!
Question.where(id: 62,  position: 594,  input_type: "radio",     admin_only_question: FALSE, content: "Do you think cats should go outside?").first_or_create!
Question.where(id: 63,  position: 598,  input_type: "textarea",  admin_only_question: FALSE, content: "Please explain.").first_or_create!
Question.where(id: 64,  position: 600,  input_type: "radio",     admin_only_question: FALSE, content: "Do you think dogs should live outside?").first_or_create!
Question.where(id: 65,  position: 610,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 64, content: "Please explain.").first_or_create!
Question.where(id: 66,  position: 620,  input_type: "radio",     admin_only_question: FALSE, content: "Will this dog be going outside for more than recreation?").first_or_create!
Question.where(id: 67,  position: 630,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 66, content: "If so, why?").first_or_create!
Question.where(id: 68,  position: 640,  input_type: "radio",     admin_only_question: FALSE, content: "Will this animal be going outdoors?").first_or_create!
Question.where(id: 69,  position: 650,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 68, content: "If so, why?").first_or_create!
Question.where(id: 70,  position: 660,  input_type: "text",      admin_only_question: FALSE, content: "Who will have responsibility for the care and feeding of the adopted horse?").first_or_create!
Question.where(id: 71,  position: 670,  input_type: "text",      admin_only_question: FALSE, content: "Who will have responsibility for feeding?").first_or_create!
Question.where(id: 72,  position: 680,  input_type: "text",      admin_only_question: FALSE, content: "Exercise responsibility?").first_or_create!
Question.where(id: 73,  position: 690,  input_type: "text",      admin_only_question: FALSE, content: "Grooming responsibility?").first_or_create!
Question.where(id: 74,  position: 700,  input_type: "text",      admin_only_question: FALSE, content: "Training responsibility?").first_or_create!
Question.where(id: 75,  position: 710,  input_type: "text",      admin_only_question: FALSE, content: "Who will have responsibility for the pet's expenses?").first_or_create!
Question.where(id: 76,  position: 705,  input_type: "textarea",  admin_only_question: FALSE, content: "What is Your Viewpoint on Declawing?").first_or_create!
Question.where(id: 77,  position: 720,  input_type: "textarea",  admin_only_question: FALSE, content: "How were you referred to The Humane Society of Fairfax County?").first_or_create!
Question.where(id: 78,  position: 730,  input_type: "radio",     admin_only_question: FALSE, content: "This animal may require spay/neuter surgery or other medical expenses following adoption. Are you prepared to take on these expenses?").first_or_create!
Question.where(id: 79,  position: 740,  input_type: "radio",     admin_only_question: FALSE, content: "Because it is very stressful for an animal to go from home to home, we hope to place each one in a caring home for the rest of its life. Are you prepared to make this commitment?").first_or_create!
Question.where(id: 80,  position: 750,  input_type: "radio",     admin_only_question: FALSE, content: "Because it is very stressful for a dog to go from home to home, we hope to place each one in a caring home for the rest of its life, which could be up to 20 years. Are you prepared to make this commitment?").first_or_create!
Question.where(id: 81,  position: 760,  input_type: "textarea",  admin_only_question: FALSE, content: "What will happen to the animal if you have to move?").first_or_create!
Question.where(id: 82,  position: 770,  input_type: "textarea",  admin_only_question: FALSE, content: "In an effort to ensure the lifelong well-being of these animals, we screen our adopters very carefully and sign a legal contract with them. If at some point you can no longer care for the animal, we require that you return it to HSFC. This way, the animal may be readopted by other qualified applicants, and once again protected by a legal contract. How do you feel about this?").first_or_create!
Question.where(id: 83,  position: 780,  input_type: "textarea",  admin_only_question: FALSE, content: "This animal may take several weeks or months to fully adjust to you and your home (and your other animals, if applicable). How would you ease the adjustment?").first_or_create!
Question.where(id: 84,  position: 790,  input_type: "textarea",  admin_only_question: FALSE, content: "How will you exercise this dog?").first_or_create!
Question.where(id: 85,  position: 800,  input_type: "textarea",  admin_only_question: FALSE, content: "How would you correct or discipline this dog?").first_or_create!
Question.where(id: 86,  position: 810,  input_type: "textarea",  admin_only_question: FALSE, content: "What kind of dog behavior do you find unacceptable?").first_or_create!
Question.where(id: 87,  position: 820,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 86, content: "How would you handle these behaviors?").first_or_create!
Question.where(id: 88,  position: 830,  input_type: "radio",     admin_only_question: FALSE, content: "Do you believe in spaying or neutering?").first_or_create!
Question.where(id: 89,  position: 840,  input_type: "textarea",  admin_only_question: FALSE, parent_id: 88, content: "If so, why?").first_or_create!
Question.where(id: 90,  position: 844,  input_type: "radio",     admin_only_question: FALSE, content: "Are your current pets properly licensed?").first_or_create!
Question.where(id: 91,  position: 848,  input_type: "radio",     admin_only_question: FALSE, content: "Have they been vaccinated?").first_or_create!
Question.where(id: 92,  position: 850,  input_type: "date",      admin_only_question: FALSE, content: "If approved, when would you like to take your pet home?").first_or_create!
Question.where(id: 93,  position: 860,  input_type: "none",      admin_only_question: FALSE, content: "Which of these subjects would you like to learn more about?").first_or_create!
Question.where(id: 94 ).first_or_create!(position: 880, #dog
                                         input_type: "select",
                                         admin_only_question: FALSE,
                                         content: "Which of these subjects would you like to learn more about?",
                                         option_list: "{House Training, Heartworm prevention, Obedience, Behavioral problems,
                                                        Feeding,
                                                        Introducing new pets to pets at home, Grooming, Fleas, Household dangers, Other}")
Question.where(id: 95 ).first_or_create!(position: 870, #cat
                                         input_type: "select",
                                         admin_only_question: FALSE,
                                         content: "Which of these subjects would you like to learn more about?",
                                         option_list: "{House Training, Litter,
                                                        Scratching/Declawing, Feeding, Upper Respiratory Infections, Feline Leukemia, Feline Aids, Urinary Problems,
                                                        Introducing new pets to pets at home, Household dangers, Other}")
Question.where(id: 96 ).first_or_create!(position: 890, #horse
                                         input_type: "select",
                                         admin_only_question: FALSE,
                                         content: "Which of these subjects would you like to learn more about?",
                                         option_list: "{Grooming, Other}")
Question.where(id: 97 ).first_or_create!(position: 900, #small mammal
                                         input_type: "select",
                                         admin_only_question: FALSE,
                                         content: "Which of these subjects would you like to learn more about?",
                                         option_list: "{Litter,
                                                        Feeding,
                                                        Introducing new pets to pets at home, Grooming, Household dangers, Other}")
Question.where(id: 98 ).first_or_create!(position: 910, #rabbit
                                         input_type: "select",
                                         admin_only_question: FALSE,
                                         content: "Which of these subjects would you like to learn more about?",
                                         option_list: "{Litter,
                                                        Feeding,
                                                        Introducing new pets to pets at home, Grooming, Household dangers, Other}")
Question.where(id: 99 ).first_or_create!(position: 920, #bird
                                         input_type: "select",
                                         admin_only_question: FALSE,
                                         content: "Which of these subjects would you like to learn more about?",
                                         option_list: "{Obedience,
                                                        Feeding,
                                                        Introducing new pets to pets at home, Grooming, Household dangers, Other}")

Question.where(id: 109, position: 870,  input_type: "textarea", admin_only_question: FALSE, parent_id: 110, content: "If other, please describe").first_or_create!
Question.where(id: 110).first_or_create!(position: 970, #dog
                                         input_type: "select",
                                         admin_only_question: FALSE,
                                         content: "Please check the type of pet(s) you'd like",
                                         option_list: "{Adult animal, Young animal, Companion for another pet, Two new compatible pets, Particular breed,
                                                        Children’s pet, Short hair, Long hair, Affectionate lap animal}")
Question.where(id: 111).first_or_create!(position: 980, #cat
                                         input_type: "select",
                                         admin_only_question: FALSE,
                                         content: "Please check the type of pet(s) you'd like",
                                         option_list: "{Adult animal, Young animal, Companion for another pet, Two new compatible pets, Particular breed,
                                                        Children’s pet, Short hair, Long hair, Affectionate lap animal, Affectionate animal,
                                                        Inside Cat, Outside Cat, Declawed Cat}")
Question.where(id: 112).first_or_create!(position: 990, #horse
                                         input_type: "select",
                                         admin_only_question: FALSE,
                                         content: "Please check the type of pet(s) you'd like",
                                         option_list: "{Adult animal, Young animal, Companion for another pet, Two new compatible pets, Particular breed,
                                                        Children’s pet, Affectionate animal}")
Question.where(id: 113).first_or_create!(position: 1000, #small mammal
                                         input_type: "select",
                                         admin_only_question: FALSE,
                                         content: "Please check the type of pet(s) you'd like",
                                         option_list: "{Adult animal, Young animal, Companion for another pet, Two new compatible pets, Particular breed,
                                                        Children’s pet, Short hair, Long hair, Affectionate lap animal, Affectionate animal}")
Question.where(id: 114).first_or_create!(position: 1010, #rabbit
                                         input_type: "select",
                                         admin_only_question: FALSE,
                                         content: "Please check the type of pet(s) you'd like",
                                         option_list: "{Adult animal, Young animal, Companion for another pet, Two new compatible pets, Particular breed,
                                                        Children’s pet, Short hair, Long hair, Affectionate animal}")
Question.where(id: 115).first_or_create!(position: 1020, #bird
                                         input_type: "select",
                                         admin_only_question: FALSE,
                                         content: "Please check the type of pet(s) you'd like",
                                         option_list: "{Adult animal, Young animal, Companion for another pet, Two new compatible pets, Particular breed,
                                                        Children’s pet, Affectionate animal}")
Question.where(id: 124, position: 1070, input_type: "radio",     admin_only_question: FALSE, content: "I understand HSFC is looking for the best possible home for this companion animal. I further understand HSFC can and will use its sole discretion to determine the best qualified candidate for this animal.").first_or_create!
Question.where(id: 125, position: 1080, input_type: "radio",     admin_only_question: FALSE, content: "I understand you will be contacting my veterinarian for the vaccination and health history of the pets I currently own or have owned in the past. I release, through submission of this application, my veterinarian to provide that information to you. I am aware that prior to placement of a pet from the HSFC, my currently owned pets, for their protection, must be up-to-date on needed vaccinations.").first_or_create!
Question.where(id: 126, position: 1090, input_type: "radio",     admin_only_question: FALSE, content: "I certify that all the information in this application is true, and I understand that false information may void this application.").first_or_create!
Question.where(id: 151, position: 1360, input_type: "radio",     admin_only_question: TRUE, content: "Do you approve of this adoption?").first_or_create!
Question.where(id: 152, position: 1370, input_type: "text",      admin_only_question: TRUE, parent_id: 151, content: "Why?").first_or_create!
Question.where(id: 153, position: 1380, input_type: "text",      admin_only_question: TRUE, content: "Comments").first_or_create!

# set sequence to continue after creating the above records
sql = "ALTER SEQUENCE questions_id_seq RESTART WITH #{Question.maximum('id') + 1}"
connection.execute(sql)

FormTypeQuestion.where(question_id: 1,   form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 1,   form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 1,   form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 1,   form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 1,   form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 1,   form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 3,   form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 4,   form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 4,   form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 4,   form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 4,   form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 4,   form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 6,   form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 6,   form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 6,   form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 6,   form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 6,   form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 7,   form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 7,   form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 7,   form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 7,   form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 7,   form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 8,   form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 8,   form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 8,   form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 8,   form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 8,   form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 9,   form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 10,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 11,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 12,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 12,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 12,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 12,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 12,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 12,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 14,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 14,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 14,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 14,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 14,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 15,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 15,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 15,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 15,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 15,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 16,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 16,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 16,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 16,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 16,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 17,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 17,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 17,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 17,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 17,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 18,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 18,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 18,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 18,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 19,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 20,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 21,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 22,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 23,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 23,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 23,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 23,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 23,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 24,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 24,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 24,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 26,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 26,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 26,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 26,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 26,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 27,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 27,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 27,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 27,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 27,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 28,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 28,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 28,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 28,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 28,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 29,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 29,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 29,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 29,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 29,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 30,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 30,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 30,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 30,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 30,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 30,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 31,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 31,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 31,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 31,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 31,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 31,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 32,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 32,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 33,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 33,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 34,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 34,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 35,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 35,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 35,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 35,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 35,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 36,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 36,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 36,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 36,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 36,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 37,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 38,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 38,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 38,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 38,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 39,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 39,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 39,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 39,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 39,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 40,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 40,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 40,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 40,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 40,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 41,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 41,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 41,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 41,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 41,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 42,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 42,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 42,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 42,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 42,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 43,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 43,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 44,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 44,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 45,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 45,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 45,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 45,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 45,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 46,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 47,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 47,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 47,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 47,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 47,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 48,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 48,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 48,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 48,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 48,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 49,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 49,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 49,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 49,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 49,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 50,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 50,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 50,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 50,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 50,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 51,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 52,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 53,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 54,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 55,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 56,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 57,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 58,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 59,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 60,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 61,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 62,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 63,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 64,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 65,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 66,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 67,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 68,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 68,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 68,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 68,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 69,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 69,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 69,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 69,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 69,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 70,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 71,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 71,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 71,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 71,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 71,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 71,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 72,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 72,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 72,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 72,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 73,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 73,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 73,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 73,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 73,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 74,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 74,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 74,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 74,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 74,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 75,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 75,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 75,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 75,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 75,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 76,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 77,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 77,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 77,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 77,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 77,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 78,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 78,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 78,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 78,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 78,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 79,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 79,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 79,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 79,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 80,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 81,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 81,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 81,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 81,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 81,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 82,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 82,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 82,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 82,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 82,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 83,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 83,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 83,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 83,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 83,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 84,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 85,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 85,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 86,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 86,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 87,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 87,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 88,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 88,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 88,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 88,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 89,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 89,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 89,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 89,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 90,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 90,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 90,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 91,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 91,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 91,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 92,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 92,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 92,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 92,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 92,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 94,  form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 95,  form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 96,  form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 97,  form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 98,  form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 99,  form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 110, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 111, form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 112, form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 113, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 114, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 115, form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 124, form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 124, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 124, form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 124, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 124, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 125, form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 125, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 125, form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 125, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 125, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 126, form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 126, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 126, form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 126, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 126, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 126, form_type_id: 3).first_or_create!
FormTypeQuestion.where(question_id: 132, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 132, form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 132, form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 132, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 132, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 133, form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 133, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 133, form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 133, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 133, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 134, form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 134, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 134, form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 134, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 134, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 135, form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 135, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 135, form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 135, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 135, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 136, form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 136, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 136, form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 136, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 136, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 137, form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 137, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 137, form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 137, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 137, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 138, form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 138, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 138, form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 138, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 138, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 139, form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 139, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 139, form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 139, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 139, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 140, form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 140, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 140, form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 140, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 140, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 141, form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 141, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 141, form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 141, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 141, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 142, form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 142, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 142, form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 142, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 142, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 143, form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 143, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 143, form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 143, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 143, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 144, form_type_id: 6).first_or_create!
FormTypeQuestion.where(question_id: 144, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 144, form_type_id: 2).first_or_create!
FormTypeQuestion.where(question_id: 144, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 144, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 146, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 146, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 146, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 147, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 147, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 147, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 148, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 148, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 148, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 149, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 149, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 149, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 151, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 151, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 151, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 152, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 152, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 152, form_type_id: 4).first_or_create!
FormTypeQuestion.where(question_id: 153, form_type_id: 1).first_or_create!
FormTypeQuestion.where(question_id: 153, form_type_id: 5).first_or_create!
FormTypeQuestion.where(question_id: 153, form_type_id: 4).first_or_create!

Submission.where(id: 1, applicant_id: 1, form_type_id: 2).first_or_create!
Submission.where(id: 2, applicant_id: 2, form_type_id: 3).first_or_create!

# set sequence to continue after creating the above records
sql = "ALTER SEQUENCE submissions_id_seq RESTART WITH #{Submission.maximum('id') + 1}"
connection.execute(sql)

Response.where(submission_id: 1, question_id: 151, boolean_response: TRUE).first_or_create!
Response.where(submission_id: 1, question_id: 152, string_response: "Wonderful person!").first_or_create!
Response.where(submission_id: 1, question_id: 153, text_response:   "She loves kittens!").first_or_create!
Response.where(submission_id: 2, question_id: 70,  string_response: "Mae Beale will.").first_or_create!
Response.where(submission_id: 2, question_id: 71,  string_response: "Mae Beale will.").first_or_create!
