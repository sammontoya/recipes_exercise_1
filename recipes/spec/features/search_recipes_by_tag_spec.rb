require 'rails_helper'

describe "search recipes by tag" do
  it 'should have an empty(nil) search field' do
    visit '/tags/search'
    expect(find_field("Enter Tag Name:").value).to eq nil
    page.should have_no_content 'Recipes found:'
    page.should have_no_content 'No Recipes Found'
  end

  it 'should tell us no recipes found if there are no results for the search' do
    visit '/tags/search'
    fill_in('search_string', :with => 'frog')
    expect(find_field("Enter Tag Name:").value).to eq 'frog'
    click_button('Search')
    visit '/tags/search?search_string=frog'
    page.should have_content('No Recipes Found')
  end

  it 'should display recipe names corresponding to the tag search' do
    visit '/recipes/new'
    fill_in('Title', :with => 'chicken')
    fill_in('Author', :with => 'chicken')
    fill_in('Ingredients', :with => 'chicken')
    fill_in('Instructions', :with => 'chicken')
    click_button('Create Recipe')
    fill_in('tag[name]', :with => 'chicken')
    click_button('Add Tag')
    visit '/tags/search'
    fill_in('search_string', :with => 'chicken')
    expect(find_field("Enter Tag Name:").value).to eq 'chicken'
    click_button('Search')
    visit '/tags/search?search_string=chicken'
    page.should have_content('Recipes Found:')
  end
end
