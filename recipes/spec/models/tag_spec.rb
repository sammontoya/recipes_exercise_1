require 'rails_helper'

describe Tag do

  it "should have a name" do
    aTag = Tag.new
    aTag.name = "blah"
    expect(aTag.name).to eq "blah"
  end

  it "should not accept an empty name" do
      aTag = Tag.new
      expect(aTag.valid?).to eq false
      aTag.name = "blah"
      expect(aTag.valid?).to eq true
  end

  it "should have a recipe" do
      aTag = Tag.new
      aTag.name = "new tag"
      aRecipe = Recipe.new
      aTag.recipe = aRecipe
      expect(aTag.recipe).to eq aRecipe
  end

  it "displays only distinct tags" do
    aTag = Tag.new
    aTag.name = "tag1"
    aTag2 = Tag.new
    aTag2.name = "tag1"
    expect (Tag.select(:name).distinct).to eq "tag1"
  end
end
