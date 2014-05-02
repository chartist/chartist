require 'spec_helper'


describe 'Choosing colors' do

  let(:user) { create(:user) }



  # let(:chart) { create(:line_chart, user: user) }

  before do
    login_as user
    visit "/charts/new"
  end

  it 'shows the option to pick a color' do
    choose_colours
    expect(page).to have_checked_field 'hockeytown'
  end

  it 'The right color is assigned to the chart' do
    choose_colours
    click_button 'Generate'
    expect(Chart.last.hockeytown?).to be_true
  end
end


def choose_colours
  fill_in 'Add a title', with: "name"
  fill_in 'Create Dashboard', with: "dashboard_titles"
  attach_file 'chart_csv', Rails.root.join('spec/extras/test.csv')
  choose 'Pie chart'
  choose 'hockeytown'
end
