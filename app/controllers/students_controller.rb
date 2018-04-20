class StudentsController < ApplicationController

	respond_to :json
	
	def index
	@students = Student.all
		respond_to do |format|
			format.html {} 
      format.json {render @students} 
		end
	end

	def new
	@student = Student.new
	end

	def create
		@student = Student.new(student_params)
				if @student.save
			redirect_to @student
		else
			render 'new'
		end
	end

	def show
		@student = Student.find(params[:id])
	end
	def edit
		@student = Student.find(params[:id])

	end
	def update
		@student = Student.find(params[:id])
		if @student.update(student_params)
			redirect_to @student
		else
			render 'edit'
		end
	end

	def destroy
        @student = Student.find(params[:id])
        @student.destroy
				redirect_to students_path
      end


	private
	def student_params
		params.require(:student).permit(:profile_pic, :first_name, :last_name, :father_name, :contact, :emergency_contact, :email, :address, :college, :date_of_birth, :gender, :course_id )
	end


end
