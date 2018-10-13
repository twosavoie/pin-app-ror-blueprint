class Pin < ActiveRecord::Base
  validates_presence_of :title, :url, :slug, :text, :category_id #:resource_type makes test pass but doens't work
  validates_uniqueness_of :slug
  belongs_to :category #, inverse_of: :pins # inverse needed? don't seem to
end
