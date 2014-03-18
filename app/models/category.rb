class Category < ActiveRecord::Base
  acts_as_nested_set
  has_many :jobs, -> { order(:position) }

  validates :title, presence: true


end
