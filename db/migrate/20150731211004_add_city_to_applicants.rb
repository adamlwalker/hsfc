class AddCityToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :city, :string
  end
end
