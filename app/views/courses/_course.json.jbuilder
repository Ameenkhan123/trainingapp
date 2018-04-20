json.extract! course, :name, :description, :duration, :fees, :banner_image
json.url course_url(course, format: :json)
