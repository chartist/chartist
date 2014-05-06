require 'spec_helper'

describe Dashboard do
  context 'creation' do

    let!(:user) { create(:user) }
    let!(:chart) { create(:chart_with_dashboards, user: user) }

    it 'belongs to user on creation' do
      expect(user.dashboards.count).to eq 4
      expect(user.dashboards.first.title).to eq 'miami'
    end
  end

end
