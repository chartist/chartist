require 'spec_helper'


describe 'Choosing colors' do

  let(:user) { create(:user) }



  let(:color_chart) { create(:pie_chart, user: user, colorscheme: 0, id: 4) }

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

  it 'Chart is rendered in the right color scheme', js: true do
    visit chart_path(color_chart)
    sleep 3
    expect(page.first('path')['fill']).to eq '#dc3912'

  end
end


def choose_colours
  fill_in 'Add a title', with: "name"
  fill_in 'Create Dashboard', with: "dashboard_titles"
  attach_file 'chart_csv', Rails.root.join('spec/extras/test.csv')
  choose 'Pie chart'
  choose 'hockeytown'
end
