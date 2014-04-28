# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chart do
    name "Football chart"
    chart_type 1
    x_type 1
    csv { fixture_file_upload Rails.root.join('spec/extras/test.csv'), 'text/csv' }
  end
end
