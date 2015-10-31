require 'rails_helper'

describe "the posting of recipes" do
  it "should allow a user to enter a recipe" do
    visit 'recipes/new'
    fill_in 'Title', :with => "myTitle"
    fill_in 'Author', :with => "anAuthor"
    fill_in 'Ingredients', :with => "anIngredient"
    fill_in 'Instructions', :with => "anInstruction"
    click_button 'Create Recipe'
    page.should have_content 'myTitle'
    page.should have_content 'anAuthor'
    page.should have_content 'anIngredient'
    page.should have_content 'anInstruction'
    visit '/recipes'
  end
end
