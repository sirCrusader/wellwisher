class Category < ActiveRecord::Base
  belongs_to :user

  attr_accessor :name, :category_image, :user
=begin
  has_attached_file :category_image, styles: { meduim: "300x300>", thumb: "100x100>" }
  validates_attachment :category_image, content_type: { content_type: "image/jpeg" }
=end
end
