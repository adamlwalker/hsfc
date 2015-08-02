class Event < ActiveRecord::Base


  def date_as_date
    Date.strptime(self.date, '%m/%d/%Y')
  end
end
