class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :objective, null: false
      t.integer :user_id, null: false
      t.boolean :completed, null: false, default: false

      t.timestamps
    end

    add_index :goals, :user_id
  end
end
