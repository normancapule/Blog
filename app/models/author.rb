class Author < ActiveRecord::Base
  has_many :articles
  validates_presence_of :last_name, :first_name
  before_save :update_date

  def update_date
    date_posted = Time.now
  end
end
