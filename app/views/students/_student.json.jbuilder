json.extract! student, :profile_pic, :first_name, :last_name, :father_name, :contact, :emergency_contact, :email, :address, :college, :date_of_birth, :gender
json.url student_url(student, format: :json)
