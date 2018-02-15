feature "Add link" do
  scenario "User clicks on a button and is directed to add link form" do
    visit '/'
    click_button "Add link"
    expect(page).to have_content "Enter a new link"

  end

  scenario "User adds a link and it is added to the list" do
    visit '/'
    click_button "Add link"
    fill_in("new_link", :with => "http://www.friedegg.com")
    click_button "Submit link"
    expect(page).to have_link("http://www.friedegg.com")
  end

  scenario "Check a users link is a valid url address" do
    visit '/'
    click_button "Add link"
    fill_in("new_link", :with => "http://www.getfitwithhunor.co.uk")
    click_button "Submit link"
    expect(page).to have_link("http://www.getfitwithhunor.co.uk")
  end

  scenario "Check a users link is a valid url address" do
    visit '/'
    click_button "Add link"
    fill_in("new_link", :with => "getfitwithhunor")
    click_button "Submit link"
    expect(page).to have_content("Invalid link given")
  end

  scenario "Check a users link is a valid url address" do
    visit '/'
    click_button "Add link"
    fill_in("new_link", :with => "http://www.getfitwithhunor")
    click_button "Submit link"
    expect(page).to have_content("Invalid link given")
  end

  scenario "Check a users link is a valid url address" do
    visit '/'
    click_button "Add link"
    fill_in("new_link", :with => "http://wwwgetfitwithhunor.com")
    click_button "Submit link"
    expect(page).to have_content("Invalid link given")
  end

  scenario "Check a users link is a valid url address" do
    visit '/'
    click_button "Add link"
    fill_in("new_link", :with => "www.getfitwithhunor.com")
    click_button "Submit link"
    expect(page).to have_content("Invalid link given")
  end

  scenario "Check a users link is a valid url address" do
    visit '/'
    click_button "Add link"
    fill_in("new_link", :with => "http://wwwgetfitwithhunorcom")
    click_button "Submit link"
    expect(page).to have_content("Invalid link given")
  end

end
