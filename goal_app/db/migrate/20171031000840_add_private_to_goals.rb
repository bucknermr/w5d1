class AddPrivateToGoals < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :shared, :boolean, null: false
  end
end
