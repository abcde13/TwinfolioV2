class Notifier < ActionMailer::Base
  default from: "temp@example.com"

	def send_mail(contact)
		@contact = contact
		if @contact.to == "Joraaver"
			mail(to: "joraaverchahal@gmail.com",subject: @contact.subject, content: 'text/html')
		elsif @contact.to == "Suchaaver"
			mail(to: "suchaaverchahal@gmail.com",subject: @contact.subject, content: 'text/html')
		else
			mail(to: "joraaverchahal@gmail.com, suchaaverchahal@gmail.com",subject: @contact.subject, content: 'text/html')
		end
	end
end
