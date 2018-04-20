class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :profile_pic
      t.string :first_name
      t.string :last_name
      t.string :father_name
      t.string :contact
      t.string :emergency_contact
      t.string :email
      t.string :address
      t.string :college
      t.date :date_of_birth
      t.string :gender
      t.integer :course_id

      t.timestamps
    end
  end
end
