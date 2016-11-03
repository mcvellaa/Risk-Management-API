class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.string :optional_title
      t.string :optional_text
      t.string :phone
      t.string :birthdate
      t.boolean :texting_consent, default: true

      t.timestamps null: false
    end
  end
end
