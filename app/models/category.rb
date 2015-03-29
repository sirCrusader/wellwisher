class Category < ActiveRecord::Base
  attr_accessible :name
  has_attached_file :category_image, styles: { meduim: "300x300>", thumb: "100x100>" }
  validates_attachment :category_image, content_type: { content_type: "image/jpeg" }
end
