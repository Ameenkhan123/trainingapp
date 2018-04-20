class RemoveCourseFromStudents < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :course_id, :integer
  end
end
