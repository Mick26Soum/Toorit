class Product < ActiveRecord::Base
  attr_accessible :description, :images, :location, :name, :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  #TODO: Add validation for products

  #relationships
  has_many :reviews
end
