module SubmissionsHelper

  def question_field_name(input_type)
    case
      when input_type == "date" then :date_response
      when input_type == "datetime" then :datetime_response
      when input_type == "integer" then :integer_response
      when input_type == "multiselect" then :array_response
      when input_type == "radio" ||
        input_type == "checkbox" then :string_response
      else :string_response
    end
  end

  def strip_hyphenated_string_to_downcase_prefix(string)
    string.gsub(/-.*$/, "").downcase
  end

  def validation_error_prompt(record)
    if record.errors.any?
      content_tag :div, "error-explanation", class: ["error-message"] do
        safe_join([
                    "<span class='glyphicon glyphicon-remove-sign'
                       aria-hidden='true'></span><h3>".html_safe,
                    (pluralize(record.errors.count, " issue" )) + " with your answers. " +
                      " (See below.) ", "<br/><br/>".html_safe,
                    "Click your browser's back button to fix and resubmit.",
                    "</h3>".html_safe,
                  record.errors.full_messages.each{ |message|
                    safe_join([
                      "<p>".html_safe,
                      message + ".",
                      "</p><br><hr><br/>".html_safe
                    ])
                  }
                  ])
      end
    end
  end

  def yes_no(val)
    if val === true
      "YES"
    elsif val === false
      "No"
    end
  end
end
