
class Recipe < ActiveRecord::Base
  validates :title, :presence => true
  validates :author, :presence => true
  validates :ingredients, :presence => true
  validates :instructions, :presence => true
  has_many :tags
  has_many :ratings

  def average_rating
    # Sum up the corresponding ratings, if any
        @recipe = Recipe.new
        if !@recipe.ratings(:number).nil?
        @recipe.ratings.each do |rating|
        rating.number
        end

      end
  end
end
