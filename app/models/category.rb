class Category < ActiveRecord::Base
  attr_accessor :name, :category_image
=begin
  has_attached_file :category_image, styles: { meduim: "300x300>", thumb: "100x100>" }
  validates_attachment :category_image, content_type: { content_type: "image/jpeg" }
=end
end
