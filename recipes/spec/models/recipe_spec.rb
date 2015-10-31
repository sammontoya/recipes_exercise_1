require 'rails_helper'

describe Recipe do

  it "has a title" do
    aRecipe = Recipe.new
    aRecipe.title ="myTitle"
    expect(aRecipe.title).to eq('myTitle')
  end
  it "has a author" do
    aRecipe = Recipe.new
    aRecipe.author ="anAuthor"
    expect(aRecipe.author).to eq('anAuthor')
  end
  it "has ingredients" do
    aRecipe = Recipe.new
    aRecipe.ingredients ="anIngredient"
    expect(aRecipe.ingredients).to eq('anIngredient')
  end
  it "has instructions" do
    aRecipe = Recipe.new
    aRecipe.instructions ="anInstruction"
    expect(aRecipe.instructions).to eq('anInstruction')
  end
  it "can have many tags" do
    aRecipe = Recipe.new
    aTag = Tag.new
    aTag2 = Tag.new
    aRecipe.tags << aTag
    aRecipe.tags << aTag2
    expect(aRecipe.tags).to match_array([aTag, aTag2])
  end

  it "can have many ratings" do
    aRecipe = Recipe.new
    aRecipe.save
    aRating = Rating.new
    aRating.save
    aRating2 = Rating.new
    aRating2.save
    aRecipe.ratings << aRating
    aRecipe.ratings << aRating2
    aRecipe.save
    expect(aRecipe.ratings).to match_array([aRating, aRating2])
  end

  it "should have an average rating" do
    aRecipe = Recipe.new
    aRecipe.save
    aRating = Rating.new(:number => 3)
    aRating.save
    aRating2 = Rating.new
    aRating2.number = 5
    aRating2.save
    aRecipe.ratings << aRating
    aRecipe.ratings << aRating2
    aRecipe.save
    expect(aRecipe.average_rating).to eq 4

  end

end
