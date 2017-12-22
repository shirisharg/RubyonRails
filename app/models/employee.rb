class Employee < ApplicationRecord
	belongs_to :project
	has_and_belongs_to_many :skills
end
