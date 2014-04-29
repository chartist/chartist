# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pie_chart, class: 'Chart' do
    name "Pie chart"
    chart_type 0
    x_type 1
    csv { fixture_file_upload Rails.root.join('spec/extras/test.csv'), 'text/csv' }
  end
  factory :line_chart, class: 'Chart' do
    name "Line chart"
    chart_type 1
    x_type 1
    csv { fixture_file_upload Rails.root.join('spec/extras/test.csv'), 'text/csv' }
  end
end
