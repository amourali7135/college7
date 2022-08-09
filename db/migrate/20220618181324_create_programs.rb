class CreatePrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :programs do |t|
      t.string :title
      t.string :headline
      t.text :description
      t.boolean :rolling, null: false, default: false
      t.date :application_due_date
      t.string :location
      t.float :latitude
      t.float :longitude
      t.boolean :remote, null: false, default: false
      t.integer :spots
      t.boolean :prerequisites, null: false, default: false
      t.text :requirements
      t.string :length
      t.integer :minimum_age
      t.boolean :visa_sponsorship, null: false, default: false
      t.boolean :first_day, null: false, default: false
      t.date :start_date
      t.boolean :virtual_components, null: false, default: false
      t.boolean :housing_provided, null: false, default: false
      t.boolean :essay_one_needed, null: false, default: false
      t.boolean :essay_two_needed, null: false, default: false
      t.boolean :essay_three_needed, null: false, default: false
      t.string :essay_question_one
      t.string :essay_question_two
      t.string :essay_question_three
      t.boolean :salary, null: false, default: false
      t.integer :salary_paid
      t.integer :cost
      t.boolean :certificate_awarded, null: false, default: false
      t.boolean :nationals_only, null: false, default: false
      t.integer :status
      t.string :time_requirement
      t.boolean :job_guaranteed, null: false, default: false
      # t.string :career_category
      t.string :program_format
      t.boolean :relocation_assistance, null: false, default: false
      t.integer :applications_count, default: 0, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
