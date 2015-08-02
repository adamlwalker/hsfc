class CrazyTown < ActiveRecord::Migration
  def change
    rename_table          :adoption_form_types,          :form_types
    rename_table          :adoption_forms,               :submissions
    rename_table          :answers,                      :responses
    rename_table          :adoption_form_type_questions, :form_type_questions

    drop_table :question_options do |t|
      t.references :question
      t.string     :option_text
    end

    add_column            :responses,                    :date_response,         :string
    add_column            :questions,                    :option_list,           :string, array: true, default: []
    rename_column         :questions,                    :answer_by_applicant,   :admin_only_question
    rename_column         :questions,                    :hint_text,             :input_type
    remove_column         :questions,                    :answer_type_id,        :integer

    add_index_and_key(:form_types,                       :pet_type)
    add_index_and_key(:form_type_questions,              :question)
    add_index_and_key(:responses,                        :question)
    add_reference_and_key(:responses,                    :submission,            true)
    add_reference_and_key(:submissions,                  :form_type,             true)
    add_reference_and_key(:form_type_questions,          :form_type,             true)

  end

  def add_reference_and_key(table, reference_name, create_indexes = false, null = false)
    add_reference  table, reference_name,   index: create_indexes,         null: null,  foreign_key: {table_name: "#{table.to_s}" }
  end

  def add_index_and_key(table, foreign_table_name_singular)
    add_index           table, "#{foreign_table_name_singular.to_s.singularize + '_id'}"
    add_foreign_key     table, foreign_table_name_singular.to_s.pluralize, column: "#{foreign_table_name_singular.to_s.singularize + '_id'}"

  end

end
