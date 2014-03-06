class Job < ActiveRecord::Base
belongs_to :user
has_many :bids, dependent: :destroy

	validates :title, :description, :image_url, :category, presence: true
	#validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
	}

	def self.latest
		Job.order(:updated_at).last
	end
end
