require 'spec_helper'

describe 'Splashpage' do

  it "should display a welcome message" do
    visit "/"
    expect(page).to have_css(".nav")
  end

end
