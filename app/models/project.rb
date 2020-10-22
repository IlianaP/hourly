class Project < ApplicationRecord

	has_many :hourlogs
	validates :name, presence: true
	validates :plan, presence: true
	validates :planhours, presence: true
	validates :plandate, presence: true
	validates :duration, presence: true
	validates :starthourtrack, presence: true
end
