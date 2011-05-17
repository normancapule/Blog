class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  validates_presence_of :title, :body
  validates_format_of :status, :with => /^(Draft)|(Posted)$/, :message=>"should be DRAFT or POSTED"
  before_save :date_validator

  private
  def date_validator
    if status == "Posted"
      self.date_posted = Time.now    
    end
  end
end
