class Course < ApplicationRecord
	after_update :check_course
	after_touch :print_to_screen
	has_many :student_courses
	has_many :students, :through => :student_courses
	mount_uploader :banner_image, ImageUploader

	
  before_save :name_camelize
  
  after_create :set_course, on: [ :create, :update ]
  after_create :inform_to_all_user, on: [ :create]


	def set_course
		self.update(duration: 4)
	end
	
	def check_course
		if self.duration.blank?
			self.update(duration: 4)
		end
	end

	def print_to_screen
		puts "successfully"
	end

	def inform_to_all_user
		User.all.each do |user|
		  UserMailer.notify_to_all_user_about_new_course(self, user).deliver_now
		  	 # mount_uploader :attachments, ImageUploader			
			end
	end
	
	private

	def name_camelize
	
		self.name.camelize
	end

	
end
