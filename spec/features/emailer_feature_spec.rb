require 'spec_helper'

describe "Welcome email" do 

  before do
    clear_emails
    create(:mario)
  end

  it "should send the user an email when registered" do
    open_email('mario@mario.com')
    expect(current_email).to have_content('Welcome to Chartist')
  end

end
