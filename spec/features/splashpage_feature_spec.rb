require 'spec_helper'

describe 'Splashpage' do

  it "should display a welcome message" do
    visit '/'
    expect(page).to have_content('We are working our butts off to finish this website')
  end

end
