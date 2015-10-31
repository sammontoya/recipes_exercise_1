require 'rails_helper'

describe "average ratings" do
  it 'should average the ratings for a recipe' do
    visit '/recipes/new'
    fill_in('Title', :with => 'chicken')
    fill_in('Author', :with => 'chicken')
    fill_in('Ingredients', :with => 'chicken')
    fill_in('Instructions', :with => 'chicken')
    click_button('Create Recipe')
    select('1', :from => 'rating[number]')
    click_button('Add Rating')
    expect find_field('rating[number]').value).to eq '1'
  end
end
