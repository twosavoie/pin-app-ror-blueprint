class Category < ActiveRecord::Base
  has_many :pins #,  inverse_of: :category # inverse needed?
#  accepts_nested_attributes_for :pins # needed? don't seem to
end
