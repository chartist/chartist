require 'spec_helper'

describe "Building a chart" do

  let(:user) { create(:user) }

  context "Pie chart" do

    let(:chart) {create(:pie_chart, user: user)}

    it "outputs a chart" do
      visit chart_path(chart)
      expect(page).to have_css '.chart_container'
      expect(page).to have_css '#pie_chart_1'
    end
  end

  context "Column chart" do

    let(:chart) {create(:col_chart, user: user)}

    it "outputs a chart" do
      visit chart_path(chart)
      expect(page).to have_css '.chart_container'
      expect(page).to have_css '#col_chart_2'
    end
  end

  context "Bar chart" do

    let(:chart) {create(:bar_chart, user: user)}

    it "outputs a chart" do
      visit chart_path(chart)
      expect(page).to have_css '.chart_container'
      expect(page).to have_css '#bar_chart_3'
    end
  end

  context "Line chart" do

    let(:chart) {create(:line_chart, user: user)}

    it "outputs a chart" do
      visit chart_path(chart)
      expect(page).to have_css '.chart_container'
      expect(page).to have_css '#line_chart_4'
    end
  end
end

describe "Charts and users" do

  let(:user) { create(:user) }
  let(:chart) { create(:line_chart, user: user) }

  it 'belongs to a user' do
    visit chart_path(chart)
    expect(page).to have_content(user.username)
  end
end


describe 'Managing charts' do

  let(:user) { create(:user) }  
  let(:hacker) { create(:hacker) }
  let(:chart) { create(:line_chart, user: user) }

  context "Editing" do
    
    it 'deletes a chart when the button is pressed' do
      login_as user
      visit chart_path(chart)
      click_link 'delete-btn'
      expect(current_path).to eq '/charts'
      expect(Chart.count).to eq(0)
    end

    it 'user can only delete own charts' do
      login_as hacker
      visit chart_path(chart)
      expect(page).not_to have_css '#delete-btn'
    end
  end

  context "Deleting" do

    it 'creator can edit chart title' do
      login_as user
      visit chart_path(chart)
      click_link 'edit-btn'
      expect(current_path).to eq chart_path(chart) + '/edit'
      fill_in 'Name', with: 'Bla'
      click_button 'Edit'
      expect(current_path).to eq chart_path(chart)
      expect(page).to have_css ".panel-heading", text: 'Bla'
    end

    it 'user can only delete own charts' do
      login_as hacker
      visit chart_path(chart)
      expect(page).not_to have_css '#delete-btn'
    end
  end
end
