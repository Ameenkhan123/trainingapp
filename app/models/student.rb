class Student < ApplicationRecord
	has_many :student_courses
	has_many :courses, :through => :student_courses
	 mount_uploader :profile_pic, ImageUploader
	geocoded_by :address   # can also be an IP address
  after_validation :geocode

	def name
		"#{self.first_name} #{self.last_name}"
	end
end
