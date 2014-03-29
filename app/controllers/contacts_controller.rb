class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			Notifier.send_mail(@contact).deliver
			redirect_to new_contact_path, :flash => {success:  "An email has been sent. Thanks for dropping by!"}
		else
			flash.now[:failure] = "You need to fill out a little more information."
			render :action => :new
		end
	end

	private
	
	def contact_params
		params.require(:contact).permit(:name, :to, :from, :subject, :body)
	end
end
