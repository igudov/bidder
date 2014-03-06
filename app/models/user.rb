class User < ActiveRecord::Base
  after_destroy :ensure_a_user_remains
  validates :name, presence: true, uniqueness: true  
  has_many :jobs, dependent: :destroy
  has_many :bids, dependent: :destroy
  has_secure_password

  private
  	def ensure_a_user_remains
  		if User.count.zero?
  			raise "Can't delete last user"
  		end
  	end
end
