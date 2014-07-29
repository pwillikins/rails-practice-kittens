require 'rails_helper'

feature "validating categories" do
  scenario "cannot leave category blank" do
    user = create_user email: "user@example.com"
    Category.create!(name: "Cutest!")
    Kitten.create!(image: "http://i.imgur.com/tOzb0dUb.jpg")
    login(user)
    find(".kitten-link").click
    click_on "Add Category"
    expect(page).to have_content("Category can't be blank")
  end

  scenario "kitten cannot have duplicate categorizations" do
    user = create_user email: "user@example.com"
    Category.create!(name: "Cutest!")
    Kitten.create!(image: "http://i.imgur.com/tOzb0dUb.jpg")
    login(user)
    find(".kitten-link").click
    select "Cutest!", from: "categorization_category_id"
    click_on "Add Category"
    find(".kitten-link").click
    select "Cutest!", from: "categorization_category_id"
    click_on "Add Category"
    expect(page).to have_content("Category has already been taken")
  end

  def login(user)
    visit root_path
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_on "Login"
  end
end