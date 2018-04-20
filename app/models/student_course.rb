class StudentCourse < ApplicationRecord
	belongs_to :course, optional: true, touch: true
 belongs_to :student, optional: true, touch: true
 
end
