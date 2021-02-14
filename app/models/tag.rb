class Tag < ApplicationRecord
	belongs_to :campaign, required: false
	belongs_to :tag, required: false
	has_many :tags

	validates :name, presence: true, uniqueness: true
end
