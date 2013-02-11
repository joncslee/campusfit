class Product < ActiveRecord::Base
  attr_accessible :description, :name, :piggybak_sellable_attributes

  acts_as_sellable
end
