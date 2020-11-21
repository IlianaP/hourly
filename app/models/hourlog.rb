class Hourlog < ApplicationRecord

	belongs_to :user
	belongs_to :project
	accepts_nested_attributes_for :project
	validates :name, presence: true
	validates :description, presence: true
	validates :hours, presence: true
	validates :date, presence: true
	validates :project, presence: true

	  def self.to_csv
	    CSV.generate do |csv|
	      column_names = %w(Project Name Description Hours Date)
	      csv << column_names
	      all.each do |hourlog|
	        csv << [hourlog.project.name, hourlog.name, hourlog.description, hourlog.hours, hourlog.date.strftime('%B %d, %Y')]
	      end
	    end
	  end

end
