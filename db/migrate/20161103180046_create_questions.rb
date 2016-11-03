class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.boolean :required
      t.string :form_type

      t.timestamps null: false
    end
  end
end
