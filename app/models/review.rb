class Review < ActiveRecord::Base
  #relationship
  belongs_to :product
  attr_accessible :author, :content, :rating, :title
end
