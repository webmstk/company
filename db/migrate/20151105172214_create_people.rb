class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone
      t.date :birthday

      t.timestamps null: false
    end
  end
end
