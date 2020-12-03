class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.integer :planet_id
      t.boolean :private, default: false
      t.timestamps
    end
  end
end
