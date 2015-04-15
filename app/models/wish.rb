class Wish < ActiveRecord::Base
  belongs_to :category

  attr_accessor :title, :description, :link, :tags, :image, :rate, :presented, :present_date
end
