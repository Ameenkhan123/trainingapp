class CoursesController < ApplicationController
	
	respond_to :json
	def index
	@courses = Course.all
		respond_to do |format|
			format.html {} 
      format.json {render @courses} 
		end
	end
	def new
		@course = Course.new
	end
	def create
		@course = Course.new(course_params)
		if @course.save
			params[:student_ids].each do |student_id|
			StudentCourse.create(student_id: student_id, course_id: @course.id)
			end
			redirect_to @course
		else
			render 'new'
		end
	end
	def show
		@course = Course.find(params[:id])
	end

	def preview
		@course = Course.find(params[:id])
	end

	def edit
		@course = Course.find(params[:id])
	end
	def update
		@course= Course.find(params[:id])
		if @course.update(course_params)
			@course.students.map{|s| StudentCourse.where(course_id: @course.id, student_id: s).first.delete}
    params[:student_ids].each do |student_id|
		  StudentCourse.create(student_id: student_id, course_id: @course.id)
		end
			redirect_to @course
		else
			render 'edit'
		end
	end
	def destroy
		@course = Course.find(params[:id])
		@course.destroy

		redirect_to courses_path
	end
	private
	def course_params
		params.require(:course).permit(:name, :description, :duration, :fees, :banner_image )
	end
end
