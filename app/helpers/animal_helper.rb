module AnimalHelper
  def gender_label(letter)
    if letter == 'F'
      'Female'
    elsif letter == 'M'
      'Male'
    else
      'Unknown'
    end
  end

  def size_label(letter)
    case letter
    when 'S'
      'Small'
    when 'M'
      'Medium'
    when 'L'
      'Large'
    when 'XL'
      'Extra-large'
    else
      'Unknown'
    end
  end

  def options_label(options)
    return 'Unknown' unless options
    options.map { |option| option.underscore.humanize }.join(', ')
  end
end
