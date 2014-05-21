class Project < ActiveRecord::Base
	has_one :pledge

	belongs_to :user

	validates :user_id, presence: true
end
