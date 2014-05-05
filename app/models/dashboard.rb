class Dashboard < ActiveRecord::Base


  has_and_belongs_to_many :charts
  belongs_to :user

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
