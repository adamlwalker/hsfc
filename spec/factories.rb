FactoryGirl.define do

  factory :applicant do
    first_name "first_name"
    last_name "last_name"
  end

  # TODO - create comfy CMS classes and get related factories running
  # factory :cms_fortress_role_detail do
  #   # name
  #   # command
  #   # can_create
  #   # can_update
  #   # can_delete
  #   # can_view
  #   # role_id
  #   # site_id
  # end
  #
  # factory :cms_fortress_role do
  #   # name
  #   # site_id
  # end
  #
  # factory :cms_fortress_user do
  #   # role_id
  #   # first_name
  #   # last_name
  #   # type_id
  #   # site_id
  # end
  #
  # factory :cms_page_workflow do
  #   # cms_page_id
  #   # status_id
  #   # site_id
  # end
  #
  # factory :comfy_blog_comment do
  #   association :post, factory: :comfy_blog_post
  #   author "author"
  #   email "email@fake.com"
  #   # content
  # end
  #
  # factory :comfy_blog_post do
  #   association :blog, factory: :comfy_blog
  #   title "title"
  #   slug "slug"
  #   # content "content"
  #   year 2014
  #   month 10
  #   published_at Time.now
  # end
  #
  # factory :comfy_blog do
  #   association :site, factory: :comfy_cms_sites
  #   label "label"
  #   identifier "identifier"
  # end
  #
  # factory :comfy_cms_blocks do
  #   identifier "identifier"
  #   # content "content"
  #   # blockable
  #   # blockable_type "blockable_type"
  # end
  #
  # factory :comfy_cms_categories do
  #   association :site, factory: :comfy_cms_sites
  #   label "label"
  #   categorized_type "categorized_type"
  # end
  #
  # factory :comfy_cms_categorization do
  #   association :category, factory: :comfy_cms_category
  #   # association :categorized, factory: :comfy_cms_categorization
  #   categorized_type "categorized_type"
  # end
  #
  # factory :comfy_cms_files do
  #   association :site, factory: :comfy_cms_sites
  #   # block
  #   label "label"
  #   file_file_name "file_file_name"
  #   file_content_type "file_content_type"
  #   file_file_size "file_file_size"
  # end
  #
  # factory :comfy_cms_layouts do
  #   association :site, factory: :comfy_cms_sites
  #   label "label"
  #   identifier "identifier"
  # end
  #
  # factory :comfy_cms_pages do
  #   association :site, factory: :comfy_cms_sites
  #   # layout
  #   label "label"
  #   full_path "full_path"
  #   published_date Date.today
  # end
  #
  # factory :comfy_cms_revisions do
  #   record_type "record_type"
  #   # association :record, factory: :comfy
  # end
  #
  # factory :comfy_cms_sites do
  #   label "label"
  #   identifier "identifier"
  #   hostname "hostname"
  # end
  #
  # factory :comfy_cms_snippets do
  #   association :site, factory: :comfy_cms_sites
  #   label "label"
  #   identifier "identifier"
  # end

  factory :event do
    sequence(:title) { |n| "Event_#{n}" }
  end

  factory :pet_type do
    sequence(:name) { |n| "Pet Type_#{n}" }

    trait :bird do
      name "bird"
    end

    trait :cat do
      name "cat"
    end

    trait :dog do
      name "dog"
    end

    trait :horse do
      name "horse"
    end

    trait :rabbit do
      name "rabbit"
    end

    trait :small_mammal do
      name "small mammal"
    end
  end

  factory :question do
    sequence(:name) { |n| "Question_#{n}" }
  end

  factory :response do
    question
  end

  factory :submission do
    applicant
    submission_template
  end

  factory :submission_template do
    sequence(:name) { |n| "SubmissionTemplate_#{n}" }
  end

  factory :submission_template_question do
    question
    submission_template
  end

end
