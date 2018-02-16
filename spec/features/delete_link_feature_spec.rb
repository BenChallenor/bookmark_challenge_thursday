feature "Delete link" do
  scenario "User can click delete button next to link and delete link" do
    visit '/'
    within "#link-#{id}" do
    click_button "Delete link"
    end
    expect(page).not_to have_content 'Facebook'
  end


end
