class Pin < ActiveRecord::Base
  validates_presence_of :title, :url, :slug, :text, :resource_type # :category_id # resource_type makes test pass but app doens't work
  validates_uniqueness_of :slug
  belongs_to :category #, inverse_of: :pins # inverse needed? don't seem to
end
