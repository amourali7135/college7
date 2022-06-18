class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.string :essay_question_one
      t.text :first_essay
      t.string :essay_question_two
      t.text :second_essay
      t.string :essay_question_three
      t.text :third_essay
      t.integer :status
      t.references :program, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
