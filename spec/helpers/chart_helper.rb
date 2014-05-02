def add_pie_chart(name, dashboard_titles)
  fill_in 'Add a title', with: name
  fill_in 'Create Dashboard', with: dashboard_titles
  attach_file 'chart_csv', Rails.root.join('spec/extras/test.csv')
  choose 'Pie chart'
  click_button 'Generate'
end
