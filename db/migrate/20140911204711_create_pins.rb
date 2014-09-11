class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :lat
      t.string :lon
      t.string :name
    end
    create_table :pins_users do |t|
      t.integer :user_id
      t.integer :pin_id
    end
  end
end
