class Contact < ActiveRecord::Base

	validates_presence_of :name
	validates_presence_of :to
	validates_presence_of :from
	validates_presence_of :body
	validates_presence_of :subject
end
