class Project < ApplicationRecord

	validates :name, presence: true, uniqueness: true
	validates :status, presence: true

	has_many :comments, dependent: :destroy

	before_update :record_activity, if: -> { status_changed? }

	def record_activity
		comments.create(content: "Status changed to #{status} by #{Current.user.email}", user: Current.user)
	end
end
