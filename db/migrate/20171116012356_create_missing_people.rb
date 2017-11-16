class CreateMissingPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :missing_people do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :sex
      t.string :eye_color
      t.string :hair_color
      t.string :skin_color
      t.string :race
      t.string :other_phys_features
      t.string :last_seen_city
      t.string :last_seen_state
      t.string :last_seen_place
      t.string :last_seen_with
      t.string :other_information

      t.timestamps
    end
  end
end
