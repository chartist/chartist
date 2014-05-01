describe "Manual data entry" do 

  xit "can add chart data via a form" do

    visit "/charts/new"
    input = 'Country,GDP\n
      US,25\n
      GB,75'
    fill_in ('Data', with: => input)
    click_button('submit')
    expect(page).to have_content('Country')
    #expect(current_path).to eq(chart_path(chart))
  end

end
