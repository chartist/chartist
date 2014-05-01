require 'spec_helper'


describe 'Choosing colors' do
  let(:user) { create(:user) }

  # let(:chart) { create(:line_chart, user: user) }

  xit 'creator can edit chart title' do
    login_as user
    visit '/charts/new'


    visit chart_path(chart)
    click_link 'edit-btn'
    expect(current_path).to eq chart_path(chart) + '/edit'
    fill_in 'Name', with: 'Bla'
    click_button 'Edit'
    expect(current_path).to eq chart_path(chart)
    expect(page).to have_css ".panel-heading", text: 'Bla'
  end

  xit 'user can only delete own charts' do
    login_as hacker
    visit chart_path(chart)
    expect(page).not_to have_css '#delete-btn'
  end
end
