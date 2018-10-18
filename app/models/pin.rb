class Pin < ActiveRecord::Base
  validates_presence_of :title, :url, :slug, :text, :category_id # :resource_type # resource_type makes test pass but app doens't work
  validates_uniqueness_of :slug
  belongs_to :category #, inverse_of: :pins # inverse needed? don't seem to
#  has_attached_file :image, styles: { medium: "300x300>", thumb: "60x60>" }, default_url: "http://placebear.com/300/300"
#  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
