feature "viewing links" do
  scenario "User can see links" do
    visit '/'
    expect(page).to have_content "Facebook"
    expect(page).to have_content "Google"
  end
end
