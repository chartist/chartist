require 'spec_helper'

describe Dashboard do
  context 'creation' do

    let(:user) { create(:user) }
    let!(:chart) { create(:chart_with_dashboards, user: user) }

    it 'belongs to user on creation' do
      expect(user.dashboards.count).to eq 3
      expect(user.dashboards.first.title).to eq 'foo'
    end
  end

  context "user's default dashboard" do

  	let(:new_user) { create(:mario) }

  	it "is created when the user is created" do
  		expect(new_user.dashboards.count).to eq 1
  	end
  end
end
