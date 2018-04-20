class HomeController < ApplicationController
	skip_before_action :verify_authenticity_token
	def index
	end

	def contact
	end

	def create_contact
		@contact = Contact.new(contact_params)
		if @contact.save
			UserMailer.welcome_email(@contact).deliver_now
			redirect_to root_path
		else
			render 'contact'
		end
	end
	
	def create_about_us
		@about_us = About_us.new(about_us_params)
		if @about_us.save
			redirect_to root_path
		else
			render 'contact'
		end
	end

	private
	def contact_params
		params.require(:contact).permit(:name, :email, :messages )
	end
end
