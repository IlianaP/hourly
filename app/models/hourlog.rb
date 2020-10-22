class Hourlog < ApplicationRecord
	belongs_to :user
	belongs_to :project
	accepts_nested_attributes_for :project
	validates :name, presence: true
	validates :description, presence: true
	validates :hours, presence: true
	validates :date, presence: true
	validates :project, presence: true
end
