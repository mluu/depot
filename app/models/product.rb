class Product < ActiveRecord::Base
  default_scope :order => 'title'

# validation
  attr_accessible :description, :image_url, :price, :title
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates_length_of :title, :minimum => 10, :message =>"Woah what are you doing? It's 10 characters or more!"
  validates :image_url, :format => {
	:with => %r{\.(gif|jpg|png)$}i,
	:message => 'must be a URL for GIF, JPG or PNG image.'
  }
end
