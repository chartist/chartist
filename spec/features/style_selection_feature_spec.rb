require 'spec_helper'


describe 'Choosing colors' do

  let(:user) { create(:user) }



  # let(:chart) { create(:line_chart, user: user) }

  before do
    login_as user
    visit "/charts/new"
  end

  it 'shows the option to pic a color' do
    fill_in 'Add a title', with: "name"
    fill_in 'Create Dashboard', with: "dashboard_titles"
    attach_file 'chart_csv', Rails.root.join('spec/extras/test.csv')
    choose 'Pie chart'
    choose 'Default'
    click_button 'hockeytown'
    save_and_open_page
  end

  xit '' do
    login_as user

  end
end
