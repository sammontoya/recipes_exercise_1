class Rating < ActiveRecord::Base
  validates :number, :presence => true
  belongs_to :recipe
end
