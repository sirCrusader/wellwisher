class Wish < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  has_attached_file :image,
                    styles: { medium: '300x300>', thumb: '50x50#', small: '141x141#'},
                    url: '/system/wish/:attachment/:id/:style/:filename',
                    path: ':rails_root/public/system/wish/:attachment/:id/:style/:filename',
                    default_url: '/images/default/wish/missing_:style.png'

  validates_presence_of :title, :category
  validates_attachment :image, size: { in: 0..2.megabytes }
  validates_attachment :image, content_type: { content_type: %w(image/jpg image/jpeg image/png image/gif)}

end
