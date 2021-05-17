class AddCityIdToSchools < ActiveRecord::Migration[6.1]
  def change
    add_column :schools, :city_id, :integer
  end
end
