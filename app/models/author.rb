class Author < ActiveRecord::Base
  # -----------------------------------------------------------
  # associations
  # -----------------------------------------------------------
  has_many :articles
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  # -----------------------------------------------------------
  # validations
  # -----------------------------------------------------------
  validates_presence_of :last_name, :first_name
  validates_attachment_presence :avatar
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/jpg', 'image/pjpeg', 'image/png', 'image/x-png']
  # -----------------------------------------------------------
  # callbacks
  # -----------------------------------------------------------
  before_save :update_date

  def update_date
    date_posted = Time.now
  end
end
